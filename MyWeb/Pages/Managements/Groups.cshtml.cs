using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace MyWeb.Pages.Managements
{
    public class GroupsModel : PageModel
    {
        public IActionResult OnGet()
        {
            string role = HttpContext.Session.GetString("ROLE");
            if (role == null || !role.Equals("ADMIN"))
            {
                return RedirectToPage("../Login");
            }
            return Page();
        }
    }
}
