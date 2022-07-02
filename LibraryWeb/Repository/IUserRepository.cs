using LibraryWeb.Model;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public interface IUserRepository
    {
        void CreateUser(User user);
        void DeleteUserById(Guid userId);
        List<User> GetAllUsers();
        User GetUserById(Guid userId);
        User CheckLogin(string email, string password);
        string CheckRole(User user);
    }
}
