using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using Microsoft.AspNetCore.Http;
using LibraryWeb.Repository;

namespace MyWeb.Pages.Groups
{
    public class CreateModel : PageModel
    {
        private readonly LibraryWeb.DataAccess.department_dbContext _context;

        private IGroupRepository groupRepo;

        [BindProperty]
        public Group Group { get; set; }
        public CreateModel(LibraryWeb.DataAccess.department_dbContext context)
        {
            _context = context;
            groupRepo = new GroupRepository();
        }

        public IActionResult OnGet()
        {
            string role = HttpContext.Session.GetString("ROLE");
            if (role == null || !role.Equals("ADMIN"))
            {
                return RedirectToPage("../Login");
            }
            ViewData["GroupOwnerId"] = new SelectList(_context.Users.Where(u => u.Role.RoleName.Equals("MANAGER")), "UserId", "Email");
            return Page();
        }


        public IActionResult OnPost()
        {
            Console.WriteLine("Toi la OnPostAsync create group!");
            if (!ModelState.IsValid)
            {
                ViewData["GroupOwnerId"] = new SelectList(_context.Users.Where(u => u.Role.RoleName.Equals("MANAGER")), "UserId", "Email");
                Console.WriteLine("Data is not valid!");
                var message = string.Join(" \n ", ModelState.Values
                                .SelectMany(v => v.Errors)
                                .Select(e => e.ErrorMessage));
                Console.WriteLine("Error: " + message);
                return Page();
            }
            else
            {
                if (groupRepo.CheckGroupNameExisted(Group.GroupName.Trim())) // Check duplicated group name
                {
                    ViewData["GroupOwnerId"] = new SelectList(_context.Users.Where(u => u.Role.RoleName.Equals("MANAGER")), "UserId", "Email");
                    ViewData["GroupNameMessage"] = "*** Sorry, this group name has existed in system!";
                    return Page();
                }
                else
                {
                    groupRepo.CreateGroup(Group.GroupName, Group.GroupOwnerId, Group.PublicStatus, Group.GroupDescription);
                    return RedirectToPage("../Managements/Groups");
                }
            }

        }
    }
}
