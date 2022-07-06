using MCAPAPI.Models;

namespace MCAPAPI.Persistence
{
    public interface IMcapDbRepository
    {
        
        Task<int> AddTrades(string LoginId);
    }
}

