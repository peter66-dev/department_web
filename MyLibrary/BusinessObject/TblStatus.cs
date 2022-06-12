using System;
using System.Collections.Generic;

#nullable disable

namespace MyLibrary.BusinessObject
{
    public partial class TblStatus
    {
        public TblStatus()
        {
            TblCommentReplies = new HashSet<TblCommentReply>();
            TblComments = new HashSet<TblComment>();
            TblGroupUsers = new HashSet<TblGroupUser>();
            TblGroups = new HashSet<TblGroup>();
            TblLikes = new HashSet<TblLike>();
            TblPostTypes = new HashSet<TblPostType>();
            TblPosts = new HashSet<TblPost>();
            TblRoles = new HashSet<TblRole>();
            TblUsers = new HashSet<TblUser>();
        }

        public int StatusId { get; set; }
        public string StatusName { get; set; }

        public virtual ICollection<TblCommentReply> TblCommentReplies { get; set; }
        public virtual ICollection<TblComment> TblComments { get; set; }
        public virtual ICollection<TblGroupUser> TblGroupUsers { get; set; }
        public virtual ICollection<TblGroup> TblGroups { get; set; }
        public virtual ICollection<TblLike> TblLikes { get; set; }
        public virtual ICollection<TblPostType> TblPostTypes { get; set; }
        public virtual ICollection<TblPost> TblPosts { get; set; }
        public virtual ICollection<TblRole> TblRoles { get; set; }
        public virtual ICollection<TblUser> TblUsers { get; set; }
    }
}
