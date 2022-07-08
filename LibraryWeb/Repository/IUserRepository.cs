using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public interface IUserRepository
    {
        void DeleteUserById(Guid userId);
        List<User> GetAllUsers();
        User GetUserById(Guid userId);
        User CheckLogin(string email, string password);
        string CheckRole(User user);

        Task<User> GetUserByIdAsync(Guid userId);

        bool CheckEmail(string email);
        void CreateUser(string firstname, string lastname, string email, string pass, bool gender, string phone, string address);
    }
}
