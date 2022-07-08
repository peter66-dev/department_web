using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using LibraryWeb.DataAccess;
using LibraryWeb.Model;

namespace MyWeb.Pages.Groups
{
    public class CreateModel : PageModel
    {
        private readonly LibraryWeb.DataAccess.department_dbContext _context;

        public CreateModel(LibraryWeb.DataAccess.department_dbContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            ViewData["GroupOwnerId"] = new SelectList(_context.Users.Where(u => u.Role.RoleName.Equals("MANAGER")), "Email", "Email");
            ViewData["PublicStatus"] = new SelectList(_context.Statuses, "StatusId", "StatusName");
            ViewData["Status"] = new SelectList(_context.Statuses, "StatusId", "StatusName");
            return Page();
        }

        [BindProperty]
        public Group Group { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Groups.Add(Group);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
