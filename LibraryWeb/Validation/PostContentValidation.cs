using System;
using System.ComponentModel.DataAnnotations;

namespace LibraryWeb.Validation
{
    public class PostContentValidation : ValidationAttribute
    {
        public PostContentValidation()
        {
            ErrorMessage = "*** Sorry, the post content is not long enough. Post content has at least 20 characters, please!";
        }

        public override bool IsValid(object value)
        {
            if (value != null)
            {
                Console.WriteLine("Post content: " + value.ToString());
                return value.ToString().Trim().Length >= 20;
            }
            return false;
        }
    }
}
