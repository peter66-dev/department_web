using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;

namespace MyWeb.Pages
{
    public class LoginModel : PageModel
    {
        [BindProperty]
        public User UserLogin { get; set; }

        public IUserRepository userRepo;

        public LoginModel()
        {
            userRepo = new UserRepository();
        }

        public IActionResult OnGet()
        {
            string role = HttpContext.Session.GetString("ROLE");
            if (role != null)
            {
                return RedirectToPage("./Posts/Index");
            }

            return Page();
        }

        public IActionResult OnPost()
        {
            User tmp = userRepo.CheckLogin(UserLogin.Email, UserLogin.Password);
            if (tmp == null)
            {
                ViewData["LoginMessage"] = "Email and password is not valid!";
                return Page();
            }
            else if (tmp != null && tmp.Status == 2)
            {
                ViewData["LoginMessage"] = "Your account is banned by admin!";
                return Page();
            }
            else
            {
                string role = userRepo.CheckRole(tmp);
                HttpContext.Session.SetString("CURRENT_USER_ID", tmp.UserId.ToString());
                HttpContext.Session.SetString("CURRENT_USER_FULLNAME", $"{tmp.FirstName} {tmp.LastName}");
                HttpContext.Session.SetString("CURRENT_USER_AVATAR", tmp.Avatar);
                if (role.Equals("ADMIN"))
                {
                    HttpContext.Session.SetString("ROLE", "ADMIN");
                }
                else if (role.Equals("MANAGER"))
                {
                    HttpContext.Session.SetString("ROLE", "MANAGER");
                }
                else if (role.Equals("RESIDENT"))
                {
                    HttpContext.Session.SetString("ROLE", "RESIDENT");
                }
                else
                {
                    Console.WriteLine("This user role is not supported!");
                }
                return Redirect("/Posts/Index");
            }
        }

        public IActionResult OnGetLogout()
        {
            Console.WriteLine("Da logout!");
            HttpContext.Session.Remove("DELETE_GROUP_MESSAGE");
            HttpContext.Session.Remove("DELETE_NEWS_MESSAGE");
            HttpContext.Session.Remove("ADMIN_MESSAGE");
            HttpContext.Session.Remove("ADMIN_FAILED_MESSAGE");


            HttpContext.Session.Remove("CURRENT_USER_ID");
            HttpContext.Session.Remove("CURRENT_USER_FULLNAME");
            HttpContext.Session.Remove("CURRENT_USER_AVATAR");
            HttpContext.Session.Remove("ROLE");
            HttpContext.Session.Remove("PENDING_RESIDENT_MESSAGE");
            HttpContext.Session.Clear();
            return Page();
        }
    }
}
