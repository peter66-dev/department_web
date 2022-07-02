using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public class GroupUserRepository : IGroupUserRepository
    {
        public IEnumerable<GroupUser> GetGroupUsers()
            => GroupUserDAO.Instance.GetGroupUsers();
        public GroupUser GetGroupUserById(Guid groupUserId)
            => GroupUserDAO.Instance.GetGroupUserById(groupUserId);
        public void DeleteGroupUserById(Guid groupUserId) 
            => GroupUserDAO.Instance.DeleteGroupUserById(groupUserId);
        public void CreateGroupUser(GroupUser groupUser) 
            => GroupUserDAO.Instance.CreateGroupUser(groupUser);

        public async Task<IEnumerable<Group>> GetGroupsByUserId(Guid userid) 
            => await GroupUserDAO.Instance.GetGroupsByUserId(userid);
    }
}
