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
            HttpContext.Session.Remove("PENDING_RESIDENT_MESSAGE");
            string role = HttpContext.Session.GetString("ROLE");
            if (role == null || !role.Equals("MANAGER"))
            {
                return RedirectToPage("../Login");
            }
            string managerId = HttpContext.Session.GetString("CURRENT_USER_ID");
            GroupUsers = guRepo.GetUsersPendingByManagerId(Guid.Parse(managerId));
            return Page();
        }

        public IActionResult OnGetApproveResident(string userid, string groupid)
        {
            Console.WriteLine("Toi la OnGetApproveResident");
            if (guRepo.ApproveResident(Guid.Parse(userid), Guid.Parse(groupid)))
            {
                Console.WriteLine("Approved resident successfully!");
                HttpContext.Session.SetString("PENDING_RESIDENT_MESSAGE", "Approved resident successfully!");
            }
            else
            {
                Console.WriteLine("Approved resident failed!");
            }

            string managerId = HttpContext.Session.GetString("CURRENT_USER_ID");
            GroupUsers = guRepo.GetUsersPendingByManagerId(Guid.Parse(managerId));
            return Page();
        }

        public IActionResult OnGetRejectResident(string userid, string groupid)
        {
            if (guRepo.RejectResident(Guid.Parse(userid), Guid.Parse(groupid)))
            {
                Console.WriteLine("Reject resident successfully!");
                HttpContext.Session.SetString("PENDING_RESIDENT_MESSAGE", "Reject resident successfully!");
            }
            else
            {
                Console.WriteLine("Reject resident failed!");
            }

            string managerId = HttpContext.Session.GetString("CURRENT_USER_ID");
            GroupUsers = guRepo.GetUsersPendingByManagerId(Guid.Parse(managerId));
            return Page();
        }
    }
}
