using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public class GroupRepository : IGroupRepository
    {
        public async Task<IEnumerable<Group>> GetGroupsAsync() => await GroupDAO.Instance.GetGroupsAsync();
        public Group GetGroupById(Guid groupId) => GroupDAO.Instance.GetGroupById(groupId);
        public async Task DeleteGroupByIdAsync(Guid groupId)
            => await GroupDAO.Instance.DeleteGroupByIdAsync(groupId);
        public void CreateGroup(string name, Guid ownerId, int publicStatus, string description)
            => GroupDAO.Instance.CreateGroup(name, ownerId, publicStatus, description);

        public async Task<IEnumerable<Group>> GetGroupsByLeaderId(Guid leaderId)
            => await GroupDAO.Instance.GetGroupsByLeaderId(leaderId);
        public async Task<IEnumerable<Group>> GetGroupsPublicByLeaderId(Guid leaderId)
                => await GroupDAO.Instance.GetGroupsPublicByLeaderId(leaderId);

        public async Task<int> GetTotalMembersInGroupById(Guid groupId)
            => await GroupDAO.Instance.GetTotalMembersInGroupById(groupId);

        public int IsLeaderGroup(Guid groupid, Guid leaderid)
            => GroupDAO.Instance.IsLeaderGroup(groupid, leaderid);

        public bool CheckGroupNameExisted(string groupName)
            => GroupDAO.Instance.CheckGroupNameExisted(groupName);

        public bool CheckGroupNameExistedForUpdate(Guid groupid, string groupName)
            => GroupDAO.Instance.CheckGroupNameExistedForUpdate(groupid, groupName);

        public void UpdateGroup(Guid groupid, string groupName, int publicStatus, string description)
            => GroupDAO.Instance.UpdateGroup(groupid, groupName, publicStatus, description);
    }
}
