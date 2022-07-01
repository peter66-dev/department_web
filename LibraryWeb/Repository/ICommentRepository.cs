using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public interface ICommentRepository
    {
        Comment CreateComment(Guid userid, Guid postid, string content);
        void DeleteCommentById(Guid commentId);
        Comment GetCommentById(Guid commentId);
        IEnumerable<Comment> GetComments();
    }
}