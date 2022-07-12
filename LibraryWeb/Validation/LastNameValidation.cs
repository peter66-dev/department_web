using System.ComponentModel.DataAnnotations;

namespace LibraryWeb.Validation
{
    public class LastNameValidation : ValidationAttribute
    {
        public LastNameValidation()
        {
            ErrorMessage = "*** Sorry, your last name must be more than 2 characters, please!";
        }

        public override bool IsValid(object value)
        {
            return value != null && value.ToString().Trim().Length >= 2;
        }
    }
}
