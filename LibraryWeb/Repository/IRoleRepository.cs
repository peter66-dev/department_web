using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public interface IRoleRepository
    {
        public List<Role> GetAllRoles();
    }
}
