using Dapper;
using MCAPAPI.Persistence;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Threading.Tasks;
using static Dapper.SqlMapper;
namespace MCAPAPI.Repository
{
    public class BaseRepository : IBaseRepository, IDisposable
    {
        public string ConnectionString { get; set; }
        private SqlConnection _connection { get; set; }

        public BaseRepository(string connectionString)
        {
            this.ConnectionString = connectionString;
            _connection = new SqlConnection(ConnectionString);
        }

        public async Task<IEnumerable<T>> QueryAsync<T>(string sql, DynamicParameters param = null, IDbTransaction transaction = null,
            CancellationToken cancellationToken = default, int? commandTimeout = null, CommandType commandType = CommandType.StoredProcedure)
        {
            return await _connection.QueryAsync<T>(sql, param, transaction, commandType: commandType);
        }

        public async Task<T> QueryFirstOrDefaultAsync<T>(string sql, DynamicParameters param = null, IDbTransaction transaction = null,
            CancellationToken cancellationToken = default, int? commandTimeout = null, CommandType commandType = CommandType.StoredProcedure)
        {
            return await _connection.QueryFirstOrDefaultAsync<T>(sql, param, transaction, commandTimeout, commandType);
        }

        public async Task<GridReader> QueryMultipleAsync(string sql, DynamicParameters param = null, IDbTransaction transaction = null,
            CancellationToken cancellationToken = default, int? commandTimeout = null, CommandType commandType = CommandType.StoredProcedure)
        {
            return await _connection.QueryMultipleAsync(sql, param, transaction, commandTimeout, commandType);
        }

        public async Task<int> ExecuteAsync(string sql, DynamicParameters param = null, IDbTransaction transaction = null,
            CancellationToken cancellationToken = default, int? commandTimeout = null, CommandType commandType = CommandType.StoredProcedure)
        {
            return await _connection.ExecuteAsync(sql, param, transaction, commandType: commandType, commandTimeout: 500);

        }

        public void Dispose()
        {
            _connection.Dispose();
        }
    }
}
