using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BookStore2.DAL
{
    public class UserGateWay
    {
        public int SaveUser(string UserName, string Password, string Email)
        {
            int returnCode = 0;
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spRegisterUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter username = new SqlParameter("@UserName", UserName);
                SqlParameter passWord = new SqlParameter("@Password", Password);
                SqlParameter emailAddress = new SqlParameter("@Email", Email);
                cmd.Parameters.Add(username);
                cmd.Parameters.Add(passWord);
                cmd.Parameters.Add(emailAddress);
                con.Open();
                returnCode = (int)cmd.ExecuteScalar();
            }
            return returnCode;
        }
        public int AuthenticateUser(string userName, string password)
        {
            int authenticated = 0;
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAuthenticateUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter username = new SqlParameter("@UserName", userName);
                SqlParameter passWord = new SqlParameter("@Password", password);

                cmd.Parameters.Add(username);
                cmd.Parameters.Add(passWord);

                con.Open();
                authenticated = (int)cmd.ExecuteScalar();
            }
            return authenticated;
        }
    }
}