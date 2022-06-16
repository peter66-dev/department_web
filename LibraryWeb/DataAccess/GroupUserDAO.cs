using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DataAccess
{
    internal class GroupUserDAO
    {
        department_dbContext _dbContext;

        public GroupUserDAO()
        {
            _dbContext = new department_dbContext();
        }

        public IEnumerable<GroupUser> GetGroupUsers() => _dbContext.GroupUsers.ToList();

        public GroupUser GetGroupUserById(Guid groupUserId) => _dbContext.GroupUsers.FirstOrDefault(grpu => grpu.GroupUserId.Equals(groupUserId));

        public void DeleteGroupUserById(Guid groupUserId)
        {
            GroupUser groupUser = _dbContext.GroupUsers.FirstOrDefault(grpu => grpu.GroupUserId.Equals(groupUserId));
            groupUser.Status = 0;

            _dbContext.SaveChanges();
        }
        public void CreateGroupUser(GroupUser groupUser)
        {
            _dbContext.GroupUsers.Add(groupUser);
            _dbContext.SaveChanges();
        }
    }
}
