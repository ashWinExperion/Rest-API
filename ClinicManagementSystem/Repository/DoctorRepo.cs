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
    public class DoctorRepo : IDoctorRepo
    {
        private clinicalmanagementsystemContext _db;

        public DoctorRepo(clinicalmanagementsystemContext db)
        {
            _db = db;
        }


        //-----------------Get Raw Table Data------------------------------------------------------------------------
        public async Task<List<Doctor>> GetAllDoctor()
        {
            return await _db.Doctor.ToListAsync();
        }


        //------------------Add Users(Doctor)--------------------------------------------------------------------------
        public async Task<int> AddDoctor(AddDoctorView usr)
        {
            if (_db != null)

            {

                Users ur = new Users();
                ur.FirstName = usr.FirstName;
                ur.LastName = usr.LastName;
                ur.RoleId = 2;
                ur.JoinDate = new DateTime();
                ur.UserDob = usr.UserDob;
                ur.UserName = usr.UserName;
                ur.Password = usr.Password;
                ur.JoinDate = DateTime.Now;
                ur.City = usr.City;
                ur.State = usr.State;
                ur.Gender = usr.Gender;
                ur.Phone = usr.Phone;
                ur.Status = 1;
                await _db.Users.AddAsync(ur);
                await _db.SaveChangesAsync();

                Doctor dr = new Doctor();
                dr.SpecializationId = usr.Specialization;
                dr.UserId = ur.UserId;
                await _db.Doctor.AddAsync(dr);
                await _db.SaveChangesAsync();

                return dr.DoctorId;
            }
            return 0;
        }



        //--------------Update Doctor---------------------------------------------------------------
        public async Task UpdDoctor(AddDoctorView usr)
        {
            if (_db != null)

            {

                Users ur = new Users();
                ur.Status = 1;
                ur.UserId = usr.UserId;
                ur.FirstName = usr.FirstName;
                ur.LastName = usr.LastName;
                ur.RoleId = 2;
                ur.JoinDate = new DateTime();
                ur.UserDob = usr.UserDob;
                ur.UserName = usr.UserName;
                ur.Password = usr.Password;
                ur.JoinDate = DateTime.Now;
                ur.City = usr.City;
                ur.State = usr.State;
                ur.Gender = usr.Gender;
                ur.Phone = usr.Phone;
                _db.Entry(ur).State = EntityState.Modified;
                _db.Users.Update(ur);
                await _db.SaveChangesAsync();

                Doctor dr = new Doctor();
                dr.DoctorId = usr.DoctorId;
                dr.SpecializationId = usr.Specialization;
                dr.UserId = usr.UserId;
                _db.Entry(dr).State = EntityState.Modified;
                _db.Doctor.Update(dr);
                await _db.SaveChangesAsync();

            }

        }

        //-------------Get Doctor Details By UserID------------------------------------------------
        public async Task<AddDoctorView> GetDoctorDetailsByUserID(int id)
        {
            return await (from user in _db.Users
                          join dr in _db.Doctor
                          on user.UserId equals dr.UserId
                          where user.UserId == id
                          select new AddDoctorView
                          {
                              Status = (int)user.Status,
                              UserId = user.UserId,
                              DoctorId = dr.DoctorId,
                              FirstName = user.FirstName,
                              LastName = user.LastName,
                              RoleId = user.RoleId,
                              JoinDate = (DateTime)user.JoinDate,
                              UserDob = (DateTime)user.UserDob,
                              UserName = user.UserName,
                              Password = user.Password,
                              City = user.City,
                              State = user.State,
                              Gender = user.Gender,
                              Phone = user.Phone,
                              Specialization = (int)dr.SpecializationId
                          }
                   ).FirstOrDefaultAsync();

        }

        public async Task<List<AllDrSpView>> GetAllDrSp(int id)
        {
            return await (
                (from doc in _db.Doctor
                 join usr in _db.Users
                 on doc.UserId equals usr.UserId
                 join sp in _db.Specialization
                 on doc.SpecializationId equals sp.SpecializationId
                 where sp.SpecializationId==id
                 select new AllDrSpView
                 {
                     doctorId = doc.DoctorId,
                     docFirstName = usr.FirstName,
                     docLastName = usr.LastName,
                     specializationID = sp.SpecializationId,
                     SpecializationName = sp.SpecializationName
                 }).ToListAsync()
                ) ;
        }
    }
}
