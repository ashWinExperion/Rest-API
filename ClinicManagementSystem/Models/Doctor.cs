﻿using System;
using System.Collections.Generic;

namespace ClinicManagementSystem.Models
{
    public partial class Doctor
    {
        public int DoctorId { get; set; }
        public int? SpecializationId { get; set; }
        public int? UserId { get; set; }

        public virtual Specialization Specialization { get; set; }
        public virtual Users User { get; set; }
    }
}
