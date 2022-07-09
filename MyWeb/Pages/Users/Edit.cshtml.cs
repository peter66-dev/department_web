using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace MyWeb.Pages.Users
{
    public class EditModel : PageModel
    {
        private readonly LibraryWeb.DataAccess.department_dbContext _context;
        private IUserRepository userRepo;

        public EditModel(LibraryWeb.DataAccess.department_dbContext context)
        {
            _context = context;
            userRepo = new UserRepository();
        }

        [BindProperty]
        public User User { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            string role = HttpContext.Session.GetString("ROLE");
            string CURRENT_USER_ID = HttpContext.Session.GetString("CURRENT_USER_ID");
            if (role == null)
            {
                return RedirectToPage("../Login");
            }

            User = await _context.Users
                .Include(u => u.Role)
                .Include(u => u.StatusNavigation).FirstOrDefaultAsync(m => m.UserId == id);

            if (User == null || id.Value != Guid.Parse(CURRENT_USER_ID))
            {
                return NotFound();
            }
            ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleName");
            ViewData["Status"] = new SelectList(_context.Statuses, "StatusId", "StatusName");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            if (!User.Password.Equals(User.Avatar))
            {
                Console.WriteLine("Password: " + User.Password);
                Console.WriteLine("Confirm password: " + User.Avatar);
                ViewData["PasswordMessage"] = "***Password didn't match!";
                return Page();
            }
            else if (userRepo.CheckEmailUpdate(User.Email.Trim(), User.UserId))
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
                userRepo.UpdateUser(User.UserId, User.FirstName, User.LastName, User.Email, User.PhoneNumber, User.Address, User.Password, User.Gender);
                return RedirectToPage("./Details", new { id = User.UserId });
            }

        }
    }
}
