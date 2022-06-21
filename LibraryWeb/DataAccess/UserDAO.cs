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
        private UserDAO() {}

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
        
        public User GetUserById(Guid userId)
        {
            User tmp = new User();
            try
            {
                var context = new department_dbContext();
                tmp = context.Users.FirstOrDefault(u => u.UserId.Equals(userId));
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetUserById: " + ex.Message);
            }
            return tmp;
        }

        public User CheckLogin(string email, string password)
        {
            User tmp = null;
            try
            {
                var context = new department_dbContext();
                tmp = context.Users.FirstOrDefault(u => u.Email.Equals(email) && u.Password.Equals(password));
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CheckLogin: " + ex.Message);
            }
            return tmp;
        }

        public string CheckRole(User user)
        {
            string str = null;
            try
            {
                var contextUser = new department_dbContext();
                var contextRole = new department_dbContext();
                str = contextRole.Roles.SingleOrDefault(r => r.RoleId.Equals(user.RoleId)).RoleName.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CheckRole: " + ex.Message);
            }
            return str;
        }

        public void DeleteUserById(Guid userId)
        {
            try
            {
                var context = new department_dbContext();
                User user = context.Users.FirstOrDefault(u => u.UserId.Equals(userId));
                user.Status = 6;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at DeleteUserById: " + ex.Message);
            }
        }
        public void CreateUser(User user)
        {
            try
            {
                var context = new department_dbContext();
                context.Users.Add(user);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CreateUser: " + ex.Message);
            }
        }
    }
}
