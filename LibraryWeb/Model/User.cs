using System;
using System.Collections.Generic;

#nullable disable

namespace LibraryWeb.Model
{
    public partial class User
    {
        public User()
        {
            CommentReplies = new HashSet<CommentReply>();
            Comments = new HashSet<Comment>();
            GroupUsers = new HashSet<GroupUser>();
            Groups = new HashSet<Group>();
            Likes = new HashSet<Like>();
            Posts = new HashSet<Post>();
        }

        public Guid UserId { get; set; }
        public Guid RoleId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public bool Gender { get; set; }
        public string Username { get; set; }
        public string Avatar { get; set; }
        public bool ActiveStatus { get; set; }
        public int Status { get; set; } // Status: 1 || 2 || 3 | 4

        public virtual Role Role { get; set; }
        public virtual Status StatusNavigation { get; set; }
        public virtual ICollection<CommentReply> CommentReplies { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<GroupUser> GroupUsers { get; set; }
        public virtual ICollection<Group> Groups { get; set; }
        public virtual ICollection<Like> Likes { get; set; }
        public virtual ICollection<Post> Posts { get; set; }
    }
}
