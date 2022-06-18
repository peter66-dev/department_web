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
        private department_dbContext _dbContext;
        private UserDAO() {
            _dbContext = new department_dbContext();
        }

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
        public IEnumerable<User> GetUsers()
        {
            _dbContext = new department_dbContext();
            return _dbContext.Users.ToList();
        }
        public User GetUserById(Guid userId)
        {
            _dbContext = new department_dbContext();
            return _dbContext.Users.FirstOrDefault(usr => usr.UserId.Equals(userId));
        }
        public void DeleteUserById(Guid userId)
        {
            _dbContext = new department_dbContext();
            User user = _dbContext.Users.FirstOrDefault(usr => usr.UserId.Equals(userId));
            user.Status = 0;

            _dbContext.SaveChanges();
        }
        public void CreateUser(User user)
        {
            _dbContext = new department_dbContext();
            _dbContext.Users.Add(user);
            _dbContext.SaveChanges();
        }
    }
}
