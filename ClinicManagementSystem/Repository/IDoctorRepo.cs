using ClinicManagementSystem.Models;
using ClinicManagementSystem.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClinicManagementSystem.Repository
{
    public interface IDoctorRepo
    {
        Task<List<AllDrSpView>> GetAllDrSp(int id);

        Task<AddDoctorView> GetDoctorDetailsByUserID(int id);
        Task UpdDoctor(AddDoctorView usr);

        Task<int> AddDoctor(AddDoctorView usr);
        Task<List<Doctor>> GetAllDoctor();
    }
}

