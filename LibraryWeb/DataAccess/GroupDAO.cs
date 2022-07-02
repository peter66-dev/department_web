using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyLibrary.DataAccess
{
    internal class GroupDAO
    {
        private static GroupDAO instance = null;
        private static readonly object instanceLock = new object();

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
            List<Group> list = new List<Group>();
            try
            {
                var context = new department_dbContext();
                context.Groups.ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetGroups: " + ex.Message);
            }
            return list;
        }

        public Group GetGroupById(Guid groupId)
        {
            Group gr = new Group();
            try
            {
                var context = new department_dbContext();
                gr = context.Groups.FirstOrDefault(g => g.GroupId.Equals(groupId));
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetGroupById: " + ex.Message);
            }
            return gr;
        }
        public void DeleteGroupById(Guid groupId)
        {
            try
            {
                var context = new department_dbContext();
                Group gr = context.Groups.FirstOrDefault(g => g.GroupId.Equals(groupId));
                gr.Status = 2;

                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DeleteGroupById: " + ex.Message);
            }
        }
        public void CreateGroup(Group group)
        {
            try
            {
                var context = new department_dbContext();
                context.Groups.Add(group);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CreateGroup: " + ex.Message);
            }
        }

        public async Task<IEnumerable<Group>> GetGroupsByLeaderId(Guid leaderId)
        {
            List<Group> list = new List<Group>();
            try
            {
                var context = new department_dbContext();
                list = await context.Groups.Where(g => g.GroupOwnerId == leaderId).ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetGroupsByLeaderId: " + ex.Message);
            }
            return list;
        }
    }
}
