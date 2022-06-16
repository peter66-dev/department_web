using System;
using System.Collections.Generic;

#nullable disable

namespace LibraryWeb.Model
{
    public partial class CommentReply
    {
        public Guid CommentReplyId { get; set; }
        public Guid UserReplyId { get; set; }
        public Guid CommentId { get; set; }
        public string CommentReplyContent { get; set; }
        public DateTime CreatedDate { get; set; }
        public int Status { get; set; }

        public virtual Comment Comment { get; set; }
        public virtual Status StatusNavigation { get; set; }
        public virtual User UserReply { get; set; }
    }
}
