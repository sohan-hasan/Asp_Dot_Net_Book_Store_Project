using BookStore2.DAL;
using BookStore2.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore2
{
    public partial class EntityFrameworkModelCRUD : System.Web.UI.Page
    {
        ProductEFGateWay dbObj = new ProductEFGateWay();
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductUserControl.opType = "EF";
            if (!IsPostBack)
            {
                LoadEFGridView();
            }
        }

        private void LoadEFGridView()
        {
            List<Product> data = dbObj.GetProductList().ToList();
            if (data.Count>0)
            {
                GridViewEF.DataSource = data;
            }
            else
            {
                GridViewEF.DataSource = null;
            }
            GridViewEF.DataBind();
        }

        protected void GridViewEF_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridViewEF.DataKeys[e.RowIndex].Value);
            string ImageName = ProductGateWay.ImageName(id);
            DeleteExistingImage(ImageName);
            dbObj.DeleteProduct(id);
            LoadEFGridView();
        }

        private void DeleteExistingImage(string imageName)
        {
            string path = Server.MapPath("Image/"+ imageName);
            FileInfo fileObj = new FileInfo(path);
            if (fileObj.Exists)
            {
                fileObj.Delete();
            }
        }

        protected void GridViewEF_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewEF.EditIndex = e.NewEditIndex;
            LoadEFGridView();
        }

        protected void GridViewEF_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridViewEF.DataKeys[e.RowIndex].Value);
            FileUpload up = (FileUpload)GridViewEF.Rows[e.RowIndex].FindControl("FileUpload1");
            string imageName = ProductGateWay.ImageName(id);
            DeleteExistingImage(imageName);
            string fileUrl = "Images/";
            string newImageName = "";
            if (up.HasFile)
            {
                newImageName = up.FileName;
                fileUrl += newImageName;
                up.SaveAs(Server.MapPath(fileUrl));
            }
            
            Product obj = new Product();
            obj.BookId = id;
            obj.BookName = e.NewValues["BookName"].ToString();
            obj.PurchaseDate = Convert.ToDateTime(e.NewValues["PurchaseDate"].ToString());
            obj.VendorEmail = e.NewValues["VendorEmail"].ToString();
            obj.VendorAge = Convert.ToInt32(e.NewValues["VendorAge"].ToString());
            obj.ImageName = newImageName;
            obj.ImageUrl = fileUrl;            
            obj.Price = Convert.ToDecimal(e.NewValues["Price"].ToString());
            dbObj.UpdateProduct(obj);
            GridViewEF.EditIndex = -1;
            LoadEFGridView();
            
        }

        protected void GridViewEF_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewEF.EditIndex = -1;
            LoadEFGridView();
        }

        protected void GridViewEF_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewEF.PageIndex = e.NewPageIndex;
            LoadEFGridView();
        }
    }
}