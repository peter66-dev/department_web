using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using LibraryWeb.DataAccess;
using LibraryWeb.Model;

namespace MyWeb.Pages.Posts
{
    public class EditModel : PageModel
    {
        private readonly LibraryWeb.DataAccess.department_dbContext _context;

        public EditModel(LibraryWeb.DataAccess.department_dbContext context)
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
           ViewData["GroupPostId"] = new SelectList(_context.Groups, "GroupId", "GroupDescription");
           ViewData["PostTypeId"] = new SelectList(_context.PostTypes, "PostTypeId", "PostTypeName");
           ViewData["Status"] = new SelectList(_context.Statuses, "StatusId", "StatusName");
           ViewData["UserPostId"] = new SelectList(_context.Users, "UserId", "Address");
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

            _context.Attach(Post).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PostExists(Post.PostId))
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

        private bool PostExists(Guid id)
        {
            return _context.Posts.Any(e => e.PostId == id);
        }
    }
}
