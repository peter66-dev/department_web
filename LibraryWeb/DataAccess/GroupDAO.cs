using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MyLibrary.DataAccess
{
    internal class GroupDAO
    {
        private static GroupDAO instance = null;
        private static readonly object instanceLock = new object();
        private department_dbContext _dbContext;
        private GroupDAO() { }

        public static GroupDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new GroupDAO();
                    }
                }
                return instance;
            }
        }

        public IEnumerable<Group> GetGroups()
        {
            _dbContext = new department_dbContext();
            return _dbContext.Groups.ToList();
        }
        public Group GetGroupById(Guid groupId)
        {
            _dbContext = new department_dbContext();
            return _dbContext.Groups.FirstOrDefault(grp => grp.GroupId.Equals(groupId));
        }
        public void DeleteGroupById(Guid groupId)
        {
            _dbContext = new department_dbContext();
            Group group = _dbContext.Groups.FirstOrDefault(cmt => cmt.GroupId.Equals(groupId));
            group.Status = 0;

            _dbContext.SaveChanges();
        }
        public void CreateGroup(Group group)
        {
            _dbContext = new department_dbContext();
            _dbContext.Groups.Add(group);
            _dbContext.SaveChanges();
        }
    }
}
