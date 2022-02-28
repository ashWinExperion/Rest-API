using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ClinicManagementSystem.ViewModel
{
    public class AddDoctorView
    {
        public int Status { get; set; }
        public int DoctorId { get; set; }
        public int UserId { get; set; }
        public string City { get; set; }
        public DateTime UserDob { get; set; }
        public DateTime JoinDate { get; set; }
        [Required(ErrorMessage ="First Name is a mandatory field")]
        [RegularExpression("[a-zA-Z ]*", ErrorMessage = "Not A Valid Name")]
        public string FirstName { get; set; }
        public string Gender { get; set; }
        public string LastName { get; set; }
        [Required(ErrorMessage = "Password is a mandatory field")]
        public string Password { get; set; }
        [Required(ErrorMessage = "Username is a mandatory field")]
        public string UserName { get; set; }
        public string Phone { get; set; }
        [Required]
        public int Specialization { get; set; }
        public string State { get; set; }

        public int RoleId { get; set; }


    }
}
