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
        public async Task<IEnumerable<Group>> GetGroupsPublicByLeaderId(Guid leaderId)
                => await GroupDAO.Instance.GetGroupsPublicByLeaderId(leaderId);

        public async Task<int> GetTotalMembersInGroupById(Guid groupId)
            => await GroupDAO.Instance.GetTotalMembersInGroupById(groupId);

        public int IsLeaderGroup(Guid groupid, Guid leaderid)
            => GroupDAO.Instance.IsLeaderGroup(groupid, leaderid);

        public async Task<List<Group>> GetGroupsAsync()
            => await GroupDAO.Instance.GetGroupsAsync();
    }
}
