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
        private department_dbContext _dbContext;

        private RoleDAO() {}

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
        public IEnumerable<Role> GetRoles()
        {
            _dbContext = new department_dbContext();
            return _dbContext.Roles.ToList();
        }
        public Role GetRoleById(Guid roleId)
        {
            _dbContext = new department_dbContext();
            return _dbContext.Roles.FirstOrDefault(rle => rle.RoleId.Equals(roleId));
        }
        public void DeleteRoleById(Guid roleId)
        {
            _dbContext = new department_dbContext();
            Role role = _dbContext.Roles.FirstOrDefault(rle => rle.RoleId.Equals(roleId));
            role.Status = 0;

            _dbContext.SaveChanges();
        }
        public void CreateRole(Role role)
        {
            _dbContext = new department_dbContext();
            _dbContext.Roles.Add(role);
            _dbContext.SaveChanges();
        }
    }
}
