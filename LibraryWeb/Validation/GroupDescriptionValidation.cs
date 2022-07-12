using System.ComponentModel.DataAnnotations;

namespace LibraryWeb.Validation
{
    public class GroupDescriptionValidation : ValidationAttribute
    {
        public GroupDescriptionValidation()
        {
            ErrorMessage = "*** Sorry, group name must be more than 10 characters, please!";
        }

        public override bool IsValid(object value)
        {
            return value != null && value.ToString().Trim().Length >= 10;
        }
    }
}
