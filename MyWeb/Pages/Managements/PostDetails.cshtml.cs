using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Threading.Tasks;

namespace MyWeb.Pages.Managements
{
    public class PostDetailsModel : PageModel
    {
        public IPostRepository postRepo;
        public Post Post { get; set; }

        public PostDetailsModel()
        {
            postRepo = new PostRepository();
        }

        public IActionResult OnGet(string id)
        {
            string managerId = HttpContext.Session.GetString("CURRENT_USER_ID");
            if (managerId != null)
            {
                Post = postRepo.GetPostById(System.Guid.Parse(id));
                return Page();
            }
            else
            {
                return new RedirectToPageResult("../Login");
            }
        }
    }
}
