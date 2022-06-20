using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MyLibrary.DataAccess
{
    internal class GroupUserDAO
    {
        private static GroupUserDAO instance = null;
        private static readonly object instanceLock = new object();

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
            List<GroupUser> list = new List<GroupUser>();
            try
            {
                var context = new department_dbContext();
                context.GroupUsers.ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetGroupUsers: " + ex.Message);
            }
            return list;
        }
        public GroupUser GetGroupUserById(Guid groupUserId)
        {
            GroupUser gu = new GroupUser();
            try
            {
                var context = new department_dbContext();
                gu = context.GroupUsers.FirstOrDefault(g => g.GroupUserId.Equals(groupUserId));
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetGroupUserById: " + ex.Message);
            }
            return gu;
        }
        public void DeleteGroupUserById(Guid groupUserId)
        {

            try
            {
                var context = new department_dbContext();
                GroupUser groupUser = context.GroupUsers.FirstOrDefault(grpu => grpu.GroupUserId.Equals(groupUserId));
                groupUser.Status = 3;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DeleteGroupUserById: " + ex.Message);
            }
        }
        public void CreateGroupUser(GroupUser groupUser)
        {
            try
            {
                var context = new department_dbContext();
                context.GroupUsers.Add(groupUser);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CreateGroupUser: " + ex.Message);
            }
        }
    }
}
