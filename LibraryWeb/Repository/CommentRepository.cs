using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public class CommentRepository : ICommentRepository
    {
        public void CreateComment(Comment comment) => CommentDAO.Instance.CreateComment(comment);
        public void DeleteCommentById(Guid commentId) => CommentDAO.Instance.DeleteCommentById(commentId);
        public Comment GetCommentById(Guid commentId) => CommentDAO.Instance.GetCommentById(commentId);
        public IEnumerable<Comment> GetComments() => CommentDAO.Instance.GetComments();
    }
}
