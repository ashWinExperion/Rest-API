﻿using ClinicManagementSystem.Models;
using ClinicManagementSystem.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClinicManagementSystem.Repository
{
    public class TestPrescriptionRepo : ITestPrescriptionRepo
    {
        private clinicalmanagementsystemContext _db;

        public TestPrescriptionRepo(clinicalmanagementsystemContext db)
        {
            _db = db;
        }

        //-----------------Get Raw Table Data------------------------------------------------------------------------
        public async Task<List<TestPrescription>> GetAllTestPrescription()
        {
            return await _db.TestPrescription.ToListAsync();
        }


        //------------------Add TestPrescription--------------------------------------------------------------------------
        public async Task<int> AddTestPrescription(TestPrescription tstPr)
        {
            if (_db != null)

            {
                await _db.TestPrescription.AddAsync(tstPr);
                await _db.SaveChangesAsync();
                return tstPr.TestPrescriptionId;
            }
            return 0;
        }

        //------------------Update TestPrescription--------------------------------------------------------------------------
        public async Task UpdateTestPrescription(TestPrescription tstPr)
        {
            _db.Entry(tstPr).State = EntityState.Modified;
            _db.TestPrescription.Update(tstPr);
            await _db.SaveChangesAsync();
        }


        //------------------Get TestPrescription By Id--------------------------------------------------------------------------
        public async Task<TestPrescription> GetByTestPrescriptionId(int id)
        {
            if (_db != null)
            {
                var result = await _db.TestPrescription.FindAsync(id);
                return result;
            }
            return null;
        }



        //---------------Get All Patients Having Test Prescribed For the Day----------------------------------------------------
        public async Task<List<PatinetsHavingTests>> GetAllTestPrescribedForTheDay()
        {
            return await (
                (from ap in _db.Appointment
                 join pt in _db.Patient
                 on ap.PatientId equals pt.PatientId
                 join doc in _db.Doctor
                 on ap.DoctorId equals doc.DoctorId
                 join usr in _db.Users
                 on doc.UserId equals usr.UserId
                 join testPres in _db.TestPrescription
                 on ap.AppointmentId equals testPres.AppointmentId
                 where ap.Date == DateTime.Today
                 select new PatinetsHavingTests
                 {
                     AppointmentId=ap.AppointmentId,
                     PatientId = pt.PatientId,
                     Status = (int)ap.Status,
                     Date = (DateTime)ap.Date,
                     TestPrescriptionID = testPres.TestPrescriptionId,
                     FirstName = pt.FirstName,
                     LastName = pt.LastName,
                     DocFirstName = usr.FirstName,
                     DocLastName = usr.LastName,
                     Token = (int)ap.TokenNumber
                 }).ToListAsync()
                );
        }

    }
}
