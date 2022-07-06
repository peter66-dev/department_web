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
        public IPostRepository postRepo;
        public IGroupRepository groupRepo;
        public IList<Post> Posts { get; set; }
        public IList<Post> HotNews { get; set; }
        public IList<GroupUser> GroupUsers { get; set; }
        public IList<Group> Groups { get; set; }
        public IList<Group> OtherGroups { get; set; }

        public IndexModel(department_dbContext context)
        {
            this.context = context;
            userRepo = new UserRepository();
            postRepo = new PostRepository();
            groupRepo = new GroupRepository();
        }


        public async Task OnGetAsync(string searchString, string searchTag, string loadPage)
        {
            string role = CheckLogin();
            if (role == null) // Chưa login!
            {
                if (searchString != null && searchString.Trim().Length > 0) // search by tag + title
                {
                    Posts = await context.Posts.Where(p => (p.Tags.Contains(searchString) && (p.GroupPost.PublicStatus == 5 || p.PostType.PostTypeName.Equals("Announcement") || p.Status == 5)
                                                          || (p.Title.Contains(searchString) && (p.GroupPost.PublicStatus == 5 || p.PostType.PostTypeName.Equals("Announcement") || p.Status == 5))))
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
                    Posts = await context.Posts.Where(p => p.Tags.Contains(searchTag) && (p.GroupPost.PublicStatus == 5 || p.PostType.PostTypeName.Equals("Announcement")) && p.Status == 5)
                                               .OrderBy(p => p.CreatedDate).Reverse()
                                               .Include(p => p.GroupPost)
                                               .Include(p => p.PostType)
                                               .Include(p => p.StatusNavigation)
                                               .Include(p => p.UserPost)
                                               .ThenInclude(u => u.Role)
                                               .ToListAsync();
                    searchTag = null;
                }

                else // OK
                {
                    Posts = await context.Posts.Where(p => (p.GroupPost.PublicStatus == 5 && p.Status == 5)
                                                        || p.PostType.PostTypeName.Equals("Announcement"))
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
                string current_user_id = HttpContext.Session.GetString("CURRENT_USER_ID");
                if (role.Equals("MANAGER"))
                { // Lấy ra những group mà nó đang làm chủ
                    var groupContXext = new department_dbContext();
                    Groups = await groupContXext.Groups
                                                    .Where(g => g.GroupOwnerId.ToString() == (current_user_id))
                                                    .ToListAsync();
                }
                else if (role.Equals("RESIDENT"))
                { // Lấy ra những group mà nó đang follow
                    var groupUserContext = new department_dbContext();
                    GroupUsers = await groupUserContext.GroupUsers
                                                    .Where(g => g.MemberId.ToString() == (current_user_id) 
                                                        && g.Status == 1)
                                                    .Include(p => p.Group)
                                                    .ToListAsync();

                    // Discover other groups
                    List<Group> allGroups = await groupRepo.GetGroupsAsync();
                    OtherGroups = DiscoverGroups(allGroups, GroupUsers.ToList());
                }

                if (searchString != null && searchString.Trim().Length > 0)
                {
                    Posts = await postRepo.SearchStringPostsByUserLogined(Guid.Parse(current_user_id), searchString);
                    searchString = null;
                }
                else if (searchTag != null)
                {
                    Posts = await postRepo.SearchTagsPostsByUserLogined(Guid.Parse(current_user_id), searchTag);
                    searchTag = null;
                }
                else // OK
                {
                    Posts = await postRepo.GetPostsForUserLogined(Guid.Parse(current_user_id));
                    searchString = null;
                    searchTag = null;
                }
            }

            // Load important news (right side): Load announcement's admin
            List<Post> tmp = new List<Post>();
            HotNews = await context.Posts.Where(p => p.PostType.PostTypeName.Equals("Announcement"))
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

        private List<Group> DiscoverGroups(List<Group> groups, List<GroupUser> followings)
        {
            List<Group> result = new List<Group>();
            List<Group> tmp = new List<Group>();

            // parse groupuser to groups
            foreach (GroupUser gu in followings)
            {
                tmp.Add(gu.Group);
            }
            Console.WriteLine($"All groups are {groups.Count}!");
            Console.WriteLine($"Following groups are {tmp.Count}!");
            
            int count = 0;
            foreach (Group group in groups)
            {
                if (!tmp.Any(g => g.GroupId == group.GroupId))
                {
                    ++count;
                    result.Add(group);
                }
            }

            Console.WriteLine($"Discover groups are: {result.Count}!");

            return result;
        }
    }
}
