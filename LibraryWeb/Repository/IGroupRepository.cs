using LibraryWeb.Model;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public interface IGroupRepository
    {
        void CreateGroup(Group group);
        void DeleteGroupById(Guid groupId);
        Group GetGroupById(Guid groupId);
        IEnumerable<Group> GetGroups();
    }
}