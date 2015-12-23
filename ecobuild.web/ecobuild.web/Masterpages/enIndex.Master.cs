using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;

namespace ecobuild.Masterpages
{
    public partial class enIndex : System.Web.UI.MasterPage
    {
        Config cf = new Config();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ViewFirst"] == null)
            {
                Session["ViewFirst"] = true;
                Response.Redirect("/introl.html");
            }
        }
        public static string setbackgroup()
        {
            var _configs = new Config().Config_meta();

            if (_configs != null && _configs.ToList().Count > 0 && !string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FIELD1))
            {
                return "background: url(" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FIELD1 + ") center center;";
            }
            return "background: url(/Resources/images/bg-default.jpg) center center;";
        }
    }
}