using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BookStore2.Models
{
    public class Product1
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
        [NotMapped]
        public string GenreName { get; set; }
        [NotMapped]        
        public string AuthorName { get; set; }
        [NotMapped]
        public string PublisherName { get; set; }
    }
}