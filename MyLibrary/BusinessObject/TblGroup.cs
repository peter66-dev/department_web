using System;
using System.Collections.Generic;

#nullable disable

namespace MyLibrary.BusinessObject
{
    public partial class TblGroup
    {
        public TblGroup()
        {
            TblPosts = new HashSet<TblPost>();
        }

        public Guid GroupId { get; set; }
        public Guid UserId { get; set; }
        public string GroupName { get; set; }
        public string GroupDescription { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool PublicStatus { get; set; }
        public int Status { get; set; }

        public virtual TblStatus StatusNavigation { get; set; }
        public virtual TblUser User { get; set; }
        public virtual ICollection<TblPost> TblPosts { get; set; }
    }
}
