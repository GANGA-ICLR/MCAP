using MCAPAPI.Persistence;
using MCAPAPI.Repository;
using MediatR;
using System.Reflection;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;

namespace MCAPAPI
{
    public static class PersistenceServiceRegistrationMcap
    {
        public static IServiceCollection AddPersistenceServicesMcap(this IServiceCollection services, string connectionString)
        {
            // DB
            services.AddTransient<IBaseMcapRepository>(r => new BaseMcapRepository(connectionString));
           
            services.AddDbContext<McapApplicationDbContext>(options => options.UseSqlServer(connectionString));
            services.AddScoped<IMcapApplicationDbContext>(provider => provider.GetService<McapApplicationDbContext>());
            services.AddMediatR(Assembly.GetExecutingAssembly());
            services.AddAutoMapper(Assembly.GetExecutingAssembly());
            // Repositories
            services.AddScoped<IMcapDbRepository, McapDbRepository>();
            return services;
        }
    }
}
