using BookStore2.DAL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore2
{
    public partial class ObjectDSCRUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductUserControl.opType = "ObjDS";
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int bookId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            FileUpload up = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
            string imageName = ProductGateWay.ImageName(bookId);
            DeleteExistingImage(imageName);
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
            ProductGateWay.UpdateImageById(newImageName, fileUrl, bookId, genreId, authorId, publisherId);
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
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int bookId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string imagename = ProductGateWay.ImageName(bookId);
            DeleteExistingImage(imagename);
        }

        
    }
}