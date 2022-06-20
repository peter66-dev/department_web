using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public class RoleRepository : IRoleRepository
    {
        public void CreateRole(Role role) => RoleDAO.Instance.CreateRole(role);

        public void DeleteRoleById(Guid roleId) => RoleDAO.Instance.DeleteRoleById(roleId);

        public List<Role> GetAllRoles() => RoleDAO.Instance.GetAllRoles();

        public Role GetRoleById(Guid roleId) => RoleDAO.Instance.GetRoleById(roleId);
    }
}
