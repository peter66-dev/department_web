using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DataAccess
{
    internal class StatusDAO
    {
        department_dbContext _dbContext;

        public StatusDAO()
        {
            _dbContext = new department_dbContext();
        }

        public IEnumerable<Status> GetStatuses() => _dbContext.Statuses.ToList();

        public Status GetStatusById(Guid statusId) => _dbContext.Statuses.FirstOrDefault(stt => stt.StatusId.Equals(statusId));

        public void DeleteStatusById(Guid statusId)
        {
            Status status = _dbContext.Statuses.FirstOrDefault(stt => stt.StatusId.Equals(statusId));
            _dbContext.Statuses.Remove(status);

            _dbContext.SaveChanges();
        }
        public void CreateStatus(Status status)
        {
            _dbContext.Statuses.Add(status);
            _dbContext.SaveChanges();
        }
    }
}
