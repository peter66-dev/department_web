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

        [Required(ErrorMessage = "First name is required field!")]
        [Display(Name ="First name")]
        [FirstNameValidation]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Last name is required field!")]
        [Display(Name ="Last name")]
        [LastNameValidation]
        public string LastName { get; set; }


        [Required(ErrorMessage = "Password is required field!")]
        [PasswordValidation]
        public string Password { get; set; }

        [Required(ErrorMessage = "Phone number is required field!")]
        [Display(Name ="Phone number")]
        [PhoneValidation]
        public string PhoneNumber { get; set; }

        [Required(ErrorMessage = "Email is required field!")]
        [AddressValidation]
        public string Address { get; set; }


        [Required(ErrorMessage = "Email is required field!")]
        [EmailAddress]
        public string Email { get; set; } // Phải check trùng

        [Required(ErrorMessage = "Email is required field!")]
        public bool Gender { get; set; }

        [Required(ErrorMessage = "Confirm password is required field!")]
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
