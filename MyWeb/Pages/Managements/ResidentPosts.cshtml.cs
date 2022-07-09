using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace MyWeb.Pages.Managements
{

    public class ResidentPosts : PageModel
    {
        private IPostRepository postRepo;
        public IEnumerable<Post> Posts { get; set; }

        public ResidentPosts()
        {
            postRepo = new PostRepository();
        }
        public IActionResult OnGet()
        {
            string role = HttpContext.Session.GetString("ROLE");
            string CURRENT_USER_ID = HttpContext.Session.GetString("CURRENT_USER_ID");
            if (role == null || !role.Equals("RESIDENT"))
            {
                return RedirectToPage("../Login");
            }
            else
            {
                HttpContext.Session.Remove("DELETE_NEWS_MESSAGE");
                Posts = postRepo.GetPostByUserId(Guid.Parse(CURRENT_USER_ID));
            }
            return Page();
        }

        public IActionResult OnGetDeleteMyPost(string id)
        {
            string CURRENT_USER_ID = HttpContext.Session.GetString("CURRENT_USER_ID");
            postRepo.DeleteMyPost(Guid.Parse(id));
            HttpContext.Session.SetString("DELETE_NEWS_MESSAGE", "Deleted successfully!");
            Posts = postRepo.GetPostByUserId(Guid.Parse(CURRENT_USER_ID));
            return Page();
        }
    }
}
