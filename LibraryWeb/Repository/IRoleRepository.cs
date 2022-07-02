using LibraryWeb.Model;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public interface IRoleRepository
    {
        List<Role> GetAllRoles();

        Role GetRoleById(Guid roleId);

        void DeleteRoleById(Guid roleId);

        void CreateRole(Role role);
    }
}
