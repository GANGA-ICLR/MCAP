using MCAPAPI.Models;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace MCAPAPI.Features.Queries
{
    public class GetTradesQuery : IRequest<List<Trades>>
    {
        public string  LoginId { get; set; }
 
    }
    
}
