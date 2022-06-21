using LibraryWeb.Model;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public interface IUserRepository
    {
        void CreateUser(User user);
        void DeleteUserById(Guid userId);
        public List<User> GetAllUsers();
        User GetUserById(Guid userId);
        public User CheckLogin(string email, string password);
        public string CheckRole(User user);
    }
}
