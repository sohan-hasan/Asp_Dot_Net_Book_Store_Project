using BookStore2.DAL;
using BookStore2.Models;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore2
{
    public partial class BookReport1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = Server.MapPath("/");

            List<Product1> products = ProductGateWay.GetProductListForReport(path);

            Session["Data"] = products;
            //Response.Redirect("ReportViewPage.aspx");
            if (Session["Data"] != null)
            {

                var list = Session["Data"] as List<Product1>;
                CrystalBookReport reportObj = new CrystalBookReport();
                reportObj.SetDataSource(list);
                CrystalReportViewer1.ReportSource = reportObj;
                reportObj.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "User Info");

            }
        }
    }
}