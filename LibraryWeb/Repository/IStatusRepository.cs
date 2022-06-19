using LibraryWeb.Model;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public interface IStatusRepository
    {
        void CreateStatus(Status status);
        void DeleteStatusById(Guid statusId);
        Status GetStatusById(Guid statusId);
        IEnumerable<Status> GetStatuses();
    }
}