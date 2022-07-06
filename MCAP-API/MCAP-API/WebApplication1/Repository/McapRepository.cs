using Dapper;
using MCAPAPI.Models;
using MCAPAPI.Persistence;
using static Dapper.SqlMapper;

namespace MCAPAPI.Repository
{
    public class McapRepository : IMcapRepository
    {
        private IBaseRepository _baseRepository { get; set; }
        private IApplicationDbContext _dbContext { get; set; }

        public McapRepository(IBaseRepository baseRepository, IApplicationDbContext dbContext)
        {
            _baseRepository = baseRepository;
            _dbContext = dbContext;
        }


        public async Task<List<Trades>> GetTrades(string LoginId)
        {
            List<Trades> TradesColumns = new List<Trades>();
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@LoginId", LoginId);
            GridReader reader = await _baseRepository.QueryMultipleAsync("sp_getTradesbyLoginId", parameters, commandTimeout: 500);
            TradesColumns = reader.Read<Trades>().AsList();
            return (TradesColumns);
        }
        //public async Task<TradeAdd> AddTrades(string LoginId)
        //{
        //    List<Trades> TradesColumns = new List<Trades>();
        //    TradesColumns = await GetTrades(LoginId);
        //    foreach (Trades td in TradesColumns)
        //    {

        //    }

        //    DynamicParameters parameters = new DynamicParameters();
        //    parameters.Add("@LoginId", LoginId);
        //    GridReader reader = await _baseRepository.QueryMultipleAsync("sp_AddTradesbyLoginId", parameters, commandTimeout: 500);
        //    TradesColumns = reader.Read<Trades>().AsList();
        //    return (TradesColumns);
        //}

    }
}
