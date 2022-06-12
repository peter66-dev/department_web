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
    public class IndexModel : PageModel
    {
        private readonly MyLibrary.DataAccess.department_dbContext _context;

        public IndexModel(MyLibrary.DataAccess.department_dbContext context)
        {
            _context = context;
        }

        public IList<TblUser> TblUser { get;set; }

        public async Task OnGetAsync()
        {
            TblUser = await _context.TblUsers
                .Include(t => t.Role)
                .Include(t => t.StatusNavigation).ToListAsync();
        }
    }
}
