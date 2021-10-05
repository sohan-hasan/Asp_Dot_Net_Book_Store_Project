using BookStore2.DAL;
using BookStore2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore2
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                lblLoggedInUser.Text = Session["User"].ToString();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            FormsAuthentication.SignOut();
            Response.Redirect("Login");
        }
        //protected void btnReport_Click(object sender, EventArgs e)
        //{
        //    List<Product1> products = ProductGateWay.GetProductList();
        //    Session["Data"] = products;
        //    Response.Redirect("ReportView.aspx");
        //}

        protected void viewReport_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(
           this.GetType(), "OpenWindow", "window.open('bookreport','_newtab');", true);
        }
    }
}