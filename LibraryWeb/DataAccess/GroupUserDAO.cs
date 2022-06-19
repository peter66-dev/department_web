﻿using LibraryWeb.DataAccess;
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
        private static GroupUserDAO instance = null;
        private static readonly object instanceLock = new object();
        private department_dbContext _dbContext;
        private GroupUserDAO() { }

        public static GroupUserDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new GroupUserDAO();
                    }
                }
                return instance;
            }
        }

        public IEnumerable<GroupUser> GetGroupUsers()
        {
            _dbContext = new department_dbContext();
            return _dbContext.GroupUsers.ToList();
        }
        public GroupUser GetGroupUserById(Guid groupUserId)
        {
            _dbContext = new department_dbContext();
            return _dbContext.GroupUsers.FirstOrDefault(grpu => grpu.GroupUserId.Equals(groupUserId));
        }
        public void DeleteGroupUserById(Guid groupUserId)
        {
            _dbContext = new department_dbContext();
            GroupUser groupUser = _dbContext.GroupUsers.FirstOrDefault(grpu => grpu.GroupUserId.Equals(groupUserId));
            groupUser.Status = 0;

            _dbContext.SaveChanges();
        }
        public void CreateGroupUser(GroupUser groupUser)
        {
            _dbContext = new department_dbContext();
            _dbContext.GroupUsers.Add(groupUser);
            _dbContext.SaveChanges();
        }
    }
}
