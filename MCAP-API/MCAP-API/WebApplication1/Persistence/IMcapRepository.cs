using MCAPAPI.Models;

namespace MCAPAPI.Persistence
{
    public interface IMcapRepository
    {
        Task<List<Trades>> GetTrades(string LoginId);
        //Task<TradeAdd> AddTrades(string LoginId);
    }
}

