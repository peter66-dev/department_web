using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using LibraryWeb.DataAccess;
using LibraryWeb.Model;

namespace MyWeb.Pages.Roles
{
    public class DetailsModel : PageModel
    {
        private readonly LibraryWeb.DataAccess.department_dbContext _context;

        public DetailsModel(LibraryWeb.DataAccess.department_dbContext context)
        {
            _context = context;
        }

        public Role Role { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Role = await _context.Roles
                .Include(r => r.StatusNavigation).FirstOrDefaultAsync(m => m.RoleId == id);

            if (Role == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
