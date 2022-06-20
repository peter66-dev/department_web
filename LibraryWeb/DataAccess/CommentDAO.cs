using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MyLibrary.DataAccess
{
    internal class CommentDAO
    {
        private static CommentDAO instance = null;
        private static readonly object instanceLock = new object();
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
            List<Comment> list = new List<Comment>();
            try
            {
                var context = new department_dbContext();
                context.Comments.ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetComments: " + ex.Message);
            }
            return list;
        }
        public Comment GetCommentById(Guid commentId)
        {
            Comment comment = new Comment();
            try
            {
                var context = new department_dbContext();
                comment = context.Comments.FirstOrDefault(c => c.CommentId.Equals(commentId));
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetCommentById: " + ex.Message);
            }
            return comment;
        }
        public void DeleteCommentById(Guid commentId)
        {
            try
            {
                var context = new department_dbContext();
                Comment comment = context.Comments.FirstOrDefault(cmt => cmt.CommentId.Equals(commentId));
                comment.Status = 6;

                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DeleteCommentById: " + ex.Message);
            }
        }
        public void CreateComment(Comment comment)
        {
            try
            {
                var context = new department_dbContext();
                context.Comments.Add(comment);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CreateComment: " + ex.Message);
            }
        }


    }
}
