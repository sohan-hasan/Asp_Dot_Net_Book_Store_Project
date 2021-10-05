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
    public partial class SqlDS_aspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductUserControl.opType = "SQLDS";
            if (Session["Product"] != null)
            {
                Product1 obj = (Product1)Session["Product"];
                InsertProduct(obj);
                Session["Product"] = null;
            }
        }
        private void InsertProduct(Product1 obj)
        {
            SqlDataSource1.InsertParameters["BookName"].DefaultValue = obj.BookName;
            SqlDataSource1.InsertParameters["PurchaseDate"].DefaultValue = obj.PurchaseDate.ToShortDateString();
            SqlDataSource1.InsertParameters["VendorEmail"].DefaultValue = obj.VendorEmail;
            SqlDataSource1.InsertParameters["VendorAge"].DefaultValue = obj.VendorAge.ToString();
            SqlDataSource1.InsertParameters["ImageName"].DefaultValue = obj.ImageName;
            SqlDataSource1.InsertParameters["ImageUrl"].DefaultValue = obj.ImageUrl;
            SqlDataSource1.InsertParameters["GenreId"].DefaultValue = obj.GenreId.ToString();
            SqlDataSource1.InsertParameters["AuthorId"].DefaultValue = obj.AuthorId.ToString();
            SqlDataSource1.InsertParameters["PublisherId"].DefaultValue = obj.PublisherId.ToString();
            SqlDataSource1.InsertParameters["Price"].DefaultValue = obj.Price.ToString();
            SqlDataSource1.Insert();
        }
        private void DeleteExistingImage(string imagename)
        {
            string path = Server.MapPath("Images/" + imagename);
            FileInfo fileObj = new FileInfo(path);
            if (fileObj.Exists)
            {
                fileObj.Delete();
            }
        }
        

        

        

        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            int bookId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string imagename = ProductGateWay.ImageName(bookId);
            DeleteExistingImage(imagename);
        }

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            int bookId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            FileUpload up = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
            string imagename = ProductGateWay.ImageName(bookId);
            DeleteExistingImage(imagename);
            string fileUrl = "Images/";
            string newImageName = "";
            if (up.HasFile)
            {
                newImageName = up.FileName;
                fileUrl += newImageName;
                up.SaveAs(Server.MapPath(fileUrl));
            }
            DropDownList dlGen = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlGenre");
            DropDownList dlAuth = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlAuthor");
            DropDownList dlPub = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlPublisher");
            int genreId = Convert.ToInt32(dlGen.SelectedValue);
            int authorId = Convert.ToInt32(dlAuth.SelectedValue);
            int publisherId = Convert.ToInt32(dlPub.SelectedValue);
            TextBox txt = GridView1.Rows[e.RowIndex].FindControl("TextBox5") as TextBox;
            txt.Text = newImageName;
            string bookName = (GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox).Text;
            string purchaseDate = (GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox).Text;
            string vendorEmail = (GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox).Text;
            string vendorAge = (GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox).Text;
            string price = (GridView1.Rows[e.RowIndex].FindControl("TextBox10") as TextBox).Text;
            UpdateSql(newImageName, fileUrl, bookId, genreId, authorId, publisherId, bookName, purchaseDate, vendorEmail, vendorAge, price);
        }
        private void UpdateSql(string newImageName, string fileUrl, int bookId, int genreId, int authorId, int publisherId, string bookName, string purchaseDate, string vendorEmail, string vendorAge, string price)
        {
            SqlDataSource1.UpdateCommand = "Update [Product] set BookName='" + bookName + "', PurchaseDate='" + purchaseDate + "', VendorEmail='" + vendorEmail + "', VendorAge='" + vendorAge + "',ImageName='" + newImageName + "', ImageUrl='" + fileUrl + "', GenreId='" + genreId + "', AuthorId='" + authorId + "',PublisherId='" + publisherId + "',Price='" + price + "' where BookId='" + bookId + "'";
            int affraw_update = SqlDataSource1.Update();
            SqlDataSource1.Dispose();
        }
    }
}