using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public class UserRepository : IUserRepository
    {
        public List<User> GetAllUsers() => UserDAO.Instance.GetAllUsers();
    }
}
