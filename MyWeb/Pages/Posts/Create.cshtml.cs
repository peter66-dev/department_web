using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyWeb.Pages.Posts
{
    public class CreateModel : PageModel
    {
        private IGroupUserRepository groupUserRepo;
        private IGroupRepository groupRepo;
        private IPostRepository postRepo;

        public bool IsAllowCreated { get; set; } = true;

        public CreateModel()
        {
            groupUserRepo = new GroupUserRepository();
            postRepo = new PostRepository();
            groupRepo = new GroupRepository();
        }

        public async Task<IActionResult> OnGetAsync()
        {
            string role = HttpContext.Session.GetString("ROLE");
            if (role == null)
            {
                return RedirectToPage("../Login");
            }
            string userid = HttpContext.Session.GetString("CURRENT_USER_ID");
            if (role.Equals("RESIDENT"))
            {
                IEnumerable<Group> list = await groupUserRepo.GetGroupsByUserId(Guid.Parse(userid));
                if (list.ToList().Count == 0)
                {
                    IsAllowCreated = false;
                }
                ViewData["GroupPostId"] = new SelectList(list, "GroupId", "GroupName");
            }
            else if (role.Equals("MANAGER"))
            {
                IEnumerable<Group> list = await groupRepo.GetGroupsByLeaderId(Guid.Parse(userid));
                if (list.ToList().Count == 0)
                {
                    IsAllowCreated = false;
                }
                ViewData["GroupPostId"] = new SelectList(list, "GroupId", "GroupName");
            }
            else
            {
                Console.WriteLine("[SYSTEM MESSAGE]: CHECK AGAIN LOGIC IN OnGetAsync-CREATE POST METHOD!");
            }
            return Page();
        }

        [BindProperty]
        public Post Post { get; set; }

        public async Task<IActionResult> OnPostAsync()
        {
            string userid = HttpContext.Session.GetString("CURRENT_USER_ID");
            if (!ModelState.IsValid)
            {
                Console.WriteLine("Post information is not valid!");
                string role = HttpContext.Session.GetString("ROLE");

                if (role.Equals("RESIDENT"))
                {
                    IEnumerable<Group> list = await groupUserRepo.GetGroupsByUserId(Guid.Parse(userid));
                    if (list.ToList().Count == 0)
                    {
                        IsAllowCreated = false;
                    }
                    ViewData["GroupPostId"] = new SelectList(list, "GroupId", "GroupName");
                }
                else if (role.Equals("MANAGER"))
                {
                    IEnumerable<Group> list = await groupRepo.GetGroupsByLeaderId(Guid.Parse(userid));
                    if (list.ToList().Count == 0)
                    {
                        IsAllowCreated = false;
                    }
                    ViewData["GroupPostId"] = new SelectList(list, "GroupId", "GroupName");
                }
                else
                {
                    Console.WriteLine("[SYSTEM MESSAGE]: CHECK AGAIN LOGIC IN OnGetAsync-CREATE POST METHOD!");
                }
                return Page();
            }
            else
            {
                Console.WriteLine("Good information");
                string roleName = HttpContext.Session.GetString("ROLE");
                if (roleName.Equals("ADMIN"))
                {
                    postRepo.CreatePost(Guid.Parse(userid), roleName, Guid.Parse(userid), Post.Title, Post.Tags, Post.PostContent); // truyền tạm grouppostid là userpostid
                }
                else
                {
                    postRepo.CreatePost(Guid.Parse(userid), roleName, Post.GroupPostId.Value, Post.Title, Post.Tags, Post.PostContent);
                }
                return RedirectToPage("./Index");
            }


        }
    }
}
