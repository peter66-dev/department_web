using System;
using System.Collections.Generic;

#nullable disable

namespace MyLibrary.BusinessObject
{
    public partial class TblGroupUser
    {
        public Guid GroupUserId { get; set; }
        public Guid UserId { get; set; }
        public Guid GroupId { get; set; }
        public int Status { get; set; }

        public virtual TblStatus StatusNavigation { get; set; }
        public virtual TblUser User { get; set; }
    }
}
