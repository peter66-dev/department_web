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

        public IEnumerable<Post> GetPosts()
        {
            List<Post> list = new List<Post>();
            try
            {
                var context = new department_dbContext();
                context.Posts.ToList();
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
                post = context.Posts.FirstOrDefault(p => p.PostId.Equals(postId));
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetPostById: " + ex.Message);
            }
            return post;
        }

        public void DeletePostById(Guid postId)
        {
            try
            {
                var context = new department_dbContext();
                Post post = context.Posts.FirstOrDefault(p => p.PostId.Equals(postId));
                post.Status = 6;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DeletePostById: " + ex.Message);
            }
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
                post.NewContent = null;
                if (roleName.Equals("ADMIN"))
                {
                    post.GroupPostId = null;
                    post.PostTypeId = Guid.Parse("b7d8febc-f871-42ce-8164-f2e34e646cbf"); // Annoucement
                    post.Status = 7;
                }
                else if (roleName.Equals("MANAGER"))
                {
                    post.GroupPostId = grouppostid;
                    post.PostTypeId = Guid.Parse("f0560405-3b2b-4173-bab8-ba41c2f549ed"); // News
                    post.Status = 5;
                }
                else if (roleName.Equals("RESIDENT"))
                {
                    post.GroupPostId = grouppostid;
                    post.PostTypeId = Guid.Parse("f0560405-3b2b-4173-bab8-ba41c2f549ed"); // News
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
                Post post = context.Posts.SingleOrDefault(p => p.PostId.Equals(postid));
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
                Post post = context.Posts.SingleOrDefault(p => p.PostId.Equals(postid));
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
                Post post = context.Posts.SingleOrDefault(p => p.PostId.Equals(postid));
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
                Post post = context.Posts.SingleOrDefault(p => p.PostId.Equals(postid));
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
                foreach (Group gr in groups)
                { // Lấy những bài mà resident đang follow
                    List<Post> tmp = new List<Post>();
                    tmp = await context.Posts.Where(p => (p.Tags.Contains(searchString) && (p.GroupPost.PublicStatus == 5 || p.PostType.PostTypeName.Equals("Announcement") || p.GroupPost.GroupId == gr.GroupId))
                                                        || (p.Title.Contains(searchString) && (p.GroupPost.PublicStatus == 5 || p.PostType.PostTypeName.Equals("Announcement") || p.GroupPost.GroupId == gr.GroupId)))
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
                    tmp = await context.Posts.Where(p => (p.Tags.Contains(searchString) && (p.GroupPost.PublicStatus == 5 || p.PostType.PostTypeName.Equals("Announcement") || p.GroupPost.GroupId == gr.GroupId))
                                                        || (p.Title.Contains(searchString) && (p.GroupPost.PublicStatus == 5 || p.PostType.PostTypeName.Equals("Announcement") || p.GroupPost.GroupId == gr.GroupId)))
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

                IEnumerable<Group> groups = await repo.GetGroupsByUserId(userid);
                IEnumerable<Group> groups1 = await groupRepo.GetGroupsByLeaderId(userid);
                foreach (Group gr in groups)
                { // Lấy những bài mà resident đang follow
                    List<Post> tmp = new List<Post>();
                    tmp = await context.Posts.Where(p => (p.Tags.Contains(searchTags) && (p.GroupPost.PublicStatus == 5 || p.PostType.PostTypeName.Equals("Announcement") || p.GroupPostId == gr.GroupId)))
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
                    tmp = await context.Posts.Where(p => (p.Tags.Contains(searchTags) && (p.GroupPost.PublicStatus == 5 || p.PostType.PostTypeName.Equals("Announcement") || p.GroupPostId == gr.GroupId)))
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

        public async Task<List<Post>> GetPostsForUserLogined(Guid userid)
        {
            List<Post> list = new List<Post>();
            try
            {
                var context = new department_dbContext();
                GroupUserRepository repo = new GroupUserRepository();
                GroupRepository groupRepo = new GroupRepository();

                IEnumerable<Group> groups = await repo.GetGroupsByUserId(userid);
                IEnumerable<Group> groups1 = await groupRepo.GetGroupsByLeaderId(userid);
                foreach (Group gr in groups)
                { // Lấy những bài mà resident đang follow
                    List<Post> tmp = new List<Post>();
                    tmp = await context.Posts.Where(p => p.GroupPost.PublicStatus == 5 
                                                        || p.PostType.PostTypeName.Equals("Announcement")
                                                        || p.GroupPostId == gr.GroupId)
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
                    tmp = await context.Posts.Where(p => p.GroupPost.PublicStatus == 5
                                                        || p.PostType.PostTypeName.Equals("Announcement")
                                                        || p.GroupPostId == gr.GroupId)
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
                Console.WriteLine("Error at SearchPostsByUserLogined: " + ex.Message); ;
            }
            return list;
        }
    }
}
