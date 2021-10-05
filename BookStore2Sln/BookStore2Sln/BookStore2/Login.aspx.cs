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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            int authenticated = 0;
            AppUser obj = new AppUser();
            obj.UserName = txtUserName.Text;
            obj.Password = txtPassword.Text;
            string encryptedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(obj.Password, "SHA1");
            UserGateWay getObj = new UserGateWay();
            authenticated = getObj.AuthenticateUser(obj.UserName, encryptedPass);
            if (authenticated == 1)
            {
                FormsAuthentication.RedirectFromLoginPage(obj.UserName, chkBoxRememberMe.Checked);
                Session["User"] = obj.UserName;
                //Response.Redirect("Home");
                
            }
            else
            {
                lblMessage.Text = "Invalid UserName and/or Password";
            }
        }
    }
}