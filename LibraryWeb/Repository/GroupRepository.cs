using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public class GroupRepository : IGroupRepository
    {
        public IEnumerable<Group> GetGroups() => GroupDAO.Instance.GetGroups();
        public Group GetGroupById(Guid groupId) => GroupDAO.Instance.GetGroupById(groupId);
        public void DeleteGroupById(Guid groupId) => GroupDAO.Instance.DeleteGroupById(groupId);
        public void CreateGroup(Group group) => GroupDAO.Instance.CreateGroup(group);

        public async Task<IEnumerable<Group>> GetGroupsByLeaderId(Guid leaderId)
            => await GroupDAO.Instance.GetGroupsByLeaderId(leaderId);
    }
}
