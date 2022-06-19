using LibraryWeb.Model;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public interface ICommentRepository
    {
        void CreateComment(Comment comment);
        void DeleteCommentById(Guid commentId);
        Comment GetCommentById(Guid commentId);
        IEnumerable<Comment> GetComments();
    }
}