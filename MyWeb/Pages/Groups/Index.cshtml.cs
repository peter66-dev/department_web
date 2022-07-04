using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using LibraryWeb.DataAccess;
using LibraryWeb.Model;

namespace MyWeb.Pages.Groups
{
    public class IndexModel : PageModel
    {
        private readonly LibraryWeb.DataAccess.department_dbContext _context;

        public IndexModel(LibraryWeb.DataAccess.department_dbContext context)
        {
            _context = context;
        }

        public IList<Group> Group { get;set; }

        public async Task OnGetAsync()
        {
            Group = await _context.Groups
                .Include(a => a.GroupOwner)
                .Include(a => a.PublicStatusNavigation)
                .Include(a => a.StatusNavigation).ToListAsync();
        }
    }
}
