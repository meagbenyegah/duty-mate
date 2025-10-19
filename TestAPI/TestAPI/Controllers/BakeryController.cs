using Microsoft.AspNetCore.Mvc;

namespace TestAPI.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class BakeryController : Controller
    {
        [HttpPost("tea-bread")]
        public string TeaBread() {

            return "TeaBread!!";
        
        }
    }
}
