using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EmailService;
using ClinicManagementSystem.ViewModel;

namespace ClinicManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SendMail : ControllerBase
    {
        private readonly IEmailSender _emailSender;

        public SendMail(IEmailSender emailSender)
        {
            _emailSender = emailSender;
        }

        [HttpPost("stringHtml")]
        public void SendGetMsg([FromBody] htmlMessageFromAngular msg)
        {
            var rng = new Random();
            var strMsg = msg.msgString;
            var mailId = msg.email;
            var message = new Message(new string[] { mailId }, "Test email async", strMsg, null);
            _emailSender.SendEmailAsync(message);


         
        }

        [HttpPost]
        public async Task  Post()
        {
            var rng = new Random();

            var files = Request.Form.Files.Any() ? Request.Form.Files : new FormFileCollection();

            var message = new Message(new string[] { "vinimadhu113@gmail.com" }, "Test mail with Attachments", "This is the content from our mail with attachments.", files);
            await _emailSender.SendEmailAsync(message);

        
        }
    }
}