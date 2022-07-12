using System.ComponentModel.DataAnnotations;

namespace LibraryWeb.Validation
{
    public class FirstNameValidation : ValidationAttribute
    {
        public FirstNameValidation()
        {
            ErrorMessage = "*** Sorry, your first name must be more than 2 characters, please!";
        }

        public override bool IsValid(object value)
        {
            return value != null && value.ToString().Trim().Length >= 2;
        }
    }
}
