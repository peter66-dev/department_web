using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
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

        public void UpdateUser(Guid id, string fname, string lname, string email, string phone, string address, string password, bool gender)
        {
            try
            {
                var context = new department_dbContext();
                User user = context.Users.FirstOrDefault(u => u.UserId == id);
                user.FirstName = fname.Trim();
                user.LastName = lname.Trim();
                user.Email = email.Trim();
                user.PhoneNumber = phone.Trim();
                user.Address = address.Trim();
                user.Password = password.Trim();
                user.Gender = gender;
                context.Entry(user).State = EntityState.Modified;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at UpdateUser: " + ex.Message);
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
                tmp = context.Users.Include(u => u.Role)
                                    .Include(u => u.StatusNavigation)
                                    .FirstOrDefault(u => u.UserId.Equals(userId));
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetUserById: " + ex.Message);
            }
            return tmp;
        }

        public async Task<User> GetUserByIdAsync(Guid userId)
        {
            User tmp = new User();
            try
            {
                var context = new department_dbContext();
                tmp = await context.Users
                                    .Include(u => u.Role)
                                    .Include(u => u.StatusNavigation)
                                    .FirstOrDefaultAsync(m => m.UserId == userId);
            }
            catch (Exception ex)
            {
                throw new Exception("Error at GetUserByIdAsync: " + ex.Message);
            }
            return tmp;
        }

        public User CheckLogin(string email, string password)
        {
            User tmp = null;
            try
            {
                var context = new department_dbContext();
                tmp = context.Users.FirstOrDefault(u => u.Email.Equals(email) && u.Password.Equals(password) && u.Status == 1);
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
                str = contextRole.Roles.FirstOrDefault(r => r.RoleId.Equals(user.RoleId)).RoleName.ToString();
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
        public void CreateUser(string firstname, string lastname, string email, string pass, bool gender, string phone, string address)
        {
            try
            {
                User user = new User()
                {
                    UserId = Guid.NewGuid(),
                    RoleId = Guid.Parse("4CC4C088-1456-4F80-91BA-204AFE6AF69C"), //resident
                    FirstName = firstname.Trim(),
                    LastName = lastname.Trim(),
                    Email = email.Trim(),
                    Password = pass.Trim(),
                    PhoneNumber = phone.Trim(),
                    Address = address.Trim(),
                    Gender = gender,
                    Avatar = "resident_avatar.png",
                    Status = 1
                };
                var context = new department_dbContext();
                context.Users.Add(user);
                if (context.SaveChanges() > 0)
                {
                    Console.WriteLine("Created account successfully!");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CreateUser: " + ex.Message);
            }
        }

        public bool CheckEmail(string email)
        {
            bool check = false;
            try
            {
                var context = new department_dbContext();
                User tmp = context.Users.FirstOrDefault(u => u.Email.Equals(email));
                check = tmp != null;
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CheckEmail: " + ex.Message);
            }
            return check;
        }

        public bool CheckEmailUpdate(string email, Guid userid)
        {
            bool check = false;
            try
            {
                var context = new department_dbContext();
                User tmp = context.Users.FirstOrDefault(u => u.Email.Equals(email) && u.UserId != userid);
                check = tmp != null;
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CheckEmailUpdate: " + ex.Message);
            }
            return check;
        }

        public bool CheckPhoneNumberUpdate(string phonenumber, Guid userid)
        {
            bool check = false;
            try
            {
                var context = new department_dbContext();
                User tmp = context.Users.FirstOrDefault(u => u.PhoneNumber.Equals(phonenumber.Trim()) && u.UserId != userid);
                check = tmp != null;
            }
            catch (Exception ex)
            {
                throw new Exception("Error at CheckPhoneNumberUpdate: " + ex.Message);
            }
            return check;
        }
    }
}
