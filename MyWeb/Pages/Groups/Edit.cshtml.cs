using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace MyWeb.Pages.Groups
{
    public class EditModel : PageModel
    {
        private readonly LibraryWeb.DataAccess.department_dbContext _context;
        private IGroupRepository groupRepo;

        public EditModel(LibraryWeb.DataAccess.department_dbContext context)
        {
            _context = context;
            groupRepo = new GroupRepository();
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
                                    .Include(a => a.StatusNavigation)
                                    .FirstOrDefaultAsync(m => m.GroupId == id);

            if (Group == null)
            {
                return NotFound();
            }
            ViewData["GroupOwnerId"] = new SelectList(_context.Users.Where(u => u.Role.RoleName.Equals("MANAGER")), "UserId", "Email");
            ViewData["PublicStatus"] = new SelectList(_context.Statuses, "StatusId", "StatusName");
            ViewData["Status"] = new SelectList(_context.Statuses, "StatusId", "StatusName");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            bool check = groupRepo.CheckGroupNameExistedForUpdate(Group.GroupId, Group.GroupName.Trim());
            if (!ModelState.IsValid || check)
            {
                Group = await _context.Groups
                                    .Include(a => a.GroupOwner)
                                    .Include(a => a.PublicStatusNavigation)
                                    .Include(a => a.StatusNavigation)
                                    .FirstOrDefaultAsync(m => m.GroupId == Group.GroupId);
                ViewData["GroupOwnerId"] = new SelectList(_context.Users.Where(u => u.Role.RoleName.Equals("MANAGER")), "UserId", "Email");
                ViewData["PublicStatus"] = new SelectList(_context.Statuses, "StatusId", "StatusName");
                ViewData["Status"] = new SelectList(_context.Statuses, "StatusId", "StatusName");
                if (check)
                {
                    ViewData["GroupNameMessage"] = "*** Sorry, this group name has existed in system!";
                }
                return Page();
            }
            else
            {
                groupRepo.UpdateGroup(Group.GroupId, Group.GroupOwnerId, Group.GroupName.Trim(), Group.PublicStatus, Group.GroupDescription.Trim());
                return RedirectToPage("../Managements/Groups");
            }



        }
    }
}
