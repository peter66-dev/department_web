using System;
using System.Collections.Generic;

#nullable disable

namespace MyLibrary.BusinessObject
{
    public partial class TblPost
    {
        public TblPost()
        {
            TblComments = new HashSet<TblComment>();
            TblLikes = new HashSet<TblLike>();
        }

        public Guid PostId { get; set; }
        public Guid UserPostId { get; set; }
        public Guid GroupPostId { get; set; }
        public Guid PostTypeId { get; set; }
        public string Title { get; set; }
        public string PostContent { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime LastModified { get; set; }
        public int Status { get; set; }

        public virtual TblGroup GroupPost { get; set; }
        public virtual TblPostType PostType { get; set; }
        public virtual TblStatus StatusNavigation { get; set; }
        public virtual TblUser UserPost { get; set; }
        public virtual ICollection<TblComment> TblComments { get; set; }
        public virtual ICollection<TblLike> TblLikes { get; set; }
    }
}
