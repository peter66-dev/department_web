using System.ComponentModel.DataAnnotations;

namespace LibraryWeb.Validation
{
    public class PasswordValidation : ValidationAttribute
    {
        public PasswordValidation()
        {
            ErrorMessage = "*** Sorry, your password must be more than 3 characters, please!";
        }

        public override bool IsValid(object value)
        {
            return value != null && value.ToString().Trim().Length >= 3;
        }
    }
}
