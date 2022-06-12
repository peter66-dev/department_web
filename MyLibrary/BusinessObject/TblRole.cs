using System;
using System.Collections.Generic;

#nullable disable

namespace MyLibrary.BusinessObject
{
    public partial class TblRole
    {
        public TblRole()
        {
            TblUsers = new HashSet<TblUser>();
        }

        public Guid RoleId { get; set; }
        public string RoleName { get; set; }
        public int Status { get; set; }

        public virtual TblStatus StatusNavigation { get; set; }
        public virtual ICollection<TblUser> TblUsers { get; set; }
    }
}
