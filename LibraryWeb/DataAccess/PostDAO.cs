using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;

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
        public void CreatePost(Post post)
        {
            try
            {
                var context = new department_dbContext();
                context.Posts.Add(post);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CreatePost: " + ex.Message);
            }
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
    }
}
