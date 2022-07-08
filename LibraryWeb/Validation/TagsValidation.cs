using System.ComponentModel.DataAnnotations;

namespace LibraryWeb.Validation
{
    public class TagsValidation : ValidationAttribute
    {
        public TagsValidation()
        {
            ErrorMessage = "*** Sorry, Tags is not valid! Ex: party home tonight";
        }

        public override bool IsValid(object value)
        {
            return value != null && value.ToString().Trim().Length >= 1;
        }
    }
}
