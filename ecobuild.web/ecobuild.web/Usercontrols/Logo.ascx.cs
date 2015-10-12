﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;

namespace ecobuild.Usercontrols
{
    public partial class Logo : System.Web.UI.UserControl
    {
        Propertity per = new Propertity();
        Function fun = new Function();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_logo();
            }
        }

        #region Load logo-banner
        protected void load_logo()
        {
            var _logoSlogan = per.Load_logo_and_sologan(2);
            if (_logoSlogan.ToList().Count > 0)
            {
                Rplogo.DataSource = _logoSlogan.Where(n => n.BANNER_FIELD1 == "1");
                Rplogo.DataBind();
            }
        }
        public string Getbanner(object Banner_type, object banner_field, object Banner_ID, object Banner_Image)
        {
            string str = "";
            if (Utils.CIntDef(banner_field) == 1)
            {
                str = fun.Getlogo(Banner_type, banner_field, Banner_ID, Banner_Image, "/");
            }
            return str;
        }
        #endregion
    }
}