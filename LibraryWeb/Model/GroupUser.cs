using System;
using System.Collections.Generic;

#nullable disable

namespace LibraryWeb.Model
{
    public partial class GroupUser
    {
        public Guid GroupUserId { get; set; }
        public Guid UserId { get; set; }
        public Guid GroupId { get; set; }
        public int Status { get; set; }

        public virtual Status StatusNavigation { get; set; }
        public virtual User User { get; set; }
    }
}
