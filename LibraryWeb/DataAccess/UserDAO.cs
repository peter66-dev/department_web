using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using LibraryWeb.Repository;
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

        public List<User> GetAllUsers()
        {
            List<User> list = new List<User>();
            try
            {
                var context = new department_dbContext();
                list = context.Users
                                .ToList();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at GetAllUsers: " + ex.Message);
            }
            return list;
        }

        public async Task<IEnumerable<User>> GetAllResidentsAndManagerByAdminAsync()
        {
            List<User> list = new List<User>();
            try
            {
                var context = new department_dbContext();
                list = await context.Users
                                        .Where(u => u.Role.RoleName.Equals("RESIDENT")
                                            || u.Role.RoleName.Equals("MANAGER"))
                                        .Include(u => u.Role)
                                        .ToListAsync();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at GetAllUsersByAdminAsync: " + ex.Message);
            }
            return list;
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
                Console.WriteLine("Error at GetUserById: " + ex.Message);
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
                Console.WriteLine("Error at GetUserByIdAsync: " + ex.Message);
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
                Console.WriteLine("Error at CheckLogin: " + ex.Message);
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
                Console.WriteLine("Error at CheckRole: " + ex.Message);
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
                Console.WriteLine("Error at DeleteUserById: " + ex.Message);
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
                Console.WriteLine("Error at CreateUser: " + ex.Message);
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
                Console.WriteLine("Error at CheckEmail: " + ex.Message);
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
                Console.WriteLine("Error at CheckEmailUpdate: " + ex.Message);
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
                Console.WriteLine("Error at CheckPhoneNumberUpdate: " + ex.Message);
            }
            return check;
        }

        public async Task ChangeStatusUser(Guid userid, int status)
        {
            try
            {
                var c = new department_dbContext();
                User user = await c.Users.FirstOrDefaultAsync(u => u.UserId == userid);
                user.Status = status;
                c.Entry(user).State = EntityState.Modified;
                await c.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at ActivatedUser: " + ex.Message);
            }
        }

        public async Task UpRole(Guid userid)
        {
            try
            {
                var c = new department_dbContext();
                User user = await c.Users.FirstOrDefaultAsync(u => u.UserId == userid);
                user.RoleId = await GetRoleIdAsync("MANAGER");
                user.Avatar = "manager_avatar.png";
                await c.SaveChangesAsync();

                IGroupUserRepository repo = new GroupUserRepository();
                repo.UpRole(user.UserId);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at UpRole: " + ex.Message);
            }
        }

        private async Task<Guid> GetRoleIdAsync(string rolename)
        {
            Guid id = Guid.NewGuid();
            try
            {
                var c = new department_dbContext();
                if (rolename.Equals("RESIDENT") || rolename.Equals("MANAGER") || rolename.Equals("ADMIN"))
                {
                    Role r = await c.Roles.SingleOrDefaultAsync(r => r.RoleName.Equals(rolename));
                    id = r.RoleId;
                }
                else
                {
                    Console.WriteLine("[SYSTEM MESSAGE]: ERROR AT GetRoleId!");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at GetRoleId: " + ex.Message);
            }
            return id;
        }

        public async Task<bool> DownRole(Guid userid)
        {
            bool check = false;
            try
            {
                var c = new department_dbContext();
                User user = await c.Users.FirstOrDefaultAsync(u => u.UserId == userid);
                IGroupRepository repo = new GroupRepository();
                IEnumerable<Group> groups = await repo.GetGroupsByLeaderId(userid);
                if (groups.ToList().Count == 0)
                {
                    user.RoleId = await GetRoleIdAsync("RESIDENT");
                    user.Avatar = "resident_avatar.png";
                    check = await c.SaveChangesAsync() > 0;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at DownRole: " + ex.Message);
            }
            return check;
        }

    }
}
