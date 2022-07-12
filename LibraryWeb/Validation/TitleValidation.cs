using System.ComponentModel.DataAnnotations;

namespace LibraryWeb.Validation
{
    public class TitleValidation : ValidationAttribute
    {
        public TitleValidation()
        {
            ErrorMessage = "*** Sorry, the title is not long enough. Title has at least 10 characters, please!";
        }

        public override bool IsValid(object value)
        {
            return value != null && value.ToString().Trim().Length >= 10;
        }
    }
}
