using System.Collections.Generic;
using dbChange.Models;

namespace dbChange.Repository
{
    public interface ITradesRepository
    {
        List<Trades> GetAllTrades(string LoginId);
        List<Trades> GetAllTrades();
    }
}