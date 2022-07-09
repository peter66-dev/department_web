using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using LibraryWeb.Repository;

namespace MyWeb.Pages.Users
{
    public class CreateModel : PageModel
    {
        private readonly LibraryWeb.DataAccess.department_dbContext _context;
        private IUserRepository userRepo;

        public CreateModel(LibraryWeb.DataAccess.department_dbContext context)
        {
            _context = context;
            userRepo = new UserRepository();
        }

        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public User User { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public IActionResult OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            if (!User.Password.Equals(User.Avatar))
            {
                Console.WriteLine("Password: " + User.Password);
                Console.WriteLine("Confirm password: " + User.Avatar);
                ViewData["ConfirmPasswordMessage"] = "***Password didn't match!";
                return Page();
            }
            else if (userRepo.CheckEmail(User.Email.Trim()))
            {
                ViewData["EmailMessage"] = "***This email has existed in system!";
                Console.WriteLine("This email has existed in system!");
                return Page();
            }
            else if (userRepo.CheckPhoneNumberUpdate(User.PhoneNumber, User.UserId))
            {
                ViewData["PhoneMessage"] = "***This phone number has existed in system!";
                Console.WriteLine("This phone number has existed in system!");
                return Page();
            }
            else
            {
                userRepo.CreateUser(User.FirstName.Trim(), User.LastName.Trim(), User.Email.Trim(), User.Password.Trim(), User.Gender, User.PhoneNumber.Trim(), User.Address.Trim());
                return RedirectToPage("../Login");
            }
        }
    }
}
