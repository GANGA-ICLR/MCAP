using MCAPAPI.Models;
using MediatR;
using MCAPAPI.Repository;
using MCAPAPI.Persistence;

namespace MCAPAPI.Features.Queries
{
    public class GetTradesQueryHandler : IRequestHandler<GetTradesQuery, List<Trades>>
    {
        private readonly IMcapRepository _mCapRepository;

        public GetTradesQueryHandler(IMcapRepository mCapRepository)
        {
            _mCapRepository = mCapRepository;

        }

        public async Task<List<Trades>> Handle(GetTradesQuery request, CancellationToken cancellationToken)
        {
            return await _mCapRepository.GetTrades(request.LoginId);

             
        }


    }
}
