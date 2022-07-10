using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using LibraryWeb.Repository;
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

        public async Task<IEnumerable<Group>> GetGroupsAsync()
        {
            List<Group> list = new List<Group>();
            try
            {
                var context = new department_dbContext();
                list = await context.Groups
                    .Where(g => g.Status == 1)
                    .Include(g => g.GroupOwner)
                    .OrderBy(g => g.CreatedDate)
                    .Reverse()
                    .ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetGroupsAsync: " + ex.Message);
            }
            return list;
        }

        public Group GetGroupById(Guid groupId)
        {
            Group gr = new Group();
            try
            {
                var context = new department_dbContext();
                gr = context.Groups
                                    .Include(g => g.GroupOwner)
                                    .FirstOrDefault(g => g.GroupId.Equals(groupId));
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetGroupById: " + ex.Message);
            }
            return gr;
        }
        public async Task DeleteGroupByIdAsync(Guid groupId)
        {
            try
            {
                var context = new department_dbContext();
                Group gr = await context.Groups.FirstOrDefaultAsync(g => g.GroupId == groupId);
                gr.Status = 2;
                context.SaveChanges();
                IGroupUserRepository guRepo = new GroupUserRepository();
                guRepo.DeleteMembersInGroup(groupId);
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DeleteGroupByIdAsync: " + ex.Message);
            }
        }
        public void CreateGroup(string name, Guid ownerId, int publicStatus, string description)
        {
            try
            {
                var context = new department_dbContext();

                Group group = new Group()
                {
                    GroupId = Guid.NewGuid(),
                    GroupOwnerId = ownerId,
                    GroupName = name.Trim(),
                    GroupDescription = description.Trim(),
                    CreatedDate = DateTime.Now,
                    PublicStatus = publicStatus,
                    Status = 1
                };

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
                list = await context.Groups.Where(g => g.GroupOwnerId == leaderId && g.Status == 1).ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetGroupsByLeaderId: " + ex.Message);
            }
            return list;
        }

        public async Task<IEnumerable<Group>> GetGroupsPublicByLeaderId(Guid leaderId)
        {
            List<Group> list = new List<Group>();
            try
            {
                var context = new department_dbContext();
                list = await context.Groups
                                        .Where(g => g.GroupOwnerId == leaderId
                                            && g.PublicStatus == 5)
                                        .ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetGroupsPublicByLeaderId: " + ex.Message);
            }
            return list;
        }

        public async Task<int> GetTotalMembersInGroupById(Guid groupId)
        {
            int total = 0;
            try
            {
                var context = new department_dbContext();
                IEnumerable<GroupUser> list = await context.GroupUsers
                                        .Where(g => g.GroupId == groupId && (g.Status == 1 || g.Status == 2))
                                        .ToListAsync();
                total = list.ToList().Count;
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetTotalMembersInGroupById: " + ex.Message);
            }
            return total;
        }

        /*
         -1: không làm chủ group này
         1: đang làm chủ group này
         */
        public int IsLeaderGroup(Guid groupid, Guid leaderid)
        {
            int status = -1;
            try
            {
                var context = new department_dbContext();
                Group gu = context.Groups
                        .FirstOrDefault(g => g.GroupOwnerId == leaderid
                                            && g.GroupId == groupid
                                            && g.Status == 1);
                if (gu != null)
                {
                    status = gu.Status;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at IsLeaderGroup: " + ex.Message);
            }
            return status;
        }

        public bool CheckGroupNameExisted(string groupName)
        {
            bool status = false;
            try
            {
                var context = new department_dbContext();
                Group g = context.Groups.FirstOrDefault(gr => gr.GroupName.Equals(groupName));
                status = g != null;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at CheckGroupNameExisted: " + ex.Message);
            }
            return status;
        }

        public bool CheckGroupNameExistedForUpdate(Guid groupid, string groupName)
        {
            bool status = false;
            try
            {
                var context = new department_dbContext();
                Group g = context.Groups.FirstOrDefault(gr => gr.GroupName.Equals(groupName) && gr.GroupId != groupid);
                status = g != null;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at CheckGroupNameExistedForUpdate: " + ex.Message);
            }
            return status;
        }

        public void UpdateGroup(Guid groupid, Guid leaderid, string groupName, int publicStatus, string description)
        {
            try
            {
                var context = new department_dbContext();
                Group g = context.Groups.FirstOrDefault(gr => gr.GroupId == groupid);
                g.GroupName = groupName;
                g.GroupOwnerId = leaderid;
                g.PublicStatus = publicStatus;
                g.GroupDescription = description;
                context.Entry(g).State = EntityState.Modified;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at UpdateGroup: " + ex.Message);
            }
        }
    }
}
