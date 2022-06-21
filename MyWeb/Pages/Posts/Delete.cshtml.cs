using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using LibraryWeb.DataAccess;
using LibraryWeb.Model;

namespace MyWeb.Pages.Posts
{
    public class DeleteModel : PageModel
    {
        private readonly LibraryWeb.DataAccess.department_dbContext _context;

        public DeleteModel(LibraryWeb.DataAccess.department_dbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Post Post { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Post = await _context.Posts
                .Include(p => p.GroupPost)
                .Include(p => p.PostType)
                .Include(p => p.StatusNavigation)
                .Include(p => p.UserPost).FirstOrDefaultAsync(m => m.PostId == id);

            if (Post == null)
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

            Post = await _context.Posts.FindAsync(id);

            if (Post != null)
            {
                _context.Posts.Remove(Post);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
