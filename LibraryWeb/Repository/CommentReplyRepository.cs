using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public class CommentReplyRepository : ICommentReplyRepository
    {
        public IEnumerable<CommentReply> GetCommentReplies() 
            => CommentReplyDAO.Instance.GetCommentReplies();
        public CommentReply GetCommentReplyById(Guid commentReplyId) 
            => CommentReplyDAO.Instance.GetCommentReplyById(commentReplyId);
        public void DeleteCommentReplyById(Guid commentReplyId) 
            => CommentReplyDAO.Instance.DeleteCommentReplyById(commentReplyId);

        public CommentReply CreateCommentReply(Guid userReplyId, Guid commentId, string content)
            => CommentReplyDAO.Instance.CreateCommentReply(userReplyId, commentId, content);
    }
}
