﻿using LibraryWeb.DataAccess;
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
        private IPostRepository postRepo;

        public CreateModel()
        {
            groupUserRepo = new GroupUserRepository();
            postRepo = new PostRepository();
        }

        public async Task<IActionResult> OnGetAsync()
        {
            string userid = HttpContext.Session.GetString("CURRENT_USER_ID");
            ViewData["GroupPostId"] = new SelectList(await groupUserRepo.GetGroupsByUserId(Guid.Parse(userid)),
                                                        "GroupId",
                                                        "GroupName");
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
                ViewData["GroupPostId"] = new SelectList(await groupUserRepo.GetGroupsByUserId(Guid.Parse(userid)),
                                                            "GroupId",
                                                            "GroupName");
                return Page();
            }
            else
            {
                Console.WriteLine("Good information");
                string roleName = HttpContext.Session.GetString("ROLE");
                postRepo.CreatePost(Guid.Parse(userid), roleName, Post.GroupPostId.Value, Post.Title, Post.Tags, Post.PostContent);
                return RedirectToPage("./Index");
            }


        }
    }
}
