using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ResearcherApplication.Startup))]
namespace ResearcherApplication
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
