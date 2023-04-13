using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SocialMedia.DAL
{
    public class UserRegMaster
    {
        public long id { get; set; }
        public string username { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public bool isactive { get; set; }
        public DateTime? created_date { get; set; }
        public long? created_by { get; set; }


        public void Add()
        {
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"Insert into [UserRegMaster]
                            (
                            [username],
                            [email],
                            [password],
                            [isactive],
                            [created_date],
                            [created_by]
                            )
                            values(
                            @username,
                            @email,
                            @password,
                            @isactive,
                            @created_date,
                            @created_by
                            )";

                sql += "Select Scope_Identity()";
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@username", SqlDbType.NVarChar, 50).Value = username == null ? (object)DBNull.Value : username;
                    cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email == null ? (object)DBNull.Value : email;
                    cmd.Parameters.Add("@password", SqlDbType.NVarChar, 50).Value = password == null ? (object)DBNull.Value : password;
                    cmd.Parameters.Add("@isactive", SqlDbType.Bit,1).Value = isactive;
                    cmd.Parameters.Add("@created_date", SqlDbType.DateTime, 8).Value = created_date == null ? (object)DBNull.Value : created_date;
                    cmd.Parameters.Add("@created_by", SqlDbType.BigInt, 8).Value = created_by == null ? (object)DBNull.Value : created_by;

                    id = Convert.ToInt32(cmd.ExecuteScalar());
                }
                conn.Close();
            }
        }

        public void Update()
        {
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"Update [UserRegMaster]
                            SET 
                            [username] = @username,
                            [email]= @email,
                            [password]= @password";



                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@username", SqlDbType.NVarChar, 50).Value = username == null ? (object)DBNull.Value : username;
                    cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email == null ? (object)DBNull.Value : email;
                    cmd.Parameters.Add("@password", SqlDbType.NVarChar, 50).Value = password == null ? (object)DBNull.Value : password;
                    cmd.ExecuteNonQuery();

                }
                conn.Close();
            }
        }

        public static UserRegMaster Get(string email, string password)
        {
            UserRegMaster rg = new UserRegMaster();
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"Select [id],
                                      [username],
                                      [email],
                                      [password]
                               From [UserRegMaster]
                                Where [email]=@email and [password]=@password;";

                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email;
                    cmd.Parameters.Add("@password", SqlDbType.NVarChar, 50).Value = password;
                    using (SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        if (dr.Read())
                        {
                            rg.id = Convert.ToInt32(dr["id"]);
                            rg.username = dr["username"] == DBNull.Value ? null : dr["username"].ToString();
                            rg.email = dr["email"] == DBNull.Value ? null : dr["email"].ToString();
                            rg.password = dr["password"] == DBNull.Value ? null : dr["password"].ToString();
                        }
                    }
                }
                conn.Close();
            }
            return rg;
        }
        public static DataTable Getall()
        {
            DataTable dtr = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"Select * from [UserRegMaster] ;";

                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        dtr.Load(dr);
                    }
                }
                conn.Close();
            }
            return dtr;
        }
   
     
        public static void Delete(long id)
        {
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"Delete from [UserRegMaster] where [id]=@id;";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@id", SqlDbType.Int, 4).Value = id;
                    cmd.ExecuteNonQuery();
                }
            }

        }
    }
}