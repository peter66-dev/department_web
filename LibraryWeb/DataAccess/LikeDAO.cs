using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MyLibrary.DataAccess
{
    public class LikeDAO
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

        private Like GetLikeByUserIDAndPostID(string userid, string postid)
        {
            Like like = null;
            try
            {
                var context = new department_dbContext();
                like = context.Likes.SingleOrDefault(l => l.UserId.ToString().Equals(userid) && l.PostId.ToString().Equals(postid));
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at GetLikeByUserIDAndPostID: " + ex.Message);
            }
            return like;
        }

        public int ChangeLikeStatus(string userid, string postid)
        {
            int result = 0;
            try
            {
                Like like = GetLikeByUserIDAndPostID(userid, postid);
                var context = new department_dbContext();
                if (like == null)
                {
                    like = new Like()
                    {
                        LikeId = Guid.NewGuid(),
                        UserId = Guid.Parse(userid),
                        PostId = Guid.Parse(postid),
                        Status = 1
                    };
                    result = 1;
                    context.Likes.Add(like);
                    context.SaveChanges();
                }
                else // đã có trong bảng like
                {
                    like.Status = like.Status == 1 ? 2 : 1;
                    result = like.Status;
                    context.Entry(like).State = EntityState.Modified;
                    context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at ChangeLikeStatus: " + ex.Message);
            }
            return result;
        }
    }
}
