using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System.Data;

namespace MCAPAPI.Persistence
{
   
        public interface IApplicationDbContext
        {
            public IDbConnection Connection { get; }
            DatabaseFacade Database { get; }
           // public DbSet<FootNote926> Footnote926 { get; set; }
            Task<int> SaveChangesAsync(CancellationToken cancellationToken);
        }
    
}
