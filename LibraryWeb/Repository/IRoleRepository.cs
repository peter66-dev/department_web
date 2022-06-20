using LibraryWeb.Model;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public interface IRoleRepository
    {
        public List<Role> GetAllRoles();

        public Role GetRoleById(Guid roleId);

        public void DeleteRoleById(Guid roleId);

        public void CreateRole(Role role);
    }
}
