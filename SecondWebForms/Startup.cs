using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SecondWebForms.Startup))]
namespace SecondWebForms
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            //ConfigureAuth(app);
        }
    }
}
