using LibraryWeb.Model;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public interface ICommentReplyRepository
    {
        void CreateCommentReply(CommentReply commentReply);
        void DeleteCommentReplyById(Guid commentReplyId);
        IEnumerable<CommentReply> GetCommentReplies();
        CommentReply GetCommentReplyById(Guid commentReplyId);
    }
}