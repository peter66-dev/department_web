using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
