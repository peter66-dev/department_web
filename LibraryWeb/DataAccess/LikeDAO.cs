using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MyLibrary.DataAccess
{
    internal class LikeDAO
    {
        private static LikeDAO instance = null;
        private static readonly object instanceLock = new object();

        private LikeDAO() { }

        public static LikeDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new LikeDAO();
                    }
                }
                return instance;
            }
        }

        public IEnumerable<Like> GetLikes()
        {
            List<Like> list = new List<Like>();
            try
            {
                var context = new department_dbContext();
                context.Likes.ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetLikes: " + ex.Message);
            }
            return list;
        }
        public Like GetLikeById(Guid likeId)
        {
            Like like = new Like();
            try
            {
                var context = new department_dbContext();
                like = context.Likes.FirstOrDefault(g => g.LikeId.Equals(likeId));
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetLikeById: " + ex.Message);
            }
            return like;
        }
        public void DeleteLikeById(Guid likeId)
        {
            try
            {
                var context = new department_dbContext();
                Like like = context.Likes.FirstOrDefault(l => l.LikeId.Equals(likeId));
                like.Status = 6;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DeleteLikeById: " + ex.Message);
            }
        }
        public void CreateLike(Like like)
        {
            try
            {
                var context = new department_dbContext();
                context.Likes.Add(like);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CreateLike: " + ex.Message);
            }
        }
    }
}
