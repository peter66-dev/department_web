using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace LibraryWeb.Model
{
    public partial class Post
    {
        public Post()
        {
            Comments = new HashSet<Comment>();
            Likes = new HashSet<Like>();
        }

        public Guid PostId { get; set; }
        public Guid UserPostId { get; set; }
        [Display(Name = "Select Group")]
        public Guid GroupPostId { get; set; }
        public Guid PostTypeId { get; set; }

        [Display(Name = "Post Title")]
        public string Title { get; set; }
        public int LikesTotal { get; set; }
        public int CommentsTotal { get; set; }

        [Range(0, Int32.MaxValue)]
        public int Views { get; set; }
        public string Tags { get; set; } // Nhớ Trim trước khi save db

        [Display(Name = "Post Content")]
        public string PostContent { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime LastModified { get; set; }
        public int Status { get; set; } // Status: 5 || 6

        public virtual Group GroupPost { get; set; }
        public virtual PostType PostType { get; set; }
        public virtual Status StatusNavigation { get; set; }
        public virtual User UserPost { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<Like> Likes { get; set; }

        public List<string> GetTagsList()
        {
            return new List<string>(Tags.Trim().Split(" "));
        }

    }
}
