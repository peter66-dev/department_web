using LibraryWeb.Model;
using LibraryWeb.Repository;
using System;
using System.Collections.Generic;

namespace ConsoleAppTest
{
    internal class Program
    {
        static void Main(string[] args)
        {
            IUserRepository repo = new UserRepository();
            List<User> users = repo.GetAllUsers();
            if (users.Count == 0)
            {
                Console.WriteLine("khong co user!");
            }
            else
            {
                foreach (User u in users)
                {
                    Console.WriteLine($"Name: " + u.Username);
                }
            }
        }
    }
}
