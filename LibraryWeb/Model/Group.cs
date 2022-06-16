﻿using System;
using System.Collections.Generic;

#nullable disable

namespace LibraryWeb.Model
{
    public partial class Group
    {
        public Group()
        {
            Posts = new HashSet<Post>();
        }

        public Guid GroupId { get; set; }
        public Guid UserId { get; set; }
        public string GroupName { get; set; }
        public string GroupDescription { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool PublicStatus { get; set; }
        public int Status { get; set; }

        public virtual Status StatusNavigation { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<Post> Posts { get; set; }
    }
}
