using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MyLibrary.DataAccess
{
    internal class StatusDAO
    {
        private static StatusDAO instance = null;
        private static readonly object instanceLock = new object();

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
            List<Status> list = new List<Status>();
            try
            {
                var context = new department_dbContext();
                list = context.Statuses.ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetStatuses: " + ex.Message);
            }
            return list;
        }
       
        public Status GetStatusById(Guid statusId)
        {
            Status status = new Status();
            try
            {
                var context = new department_dbContext();       
                status = context.Statuses.FirstOrDefault(s => s.StatusId.Equals(statusId));
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetStatusById: " + ex.Message);
            }
            return status;
        }
        
    }
}
