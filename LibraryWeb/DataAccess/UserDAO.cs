using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DataAccess
{
    public class UserDAO
    {
        private static UserDAO instance = null;
        private static readonly object instanceLock = new object();

        private UserDAO() { }

        public static UserDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new UserDAO();
                    }
                }
                return instance;
            }
        }

        public List<User> GetAllUsers()
        {
            List<User> roles = new List<User>();
            try
            {
                var context = new department_dbContext();
                roles = context.Users.ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetAllUsers: " + ex.Message);
            }
            return roles;
        }
    }
}
