using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using NSwag.Annotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.IO;
using System.Threading;
using MCAPAPI.Models;
using MCAPAPI.Features.Queries;

namespace MCAPAPI.Controllers
{
    [Route("api/MCAP/[controller]")]
    [ApiController]
    public class TradesController : ControllerBase
    {

        private readonly IMediator _mediator;
        private readonly ILogger<TradesController> _logger;
        
        public TradesController(IMediator mediator, ILogger<TradesController> logger)
        {
            _mediator = mediator;
            _logger = logger;
            
        }


        [HttpGet]
        [Route("GetTrades")]
        [SwaggerResponse(typeof(List<Trades>))]
        public async Task<IActionResult> GetTrades(string LoginId)
        {

            _logger.LogDebug($"Started GetTrades. LoginId: {LoginId}", HttpContext.TraceIdentifier);
            GetTradesQuery getTradesQuery = new GetTradesQuery() { LoginId = LoginId };
            var result = await _mediator.Send(getTradesQuery);
            return Ok(result);
        }
        [HttpGet]
        [Route("AddTrades")]
        [SwaggerResponse(typeof(int))]
        public async Task<int> AddTrades(string LoginId)
        {

            _logger.LogDebug($"Started AddTrades. LoginId: {LoginId}", HttpContext.TraceIdentifier);
            AddTradesQuery addTradesQuery = new AddTradesQuery() { LoginId = LoginId };
            var result = await _mediator.Send(addTradesQuery);
            return result;
        }
    }
}
