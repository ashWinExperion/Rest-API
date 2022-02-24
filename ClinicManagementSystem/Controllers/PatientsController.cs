﻿using ClinicManagementSystem.Models;
using ClinicManagementSystem.Repository;
using ClinicManagementSystem.ViewModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClinicManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PatientsController : ControllerBase
    {
        private IPatientsRepo _intrface;

        public PatientsController(IPatientsRepo intrfaceDI)
        {
            _intrface = intrfaceDI;
        }

        //Get Raw Table Data
        [HttpGet("raw")]
        public async Task<List<Patient>> GetAllPatient()
        {
            return await _intrface.GetAllPatient();
        }



        //GET By Id
        [HttpGet("{id}")]
        public async Task<ActionResult<Patient>> GetPatientById(int id)
        {
            try
            {
                var result = await _intrface.GetByPatientId(id);
                if (result == null)
                {
                    return NotFound();
                }
                return result; //return Ok(employee)
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }


        //Add Patient
        [HttpPost]
        public async Task<IActionResult> AddPatient([FromBody] Patient apnt)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var postId = await _intrface.AddPatient(apnt);
                    if (postId > 0)
                    {
                        return Ok(postId);
                    }
                    else
                    {
                        return NotFound();
                    }
                }
                catch (Exception)
                {
                    return BadRequest();
                }
            }
            return BadRequest();
        }


        //Update Patient
        [HttpPut]
        public async Task<IActionResult> UpdPatient([FromBody] Patient apnt)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    await _intrface.UpdatePatient(apnt);
                    return Ok();
                }
                catch (Exception)
                {
                    return BadRequest();
                }
            }
            return BadRequest();
        }


        [HttpGet("bill/{AppointmentId}")]
        public async Task<BillDetails> GetBill(int AppointmentId)
        {
            return await _intrface.GetBill(AppointmentId);
        }
    }
}
