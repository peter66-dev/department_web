using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryWeb.Validation
{
    public class PasswordValidation : ValidationAttribute
    {
        public PasswordValidation()
        {
            ErrorMessage = "*** Sorry, your password must be more than 2 characters, please!";
        }

        public override bool IsValid(object value)
        {
            return value != null && value.ToString().Trim().Length >= 2;
        }
    }
}
