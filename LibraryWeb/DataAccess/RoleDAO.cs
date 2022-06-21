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
        
        public Role GetRoleById(Guid roleId)
        {
            Role role = new Role();
            try
            {
                var context = new department_dbContext();
                role = context.Roles.FirstOrDefault(r => r.RoleId.Equals(roleId));
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetRoleById: " + ex.Message);
            }
            return role;
        }
        
        public void DeleteRoleById(Guid roleId)
        {
            try
            {
                var context = new department_dbContext();
                Role role = context.Roles.FirstOrDefault(r => r.RoleId.Equals(roleId));
                role.Status = 6;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DeleteRoleById: " + ex.Message);
            }
        }
       
        public void CreateRole(Role role)
        {
            try
            {
                var context = new department_dbContext();
                context.Roles.Add(role);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CreateRole: " + ex.Message);
            }
        }
    }
}
