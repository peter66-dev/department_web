using System;
using System.Collections.Generic;

#nullable disable

namespace LibraryWeb.Model
{
    public partial class Like
    {
        public Guid LikeId { get; set; }
        public Guid UserId { get; set; }
        public Guid PostId { get; set; }
        public int Status { get; set; }

        public virtual Post Post { get; set; }
        public virtual Status StatusNavigation { get; set; }
        public virtual User User { get; set; }
    }
}
