using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SocialMedia.DAL
{
    public class PostMaster
    {
        public long post_id { get; set; }
        public string image_url { get; set; }
        public string post_text { get; set; }
        public string location { get; set; }
        public long? user_id { get; set; }
        public bool isactive { get; set; }
        public DateTime? created_date { get; set; }
        public long? created_by { get; set; }

        

        public void Add()
        {
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"Insert into [PostMaster]
                            (
                            [image_url],
                            [post_text],
                            [location],
                            [user_id],
                            [isactive],
                            [created_date],
                            [created_by]
                            )
                            values(
                            @image_url,
                            @post_text,
                            @location,
                            @user_id,
                            @isactive,
                            @created_date,
                            @created_by
                            )";

                sql += "Select Scope_Identity()";
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@image_url", SqlDbType.NVarChar, 50).Value = image_url == null ? (object)DBNull.Value : image_url;
                    cmd.Parameters.Add("@post_text", SqlDbType.NVarChar, 50).Value = post_text == null ? (object)DBNull.Value : post_text;
                    cmd.Parameters.Add("@location", SqlDbType.NVarChar, 50).Value = location == null ? (object)DBNull.Value : location;
                    cmd.Parameters.Add("@user_id", SqlDbType.BigInt, 1).Value = user_id;
                    cmd.Parameters.Add("@isactive", SqlDbType.Bit, 1).Value = isactive;
                    cmd.Parameters.Add("@created_date", SqlDbType.DateTime, 8).Value = created_date == null ? (object)DBNull.Value : created_date;
                    cmd.Parameters.Add("@created_by", SqlDbType.BigInt, 8).Value = created_by == null ? (object)DBNull.Value : created_by;

                    post_id = Convert.ToInt32(cmd.ExecuteScalar());
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
                string sql = @"SELECT top 5 * ,
                              (SELECT COUNT(user_like)
                               FROM LikeCommentMaster A
                               WHERE status =  'like' 
                                 AND A.post_id = Posts.post_id) as LikeCNT
                           FROM PostMaster Posts
                           left join UserDetailsMaster USERS
                           on Posts.user_id = USERS.user_id
                           ORDER BY post_id DESC";
            
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                  //  cmd.Parameters.Add("@user_id", SqlDbType.BigInt, 8).Value = id;
                    using (SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        dtr.Load(dr);
                    }
                }
                conn.Close();
            }
            return dtr;
        }

        public static DataTable GetPostList(long id)
        {
            DataTable dtr = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"SELECT * from PostMaster where user_id=@user_id ";

                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                      cmd.Parameters.Add("@user_id", SqlDbType.BigInt, 8).Value = id;
                    using (SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        dtr.Load(dr);
                    }
                }
                conn.Close();
            }
            return dtr;
        }

        public static DataTable GetCount(long id)
        {
            DataTable dtr = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"select distinct
post_count =(select count(user_id)  from PostMaster where user_id=@user_id),
friend =(select count(senderid) from RequestMaster where status='confirm' and senderid=@user_id )
from PostMaster";

                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@user_id", SqlDbType.BigInt, 8).Value = id;
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