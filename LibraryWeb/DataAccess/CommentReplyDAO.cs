using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MyLibrary.DataAccess
{
    internal class CommentReplyDAO
    {
        private static CommentReplyDAO instance = null;
        private static readonly object instanceLock = new object();
        private CommentReplyDAO() { }

        public static CommentReplyDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new CommentReplyDAO();
                    }
                }
                return instance;
            }
        }

        public IEnumerable<CommentReply> GetCommentReplies()
        {
            List<CommentReply> list = new List<CommentReply>();
            try
            {
                var context = new department_dbContext();
                context.CommentReplies.ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetCommentReplies: " + ex.Message);
            }
            return list;
        }

        public CommentReply GetCommentReplyById(Guid commentReplyId)
        {
            CommentReply comment = new CommentReply();
            try
            {
                var context = new department_dbContext();
                comment = context.CommentReplies.FirstOrDefault(cmtrepl => cmtrepl.CommentReplyId.Equals(commentReplyId));
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetCommentReplyById: " + ex.Message);
            }
            return comment;
        }
        public void DeleteCommentReplyById(Guid commentReplyId)
        {
            try
            {
                var context = new department_dbContext();
                CommentReply comment = context.CommentReplies.FirstOrDefault(cmt => cmt.CommentReplyId.Equals(commentReplyId));
                comment.Status = 6;

                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DeleteCommentReplyById: " + ex.Message);
            }
        }
        public CommentReply CreateCommentReply(Guid userReplyId, Guid commentId, string content)
        {
            CommentReply cmtReply = null;
            try
            {
                var context = new department_dbContext();
                cmtReply = new CommentReply()
                {
                    CommentReplyId = Guid.NewGuid(),
                    UserReplyId = userReplyId,
                    CommentId = commentId,
                    CommentReplyContent = content,
                    CreatedDate = DateTime.Now,
                    Status = 5
                };
                context.CommentReplies.Add(cmtReply);
                bool check = context.SaveChanges() > 0;
                if (!check) // insert fail > return null
                {
                    cmtReply = null;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CreateCommentReply: " + ex.Message);
            }
            return cmtReply;
        }


    }
}
