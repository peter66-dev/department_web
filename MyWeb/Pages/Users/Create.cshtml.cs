using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using MyLibrary.BusinessObject;
using MyLibrary.DataAccess;

namespace MyWeb.Pages.Users
{
    public class CreateModel : PageModel
    {
        private readonly MyLibrary.DataAccess.department_dbContext _context;

        public CreateModel(MyLibrary.DataAccess.department_dbContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
        ViewData["RoleId"] = new SelectList(_context.TblRoles, "RoleId", "RoleName");
        ViewData["Status"] = new SelectList(_context.TblStatuses, "StatusId", "StatusName");
            return Page();
        }

        [BindProperty]
        public TblUser TblUser { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.TblUsers.Add(TblUser);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
