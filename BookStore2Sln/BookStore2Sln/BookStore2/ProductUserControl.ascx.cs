using BookStore2.DAL;
using BookStore2.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore2
{
    public partial class ProductUserControl : System.Web.UI.UserControl
    {
        public string opType = "EF";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
                LaodDdlGenre();
                LoadDdlAuthor();
                LoadDdlPublisher();
            }
            ShowImage();
        }

        private void LoadDdlAuthor()
        {
            DataTable dt = ProductGateWay.GetAuthor();

            DataRow dr = dt.NewRow();
            dr.ItemArray = new object[] { 0, "-Select-" };
            dt.Rows.InsertAt(dr, 0);

            ddlAuthor.DataSource = dt;
            ddlAuthor.DataTextField = dt.Columns["authorName"].ToString();
            ddlAuthor.DataValueField = dt.Columns["authorId"].ToString();
            ddlAuthor.DataBind();
        }
        private void LoadDdlPublisher()
        {
            DataTable dt = ProductGateWay.GetPublisher();

            DataRow dr = dt.NewRow();
            dr.ItemArray = new object[] { 0, "-Select-" };
            dt.Rows.InsertAt(dr, 0);

            ddlPublisher.DataSource = dt;
            ddlPublisher.DataTextField = dt.Columns["publisherName"].ToString();
            ddlPublisher.DataValueField = dt.Columns["publisherId"].ToString();
            ddlPublisher.DataBind();
        }

        private void ShowImage()
        {
            if (FileUpload1.HasFile)
            {
                string imageName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                HiddenImageName.Value = imageName;
                string filePath = "Images/" + imageName;
                HiddenImageUrl.Value = filePath;
                FileUpload1.SaveAs(Server.MapPath(filePath));
                Image1.ImageUrl = filePath;
            }
        }

        private void LaodDdlGenre()
        {
            DataTable dt = ProductGateWay.GetGenre();

            DataRow dr = dt.NewRow();
            dr.ItemArray = new object[] { 0, "-Select-" };
            dt.Rows.InsertAt(dr, 0);

            ddlGenre.DataSource = dt;
            ddlGenre.DataTextField = dt.Columns["genreName"].ToString();
            ddlGenre.DataValueField = dt.Columns["genreId"].ToString();
            ddlGenre.DataBind();
        }

        

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            { Calendar1.Visible = false; }
            else { Calendar1.Visible = true; }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendar1.SelectedDate.ToShortDateString();
            Calendar1.Visible = false;
        }


        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            bool IsCap = args.Value.All(char.IsUpper);
            if (IsCap)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void btnGenreSave_Click(object sender, EventArgs e)
        {
            
            if (Page.IsValid)
            {
                Genre obj = new Genre();
                obj.GenreName = txtGenre.Text;
                ProductGateWay.SaveGenre(obj.GenreName);
                txtGenre.Text = "";

                LaodDdlGenre();
            }

        }

        protected void btnAuthor_Click(object sender, EventArgs e)
        {
            Author obj = new Author();
            obj.AuthorName = txtAuthor.Text;
            ProductGateWay.SaveAuthor(obj.AuthorName);
            txtAuthor.Text = "";
            LoadDdlAuthor();
        }

        protected void btnPublisher_Click(object sender, EventArgs e)
        {
            Publisher obj = new Publisher();
            obj.PublisherName = txtPublisher.Text;
            ProductGateWay.SavePublisher(obj.PublisherName);
            txtPublisher.Text = "";
            LoadDdlPublisher();
        }

        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Product1 obj = new Product1();
                obj.BookName = txtBookName.Text;
                obj.PurchaseDate = Convert.ToDateTime(txtDate.Text);
                obj.VendorEmail = txtEmail.Text;
                obj.VendorAge = Convert.ToInt32(txtAge.Text);
                obj.ImageName = HiddenImageName.Value;
                obj.ImageUrl = HiddenImageUrl.Value;
                obj.GenreId = Convert.ToInt32(ddlGenre.SelectedValue);
                obj.AuthorId = Convert.ToInt32(ddlAuthor.SelectedValue);
                obj.PublisherId = Convert.ToInt32(ddlPublisher.SelectedValue);
                obj.Price = Convert.ToDecimal(txtPrice.Text);
                if (opType == "ObjDS")
                {
                    ProductGateWay.SaveProduct(obj.BookName, obj.PurchaseDate, obj.VendorEmail, obj.VendorAge, obj.ImageName, obj.ImageUrl, obj.Price, obj.GenreId, obj.AuthorId, obj.PublisherId);
                    Response.Redirect("ObjCrud");
                }
                else if (opType=="EF")
                {
                    Product obj1 = new Product();
                    obj1.BookName = txtBookName.Text;
                    obj1.PurchaseDate = Convert.ToDateTime(txtDate.Text);
                    obj1.VendorEmail = txtEmail.Text;
                    obj1.VendorAge = Convert.ToInt32(txtAge.Text);
                    obj1.ImageName = HiddenImageName.Value;
                    obj1.ImageUrl = HiddenImageUrl.Value;
                    obj1.GenreId = Convert.ToInt32(ddlGenre.SelectedValue);
                    obj1.AuthorId = Convert.ToInt32(ddlAuthor.SelectedValue);
                    obj1.PublisherId = Convert.ToInt32(ddlPublisher.SelectedValue);
                    obj1.Price = Convert.ToDecimal(txtPrice.Text);
                    ProductEFGateWay efObj = new ProductEFGateWay();
                    efObj.InsertProduct(obj1);
                    Response.Redirect("EFCRUD");
                }
               
                else 
                {
                    Session["Product"] = obj;
                    Response.Redirect("SqlCrud");
                }
            }
        }

        
    }
}