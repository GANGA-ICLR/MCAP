using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using dbChange.Models;
using dbChange.Repository;

namespace dbChange.Controllers
{
    public class HomeController : Controller
    {
        private readonly ITradesRepository _repository;

        public HomeController(ITradesRepository repository)
        {
            _repository = repository;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
       
        public IActionResult GetTrades(string LoginId){
            return Ok(_repository.GetAllTrades(LoginId));
        }
        [HttpGet]
        
        public IActionResult GetAllTrades()
        {
            return Ok(_repository.GetAllTrades());
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
