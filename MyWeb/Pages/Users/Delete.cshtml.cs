using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using MyLibrary.BusinessObject;
using MyLibrary.DataAccess;

namespace MyWeb.Pages.Users
{
    public class DeleteModel : PageModel
    {
        private readonly MyLibrary.DataAccess.department_dbContext _context;

        public DeleteModel(MyLibrary.DataAccess.department_dbContext context)
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
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            TblUser = await _context.TblUsers.FindAsync(id);

            if (TblUser != null)
            {
                _context.TblUsers.Remove(TblUser);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
