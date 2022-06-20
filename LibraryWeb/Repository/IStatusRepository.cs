using LibraryWeb.Model;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public interface IStatusRepository
    {
        Status GetStatusById(Guid statusId);

        IEnumerable<Status> GetStatuses();
    }
}