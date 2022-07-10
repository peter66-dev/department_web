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

        public async Task<IEnumerable<Group>> GetGroupsPublicByMemberID(Guid memberId)
                => await GroupUserDAO.Instance.GetGroupsPublicByMemberID(memberId);

        public List<GroupUser> GetUsersPendingByManagerId(Guid managerId)
            => GroupUserDAO.Instance.GetUsersPendingByManagerId(managerId);

        public int IsJoinedGroup(Guid groupid, Guid memberid)
            => GroupUserDAO.Instance.IsJoinedGroup(groupid, memberid);

        public bool LetUserJoinGroup(Guid memberid, Guid groupid)
            => GroupUserDAO.Instance.LetUserJoinGroup(memberid, groupid);

        public bool LetUserLeaveGroup(Guid memberid, Guid groupid)
            => GroupUserDAO.Instance.LetUserLeaveGroup(memberid, groupid);

        public bool ApproveResident(Guid userid, Guid groupid)
             => GroupUserDAO.Instance.ApproveResident(userid, groupid);

        public bool RejectResident(Guid userid, Guid groupid)
            => GroupUserDAO.Instance.RejectResident(userid, groupid);

        public void DeleteMembersInGroup(Guid groupid)
            => GroupUserDAO.Instance.DeleteMembersInGroup(groupid);
    }
}
