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
using Microsoft.AspNetCore.Http;

namespace MyWeb.Pages.Groups
{
    public class EditModel : PageModel
    {
        private readonly LibraryWeb.DataAccess.department_dbContext _context;

        public EditModel(LibraryWeb.DataAccess.department_dbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Group Group { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            string role = HttpContext.Session.GetString("ROLE");
            if (role == null || !role.Equals("ADMIN"))
            {
                return RedirectToPage("../Login");
            }

            Group = await _context.Groups
                .Include(a => a.GroupOwner)
                .Include(a => a.PublicStatusNavigation)
                .Include(a => a.StatusNavigation).FirstOrDefaultAsync(m => m.GroupId == id);

            if (Group == null)
            {
                return NotFound();
            }
           ViewData["GroupOwnerId"] = new SelectList(_context.Users, "UserId", "Address");
           ViewData["PublicStatus"] = new SelectList(_context.Statuses, "StatusId", "StatusName");
           ViewData["Status"] = new SelectList(_context.Statuses, "StatusId", "StatusName");
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

            _context.Attach(Group).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GroupExists(Group.GroupId))
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

        private bool GroupExists(Guid id)
        {
            return _context.Groups.Any(e => e.GroupId == id);
        }
    }
}
