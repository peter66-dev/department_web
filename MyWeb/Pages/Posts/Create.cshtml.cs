using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using LibraryWeb.DataAccess;
using LibraryWeb.Model;

namespace MyWeb.Pages.Posts
{
    public class CreateModel : PageModel
    {
        private readonly LibraryWeb.DataAccess.department_dbContext _context;

        public CreateModel(LibraryWeb.DataAccess.department_dbContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
        ViewData["GroupPostId"] = new SelectList(_context.Groups, "GroupId", "GroupDescription");
        ViewData["PostTypeId"] = new SelectList(_context.PostTypes, "PostTypeId", "PostTypeName");
        ViewData["Status"] = new SelectList(_context.Statuses, "StatusId", "StatusName");
        ViewData["UserPostId"] = new SelectList(_context.Users, "UserId", "Address");
            return Page();
        }

        [BindProperty]
        public Post Post { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Posts.Add(Post);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
