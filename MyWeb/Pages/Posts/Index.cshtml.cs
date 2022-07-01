using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
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

        public IUserRepository userRepo;

        public IndexModel(department_dbContext context)
        {
            this.context = context;
            userRepo = new UserRepository();
        }

        public IList<Post> Posts { get; set; }
        public IList<Post> HotNews { get; set; }
        public IList<GroupUser> GroupUsers { get; set; }
        public IList<Group> Groups { get; set; }

        public async Task OnGetAsync(string searchString, string searchTag, string loadPage)
        {
            string role = CheckLogin();
            if (role == null) // Chưa login!
            {
                if (searchString != null && searchString.Trim().Length > 0) // search by tag + title
                {
                    Posts = await context.Posts.Where(p => (p.Tags.Contains(searchString) && (p.GroupPost.PublicStatus == 5 || p.PostType.PostTypeName.Equals("Announcement"))
                                                          || (p.Title.Contains(searchString) && (p.GroupPost.PublicStatus == 5 || p.PostType.PostTypeName.Equals("Announcement")))))
                                                .OrderBy(p => p.CreatedDate).Reverse()
                                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role)
                                                .ToListAsync();
                    searchString = null;
                }
                else if (searchTag != null)                               // search by tag
                {
                    Posts = await context.Posts.Where(p => p.Tags.Contains(searchTag) && (p.GroupPost.PublicStatus == 5 || p.PostType.PostTypeName.Equals("Announcement")))
                                               .OrderBy(p => p.CreatedDate).Reverse()
                                               .Include(p => p.GroupPost)
                                               .Include(p => p.PostType)
                                               .Include(p => p.StatusNavigation)
                                               .Include(p => p.UserPost)
                                               .ThenInclude(u => u.Role)
                                               .ToListAsync();
                    searchTag = null;
                }

                else
                {
                    Posts = await context.Posts.Where(p => p.GroupPost.PublicStatus == 5 || p.PostType.PostTypeName.Equals("Announcement"))
                                                .OrderBy(p => p.CreatedDate).Reverse()
                                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role)
                                                .ToListAsync();
                    searchString = null;
                    searchTag = null;
                }
            }
            else // Đã login!
            {
                string currenxt_user_id = HttpContext.Session.GetString("CURRENT_USER_ID");
                if (role.Equals("MANAGER"))
                {
                    var groupContXext = new department_dbContext();
                    Groups = await groupContXext.Groups
                                                    .Where(g => g.GroupOwnerId.ToString() == (currenxt_user_id))
                                                    .ToListAsync();
                }
                else if (role.Equals("RESIDENT"))
                {
                    var groupUserContext = new department_dbContext();
                    GroupUsers = await groupUserContext.GroupUsers
                                                    .Where(g => g.MemberId.ToString() == (currenxt_user_id))
                                                    .Include(p => p.Group)
                                                    .ToListAsync();
                }
                if (searchString != null && searchString.Trim().Length > 0)
                {
                    Posts = await context.Posts.Where(p => p.Tags.Contains(searchString)
                                                      && p.GroupPost.PublicStatus == 5)
                                                .OrderBy(p => p.CreatedDate).Reverse()
                                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role)
                                                .ToListAsync();
                    searchString = null;
                }
                else if (searchTag != null)
                {
                    Posts = await context.Posts.Where(p => p.Tags.Contains(searchTag)
                                                    && p.GroupPost.PublicStatus == 5)
                                               .OrderBy(p => p.CreatedDate).Reverse()
                                               .Include(p => p.GroupPost)
                                               .Include(p => p.PostType)
                                               .Include(p => p.StatusNavigation)
                                               .Include(p => p.UserPost)
                                               .ThenInclude(u => u.Role)
                                               .ToListAsync();
                    searchTag = null;
                }
                else
                {
                    Posts = await context.Posts.Where(p => p.GroupPost.PublicStatus == 5)
                                                .OrderBy(p => p.CreatedDate).Reverse()
                                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role)
                                                .ToListAsync();
                    searchString = null;
                    searchTag = null;
                }
            }


            // Load important news (right side): Load announcement's admin
            HotNews = await context.Posts.Where(p => p.PostType.PostTypeName.Equals("Announcement")
                                                && p.UserPost.Role.RoleName.Equals("ADMIN"))
                                        .OrderBy(p => p.CreatedDate).Reverse()
                                        .Include(p => p.GroupPost)
                                        .Include(p => p.PostType)
                                        .Include(p => p.StatusNavigation)
                                        .Include(p => p.UserPost)
                                        .ToListAsync();
        }

        private string CheckLogin()
        {
            string role = HttpContext.Session.GetString("ROLE");
            return role;
        }
    }
}
