using System;
using System.Collections.Generic;

#nullable disable

namespace LibraryWeb.Model
{
    public partial class Group
    {
        public Group()
        {
            GroupUsers = new HashSet<GroupUser>();
            Posts = new HashSet<Post>();
        }

        public Guid GroupId { get; set; }
        public Guid GroupOwnerId { get; set; }
        public string GroupName { get; set; } // Phải check trùng
        public string GroupDescription { get; set; }
        public DateTime CreatedDate { get; set; }
        public int PublicStatus { get; set; }
        public int Status { get; set; } // Status: 1 || 2

        public virtual User GroupOwner { get; set; }
        public virtual Status PublicStatusNavigation { get; set; }
        public virtual Status StatusNavigation { get; set; }
        public virtual ICollection<GroupUser> GroupUsers { get; set; }
        public virtual ICollection<Post> Posts { get; set; }
    }
}
