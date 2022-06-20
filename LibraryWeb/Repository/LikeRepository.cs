using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public class LikeRepository : ILikeRepository
    {
        public IEnumerable<Like> GetLikes() => LikeDAO.Instance.GetLikes();
        public Like GetLikeById(Guid likeId) => LikeDAO.Instance.GetLikeById(likeId);
        public void DeleteLikeById(Guid likeId) => LikeDAO.Instance.DeleteLikeById(likeId);
        public void CreateLike(Like like) => LikeDAO.Instance.CreateLike(like);
    }
}
