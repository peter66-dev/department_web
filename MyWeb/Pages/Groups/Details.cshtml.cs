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
        public string Role { get; set; } = "";
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
                Role = HttpContext.Session.GetString("ROLE");
                if (Role.Equals("ADMIN"))
                {
                    IsJoined = 1; // ADMIN được phép coi tất cả group
                }
                else if (Role.Equals("MANAGER")) // -1: không cho join || 1: đang làm chủ group
                {
                    IsJoined = groupRepo.IsLeaderGroup(id.Value, Guid.Parse(CURRENT_USER_ID));
                }
                else     // RESIDENT
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


        public async Task<IActionResult> OnGetJoinGroupActionAsync(string groupId)
        {
            string CURRENT_USER_ID = HttpContext.Session.GetString("CURRENT_USER_ID");

            bool check = groupUserRepo.LetUserJoinGroup(Guid.Parse(CURRENT_USER_ID), Guid.Parse(groupId));
            if (check)
            {
                Console.WriteLine("Pending successfully!");
            }
            IsJoined = 4;
            Role = "RESIDENT";
            TotalMembers = await groupRepo.GetTotalMembersInGroupById(Guid.Parse(groupId));
            Group = groupRepo.GetGroupById(Guid.Parse(groupId));
            if (Group.PublicStatus == 5)
            {
                Posts = await postRepo.GetPostsByGroupId(Guid.Parse(groupId));
            }
            return Page();

        }

        public async Task<IActionResult> OnGetCancelGroupActionAsync(string groupId) // default: đã login
        {
            string CURRENT_USER_ID = HttpContext.Session.GetString("CURRENT_USER_ID");

            bool check = groupUserRepo.LetUserLeaveGroup(Guid.Parse(CURRENT_USER_ID), Guid.Parse(groupId));
            if (check)
            {
                Console.WriteLine("Cancel pending successfully!");
            }
            IsJoined = 2;
            Role = "RESIDENT";
            TotalMembers = await groupRepo.GetTotalMembersInGroupById(Guid.Parse(groupId));
            Group = groupRepo.GetGroupById(Guid.Parse(groupId));
            if (Group.PublicStatus == 5)
            {
                Posts = await postRepo.GetPostsByGroupId(Guid.Parse(groupId));
            }
            return Page();
        }
    }
}
