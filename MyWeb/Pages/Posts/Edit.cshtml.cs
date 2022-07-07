using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;

namespace MyWeb.Pages.Posts
{
    public class EditModel : PageModel
    {
        private readonly LibraryWeb.DataAccess.department_dbContext _context;
        private IPostRepository postRepo;

        public EditModel(LibraryWeb.DataAccess.department_dbContext context)
        {
            _context = context;
            postRepo = new PostRepository();
        }

        [BindProperty]
        public Post Post { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            string CURRENT_USER_ID = HttpContext.Session.GetString("CURRENT_USER_ID");
            Post = await postRepo.GetPostByIdAsync(id.Value);
            if (Post == null)
            {
                return NotFound();
            }
            if (Post.UserPostId != Guid.Parse(CURRENT_USER_ID))
            {
                return NotFound();
            }
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync() // update trực tiếp, ko cần manager duyệt
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            Guid postid = Post.PostId;
            string title = Post.Title;
            string tags = Post.Tags.Trim();
            string content = Post.PostContent;
            bool check = await postRepo.UpdatePost(postid, title, tags, content);
            if (check)
            {
                Console.WriteLine("Updated post successfully!");
                return RedirectToPage("../Users/Details", "Get", new { id = Post.UserPostId });
            }
            else // chỗ này dành cho trường hợp update bài khi đang còn trong trạng thái pending
            {
                return RedirectToPage("./Index");
            }
        }
    }
}
