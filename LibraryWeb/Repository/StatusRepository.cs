using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public class StatusRepository : IStatusRepository
    {
        public IEnumerable<Status> GetStatuses() => StatusDAO.Instance.GetStatuses();
        public Status GetStatusById(Guid statusId) => StatusDAO.Instance.GetStatusById(statusId);
        public void DeleteStatusById(Guid statusId) => StatusDAO.Instance.DeleteStatusById(statusId);
        public void CreateStatus(Status status) => StatusDAO.Instance.CreateStatus(status);
    }
}
