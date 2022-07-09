using LibraryWeb.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

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

        [Required]
        [GroupNameValidation]
        public string GroupName { get; set; } // Phải check trùng


        [Required]
        [GroupDescriptionValidation]
        public string GroupDescription { get; set; }
        public DateTime CreatedDate { get; set; }
        public int PublicStatus { get; set; }// Status: 5 || 6
        public int Status { get; set; } // Status: 1 || 2

        public virtual User GroupOwner { get; set; }
        public virtual Status PublicStatusNavigation { get; set; }
        public virtual Status StatusNavigation { get; set; }
        public virtual ICollection<GroupUser> GroupUsers { get; set; }
        public virtual ICollection<Post> Posts { get; set; }
    }
}
