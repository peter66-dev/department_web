using System;
using System.Collections.Generic;

#nullable disable

namespace LibraryWeb.Model
{
    public partial class Post
    {
        public Post()
        {
            Comments = new HashSet<Comment>();
            Likes = new HashSet<Like>();
        }

        public Guid PostId { get; set; }
        public Guid UserPostId { get; set; }
        public Guid GroupPostId { get; set; }
        public Guid PostTypeId { get; set; }
        public string Title { get; set; }
        public string PostContent { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime LastModified { get; set; }
        // Còn 1 field PublicStatus nữa!
        public int Status { get; set; } // Status: 5 || 6

        public virtual Group GroupPost { get; set; }
        public virtual PostType PostType { get; set; }
        public virtual Status StatusNavigation { get; set; }
        public virtual User UserPost { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<Like> Likes { get; set; }
    }
}
