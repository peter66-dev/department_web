using System;
using System.Collections.Generic;

#nullable disable

namespace MyLibrary.BusinessObject
{
    public partial class TblLike
    {
        public Guid LikeId { get; set; }
        public Guid UserId { get; set; }
        public Guid PostId { get; set; }
        public int Status { get; set; }

        public virtual TblPost Post { get; set; }
        public virtual TblStatus StatusNavigation { get; set; }
        public virtual TblUser User { get; set; }
    }
}
