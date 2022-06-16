using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public class RoleRepository : IRoleRepository
    {
        public List<Role> GetAllRoles() => RoleDAO.Instance.GetAllRoles();
    }
}
