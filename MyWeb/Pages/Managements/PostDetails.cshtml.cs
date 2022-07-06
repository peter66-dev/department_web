using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;

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
                Post = postRepo.GetPostById(Guid.Parse(id));
                return Page();
            }
            else
            {
                return new RedirectToPageResult("../Login");
            }
        }

        public IActionResult OnGetApprove(string id)
        {
            Console.WriteLine("PostId: " + id);
            if (postRepo.ApprovePost(Guid.Parse(id)))
            {
                return new RedirectToPageResult("./Posts");
            }
            else
            {
                Post = postRepo.GetPostById(Guid.Parse(id));
                return Page();
            }
        }

        public IActionResult OnGetReject(string postid, string reason_reject)
        {
            Console.WriteLine("Post id: " + postid);
            Console.WriteLine("Reason reject: " + reason_reject);
            if (postRepo.RejectPost(Guid.Parse(postid), reason_reject))
            {
                return new RedirectToPageResult("./Posts");
            }
            else
            {
                Post = postRepo.GetPostById(Guid.Parse(postid));
                return Page();
            }
        }
    }
}
