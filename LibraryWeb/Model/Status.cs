using System;
using System.Collections.Generic;

#nullable disable

namespace LibraryWeb.Model
{
    public partial class Status
    {
        public Status()
        {
            CommentReplies = new HashSet<CommentReply>();
            Comments = new HashSet<Comment>();
            GroupPublicStatusNavigations = new HashSet<Group>();
            GroupStatusNavigations = new HashSet<Group>();
            GroupUsers = new HashSet<GroupUser>();
            Likes = new HashSet<Like>();
            PostTypes = new HashSet<PostType>();
            Posts = new HashSet<Post>();
            Roles = new HashSet<Role>();
            Users = new HashSet<User>();
        }

        public int StatusId { get; set; }
        public string StatusName { get; set; }

        public virtual ICollection<CommentReply> CommentReplies { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<Group> GroupPublicStatusNavigations { get; set; }
        public virtual ICollection<Group> GroupStatusNavigations { get; set; }
        public virtual ICollection<GroupUser> GroupUsers { get; set; }
        public virtual ICollection<Like> Likes { get; set; }
        public virtual ICollection<PostType> PostTypes { get; set; }
        public virtual ICollection<Post> Posts { get; set; }
        public virtual ICollection<Role> Roles { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
