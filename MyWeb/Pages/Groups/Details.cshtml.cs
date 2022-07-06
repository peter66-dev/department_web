using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MyWeb.Pages.Groups
{
    public class DetailsModel : PageModel
    {
        private IPostRepository postRepo;
        private IGroupRepository groupRepo;
        private IGroupUserRepository groupUserRepo;


        public DetailsModel()
        {
            postRepo = new PostRepository();
            groupRepo = new GroupRepository();
            groupUserRepo = new GroupUserRepository();
        }

        public int TotalMembers { get; set; }
        public int IsJoined { get; set; }

        public Group Group { get; set; }
        public IEnumerable<Post> Posts { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            TotalMembers = await groupRepo.GetTotalMembersInGroupById(id.Value);
            Group = groupRepo.GetGroupById(id.Value);

            string CURRENT_USER_ID = HttpContext.Session.GetString("CURRENT_USER_ID");
            if (CURRENT_USER_ID != null)
            {
                string role = HttpContext.Session.GetString("ROLE");
                if (role.Equals("ADMIN"))
                {
                    IsJoined = 1; // ADMIN được phép coi tất cả group
                }else if (role.Equals("MANAGER")) // -1: không cho join || 1: đang làm chủ group
                {
                    IsJoined = groupRepo.IsLeaderGroup(id.Value, Guid.Parse(CURRENT_USER_ID));
                }
                else
                {
                    IsJoined = groupUserRepo.IsJoinedGroup(id.Value, Guid.Parse(CURRENT_USER_ID));
                    if (IsJoined == 1) // active
                    {
                        Console.WriteLine($"This user has joined group {Group.GroupName}!");
                    }
                    else if (IsJoined == 0 || IsJoined == 2) // get null
                    {
                        Console.WriteLine($"This user has not joined group {Group.GroupName}!");
                    }
                    else if (IsJoined == 4) // pending
                    {
                        Console.WriteLine($"This user is pending group {Group.GroupName}!");
                    }
                    else // not cover this case
                    {
                        Console.WriteLine("[SYSTEM MESSAGE]: CHECK LOGIC AGAIN PLEASE! OnGetAsync");
                    }
                }
            }

            if (Group.PublicStatus == 5 || IsJoined == 1)
            {
                Posts = await postRepo.GetPostsByGroupId(id.Value);
            }

            if (Group == null)
            {
                return NotFound();
            }
            return Page();
        }

        /* {status}    
            1: success
            2: not login
            3: failed
         */
        public JsonResult OnGetJoinGroupAction(string groupId)
        {
            string CURRENT_USER_ID = HttpContext.Session.GetString("CURRENT_USER_ID");

            if (CURRENT_USER_ID == null) // not login
            {
                return new JsonResult(new { status = 2 });
            }
            else
            {
                bool check = groupUserRepo.LetUserJoinGroup(Guid.Parse(CURRENT_USER_ID), Guid.Parse(groupId));
                if (check)
                {
                    return new JsonResult(new { status = 1 });
                }
                else
                {
                    return new JsonResult(new { status = 3 });
                }
            }
        }

        /* {status}    
           1: success
           2: failed
        */
        public JsonResult OnGetCancelGroupAction(string groupId) // default: đã login
        {
            Console.WriteLine("Tui la OnGetCancelGroupAction");
            string CURRENT_USER_ID = HttpContext.Session.GetString("CURRENT_USER_ID");

            bool check = groupUserRepo.LetUserLeaveGroup(Guid.Parse(CURRENT_USER_ID), Guid.Parse(groupId));
            if (check)
            {
                return new JsonResult(new { status = 1 });
            }
            else
            {
                Console.WriteLine("[SYSTEM MESSAGE]: CHECK LOGIC CODE AGAIN PLEASE! OnGetCancelGroupAction");
                return new JsonResult(new { status = 2 });
            }
        }
    }
}
