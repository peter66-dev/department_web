﻿using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public interface IGroupRepository
    {
        void CreateGroup(Group group);
        void DeleteGroupById(Guid groupId);
        Group GetGroupById(Guid groupId);
        Task<IEnumerable<Group>> GetGroupsByLeaderId(Guid leaderId);
        Task<IEnumerable<Group>> GetGroupsPublicByLeaderId(Guid leaderId);
        Task<int> GetTotalMembersInGroupById(Guid groupId);
        int IsLeaderGroup(Guid groupid, Guid leaderid);

        Task<IEnumerable<Group>> GetGroupsAsync();
    }
}