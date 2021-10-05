using BookStore2.DAL;
using BookStore2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore2.Registration
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                AppUser obj = new AppUser();
                obj.UserName = txtUserName.Text;
                obj.Password = txtPassword.Text;
                obj.Email = txtEmail.Text;
                string encryptedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(obj.Password, "SHA1");
                UserGateWay gateObj = new UserGateWay();
                int returnCode = gateObj.SaveUser(obj.UserName, encryptedPass, obj.Email); ;
                if (returnCode == -1)
                {
                    lblMessage.Text = "User Name already exist. Please choose another user name";
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
    }
}