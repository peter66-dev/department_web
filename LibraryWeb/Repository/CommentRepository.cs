using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public class CommentRepository : ICommentRepository
    {
        public Comment CreateComment(Guid userid, Guid postid, string content) => CommentDAO.Instance.CreateComment(userid, postid, content);
        public void DeleteCommentById(Guid commentId) => CommentDAO.Instance.DeleteCommentById(commentId);
        public Comment GetCommentById(Guid commentId) => CommentDAO.Instance.GetCommentById(commentId);
        public IEnumerable<Comment> GetComments() => CommentDAO.Instance.GetComments();
    }
}
