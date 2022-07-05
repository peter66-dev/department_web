using LibraryWeb.Model;
using LibraryWeb.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MyWeb.Pages.Groups
{
    public class DetailsModel : PageModel
    {
        private IPostRepository postRepo;
        private IGroupRepository groupRepo;


        public DetailsModel()
        {
            postRepo = new PostRepository();
            groupRepo = new GroupRepository();
        }

        public int TotalMembers { get; set; }
        public Group Group { get; set; }
        public IEnumerable<Post> Posts { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            TotalMembers = await groupRepo.GetTotalMembersInGroupById(id.Value);
            Group = groupRepo.GetGroupById(id.Value);

            if (Group.PublicStatus == 5)
            {
                Posts = await postRepo.GetPostsByGroupId(id.Value);
            }


            if (Group == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
