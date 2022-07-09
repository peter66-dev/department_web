using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyWeb.Pages.Managements
{
    public class PostsModel : PageModel
    {
        private IPostRepository postRepo;
        public IEnumerable<Post> Posts { get; set; }

        public PostsModel()
        {
            postRepo = new PostRepository();
            Posts = new List<Post>();
        }
        public async Task<IActionResult> OnGet()
        {
            string role = HttpContext.Session.GetString("ROLE");
            if (role == null || !role.Equals("MANAGER"))
            {
                return RedirectToPage("../Login");
            }
            string managerId = HttpContext.Session.GetString("CURRENT_USER_ID");
            if (managerId != null)
            {
                Posts = await postRepo.GetPostsForManagerApprove(Guid.Parse(managerId));
                Console.WriteLine($"This group has {Posts.ToList().Count} pending posts!");
                return Page();
            }
            else
            {
                return new RedirectToPageResult("../Login");
            }
        }
    }
}
