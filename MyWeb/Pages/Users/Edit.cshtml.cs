using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MyLibrary.BusinessObject;
using MyLibrary.DataAccess;

namespace MyWeb.Pages.Users
{
    public class EditModel : PageModel
    {
        private readonly MyLibrary.DataAccess.department_dbContext _context;

        public EditModel(MyLibrary.DataAccess.department_dbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public TblUser TblUser { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            TblUser = await _context.TblUsers
                .Include(t => t.Role)
                .Include(t => t.StatusNavigation).FirstOrDefaultAsync(m => m.UserId == id);

            if (TblUser == null)
            {
                return NotFound();
            }
           ViewData["RoleId"] = new SelectList(_context.TblRoles, "RoleId", "RoleName");
           ViewData["Status"] = new SelectList(_context.TblStatuses, "StatusId", "StatusName");
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

            _context.Attach(TblUser).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TblUserExists(TblUser.UserId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool TblUserExists(Guid id)
        {
            return _context.TblUsers.Any(e => e.UserId == id);
        }
    }
}
