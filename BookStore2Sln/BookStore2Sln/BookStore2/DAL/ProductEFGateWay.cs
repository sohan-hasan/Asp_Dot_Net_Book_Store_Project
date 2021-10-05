using BookStore2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore2.DAL
{
    public class ProductEFGateWay
    {
        BookStoreDBEntities db = new BookStoreDBEntities();
        public IQueryable<Product> GetProductList()
        {
            return from prod in db.Products select prod;
        }
        public Product GetProduct(int id)
        {
            Product prod = db.Products.FirstOrDefault(p => p.BookId == id);
            return prod;
        }
        public void InsertProduct(Product obj)
        {
            db.Products.Add(obj);
            db.SaveChanges();
        }
        public int UpdateProduct(Product upObj)
        {
            int count = 0;
            Product obj = GetProduct(upObj.BookId);
            obj.BookName = upObj.BookName;
            obj.PurchaseDate = upObj.PurchaseDate;
            obj.VendorEmail = upObj.VendorEmail;
            obj.VendorAge = upObj.VendorAge;
            obj.ImageName = upObj.ImageName;
            obj.ImageUrl = upObj.ImageUrl;
           
            obj.Price = upObj.Price;
            count = db.SaveChanges();
            return count;
        }
        public int DeleteProduct(int id)
        {
            int count = 0;
            Product deleteProduct = GetProduct(id);
            db.Products.Remove(deleteProduct);
            count = db.SaveChanges();
            return count;
        }
    }
}