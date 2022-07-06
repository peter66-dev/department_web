using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using LibraryWeb.DataAccess;
using LibraryWeb.Model;

namespace MyWeb.Pages.Users
{
    public class IndexModel : PageModel
    {
        private readonly LibraryWeb.DataAccess.department_dbContext _context;

        public IndexModel(LibraryWeb.DataAccess.department_dbContext context)
        {
            _context = context;
        }

        public IList<User> User { get;set; }

        public async Task OnGetAsync()
        {
            User = await _context.Users
                .Include(u => u.Role)
                .Include(u => u.StatusNavigation).ToListAsync();
        }
    }
}
