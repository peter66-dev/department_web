using LibraryWeb.Model;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public interface ICommentReplyRepository
    {
        CommentReply CreateCommentReply(Guid userReplyId, Guid commentId, string content);
        void DeleteCommentReplyById(Guid commentReplyId);
        IEnumerable<CommentReply> GetCommentReplies();
        CommentReply GetCommentReplyById(Guid commentReplyId);
    }
}