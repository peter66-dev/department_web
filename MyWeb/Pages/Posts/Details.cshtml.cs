using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
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
        private readonly department_dbContext _context;
        private ILikeRepository likeRepo;
        private IPostRepository postRepo;

        public bool IsLiked { get; set; } = false;

        public DetailsModel(department_dbContext context)
        {
            _context = context;
            likeRepo = new LikeRepository();
            postRepo = new PostRepository();
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

            //Get IsLiked status
            string user_login_id = HttpContext.Session.GetString("CURRENT_USER_ID");
            if (user_login_id != null)
            {
                Console.WriteLine("user_login_id: " + user_login_id);
                var context = new department_dbContext();
                Like like = await context.Likes.FirstOrDefaultAsync(l =>
                                            l.PostId == id.Value
                                            && l.UserId.ToString().Equals(user_login_id));
                if (like != null && like.Status == 1)
                {
                    IsLiked = true;
                }
            }

            if (Post == null)
            {
                return NotFound();
            }
            return Page();
        }

        public JsonResult OnGetLikeAction(string postid)
        {
            string userid = HttpContext.Session.GetString("CURRENT_USER_ID");
            if (userid == null)
            {
                return new JsonResult(3);
            }
            else
            {
                int result = likeRepo.ChangeLikeStatus(userid, postid);
                IsLiked = result == 1;
                int currentLikesTotal = 0;
                if (result == 1) // bug here
                { // plus like quantity in this post if result = 1
                    currentLikesTotal = postRepo.IncreaseLikesTotal(Guid.Parse(postid));
                    Console.WriteLine("plus like quantity => " + currentLikesTotal);
                }
                else if (result == 2) // sub like quantity in this post if result = 2
                {
                    currentLikesTotal = postRepo.DecreaseLikesTotal(Guid.Parse(postid));
                    Console.WriteLine("sub like quantity => " + currentLikesTotal);
                }
                else
                {
                    Console.WriteLine("Something's wrong in changeLikeTotal!");
                }
                return new JsonResult(new int[] { result, currentLikesTotal });
            }
        }
    }
}
