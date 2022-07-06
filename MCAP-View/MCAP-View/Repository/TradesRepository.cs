using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using dbChange.Models;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Configuration;

namespace dbChange.Repository
{
    public class TradesRepository : ITradesRepository
    {
        private readonly IHubContext<SignalServer> _context;
        string connectionString = "";
        public TradesRepository(IConfiguration configuration,
                                    IHubContext<SignalServer> context)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection");
            _context = context;
        }
        public List<Trades> GetAllTrades(string LoginId)
        {
            var Trades = new List<Trades>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlDependency.Start(connectionString);
                SqlParameter pm = new SqlParameter();
                
                string commandText = "sp_getmcaptrades";
                //string commandText = "select Id, Name, Age from dbo.Employees";
                SqlCommand cmd = new SqlCommand(commandText, conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@LoginId", LoginId));
                SqlDependency dependency = new SqlDependency(cmd);

                dependency.OnChange += new OnChangeEventHandler(dbChangeNotification);

                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var trade = new Trades
                    {

                        Account = reader["Account"].ToString(),
                        AccountName = reader["AccountName"].ToString(),
                        Security = reader["Security"].ToString(),
                        Quantity = Convert.ToInt32(reader["Quantity"]),
                        Price = Convert.ToDecimal(reader["Price"]),
                        TD_MarketValue = Convert.ToDecimal(reader["TD_MarketValue"]),
                        TD_Quantity = Convert.ToInt32(reader["TD_Quantity"]),
                        Dv0 = reader["Dv0"].ToString()
                    };

                    Trades.Add(trade);
                }
            }

            return Trades;
        }
        public List<Trades> GetAllTrades()
        {
            var Trades = new List<Trades>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlDependency.Start(connectionString);
               
                string commandText = "sp_getmcaptrades";
                //string commandText = "select Id, Name, Age from dbo.Employees";
               SqlCommand cmd = new SqlCommand(commandText, conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
              //  cmd.Parameters.Add(new SqlParameter("@LoginId", LoginId));
                SqlDependency dependency = new SqlDependency(cmd);

                dependency.OnChange += new OnChangeEventHandler(dbChangeNotification);

                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var trade = new Trades
                    {

                        Account = reader["Account"].ToString(),
                        AccountName = reader["AccountName"].ToString(),
                        Security = reader["Security"].ToString(),
                        Quantity = Convert.ToInt32(reader["Quantity"]),
                        Price = Convert.ToDecimal(reader["Price"]),
                        TD_MarketValue = Convert.ToDecimal(reader["TD_MarketValue"]),
                        TD_Quantity = Convert.ToInt32(reader["TD_Quantity"]),
                        Dv0 = reader["Dv0"].ToString()
                    };

                    Trades.Add(trade);
                }
            }

            return Trades;
        }
        private void dbChangeNotification(object sender, SqlNotificationEventArgs e)
        {
            _context.Clients.All.SendAsync("refreshTrades");
        }
    }
}