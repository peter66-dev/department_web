using System;
using System.Collections.Generic;

#nullable disable

namespace MyLibrary.BusinessObject
{
    public partial class TblComment
    {
        public TblComment()
        {
            TblCommentReplies = new HashSet<TblCommentReply>();
        }

        public Guid CommentId { get; set; }
        public Guid UserCommentId { get; set; }
        public Guid PostId { get; set; }
        public string CommentContent { get; set; }
        public DateTime CreatedDate { get; set; }
        public int Status { get; set; }

        public virtual TblPost Post { get; set; }
        public virtual TblStatus StatusNavigation { get; set; }
        public virtual TblUser UserComment { get; set; }
        public virtual ICollection<TblCommentReply> TblCommentReplies { get; set; }
    }
}
