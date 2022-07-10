using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public interface IGroupRepository
    {
        void CreateGroup(string name, Guid ownerId, int publicStatus, string description);
        Task DeleteGroupByIdAsync(Guid groupId);
        Group GetGroupById(Guid groupId);
        Task<IEnumerable<Group>> GetGroupsByLeaderId(Guid leaderId);
        Task<IEnumerable<Group>> GetGroupsPublicByLeaderId(Guid leaderId);
        Task<int> GetTotalMembersInGroupById(Guid groupId);
        int IsLeaderGroup(Guid groupid, Guid leaderid);

        Task<IEnumerable<Group>> GetGroupsAsync();

        bool CheckGroupNameExisted(string groupName);
        bool CheckGroupNameExistedForUpdate(Guid groupid, string groupName);

        void UpdateGroup(Guid groupid, Guid leaderid, string groupName, int publicStatus, string description);
    }
}