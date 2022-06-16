using System;
using System.Collections.Generic;

#nullable disable

namespace LibraryWeb.Model
{
    public partial class Comment
    {
        public Comment()
        {
            CommentReplies = new HashSet<CommentReply>();
        }

        public Guid CommentId { get; set; }
        public Guid UserCommentId { get; set; }
        public Guid PostId { get; set; }
        public string CommentContent { get; set; }
        public DateTime CreatedDate { get; set; }
        public int Status { get; set; }

        public virtual Post Post { get; set; }
        public virtual Status StatusNavigation { get; set; }
        public virtual User UserComment { get; set; }
        public virtual ICollection<CommentReply> CommentReplies { get; set; }
    }
}
