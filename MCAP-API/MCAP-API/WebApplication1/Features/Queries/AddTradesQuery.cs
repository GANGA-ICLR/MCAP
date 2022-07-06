using MCAPAPI.Models;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace MCAPAPI.Features.Queries
{
    public class AddTradesQuery : IRequest<int>
    {
        public string  LoginId { get; set; }
 
    }
    
}
