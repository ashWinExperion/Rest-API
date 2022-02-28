using ClinicManagementSystem.Models;
using ClinicManagementSystem.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClinicManagementSystem.Repository
{
    public class UsersRepo : IUsersRepo
    {
        private clinicalmanagementsystemContext _db;

        public UsersRepo(clinicalmanagementsystemContext db)
        {
            _db = db;
        }

        //-----------------Get Raw Table Data------------------------------------------------------------------------
        public async Task<List<Users>> GetAllUsers()
        {
            return await _db.Users.Where(x=>x.Status==1).ToListAsync();
        }


        //------------------Add Users--------------------------------------------------------------------------
        public async Task<int> AddUsers(Users usr)
        {
            if (_db != null)

            {
                usr.Status = 1;
                usr.JoinDate = DateTime.Now;
                await _db.Users.AddAsync(usr);
                await _db.SaveChangesAsync();
                return usr.UserId;
            }
            return 0;
        }



        //------------------Update Users--------------------------------------------------------------------------
        public async Task UpdateUsers(Users usr)
        {
            _db.Entry(usr).State = EntityState.Modified;
            _db.Users.Update(usr);
            await _db.SaveChangesAsync();
        }


        //------------------Get Users By Id--------------------------------------------------------------------------
        public async Task<Users> GetByUsersId(int id)
        {
            if (_db != null)
            {
                var result = await _db.Users.FindAsync(id);
                return result;
            }
            return null;
        }


        public async Task<Users> GetUserByUserNamePassword(string userName, string passWord)
        {
            return await (
                _db.Users.Where(x => x.Password == passWord && x.UserName == userName)
                ).FirstOrDefaultAsync();
        }



        public async Task DisableUser(int id)
        {
            var tempUser = _db.Users.Find(id);
            tempUser.Status = 0;
            _db.SaveChanges();
        }

    }
}
