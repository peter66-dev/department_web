using System;
using System.Collections.Generic;

#nullable disable

namespace MyLibrary.BusinessObject
{
    public partial class TblCommentReply
    {
        public Guid CommentReplyId { get; set; }
        public Guid UserReplyId { get; set; }
        public Guid CommentId { get; set; }
        public string CommentReplyContent { get; set; }
        public DateTime CreatedDate { get; set; }
        public int Status { get; set; }

        public virtual TblComment Comment { get; set; }
        public virtual TblStatus StatusNavigation { get; set; }
        public virtual TblUser UserReply { get; set; }
    }
}
