using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MyLibrary.DataAccess
{
    public class RoleDAO
    {
        private static RoleDAO instance = null;
        private static readonly object instanceLock = new object();

        private RoleDAO() { }

        public static RoleDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new RoleDAO();
                    }
                }
                return instance;
            }
        }

        public List<Role> GetAllRoles()
        {
            List<Role> roles = new List<Role>();
            try
            {
                var context = new department_dbContext();
                roles = context.Roles.ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetAllRoles: " + ex.Message);
            }
            return roles;
        }
    }
}
