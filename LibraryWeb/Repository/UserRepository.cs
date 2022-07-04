using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public class UserRepository : IUserRepository
    {
        public List<User> GetAllUsers() => UserDAO.Instance.GetAllUsers();
        public User GetUserById(Guid userId) => UserDAO.Instance.GetUserById(userId);
        public void DeleteUserById(Guid userId) => UserDAO.Instance.DeleteUserById(userId);
        public void CreateUser(User user) => UserDAO.Instance.CreateUser(user);
        public User CheckLogin(string email, string password) => UserDAO.Instance.CheckLogin(email, password);
        public string CheckRole(User user) => UserDAO.Instance.CheckRole(user);

        public Task<User> GetUserByIdAsync(Guid userId)
            => UserDAO.Instance.GetUserByIdAsync(userId);
    }
}
