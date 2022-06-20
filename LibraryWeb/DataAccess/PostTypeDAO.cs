using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MyLibrary.DataAccess
{
    internal class PostTypeDAO
    {
        private static PostTypeDAO instance = null;
        private static readonly object instanceLock = new object();

        private PostTypeDAO() { }

        public static PostTypeDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new PostTypeDAO();
                    }
                }
                return instance;
            }
        }

        public IEnumerable<PostType> GetPostTypes()
        {
            List<PostType> list = new List<PostType>();
            try
            {
                var context = new department_dbContext();
                context.PostTypes.ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetPostTypes: " + ex.Message);
            }
            return list;
        }
        public PostType GetPostTypeById(Guid postTypeId)
        {
            PostType pt = new PostType();
            try
            {
                var context = new department_dbContext();
                pt = context.PostTypes.FirstOrDefault(p => p.PostTypeId.Equals(postTypeId));
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetPostTypeById: " + ex.Message);
            }
            return pt;
        }
        public void DeletePostTypeById(Guid postTypeId)
        {
            try
            {
                var context = new department_dbContext();
                PostType pt = context.PostTypes.FirstOrDefault(p => p.PostTypeId.Equals(postTypeId));
                pt.Status = 6;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DeletePostTypeById: " + ex.Message);
            }
        }
        public void CreatePostType(PostType postType)
        {
            try
            {
                var context = new department_dbContext();
                context.PostTypes.Add(postType);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CreatePostType: " + ex.Message);
            }
        }
    }
}
