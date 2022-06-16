using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DataAccess
{
    internal class CommentDAO
    {
        department_dbContext _dbContext;

        public CommentDAO()
        {
            _dbContext = new department_dbContext();
        }

        public IEnumerable<Comment> GetComments() => _dbContext.Comments.ToList();

        public Comment GetCommentById(Guid commentId) => _dbContext.Comments.FirstOrDefault(cmt => cmt.CommentId.Equals(commentId));

        public void DeleteCommentById(Guid commentId)
        {
            Comment comment = _dbContext.Comments.FirstOrDefault(cmt => cmt.CommentId.Equals(commentId));
            comment.Status = 0;

            _dbContext.SaveChanges();
        }
        public void CreateComment(Comment comment)
        {
            _dbContext.Comments.Add(comment);
            _dbContext.SaveChanges();
        }


    }
}
