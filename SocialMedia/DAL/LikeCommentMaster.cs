using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SocialMedia.DAL
{
    public class LikeCommentMaster
    {
        public long  id { get; set; }
        public long post_id { get; set; }
        public bool user_like { get; set; }
        public string comment { get; set; }
        public long given_by { get; set; }
        public string status { get; set; }
        public bool isactive { get; set; }
        public long created_by { get; set; }
        public DateTime? created_date { get; set; }


        public void Add()
        {
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"Insert into [LikeCommentMaster]
                            (
                            [post_id],
                            [user_like],
                            [comment],
                            [given_by],
                            [status],
                            [isactive],
                            [created_date],
                            [created_by]
                            )
                            values(
                            @post_id,
                            @user_like,
                            @comment,
                            @given_by,
                            @status,
                            @isactive,
                            @created_date,
                            @created_by
                            )";

                sql += "Select Scope_Identity()";
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@post_id", SqlDbType.BigInt,8).Value = post_id;
                    cmd.Parameters.Add("@user_like", SqlDbType.Bit, 1).Value = user_like ;
                    cmd.Parameters.Add("@comment", SqlDbType.NVarChar, 50).Value = comment == null ? (object)DBNull.Value : comment;
                    cmd.Parameters.Add("@given_by", SqlDbType.BigInt, 1).Value = given_by;
                    cmd.Parameters.Add("@status", SqlDbType.NVarChar, 60).Value = status == null ? (object)DBNull.Value : status;
                    cmd.Parameters.Add("@isactive", SqlDbType.Bit, 1).Value = isactive;
                    cmd.Parameters.Add("@created_date", SqlDbType.DateTime, 8).Value = created_date == null ? (object)DBNull.Value : created_date;
                    cmd.Parameters.Add("@created_by", SqlDbType.BigInt, 8).Value = created_by == null ? (object)DBNull.Value : created_by;

                    id = Convert.ToInt32(cmd.ExecuteScalar());
                }
                conn.Close();
            }
        }

        public static DataTable Getall()
        {
            DataTable dtr = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"Select * from [LikeCommentMaster] ;";
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
        public static DataTable GetLikeCount()
        {
            DataTable dtr = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"select  count(user_like) from  LikeCommentMaster  group by post_id;";
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
    }
}