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
                list = context.GroupUsers.ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetGroupUsers: " + ex.Message);
            }
            return list;
        }

        public async Task<IEnumerable<Group>> GetGroupsByUserId(Guid userid)
        {
            List<Group> list = new List<Group>();
            try
            {
                var context = new department_dbContext();
                var tmp = await context.GroupUsers
                                .Where(gu => gu.MemberId == userid && gu.Status == 1)
                                .Include(gu => gu.Group).ToListAsync();
                foreach (var cur in tmp)
                {
                    list.Add(cur.Group);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetGroupsByUserId: " + ex.Message);
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

        public async Task<IEnumerable<Group>> GetGroupsPublicByMemberID(Guid memberId)
        {
            List<Group> list = new List<Group>();
            try
            {
                var context = new department_dbContext();
                List<GroupUser> tmp = await context.GroupUsers
                                        .Where(g => g.Group.PublicStatus == 5
                                            && g.MemberId == memberId)
                                        .Include(g => g.Group)
                                        .ToListAsync();
                if (tmp.Count > 0)
                {
                    foreach (GroupUser ge in tmp)
                    {
                        GroupRepository repo = new GroupRepository();
                        list.Add(repo.GetGroupById(ge.GroupId));
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetGroupsPublicByMemberID: " + ex.Message);
            }
            return list;
        }

        public List<GroupUser> GetUsersPendingByManagerId(Guid managerId)
        {
            IEnumerable<GroupUser> list = null;
            try
            {
                var context = new department_dbContext();
                list = context.GroupUsers
                                    .Where(g => g.Status == 4
                                        && g.Group.GroupOwnerId == managerId)
                                    .Include(g => g.Group)
                                    .Include(g => g.Member);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at GetUsersPendingByManagerId: " + ex.Message);
            }
            return list.ToList();
        }

        public int IsJoinedGroup(Guid groupid, Guid memberid)
        {
            int status = 0;
            try
            {
                var context = new department_dbContext();
                GroupUser gu = context.GroupUsers
                        .FirstOrDefault(g => g.MemberId == memberid && g.GroupId == groupid);
                if (gu != null)
                {
                    status = gu.Status;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at IsJoinedGroup: " + ex.Message);
            }
            return status;
        }

        private GroupUser CheckUserJoinGroup(Guid memberid, Guid groupid)
        {
            GroupUser gu = null;
            try
            {
                var context = new department_dbContext();
                gu = context.GroupUsers
                                .FirstOrDefault(g => g.MemberId == memberid
                                                    && g.GroupId == groupid);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at CheckUserJoinGroup: " + ex.Message);
            }
            return gu;
        }

        public bool LetUserJoinGroup(Guid memberid, Guid groupid)
        {
            bool check = false;
            try
            {
                var context = new department_dbContext();
                GroupUser gu = context.GroupUsers
                                                .FirstOrDefault(g => g.MemberId == memberid
                                                        && g.GroupId == groupid);
                if (gu == null)
                {
                    gu = new GroupUser();
                    gu.GroupUserId = Guid.NewGuid();
                    gu.GroupId = groupid;
                    gu.MemberId = memberid;
                    gu.Status = 4;
                    context.GroupUsers.Add(gu);
                    check = context.SaveChanges() > 0;
                }
                else
                {
                    gu.Status = 4; // let user join group
                    context.Entry<GroupUser>(gu).State = EntityState.Modified;
                    check = context.SaveChanges() > 0;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at LetUserJoinGroup: " + ex.Message);
            }
            return check;
        }

        public bool LetUserLeaveGroup(Guid memberid, Guid groupid)
        {
            bool check = false;
            try
            {
                var context = new department_dbContext();
                GroupUser gu = context.GroupUsers
                                                .FirstOrDefault(g => g.MemberId == memberid
                                                        && g.GroupId == groupid);

                gu.Status = 2; // let user quit group: Inactive
                context.Entry<GroupUser>(gu).State = EntityState.Modified;
                check = context.SaveChanges() > 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at LetUserLeaveGroup: " + ex.Message);
            }
            return check;
        }

        public bool ApproveResident(Guid userid, Guid groupid)
        {
            bool check = false;
            try
            {
                var context = new department_dbContext();
                GroupUser gu = context.GroupUsers.FirstOrDefault(g => g.MemberId == userid && g.GroupId == groupid);
                if (gu != null)
                {
                    gu.Status = 1;
                }
                context.Entry(gu).State = EntityState.Modified;
                check = context.SaveChanges() > 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at ApproveResident: " + ex.Message);
            }
            return check;
        }

        public bool RejectResident(Guid userid, Guid groupid)
        {
            bool check = false;
            try
            {
                var context = new department_dbContext();
                GroupUser gu = context.GroupUsers.FirstOrDefault(g => g.MemberId == userid && g.GroupId == groupid);
                if (gu != null)
                {
                    gu.Status = 8;
                }
                context.Entry(gu).State = EntityState.Modified;
                check = context.SaveChanges() > 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at RejectResident: " + ex.Message);
            }
            return check;
        }

        public void DeleteMembersInGroup(Guid groupid)
        {
            try
            {
                var context = new department_dbContext();
                List<GroupUser> gu = context.GroupUsers.Where(g => g.GroupId == groupid).ToList();
                foreach (GroupUser item in gu)
                {
                    DeleteMemberInGroup(item.MemberId, item.GroupId);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at DeleteMembersInGroup: " + ex.Message);
            }
        }

        private void DeleteMemberInGroup(Guid memberid, Guid groupid)
        {
            try
            {
                var context = new department_dbContext();
                GroupUser gu = context.GroupUsers.FirstOrDefault(g => g.MemberId == memberid && g.GroupId == groupid);
                gu.Status = 8;
                context.Entry(gu).State = EntityState.Modified;
                if (context.SaveChanges() > 0)
                {
                    Console.WriteLine("Da xoa members!");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at DeleteMemberInGroup: " + ex.Message);
            }
        }

        public async Task UpRoleAsync(Guid memberid)
        {
            try
            {
                var context = new department_dbContext();
                IEnumerable<GroupUser> list = await context.GroupUsers.Where(g => g.MemberId == memberid).ToListAsync();
                foreach (GroupUser gu in list)
                {
                    var c = new department_dbContext();
                    GroupUser g = await c.GroupUsers.FirstOrDefaultAsync(group => group.GroupUserId == gu.GroupUserId);
                    g.Status = 2;
                    c.Entry(g).State = EntityState.Modified;
                    if (c.SaveChanges() > 0)
                    {
                        Console.WriteLine("Da up role member!");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at UpRole: " + ex.Message);
            }
        }
    }
}
