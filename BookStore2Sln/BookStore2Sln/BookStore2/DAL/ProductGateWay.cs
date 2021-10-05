using BookStore2.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BookStore2.DAL
{
    public class ProductGateWay
    {
        public static List<Product1> GetProductList()
        {
            List<Product1> list = new List<Product1>();
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT BookId,BookName,PurchaseDate,VendorEmail, VendorAge, ImageName, ImageUrl, p.GenreId, p.AuthorId, p.PublisherId, Price, g.GenreName, a.AuthorName, pb.PublisherName" +
                    " FROM Product p join Genre g on p.GenreId=g.GenreId join Author a on p.AuthorId=a.AuthorId join Publisher pb on p.PublisherId=pb.PublisherId";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Product1 obj = new Product1();
                    obj.BookId = Convert.ToInt32(rdr["BookId"]);
                    obj.BookName = rdr["BookName"].ToString();
                    obj.PurchaseDate = Convert.ToDateTime(rdr["PurchaseDate"].ToString());
                    obj.VendorEmail = rdr["VendorEmail"].ToString();
                    obj.VendorAge = Convert.ToInt32(rdr["VendorAge"].ToString());
                    obj.ImageName = rdr["ImageName"].ToString();
                    obj.ImageUrl = rdr["ImageUrl"].ToString();
                    obj.Price = Convert.ToDecimal(rdr["Price"].ToString());
                    obj.GenreId = Convert.ToInt32(rdr["GenreId"]);
                    obj.GenreName = rdr["GenreName"].ToString();
                    obj.AuthorId = Convert.ToInt32(rdr["AuthorId"]);
                    obj.AuthorName = rdr["AuthorName"].ToString();
                    obj.PublisherId = Convert.ToInt32(rdr["PublisherId"]);
                    obj.PublisherName = rdr["PublisherName"].ToString();
                    list.Add(obj);
                }
                return list;
            }
        }
        public static void SaveProduct(string BookName, DateTime PurchaseDate,
            string VendorEmail, int VendorAge, string ImageName, string ImageUrl, decimal Price, int GenreId, int AuthorId, int PublisherId)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Product (BookName,PurchaseDate,VendorEmail,VendorAge,ImageName,ImageUrl, Price, GenreId, AuthorId, PublisherId) " +
                    "VALUES(@BookName,@PurchaseDate,@VendorEmail,@VendorAge,@ImageName,@ImageUrl, @Price, @GenreId, @AuthorId, @PublisherId)";
                cmd.Parameters.AddWithValue("@BookName", BookName);
                cmd.Parameters.AddWithValue("@PurchaseDate", PurchaseDate);
                cmd.Parameters.AddWithValue("@VendorEmail", VendorEmail);
                cmd.Parameters.AddWithValue("@VendorAge", VendorAge);
                cmd.Parameters.AddWithValue("@ImageName", ImageName);
                cmd.Parameters.AddWithValue("@ImageUrl", ImageUrl);
                cmd.Parameters.AddWithValue("@Price", Price);
                cmd.Parameters.AddWithValue("@GenreId", GenreId);
                cmd.Parameters.AddWithValue("@AuthorId", AuthorId);
                cmd.Parameters.AddWithValue("@PublisherId", PublisherId);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public static void UpdateProduct(string BookName, DateTime PurchaseDate,
            string VendorEmail, int VendorAge, string ImageName, string ImageUrl, decimal Price, int GenreId, int AuthorId, int PublisherId, int BookId)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "UPDATE Product Set BookName=@BookName, PurchaseDate=@PurchaseDate, VendorEmail=@VendorEmail, VendorAge=@VendorAge,  Price=@Price, GenreId=@GenreId, AuthorId=@AuthorId, PublisherId=@PublisherId WHERE BookId=@BookId";
                cmd.Parameters.AddWithValue("@BookName", BookName);
                cmd.Parameters.AddWithValue("@PurchaseDate", PurchaseDate);
                cmd.Parameters.AddWithValue("@VendorEmail", VendorEmail);
                cmd.Parameters.AddWithValue("@VendorAge", VendorAge);

                cmd.Parameters.AddWithValue("@Price", Price);
                cmd.Parameters.AddWithValue("@GenreId", GenreId);
                cmd.Parameters.AddWithValue("@AuthorId", AuthorId);
                cmd.Parameters.AddWithValue("@PublisherId", PublisherId);
                cmd.Parameters.AddWithValue("@BookId", BookId);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static void DeleteProduct(int BookId)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "DELETE FROM  Product WHERE BookId=@BookId";
                cmd.Parameters.AddWithValue("@BookId", BookId);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static string ImageName(int BookId)
        {
            string imageName = "";
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT ImageName FROM Product WHERE BookId=@BookId";
                cmd.Parameters.AddWithValue("@BookId", BookId);
                con.Open();
                imageName = cmd.ExecuteScalar().ToString();
            }
            return imageName;
        }
        public static void UpdateImageById(string ImageName, string ImageUrl, int BookId, int GenreId, int AuthorId, int PublisherId)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "UPDATE Product Set ImageName=@ImageName, ImageUrl=@ImageUrl, GenreId=@GenreId, AuthorId=@AuthorId, PublisherId=@PublisherId WHERE BookId=@BookId";
                cmd.Parameters.AddWithValue("@ImageName", ImageName);
                cmd.Parameters.AddWithValue("@ImageUrl", ImageUrl);
                cmd.Parameters.AddWithValue("@GenreId", GenreId);
                cmd.Parameters.AddWithValue("@AuthorId", AuthorId);
                cmd.Parameters.AddWithValue("@PublisherId", PublisherId);
                cmd.Parameters.AddWithValue("@BookId", BookId);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static DataTable GetGenre()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM Genre";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                dt.Load(rdr, LoadOption.Upsert);
            }
            return dt;
        }
        public static DataTable GetAuthor()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM Author";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                dt.Load(rdr, LoadOption.Upsert);
            }
            return dt;
        }
        public static DataTable GetPublisher()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM Publisher";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                dt.Load(rdr, LoadOption.Upsert);
            }
            return dt;
        }

        public static void SaveGenre(string GenreName)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Genre (GenreName) VALUES(@GenreName)";
                cmd.Parameters.AddWithValue("@GenreName", GenreName);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static void SaveAuthor(string AuthorName)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Author (AuthorName) VALUES(@AuthorName)";
                cmd.Parameters.AddWithValue("@AuthorName", AuthorName);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static void SavePublisher(string PublisherName)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Publisher (PublisherName) VALUES(@PublisherName)";
                cmd.Parameters.AddWithValue("@PublisherName", PublisherName);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static List<Product1> GetProductListForReport(string path)
        {
            List<Product1> list = new List<Product1>();
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT BookId,BookName,PurchaseDate,VendorEmail, VendorAge, ImageName, ImageUrl, p.GenreId, p.AuthorId, p.PublisherId, Price, g.GenreName, a.AuthorName, pb.PublisherName" +
                    " FROM Product p join Genre g on p.GenreId=g.GenreId join Author a on p.AuthorId=a.AuthorId join Publisher pb on p.PublisherId=pb.PublisherId";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Product1 obj = new Product1();
                    obj.BookId = Convert.ToInt32(rdr["BookId"]);
                    obj.BookName = rdr["BookName"].ToString();
                    obj.PurchaseDate = Convert.ToDateTime(rdr["PurchaseDate"].ToString());
                    obj.VendorEmail = rdr["VendorEmail"].ToString();
                    obj.VendorAge = Convert.ToInt32(rdr["VendorAge"].ToString());
                    obj.ImageName = rdr["ImageName"].ToString();
                    obj.ImageUrl =path + rdr["ImageUrl"].ToString();
                    obj.Price = Convert.ToDecimal(rdr["Price"].ToString());
                    obj.GenreId = Convert.ToInt32(rdr["GenreId"]);
                    obj.GenreName = rdr["GenreName"].ToString();
                    obj.AuthorId = Convert.ToInt32(rdr["AuthorId"]);
                    obj.AuthorName = rdr["AuthorName"].ToString();
                    obj.PublisherId = Convert.ToInt32(rdr["PublisherId"]);
                    obj.PublisherName = rdr["PublisherName"].ToString();
                    list.Add(obj);
                }
                return list;
            }
        }
    }
}