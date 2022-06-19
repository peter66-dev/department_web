using LibraryWeb.Model;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public interface IGroupUserRepository
    {
        void CreateGroupUser(GroupUser groupUser);
        void DeleteGroupUserById(Guid groupUserId);
        GroupUser GetGroupUserById(Guid groupUserId);
        IEnumerable<GroupUser> GetGroupUsers();
    }
}