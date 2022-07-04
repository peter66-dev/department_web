using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MyWeb.Pages
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
        public IList<Post> Posts { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            User = await userRepo.GetUserByIdAsync(id.Value);
            Posts = await postRepo.GetPostsInUserDetailsWithoutLogin(id.Value);

            if (User == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
