using Dapper;
using System.Data;
using static Dapper.SqlMapper;

namespace MCAPAPI.Persistence
{
    public interface IBaseRepository
    {
        public string ConnectionString {get;set;}
        public Task<IEnumerable<T>> QueryAsync<T>(string sql, DynamicParameters param = null, IDbTransaction transaction = null,
           CancellationToken cancellationToken = default, int? commandTimeout = null, CommandType commandType = CommandType.StoredProcedure);

        public Task<T> QueryFirstOrDefaultAsync<T>(string sql, DynamicParameters param = null, IDbTransaction transaction = null,
            CancellationToken cancellationToken = default, int? commandTimeout = null, CommandType commandType = CommandType.StoredProcedure);

        public Task<GridReader> QueryMultipleAsync(string sql, DynamicParameters param = null, IDbTransaction transaction = null,
            CancellationToken cancellationToken = default, int? commandTimeout = null, CommandType commandType = CommandType.StoredProcedure);
        public Task<int> ExecuteAsync(string sql, DynamicParameters param = null, IDbTransaction transaction = null,
            CancellationToken cancellationToken = default, int? commandTimeout = null, CommandType commandType = CommandType.StoredProcedure);
    }
}
