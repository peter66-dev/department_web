using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DataAccess
{
    internal class LikeDAO
    {
        department_dbContext _dbContext;

        public LikeDAO()
        {}

        public IEnumerable<Like> GetLikes()
        {
            _dbContext = new department_dbContext();
            return _dbContext.Likes.ToList();
        }
        public Like GetLikeById(Guid likeId)
        {
            _dbContext = new department_dbContext();
            return _dbContext.Likes.FirstOrDefault(lke => lke.LikeId.Equals(likeId));
        }
        public void DeleteLikeById(Guid likeId)
        {
            _dbContext = new department_dbContext();
            Like like = _dbContext.Likes.FirstOrDefault(lke => lke.LikeId.Equals(likeId));
            like.Status = 0;

            _dbContext.SaveChanges();
        }
        public void CreateLike(Like like)
        {
            _dbContext = new department_dbContext();
            _dbContext.Likes.Add(like);
            _dbContext.SaveChanges();
        }
    }
}
