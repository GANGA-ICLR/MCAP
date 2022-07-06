
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.FeatureManagement;
using Microsoft.IdentityModel.Tokens;
using NSwag;
using NSwag.AspNetCore;

using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
namespace MCAPAPI
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;

        }

        public IConfiguration Configuration { get; }


        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddControllersWithViews();
            services.AddRazorPages();
            services.AddControllers();


          
            services.AddFeatureManagement();

            services.AddSwaggerDocument(config =>
            {
                config.PostProcess = document =>
                {
                    document.Info.Version = "0.1.0";
                    document.Info.Title = "MCAP";
                    document.Info.Description = "MCAP Web API";
                };

            });

            var allowedHosts = Configuration.GetSection("AllowedHosts").Get<string[]>();

            //TODO
            //services.AddCors(options =>
            //{
            //    options.AddPolicy("_AllowSpecificOrigins",
            //    builder =>
            //    {
            //        builder.WithOrigins(allowedHosts)
            //        .AllowAnyMethod()
            //        .AllowAnyHeader();
            //    });
            //});
            services.AddCors(c =>
            {
                c.AddPolicy("AllowOrigin", options => options.AllowAnyOrigin());
            });

            //services.AddApplicationServices();
            services.AddPersistenceServices(Configuration.GetConnectionString("DefaultConnection"));
            services.AddPersistenceServicesMcap(Configuration.GetConnectionString("MCAPDbConnection"));
            // Config._ConnectionString = Configuration.GetConnectionString("DefaultConnection");

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            //app.UseCustomExceptionHandler();

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseOpenApi();
            app.UseSwaggerUi3();

            app.UseAuthentication();

            app.UseCors("_AllowSpecificOrigins");

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}


