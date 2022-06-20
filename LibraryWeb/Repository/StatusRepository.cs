using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public class StatusRepository : IStatusRepository
    {
        public IEnumerable<Status> GetStatuses() => StatusDAO.Instance.GetStatuses();
      
        public Status GetStatusById(Guid statusId) => StatusDAO.Instance.GetStatusById(statusId);
    }
}
