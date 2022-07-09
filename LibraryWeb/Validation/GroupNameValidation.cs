﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
