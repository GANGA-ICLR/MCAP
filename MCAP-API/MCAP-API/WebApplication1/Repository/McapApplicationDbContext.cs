using MCAPAPI.Persistence;
using Microsoft.EntityFrameworkCore;

using System.Data;
namespace MCAPAPI.Repository
{
    public partial class McapApplicationDbContext : DbContext, IMcapApplicationDbContext
    {
        public McapApplicationDbContext(DbContextOptions<McapApplicationDbContext> options) : base(options)
        {
        }

        public IDbConnection Connection => Database.GetDbConnection();
       


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
           

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
