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

        public IActionResult OnPost()
        {
            User tmp = userRepo.CheckLogin(UserLogin.Email, UserLogin.Password);
            if (tmp == null)
            {
                ViewData["LoginMessage"] = "Email and password is not valid!";
                return Page();
            }
            else
            {
                string role = userRepo.CheckRole(tmp);
                HttpContext.Session.SetString("CURRENT_USER_ID", tmp.UserId.ToString());
                HttpContext.Session.SetString("CURRENT_USER_FULLNAME", $"{tmp.FirstName} {tmp.LastName}");
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
            HttpContext.Session.Remove("CURRENT_USER_ID");
            HttpContext.Session.Remove("CURRENT_USER_FULLNAME");
            HttpContext.Session.Remove("ROLE");
            HttpContext.Session.Clear();
            return Page();
        }
    }
}
