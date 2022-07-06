using Dapper;
using MCAPAPI.Models;
using MCAPAPI.Persistence;
using static Dapper.SqlMapper;

namespace MCAPAPI.Repository
{
    public class McapDbRepository :IMcapDbRepository
    {
        private IBaseMcapRepository _baseMcapRepository { get; set; }
        private IBaseRepository _baseRepository { get; set; }
        private IMcapApplicationDbContext _dbMcapContext { get; set; }

        private IApplicationDbContext _dbContext { get; set; }
        public McapDbRepository(IBaseMcapRepository baseMcapRepository, IMcapApplicationDbContext dbMcapContext, IBaseRepository baseRepository, IApplicationDbContext dbContext)
        {
            _baseMcapRepository = baseMcapRepository;
            _dbContext = dbContext;
            _baseRepository = baseRepository;
            _dbMcapContext = dbMcapContext;

        }



        public async Task<int> AddTrades(string LoginId)
        {
            List<Trades> TradesColumns = new List<Trades>();
            McapRepository mcapRepository = new McapRepository(_baseRepository, _dbContext);

            TradesColumns = await mcapRepository.GetTrades(LoginId);
            foreach (Trades td in TradesColumns)
            {
                decimal mktval = (Convert.ToDecimal(td.price) * Convert.ToDecimal(td.qty));

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@Account", td.acct_no);
                parameters.Add("@AccountName", td.contra_code);
                parameters.Add("@Security", td.symbol); 
                parameters.Add("@Price", td.price);
                parameters.Add("@Quantity", td.qty);
                parameters.Add("@TD_MarketValue", mktval.ToString());
                parameters.Add("@TD_Quantity", td.qty);
                parameters.Add("@Dv0", "Dv0");
                parameters.Add("@LoginId", LoginId);
                GridReader reader = await _baseMcapRepository.QueryMultipleAsync("sp_AddTradesbyLoginId", parameters, commandTimeout: 500);
               // TradesColumns = reader.Read<Trades>().AsList();
            }

            return 0;
        }

    }
}
