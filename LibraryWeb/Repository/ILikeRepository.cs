using LibraryWeb.Model;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public interface ILikeRepository
    {
        void CreateLike(Like like);
        void DeleteLikeById(Guid likeId);
        Like GetLikeById(Guid likeId);
        IEnumerable<Like> GetLikes();
    }
}