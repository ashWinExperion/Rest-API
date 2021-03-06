using ClinicManagementSystem.Models;
using ClinicManagementSystem.Repository;
using ClinicManagementSystem.ViewModel;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// Doctor Details API

namespace ClinicManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DoctorsController : ControllerBase
    {

        private IDoctorRepo _intrface;

        public DoctorsController(IDoctorRepo intrfaceDI)
        {
            _intrface = intrfaceDI;
        }

        // GET: api/<DoctorController>/specialisation
        [HttpGet("specialisation/{id}")]
        public async Task<List<AllDrSpView>> GetAllDrSp(int id)
        {
            return await _intrface.GetAllDrSp(id);
        }

        //Get Raw Table Data
        [HttpGet("raw")]
        public async Task<List<Doctor>> GetAllDoctor()
        {
            return await _intrface.GetAllDoctor();
        }

        
        //Add Doctor
        [HttpPost]
        public async Task<ActionResult<int>> AddDoctor([FromBody] AddDoctorView user)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var postId =  await _intrface.AddDoctor(user);
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

        //Update Doctor
        [HttpPut]
        public async Task<IActionResult> UpdDoctor(AddDoctorView usr)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    await _intrface.UpdDoctor(usr);
                    return Ok();
                }
                catch (Exception)
                {
                    return BadRequest();
                }
            }
            return BadRequest();
        }

        //Get Doctor By Id
        [HttpGet("users/{Id}")]
        public async Task<AddDoctorView> GetDoctorDetailsByUserID(int id)
        {
            return await _intrface.GetDoctorDetailsByUserID(id);
        }



    }
}
