using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace MyWeb.Pages.Managements
{
    public class UsersModel : PageModel
    {
        private IUserRepository userRepo;

        public IEnumerable<User> Users { get; set; }

        public UsersModel()
        {
            userRepo = new UserRepository();
        }
        public async Task<IActionResult> OnGetAsync()
        {
            HttpContext.Session.Remove("ADMIN_MESSAGE");
            string role = HttpContext.Session.GetString("ROLE");
            if (role == null || !role.Equals("ADMIN"))
            {
                return RedirectToPage("../Login");
            }
            else
            {
                Users = await userRepo.GetAllUsersByAdminAsync();
                return Page();
            }
        }

        public async Task<IActionResult> OnGetAllowUserAsync(string userid)
        {
            //HttpContext.Session.Remove("ADMIN_MESSAGE");
            string role = HttpContext.Session.GetString("ROLE");
            if (role == null || !role.Equals("ADMIN"))
            {
                return RedirectToPage("../Login");
            }
            else
            {
                await userRepo.ChangeStatusUser(Guid.Parse(userid), 1);
                Users = await userRepo.GetAllUsersByAdminAsync();
                HttpContext.Session.SetString("ADMIN_MESSAGE", "Activated user successfully!");
                return Page();
            }
        }

        public async Task<IActionResult> OnGetBanUserAsync(string userid)
        {
            //HttpContext.Session.Remove("ADMIN_MESSAGE");
            string role = HttpContext.Session.GetString("ROLE");
            if (role == null || !role.Equals("ADMIN"))
            {
                return RedirectToPage("../Login");
            }
            else
            {
                await userRepo.ChangeStatusUser(Guid.Parse(userid), 2);
                Users = await userRepo.GetAllUsersByAdminAsync();
                HttpContext.Session.SetString("ADMIN_MESSAGE", "Banned user successfully!");
                return Page();
            }
        }
    }
}
