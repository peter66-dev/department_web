using LibraryWeb.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace MyWeb.Pages.Posts
{
    public class DetailsModel : PageModel
    {
        private readonly LibraryWeb.DataAccess.department_dbContext _context;

        public DetailsModel(LibraryWeb.DataAccess.department_dbContext context)
        {
            _context = context;
        }

        public Post Post { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Post = await _context.Posts
                                        .Include(p => p.GroupPost)
                                        .Include(p => p.PostType)
                                        .Include(p => p.StatusNavigation)
                                        .Include(p => p.UserPost)
                                        .Include(p => p.Comments.Where(c => c.Status == 5))
                                        .ThenInclude(cr => cr.CommentReplies.Where(cr => cr.Status == 5))
                                        .ThenInclude(ucr => ucr.UserReply)
                                        .Include(p => p.Comments.Where(c => c.Status == 5))
                                        .ThenInclude(usercomment => usercomment.UserComment)
                                        .Include(p => p.UserPost.Role)
                                        .FirstOrDefaultAsync(m => m.PostId == id);

            // plus views
            Post.Views++;
            _context.SaveChanges();

            if (Post == null)
            {
                return NotFound();
            }
            return Page();
        }

        public JsonResult OnPostLikeActionAsync(string userid, Guid postid)
        {
            try
            {
                Console.WriteLine("Userid: " + userid);
                Console.WriteLine("Postid: " + postid);
                return new JsonResult(new { code = 200, msg = "Good job!" });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { code = 404, msg = "Bad request: " + ex.Message });
            }
        }
    }
}
