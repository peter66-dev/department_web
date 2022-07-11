using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyLibrary.DataAccess
{
    internal class PostDAO
    {
        private static PostDAO instance = null;
        private static readonly object instanceLock = new object();

        private PostDAO() { }

        public static PostDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new PostDAO();
                    }
                }
                return instance;
            }
        }

        public async Task<IEnumerable<Post>> GetPosts()
        {
            List<Post> list = new List<Post>();
            try
            {
                var context = new department_dbContext();
                list = await context.Posts.Where(p => p.Status == 5 || p.Status == 7 && p.GroupPost.Status == 1)
                                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role).ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetPosts: " + ex.Message);
            }
            return list;
        }

        public Post GetPostById(Guid postId)
        {
            Post post = new Post();
            try
            {
                var context = new department_dbContext();
                post = context.Posts
                                    .Where(p => p.PostId.Equals(postId))
                                    .Include(p => p.UserPost)
                                    .ToList()[0];
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetPostById: " + ex.Message);
            }
            return post;
        }

        public IEnumerable<Post> GetPostByUserId(Guid userid)
        {
            IEnumerable<Post> list = null;
            try
            {
                var context = new department_dbContext();
                list = context.Posts
                                    .Include(p => p.GroupPost)
                                    .Include(p => p.PostType)
                                    .Include(p => p.StatusNavigation)
                                    .Include(p => p.UserPost)
                                    .Where(m => m.UserPostId == userid && m.Status != 9 && m.GroupPost.Status == 1)
                                    .OrderBy(p => p.CreatedDate)
                                    .Reverse()
                                    .ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetPostByUserId: " + ex.Message);
            }
            return list;
        }

        public async Task<IEnumerable<Post>> AdminSeeAllPostsUser(Guid userid) // có vô
        {
            IEnumerable<Post> list = null;
            try
            {
                var context = new department_dbContext();
                list = await context.Posts
                                    .Include(p => p.GroupPost)
                                    .Include(p => p.PostType)
                                    .Include(p => p.StatusNavigation)
                                    .Include(p => p.UserPost)
                                    .Where(m => m.UserPostId == userid && m.Status == 5 && m.GroupPost.Status == 1) // lấy bài đăng đã được duyệt ở group đang hoạt động(public + private)
                                    .OrderBy(p => p.CreatedDate)
                                    .Reverse()
                                    .ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at AdminSeeAllPostsUser: " + ex.Message);
            }
            return list;
        }

        public async Task<IEnumerable<Post>> GetPostByUserIdAsync(Guid userid, string role)
        {
            IEnumerable<Post> list = null;
            try
            {
                var context = new department_dbContext();
                if (role.Equals("ADMIN"))
                {
                    list = await context.Posts
                                   .Include(p => p.GroupPost)
                                   .Include(p => p.PostType)
                                   .Include(p => p.StatusNavigation)
                                   .Include(p => p.UserPost)
                                   .Where(m => m.UserPostId == userid && m.Status == 7)
                                   .OrderBy(p => p.CreatedDate)
                                   .Reverse()
                                   .ToListAsync();
                }
                else
                {
                    list = await context.Posts
                                   .Include(p => p.GroupPost)
                                   .Include(p => p.PostType)
                                   .Include(p => p.StatusNavigation)
                                   .Include(p => p.UserPost)
                                   .Where(m => m.UserPostId == userid && (m.Status == 5 && m.GroupPost.Status == 1))
                                   .OrderBy(p => p.CreatedDate)
                                   .Reverse()
                                   .ToListAsync();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetPostByUserIdAsync: " + ex.Message);
            }
            return list;
        }

        public async Task<Post> GetPostByIdAsync(Guid postId)
        {
            Post post = new Post();
            try
            {
                var context = new department_dbContext();
                post = await context.Posts
                                    .Include(p => p.GroupPost)
                                    .Include(p => p.PostType)
                                    .Include(p => p.StatusNavigation)
                                    .Include(p => p.UserPost)
                                    .FirstOrDefaultAsync(m => m.PostId == postId);
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetPostByIdAsync: " + ex.Message);
            }
            return post;
        }

        public async Task<List<Post>> GetPostsForUserLogined(Guid userid)
        {
            List<Post> list = new List<Post>();
            try
            {
                var context = new department_dbContext();
                GroupUserRepository repo = new GroupUserRepository();
                GroupRepository groupRepo = new GroupRepository();
                list = context.Posts.Where(p => (((p.GroupPost.PublicStatus == 5 && p.Status == 5 && p.GroupPost.Status == 1)
                                                    || (p.PostType.PostTypeName.Equals("Announcement") && p.Status == 7))))
                                                .OrderBy(p => p.CreatedDate).Reverse()
                                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role)
                                                .ToList();

                IEnumerable<Group> groups = await repo.GetGroupsByUserId(userid);
                IEnumerable<Group> groups1 = await groupRepo.GetGroupsByLeaderId(userid);
                foreach (Group gr in groups)
                {               // Lấy những bài mà resident đang follow
                    List<Post> tmp = new List<Post>();
                    tmp = await context.Posts.Where(p => (p.GroupPost.PublicStatus == 6 && p.Status == 5 && p.GroupPost.Status == 1 && p.GroupPostId == gr.GroupId))
                                                .OrderBy(p => p.CreatedDate).Reverse()
                                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role)
                                                .ToListAsync();
                    list.AddRange(tmp);
                }

                foreach (Group gr in groups1)
                { // Lấy những bài mà group của manager quản lý
                    List<Post> tmp = new List<Post>();
                    tmp = await context.Posts.Where(p => (p.GroupPost.PublicStatus == 6 && p.Status == 5 && p.GroupPost.Status == 1 && p.GroupPostId == gr.GroupId))
                                                .OrderBy(p => p.CreatedDate).Reverse()
                                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role)
                                                .ToListAsync();
                    list.AddRange(tmp);
                }
                //List<Post> tmp1 = new List<Post>();
                //tmp1 = await context.Posts.Where(p => p.Status == 7
                //                                    || (p.GroupPost.PublicStatus == 5 && p.Status == 5 && p.GroupPost.Status == 1))
                //                              .OrderBy(p => p.CreatedDate).Reverse()
                //                              .Include(p => p.GroupPost)
                //                                .Include(p => p.PostType)
                //                                .Include(p => p.StatusNavigation)
                //                                .Include(p => p.UserPost)
                //                                .ThenInclude(u => u.Role)
                //                            .ToListAsync();
                //list.AddRange(tmp1);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at GetPostsForUserLogined: " + ex.Message); ;
            }
            return list;
        }

        public async Task<List<Post>> GetPostsInUserDetailsWithoutLogin(Guid userDetailId)
        {
            List<Post> list = new List<Post>();
            try
            {
                var context = new department_dbContext();
                IUserRepository repo = new UserRepository();
                User user = repo.GetUserById(userDetailId);

                if (user.Role.RoleName.Equals("ADMIN"))
                {
                    list = await context.Posts
                                    .Where(p => p.UserPostId == userDetailId
                                                && p.Status == 7) // Nếu nó là admin
                                    .Include(p => p.UserPost)
                                    .ToListAsync();
                }
                else if (user.Role.RoleName.Equals("MANAGER"))
                {
                    list = await context.Posts.Where(p => p.UserPostId == userDetailId // Bài của userDetailId
                                                        && p.GroupPost.PublicStatus == 5 && p.GroupPost.Status == 1) // group public mà userDetailId đang quản lý
                                              .Include(p => p.UserPost)
                                              .Include(p => p.GroupPost)
                                              .OrderBy(p => p.CreatedDate).Reverse()
                                              .ToListAsync();
                }
                else        // RESIDENT
                {
                    list = await context.Posts.Where(p => p.UserPostId == userDetailId // Bài của userDetailId
                                                        && p.GroupPost.PublicStatus == 5
                                                        && p.Status == 5 && p.GroupPost.Status == 1) // group public mà userDetailId đang join
                                              .Include(p => p.UserPost)
                                              .Include(p => p.GroupPost)
                                              .OrderBy(p => p.CreatedDate).Reverse()
                                              .ToListAsync();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at GetPostsInUserDetailsWithoutLogin: " + ex.Message); ;
            }
            return list;
        }

        public async Task<IEnumerable<Post>> GetPostByGroupIdAndUserPostId(Guid groupId, Guid userPostId)
        {
            IEnumerable<Post> list = new List<Post>();
            try
            {
                var context = new department_dbContext();
                list = await context.Posts.Where(p => p.GroupPostId == groupId
                                                    && p.Status == 5 && p.GroupPost.Status == 1
                                                    && p.UserPostId == userPostId)
                                              .Include(p => p.UserPost)
                                              .Include(p => p.GroupPost)
                                              .OrderBy(p => p.CreatedDate).Reverse()
                                              .ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetPostByGroupIdAndUserPostId: " + ex.Message);
            }
            return list;
        }

        public async Task<IEnumerable<Post>> GetPostsByGroupId(Guid groupId)
        {
            IEnumerable<Post> list = new List<Post>();
            try
            {
                var context = new department_dbContext();
                list = await context.Posts.Where(p => p.GroupPostId == groupId
                                                    && p.Status == 5 && p.GroupPost.Status == 1)
                                              .Include(p => p.UserPost)
                                              .Include(p => p.GroupPost)
                                              .OrderBy(p => p.CreatedDate).Reverse()
                                              .ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetPostsByGroupId: " + ex.Message);
            }
            return list;
        }

        public async Task<IEnumerable<Post>> GetPostsForManagerApprove(Guid managerId)
        {
            IEnumerable<Post> list = new List<Post>();
            try
            {
                var context = new department_dbContext();
                list = await context.Posts
                                        .Where(p => p.GroupPost.GroupOwnerId == managerId
                                            && p.Status == 4 && p.GroupPost.Status == 1)
                                        .Include(p => p.UserPost)
                                        .Include(p => p.GroupPost)
                                        .OrderBy(p => p.CreatedDate).Reverse().ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetPostsForManagerApprove: " + ex.Message);
            }
            return list;
        }

        public async Task<bool> DeletePostByIdAsync(Guid postId)
        {
            bool check = false;
            try
            {
                var context = new department_dbContext();
                Post post = await context.Posts.FirstOrDefaultAsync(p => p.PostId == postId);
                post.Status = 6;
                check = context.SaveChanges() > 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DeletePostByIdAsync: " + ex.Message);
            }
            return check;
        }

        public void DeletePostByGroupid(Guid groupid)
        {
            try
            {
                var context = new department_dbContext();
                List<Post> posts = context.Posts.Where(p => p.GroupPostId == groupid).ToList();
                foreach (var item in posts)
                {
                    DeletePost(item.PostId);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DeletePostByGroupid: " + ex.Message);
            }
        }

        private void DeletePost(Guid postid)
        {
            try
            {
                var context = new department_dbContext();
                Post post = context.Posts.FirstOrDefault(p => p.PostId == postid);
                post.Status = 9;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DeletePostByGroupid: " + ex.Message);
            }
        }

        private Guid GetPostTypeId(string name)
        {
            PostType pt = null;
            try
            {
                var context = new department_dbContext();
                pt = context.PostTypes.SingleOrDefault(p => p.PostTypeName.Equals(name));
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at GetPostTypeId: " + ex.Message);
            }
            return pt.PostTypeId;
        }

        public bool CreatePost(Guid userid, string roleName, Guid grouppostid,
            string title, string tags, string content)
        {
            bool check = false;
            try
            {
                var context = new department_dbContext();
                Post post = new Post();
                post.PostId = Guid.NewGuid();
                post.UserPostId = userid;
                post.Title = title;
                post.LikesTotal = 0;
                post.CommentsTotal = 0;
                post.Views = 0;
                post.Tags = tags.Trim();
                post.PostContent = content;
                post.CreatedDate = DateTime.Now;
                post.LastModified = null;
                post.ApprovedDate = null;
                post.Reason = null;
                if (roleName.Equals("ADMIN"))
                {
                    post.GroupPostId = null;
                    post.PostTypeId = GetPostTypeId("Announcement"); // Announcement
                    post.ApprovedDate = DateTime.Now;
                    post.Status = 7;
                }
                else if (roleName.Equals("MANAGER"))
                {
                    post.GroupPostId = grouppostid;
                    post.PostTypeId = GetPostTypeId("News"); // News
                    post.ApprovedDate = DateTime.Now;
                    post.Status = 5;
                }
                else if (roleName.Equals("RESIDENT"))
                {
                    post.GroupPostId = grouppostid;
                    post.PostTypeId = GetPostTypeId("News"); // News
                    post.Status = 4; // pending and waiting for manager's approval
                }
                else
                {
                    throw new Exception();
                }
                context.Posts.Add(post);
                check = context.SaveChanges() > 0;
            }
            catch (Exception ex)
            {

                Console.WriteLine("Error at CreatePost: " + ex.Message); ;
            }
            return check;
        }

        public void IncreaseViews(Guid postid)
        {
            try
            {
                var context = new department_dbContext();
                Post post = context.Posts.FirstOrDefault(p => p.PostId.Equals(postid));
                ++post.Views;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CreatePost: " + ex.Message);
            }
        }

        public int IncreaseCommentsTotal(Guid postid)
        {
            int result = 0;
            try
            {
                var context = new department_dbContext();
                Post post = context.Posts.FirstOrDefault(p => p.PostId.Equals(postid));
                ++post.CommentsTotal;
                result = post.CommentsTotal;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at IncreaseCommentsTotal: " + ex.Message);
            }
            return result;
        }

        public int IncreaseLikesTotal(Guid postid)
        {
            int result = 0;
            try
            {
                var context = new department_dbContext();
                Post post = context.Posts.FirstOrDefault(p => p.PostId.Equals(postid));
                ++post.LikesTotal;
                result = post.LikesTotal;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DecreaseLikesTotal: " + ex.Message);
            }
            return result;
        }

        public int DecreaseLikesTotal(Guid postid)
        {
            int result = 0;
            try
            {
                var context = new department_dbContext();
                Post post = context.Posts.FirstOrDefault(p => p.PostId.Equals(postid));
                --post.LikesTotal;
                result = post.LikesTotal;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DecreaseLikesTotal: " + ex.Message);
            }
            return result;
        }

        public async Task<List<Post>> SearchStringPostsByUserLogined(Guid userid, string searchString)
        {
            List<Post> list = new List<Post>();
            try
            {
                var context = new department_dbContext();
                GroupUserRepository repo = new GroupUserRepository();
                GroupRepository groupRepo = new GroupRepository();

                IEnumerable<Group> groups = await repo.GetGroupsByUserId(userid);
                IEnumerable<Group> groups1 = await groupRepo.GetGroupsByLeaderId(userid);
                list = context.Posts.Where(p => (p.Tags.Contains(searchString) && ((p.GroupPost.PublicStatus == 5 && p.Status == 5 && p.GroupPost.Status == 1) || (p.PostType.PostTypeName.Equals("Announcement") && p.Status == 7))
                                                          || (p.Title.Contains(searchString) && ((p.GroupPost.PublicStatus == 5 && p.Status == 5 && p.GroupPost.Status == 1) || (p.PostType.PostTypeName.Equals("Announcement") && p.Status == 7)))))
                                                .OrderBy(p => p.CreatedDate).Reverse()
                                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role)
                                                .ToList();
                foreach (Group gr in groups)
                { // Lấy những bài mà resident đang follow
                    List<Post> tmp = new List<Post>();
                    tmp = await context.Posts.Where(p => (p.Tags.Contains(searchString) && p.GroupPost.GroupId == gr.GroupId && p.Status == 5 && p.GroupPost.PublicStatus == 6 && p.GroupPost.Status == 1)
                                                        || (p.Title.Contains(searchString) && p.GroupPost.GroupId == gr.GroupId && p.Status == 5 && p.GroupPost.PublicStatus == 6 && p.GroupPost.Status == 1))
                                                .OrderBy(p => p.CreatedDate).Reverse()
                                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role)
                                                .ToListAsync();
                    list.AddRange(tmp);
                }

                foreach (Group gr in groups1)
                { // Lấy những bài mà group của manager quản lý
                    List<Post> tmp = new List<Post>();
                    tmp = await context.Posts.Where(p => (p.Tags.Contains(searchString) && p.GroupPost.GroupId == gr.GroupId)
                                                        || (p.Title.Contains(searchString) && p.GroupPost.GroupId == gr.GroupId))
                                                .OrderBy(p => p.CreatedDate).Reverse()
                                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role)
                                                .ToListAsync();
                    list.AddRange(tmp);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at SearchStringPostsByUserLogined: " + ex.Message); ;
            }
            return list;
        }

        public async Task<List<Post>> SearchTagsPostsByUserLogined(Guid userid, string searchTags)
        {
            List<Post> list = new List<Post>();
            try
            {
                var context = new department_dbContext();
                GroupUserRepository repo = new GroupUserRepository();
                GroupRepository groupRepo = new GroupRepository();
                list = context.Posts.Where(p => (p.Tags.Contains(searchTags) && (((p.GroupPost.PublicStatus == 5 && p.Status == 5 && p.GroupPost.Status == 1) // 1
                                                            || (p.PostType.PostTypeName.Equals("Announcement") && p.Status == 7)))))
                                                .OrderBy(p => p.CreatedDate).Reverse()
                                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role)
                                                .ToList();

                IEnumerable<Group> groups = await repo.GetGroupsByUserId(userid);
                IEnumerable<Group> groups1 = await groupRepo.GetGroupsByLeaderId(userid);
                foreach (Group gr in groups)
                { // Lấy những bài mà resident đang follow
                    List<Post> tmp = new List<Post>();
                    tmp = await context.Posts.Where(p => (p.Tags.Contains(searchTags) && p.GroupPostId == gr.GroupId && p.Status == 5 && p.GroupPost.Status == 1 && p.GroupPost.PublicStatus == 6))
                                                .OrderBy(p => p.CreatedDate).Reverse()
                                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role)
                                                .ToListAsync();
                    list.AddRange(tmp);
                }
                foreach (Group gr in groups1)
                { // Lấy những bài mà group của manager quản lý
                    List<Post> tmp = new List<Post>();
                    tmp = await context.Posts.Where(p => (p.Tags.Contains(searchTags) && p.GroupPostId == gr.GroupId && p.GroupPost.Status == 1 && p.Status == 5 && p.GroupPost.PublicStatus == 6)) // 2
                                                .OrderBy(p => p.CreatedDate).Reverse()
                                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role)
                                                .ToListAsync();
                    list.AddRange(tmp);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at SearchTagsPostsByUserLogined: " + ex.Message); ;
            }
            return list;
        }

        public async Task<IEnumerable<Post>> SearchStringByAdminRole(string searchString)
        {
            List<Post> list = new List<Post>();
            try
            {
                var context = new department_dbContext();
                list = await context.Posts.Where(p => ((p.Status == 5 && p.GroupPost.Status == 1) || p.Status == 7)
                                && (p.Title.Contains(searchString) || p.Tags.Contains(searchString)))
                                .OrderBy(p => p.CreatedDate).Reverse()
                                .Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role).ToListAsync();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at SearchStringByAdminRole: " + ex.Message); ;
            }
            return list;
        }

        public async Task<IEnumerable<Post>> SearchTagByAdminRole(string searchTag)
        {
            List<Post> list = new List<Post>();
            try
            {
                var context = new department_dbContext();
                list = await context.Posts.Where(p => ((p.Status == 5 && p.GroupPost.Status == 1) || p.Status == 7)
                                && (p.Tags.Contains(searchTag)))
                                .OrderBy(p => p.CreatedDate).Reverse().Include(p => p.GroupPost)
                                                .Include(p => p.PostType)
                                                .Include(p => p.StatusNavigation)
                                                .Include(p => p.UserPost)
                                                .ThenInclude(u => u.Role).ToListAsync();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at SearchTagByAdminRole: " + ex.Message); ;
            }
            return list;
        }


        public bool ApprovePost(Guid postid)
        {
            bool check = false;
            try
            {
                var context = new department_dbContext();
                Post post = GetPostById(postid);
                if (post != null)
                {
                    post.ApprovedDate = DateTime.Now;
                    post.Status = 5;
                }
                context.Entry(post).State = EntityState.Modified;
                check = context.SaveChanges() > 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at ApprovePost: " + ex.Message);
            }
            return check;
        }

        public bool RejectPost(Guid postid, string reason)
        {
            bool check = false;
            try
            {
                var context = new department_dbContext();
                Post post = GetPostById(postid);
                if (post != null)
                {
                    post.Reason = reason;
                    post.Status = 8;
                }
                context.Entry(post).State = EntityState.Modified;
                check = context.SaveChanges() > 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at RejectPost: " + ex.Message);
            }
            return check;
        }

        public async Task<bool> UpdatePost(Guid postid, string title, string tags, string content)
        {
            bool check = false;
            try
            {
                var context = new department_dbContext();
                Post post = await context.Posts.FirstOrDefaultAsync(p => p.PostId == postid);
                post.Title = title;
                post.Tags = tags;
                post.PostContent = content;
                post.LastModified = DateTime.Now;
                context.Entry(post).State = EntityState.Modified;
                check = context.SaveChanges() > 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at UpdatePost: " + ex.Message);
            }
            return check;
        }

        public void DeleteMyPost(Guid postid)
        {
            try
            {
                var context = new department_dbContext();
                Post post = context.Posts.FirstOrDefault(p => p.PostId == postid);
                post.Status = 9;
                context.Entry(post).State = EntityState.Modified;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at DeleteMyPost: " + ex.Message);
            }
        }
    }
}
