using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace BookStore2
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Temporary;
            routes.EnableFriendlyUrls(settings);
            routes.MapPageRoute("Home", "Home", "~/default.aspx");
            routes.MapPageRoute("ObjCRUD", "ObjCrud", "~/ObjectDSCRUD.aspx");
            routes.MapPageRoute("SQLCRUD", "SqlCrud", "~/SqlDS.aspx");
            routes.MapPageRoute("EntityCRUD", "EFCRUD", "~/EntityFrameworkModelCRUD.aspx");
            routes.MapPageRoute("DataView", "DataView", "~/DataViewControl.aspx");
            routes.MapPageRoute("Register", "Register", "~/Registration/Register.aspx");
            routes.MapPageRoute("Login", "Login", "~/Login.aspx");
            routes.MapPageRoute("BookReport", "bookreport", "~/BookReport.aspx");
        }
    }
}
