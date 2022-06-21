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
            GroupUsers = new HashSet<GroupUser>();
            Groups = new HashSet<Group>();
            Likes = new HashSet<Like>();
            PostPublicStatusNavigations = new HashSet<Post>();
            PostStatusNavigations = new HashSet<Post>();
            PostTypes = new HashSet<PostType>();
            Roles = new HashSet<Role>();
            Users = new HashSet<User>();
        }

        public int StatusId { get; set; }
        public string StatusName { get; set; }

        public virtual ICollection<CommentReply> CommentReplies { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<GroupUser> GroupUsers { get; set; }
        public virtual ICollection<Group> Groups { get; set; }
        public virtual ICollection<Like> Likes { get; set; }
        public virtual ICollection<Post> PostPublicStatusNavigations { get; set; }
        public virtual ICollection<Post> PostStatusNavigations { get; set; }
        public virtual ICollection<PostType> PostTypes { get; set; }
        public virtual ICollection<Role> Roles { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
