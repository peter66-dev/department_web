using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DataAccess
{
    internal class CommentReplyDAO
    {
        private static CommentReplyDAO instance = null;
        private static readonly object instanceLock = new object();
        private department_dbContext _dbContext;
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
            _dbContext = new department_dbContext();
            return _dbContext.CommentReplies.ToList();
        }
        public CommentReply GetCommentReplyById(Guid commentReplyId)
        {
            _dbContext = new department_dbContext();
            return _dbContext.CommentReplies.FirstOrDefault(cmtrepl => cmtrepl.CommentReplyId.Equals(commentReplyId));
        }
        public void DeleteCommentReplyById(Guid commentReplyId)
        {
            CommentReply commentReply = _dbContext.CommentReplies.FirstOrDefault(cmtrepl => cmtrepl.CommentReplyId.Equals(commentReplyId));
            commentReply.Status = 0;

            _dbContext.SaveChanges();
        }
        public void CreateCommentReply(CommentReply commentReply)
        {
            _dbContext = new department_dbContext();
            _dbContext.CommentReplies.Add(commentReply);
            _dbContext.SaveChanges();
        }


    }
}
