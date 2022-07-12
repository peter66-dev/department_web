using System.ComponentModel.DataAnnotations;

namespace LibraryWeb.Validation
{
    public class GroupNameValidation : ValidationAttribute
    {
        public GroupNameValidation()
        {
            ErrorMessage = "*** Sorry, group name must be more than 5 characters, please!";
        }

        public override bool IsValid(object value)
        {
            return value != null && value.ToString().Trim().Length >= 5;
        }
    }
}
