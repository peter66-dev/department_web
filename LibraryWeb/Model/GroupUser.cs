using System;

#nullable disable

namespace LibraryWeb.Model
{
    public partial class GroupUser
    {
        public Guid GroupUserId { get; set; }
        public Guid UserId { get; set; }
        public Guid GroupId { get; set; }
        public int Status { get; set; } // Status: 1 || 2 || 3 || 4

        public virtual Status StatusNavigation { get; set; }
        public virtual User User { get; set; }
    }
}
