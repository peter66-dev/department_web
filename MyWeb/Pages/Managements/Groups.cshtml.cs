using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MyWeb.Pages.Managements
{
    public class GroupsModel : PageModel
    {
        public IEnumerable<Group> Groups { get; set; }
        private IGroupRepository groupRepo;
        public GroupsModel()
        {
            groupRepo = new GroupRepository();
        }
        public async Task<IActionResult> OnGetAsync()
        {
            HttpContext.Session.Remove("DELETE_GROUP_MESSAGE");
            string role = HttpContext.Session.GetString("ROLE");
            if (role == null || !role.Equals("ADMIN"))
            {
                return RedirectToPage("../Login");
            }
            else
            {
                Groups = await groupRepo.GetGroupsAsync();
                return Page();
            }
        }

        public async Task<IActionResult> OnGetDeleteGroupAsync(string id) // status = 2
        {
            string role = HttpContext.Session.GetString("ROLE");
            if (role == null || !role.Equals("ADMIN"))
            {
                return RedirectToPage("../Login");
            }
            else
            {
                Console.WriteLine("Group id deleted:" + id);
                await groupRepo.DeleteGroupByIdAsync(Guid.Parse(id));
                HttpContext.Session.SetString("DELETE_GROUP_MESSAGE", "Deleted successfully!");
                Groups = await groupRepo.GetGroupsAsync();
                return Page();
            }
        }
    }
}
