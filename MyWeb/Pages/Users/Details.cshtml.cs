using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MyWeb.Pages.Users
{
    public class DetailsModel : PageModel
    {
        private IUserRepository userRepo;
        private IPostRepository postRepo;
        public DetailsModel(department_dbContext context)
        {
            userRepo = new UserRepository();
            postRepo = new PostRepository();
        }

        public User User { get; set; }
        public IEnumerable<Post> Posts { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }


            User = await userRepo.GetUserByIdAsync(id.Value);
            string CURRENT_USER_ID = HttpContext.Session.GetString("CURRENT_USER_ID");
            if (CURRENT_USER_ID == null || id.Value != Guid.Parse(CURRENT_USER_ID))
            {
                Posts = await postRepo.GetPostsInUserDetailsWithoutLogin(id.Value);
            }
            else if (id.Value == Guid.Parse(CURRENT_USER_ID)) // vào xem profile chính mình
            {
                Posts = await postRepo.GetPostByUserIdAsync(id.Value);
            }
            return Page();
        }
    }
}
