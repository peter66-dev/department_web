using System;
using System.Collections.Generic;

#nullable disable

namespace LibraryWeb.Model
{
    public partial class PostType
    {
        public PostType()
        {
            Posts = new HashSet<Post>();
        }

        public Guid PostTypeId { get; set; }
        public string PostTypeName { get; set; }
        public int Status { get; set; }

        public virtual Status StatusNavigation { get; set; }
        public virtual ICollection<Post> Posts { get; set; }
    }
}
