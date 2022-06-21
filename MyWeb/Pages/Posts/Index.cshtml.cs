using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyWeb.Pages.Posts
{
    public class IndexModel : PageModel
    {
        private readonly department_dbContext context;

        public Dictionary<Guid, int> PostLikes = new Dictionary<Guid, int>();
        public Dictionary<Guid, int> PostComments = new Dictionary<Guid, int>();

        public IndexModel(department_dbContext context)
        {
            this.context = context;
        }

        public IList<Post> Posts { get; set; }
        public IList<Post> HotNews { get; set; }

        public async Task OnGetAsync(string searchString, string searchTag)
        {
            var contextLikes = new department_dbContext();
            var contextComments = new department_dbContext();
            var contextCommentReplies = new department_dbContext();
            var contextHotNews = new department_dbContext();

            if (searchString != null && searchString.Trim().Length > 0)
            {
                Console.WriteLine("Search string: " + searchString);
                Posts = await context.Posts.Where(p => p.Tags.Contains(searchString) && p.PublicStatus == 5)
                                        .OrderBy(p => p.CreatedDate).Reverse()
                                        .Include(p => p.GroupPost)
                                        .Include(p => p.PostType)
                                        .Include(p => p.StatusNavigation)
                                        .Include(p => p.UserPost)
                                        .ToListAsync();
            }
            else if (searchTag != null)
            {
                Console.WriteLine("Search by tag!Tag: " + searchTag);
                Posts = await context.Posts.Where(p => p.PublicStatus == 5 && p.Tags.Contains(searchTag))
                                       .OrderBy(p => p.CreatedDate).Reverse()
                                       .Include(p => p.GroupPost)
                                       .Include(p => p.PostType)
                                       .Include(p => p.StatusNavigation)
                                       .Include(p => p.UserPost)
                                       .ToListAsync();
            }
            else
            {
                Console.WriteLine("Search by default!");
                Posts = await context.Posts.Where(p => p.PublicStatus == 5)
                                        .OrderBy(p => p.CreatedDate).Reverse()
                                        .Include(p => p.GroupPost)
                                        .Include(p => p.PostType)
                                        .Include(p => p.StatusNavigation)
                                        .Include(p => p.UserPost)
                                        .ToListAsync();
            }

            // Load important news (right side)
            HotNews = await context.Posts.Where(p => p.PublicStatus == 5 && p.Status == 7)
                                        .OrderBy(p => p.CreatedDate).Reverse()
                                        .Include(p => p.GroupPost)
                                        .Include(p => p.PostType)
                                        .Include(p => p.StatusNavigation)
                                        .Include(p => p.UserPost)
                                        .ToListAsync();

            // load total likes of post
            foreach (Post post in Posts)
            {
                List<Like> list = await contextLikes.Likes.Where(l => l.PostId == post.PostId).ToListAsync();
                PostLikes.Add(post.PostId, list.Count);
            }

            // load total comments + comment replies of post
            foreach (Post post in Posts)
            {
                List<Comment> listComment =
                    await contextComments.Comments.Where(c => c.PostId == post.PostId).ToListAsync();
                List<CommentReply> listCommentReply =
                    await contextCommentReplies.CommentReplies.Where(cr => cr.Comment.PostId == post.PostId).ToListAsync();
                PostComments.Add(post.PostId, listComment.Count + listCommentReply.Count);
            }

        }

    }
}
