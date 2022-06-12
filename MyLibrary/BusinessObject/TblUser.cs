using System;
using System.Collections.Generic;

#nullable disable

namespace MyLibrary.BusinessObject
{
    public partial class TblUser
    {
        public TblUser()
        {
            TblCommentReplies = new HashSet<TblCommentReply>();
            TblComments = new HashSet<TblComment>();
            TblGroupUsers = new HashSet<TblGroupUser>();
            TblGroups = new HashSet<TblGroup>();
            TblLikes = new HashSet<TblLike>();
            TblPosts = new HashSet<TblPost>();
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
        public int Status { get; set; }

        public virtual TblRole Role { get; set; }
        public virtual TblStatus StatusNavigation { get; set; }
        public virtual ICollection<TblCommentReply> TblCommentReplies { get; set; }
        public virtual ICollection<TblComment> TblComments { get; set; }
        public virtual ICollection<TblGroupUser> TblGroupUsers { get; set; }
        public virtual ICollection<TblGroup> TblGroups { get; set; }
        public virtual ICollection<TblLike> TblLikes { get; set; }
        public virtual ICollection<TblPost> TblPosts { get; set; }
    }
}
