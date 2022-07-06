using MCAPAPI.Persistence;
using MCAPAPI.Repository;
using MediatR;
using System.Reflection;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;

namespace MCAPAPI
{
    public static class PersistenceServiceRegistration
    {
        public static IServiceCollection AddPersistenceServices(this IServiceCollection services, string connectionString)
        {
            // DB
            services.AddTransient<IBaseRepository>(r => new BaseRepository(connectionString));
            services.AddDbContext<ApplicationDbContext>(options => options.UseSqlServer(connectionString));
            services.AddScoped<IApplicationDbContext>(provider => provider.GetService<ApplicationDbContext>());
            //services.AddDbContext<McapApplicationDbContext>(options => options.UseSqlServer(connectionString));
           // services.AddScoped<IMcapApplicationDbContext>(provider => provider.GetService<McapApplicationDbContext>());
            services.AddMediatR(Assembly.GetExecutingAssembly());
            services.AddAutoMapper(Assembly.GetExecutingAssembly());
            // Repositories
            services.AddScoped<IMcapRepository, McapRepository>();
            return services;
        }
    }
}
