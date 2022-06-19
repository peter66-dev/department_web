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
        private static StatusDAO instance = null;
        private static readonly object instanceLock = new object();
        private department_dbContext _dbContext;
        private StatusDAO() { }

        public static StatusDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new StatusDAO();
                    }
                }
                return instance;
            }
        }

        public IEnumerable<Status> GetStatuses()
        {
            _dbContext = new department_dbContext();
            return _dbContext.Statuses.ToList();
        }
        public Status GetStatusById(Guid statusId)
        {
            _dbContext = new department_dbContext();
            return _dbContext.Statuses.FirstOrDefault(stt => stt.StatusId.Equals(statusId));
        }
        public void DeleteStatusById(Guid statusId)
        {
            _dbContext = new department_dbContext();
            Status status = _dbContext.Statuses.FirstOrDefault(stt => stt.StatusId.Equals(statusId));
            _dbContext.Statuses.Remove(status);

            _dbContext.SaveChanges();
        }
        public void CreateStatus(Status status)
        {
            _dbContext = new department_dbContext();
            _dbContext.Statuses.Add(status);
            _dbContext.SaveChanges();
        }
    }
}
