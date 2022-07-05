using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public interface IGroupUserRepository
    {
        void CreateGroupUser(GroupUser groupUser);
        void DeleteGroupUserById(Guid groupUserId);
        GroupUser GetGroupUserById(Guid groupUserId);
        IEnumerable<GroupUser> GetGroupUsers();

        Task<IEnumerable<Group>> GetGroupsByUserId(Guid userid);

        Task<IEnumerable<Group>> GetGroupsPublicByMemberID(Guid memberId);
        List<GroupUser> GetUsersPendingByManagerId(Guid managerId);
    }
}