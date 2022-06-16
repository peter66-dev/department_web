using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MyLibrary.DataAccess
{
    internal class GroupDAO
    {
        private department_dbContext _dbContext;

        public GroupDAO()
        {
            _dbContext = new department_dbContext();
        }

        public IEnumerable<Group> GetGroups() => _dbContext.Groups.ToList();

        public Group GetGroupById(Guid groupId) => _dbContext.Groups.FirstOrDefault(grp => grp.GroupId.Equals(groupId));

        public void DeleteGroupById(Guid groupId)
        {
            Group group = _dbContext.Groups.FirstOrDefault(cmt => cmt.GroupId.Equals(groupId));
            group.Status = 0;

            _dbContext.SaveChanges();
        }
        public void CreateGroup(Group group)
        {
            _dbContext.Groups.Add(group);
            _dbContext.SaveChanges();
        }
    }
}
