using System;
using System.Collections.Generic;

#nullable disable

namespace MyLibrary.BusinessObject
{
    public partial class TblPostType
    {
        public TblPostType()
        {
            TblPosts = new HashSet<TblPost>();
        }

        public Guid PostTypeId { get; set; }
        public string PostTypeName { get; set; }
        public int Status { get; set; }

        public virtual TblStatus StatusNavigation { get; set; }
        public virtual ICollection<TblPost> TblPosts { get; set; }
    }
}
