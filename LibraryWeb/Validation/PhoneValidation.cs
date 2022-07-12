using System.ComponentModel.DataAnnotations;

namespace LibraryWeb.Validation
{
    public class PhoneValidation : ValidationAttribute
    {
        public PhoneValidation()
        {
            ErrorMessage = "*** Sorry, your phone number must be between 10-12 characters, please!";
        }

        public override bool IsValid(object value)
        {
            return value != null && value.ToString().Trim().Length >= 10 && value.ToString().Trim().Length <= 12;
        }
    }
}
