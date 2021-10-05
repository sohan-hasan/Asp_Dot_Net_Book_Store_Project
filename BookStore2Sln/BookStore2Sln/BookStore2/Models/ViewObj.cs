using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore2.Models
{
    public class ViewObj
    {
        public int BookId { get; set; }
        public string BookName { get; set; }
        public DateTime PurchaseDate { get; set; }
        public string VendorEmail { get; set; }
        public int VendorAge { get; set; }
        public string ImageName { get; set; }
        public string ImageUrl { get; set; }
        public int GenreId { get; set; }
        public int AuthorId { get; set; }
        public int PublisherId { get; set; }
        public decimal Price { get; set; }
        public string GenreName { get; set; }       
        public string AuthorName { get; set; }   
        public string PublisherName { get; set; }
    }
}