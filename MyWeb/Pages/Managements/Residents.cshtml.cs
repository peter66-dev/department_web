using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;

namespace MyWeb.Pages.Managements
{
    public class Residents : PageModel
    {
        public List<GroupUser> GroupUsers { get; set; }
        private IGroupUserRepository guRepo;
        public Residents()
        {
            guRepo = new GroupUserRepository();
        }
        public IActionResult OnGet()
        {
            string managerId = HttpContext.Session.GetString("CURRENT_USER_ID");
            string role = HttpContext.Session.GetString("ROLE");
            if (managerId != null && role.Equals("MANAGER"))
            {
                GroupUsers = guRepo.GetUsersPendingByManagerId(Guid.Parse(managerId));
                return Page();
            }
            else
            {
                return new RedirectToPageResult("../Login");
            }
        }
    }
}
