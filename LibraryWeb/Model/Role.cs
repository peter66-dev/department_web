using System;
using System.Collections.Generic;

#nullable disable

namespace LibraryWeb.Model
{
    public partial class Role
    {
        public Role()
        {
            Users = new HashSet<User>();
        }

        public Guid RoleId { get; set; }
        public string RoleName { get; set; }
        public int Status { get; set; } // Status: 5 || 6

        public virtual Status StatusNavigation { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
