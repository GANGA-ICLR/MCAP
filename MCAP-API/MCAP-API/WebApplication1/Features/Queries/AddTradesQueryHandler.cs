using MCAPAPI.Models;
using MediatR;
using MCAPAPI.Repository;
using MCAPAPI.Persistence;

namespace MCAPAPI.Features.Queries
{
    public class AddTradesQueryHandler : IRequestHandler<AddTradesQuery, int>
    {
        private readonly IMcapDbRepository _mCapDbRepository;

        public AddTradesQueryHandler(IMcapDbRepository mCapRepository)
        {
            _mCapDbRepository = mCapRepository;

        }

        public async Task<int> Handle(AddTradesQuery request, CancellationToken cancellationToken)
        {
            return await _mCapDbRepository.AddTrades(request.LoginId);

             
        }


    }
}
