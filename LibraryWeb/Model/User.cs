using LibraryWeb.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace LibraryWeb.Model
{
    public partial class User
    {
        public User()
        {
            CommentReplies = new HashSet<CommentReply>();
            Comments = new HashSet<Comment>();
            GroupUsers = new HashSet<GroupUser>();
            Groups = new HashSet<Group>();
            Likes = new HashSet<Like>();
            Posts = new HashSet<Post>();
        }

        public Guid UserId { get; set; }

        public Guid RoleId { get; set; }

        [Required(ErrorMessage = "First name is required")]
        [Display(Name ="First name")]
        [FirstNameValidation]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Last name is required")]
        [Display(Name ="Last name")]
        [LastNameValidation]
        public string LastName { get; set; }


        [Required(ErrorMessage = "Password is required")]
        [PasswordValidation]
        public string Password { get; set; }

        [Required(ErrorMessage = "Phone number is required")]
        [Display(Name ="Phone number")]
        [PhoneValidation]
        public string PhoneNumber { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [AddressValidation]
        public string Address { get; set; }


        [Required(ErrorMessage = "Email is required")]
        [EmailAddress]
        public string Email { get; set; } // Phải check trùng

        [Required(ErrorMessage = "Email is required")]
        public bool Gender { get; set; }

        [Required(ErrorMessage = "Confirm is required")]
        public string Avatar { get; set; }

        public int Status { get; set; }

        public virtual Role Role { get; set; }

        public virtual Status StatusNavigation { get; set; }

        public virtual ICollection<CommentReply> CommentReplies { get; set; }

        public virtual ICollection<Comment> Comments { get; set; }

        public virtual ICollection<GroupUser> GroupUsers { get; set; }

        public virtual ICollection<Group> Groups { get; set; }

        public virtual ICollection<Like> Likes { get; set; }

        public virtual ICollection<Post> Posts { get; set; }

    }
}
