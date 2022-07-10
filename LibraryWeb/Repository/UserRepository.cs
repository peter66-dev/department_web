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

        public async Task<IEnumerable<User>> GetAllResidentsAndManagerByAdminAsync()
            => await UserDAO.Instance.GetAllResidentsAndManagerByAdminAsync();

        public User GetUserById(Guid userId) => UserDAO.Instance.GetUserById(userId);

        public void DeleteUserById(Guid userId) => UserDAO.Instance.DeleteUserById(userId);

        public User CheckLogin(string email, string password) => UserDAO.Instance.CheckLogin(email, password);

        public string CheckRole(User user) => UserDAO.Instance.CheckRole(user);

        public Task<User> GetUserByIdAsync(Guid userId)
            => UserDAO.Instance.GetUserByIdAsync(userId);

        public bool CheckEmail(string email)
            => UserDAO.Instance.CheckEmail(email);

        public void CreateUser(string firstname, string lastname, string email, string pass, bool gender, string phone, string address)
            => UserDAO.Instance.CreateUser(firstname, lastname, email, pass, gender, phone, address);

        public bool CheckEmailUpdate(string email, Guid userid)
            => UserDAO.Instance.CheckEmailUpdate(email, userid);

        public bool CheckPhoneNumberUpdate(string phonenumber, Guid userid)
            => UserDAO.Instance.CheckPhoneNumberUpdate(phonenumber, userid);

        public void UpdateUser(Guid id, string fname, string lname, string email, string phone, string address, string password, bool gender)
            => UserDAO.Instance.UpdateUser(id, fname, lname, email, phone, address, password, gender);

        public async Task ChangeStatusUser(Guid userid, int status)
            => await UserDAO.Instance.ChangeStatusUser(userid, status);

        public async Task UpRole(Guid userid)
            => await UserDAO.Instance.UpRole(userid);

        public async Task<bool> DownRole(Guid userid)
        => await UserDAO.Instance.DownRole(userid);


    }
}
