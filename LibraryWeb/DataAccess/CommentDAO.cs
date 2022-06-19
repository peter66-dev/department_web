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
        private static CommentDAO instance = null;
        private static readonly object instanceLock = new object();
        private department_dbContext _dbContext;
        private CommentDAO() { }

        public static CommentDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new CommentDAO();
                    }
                }
                return instance;
            }
        }

        public IEnumerable<Comment> GetComments()
        {
            _dbContext = new department_dbContext();
            return _dbContext.Comments.ToList();
        }
        public Comment GetCommentById(Guid commentId)
        {
            _dbContext = new department_dbContext(); 
            return _dbContext.Comments.FirstOrDefault(cmt => cmt.CommentId.Equals(commentId));
        }
        public void DeleteCommentById(Guid commentId)
        {
            _dbContext = new department_dbContext();
            Comment comment = _dbContext.Comments.FirstOrDefault(cmt => cmt.CommentId.Equals(commentId));
            comment.Status = 0;

            _dbContext.SaveChanges();
        }
        public void CreateComment(Comment comment)
        {
            _dbContext = new department_dbContext();
            _dbContext.Comments.Add(comment);
            _dbContext.SaveChanges();
        }


    }
}
