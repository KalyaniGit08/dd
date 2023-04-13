using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SocialMedia.DAL
{
    public class RequestMaster
    {
        public long id { get; set; }
        public long senderid { get; set; }
        public long recieverid { get; set; }
        public string status { get; set; }
        public bool isactive { get; set; }
        public DateTime? created_date { get; set; }
        public long? created_by { get; set; }



        public void Add()
        {
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"Insert into [RequestMaster]
                            (
                            [senderid],
                            [recieverid],
                            [status],
                            [isactive],
                            [created_date],
                            [created_by]
                            )
                            values(
                            @senderid,
                            @recieverid,
                            @status,
                            @isactive,
                            @created_date,
                            @created_by
                            )";

                sql += "Select Scope_Identity()";
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@senderid", SqlDbType.NVarChar, 50).Value = senderid ;
                    cmd.Parameters.Add("@recieverid", SqlDbType.NVarChar, 50).Value = recieverid;
                    cmd.Parameters.Add("@status", SqlDbType.NVarChar, 50).Value = status == null ? (object)DBNull.Value : status;
                    cmd.Parameters.Add("@isactive", SqlDbType.Bit, 1).Value = isactive;
                    cmd.Parameters.Add("@created_date", SqlDbType.DateTime, 8).Value = created_date == null ? (object)DBNull.Value : created_date;
                    cmd.Parameters.Add("@created_by", SqlDbType.BigInt, 8).Value = created_by == null ? (object)DBNull.Value : created_by;

                    id = Convert.ToInt32(cmd.ExecuteScalar());
                }
                conn.Close();
            }
        }

        public bool Update()
        {
            bool result = true;
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"Update [RequestMaster]
                            SET 
                            [status] = @status
                           where [id]=@id";



                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@id", SqlDbType.BigInt, 8).Value = id ;

                    cmd.Parameters.Add("@status", SqlDbType.NVarChar, 50).Value = status == null ? (object)DBNull.Value : status;
                    result = Convert.ToBoolean( cmd.ExecuteNonQuery());

                }
                conn.Close();
                return result;
            }
        }
        public static DataTable Getall(long id)
        {
            DataTable dtr = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"select * ,
                              profile = (select profile from UserDetailsMaster where user_id=um.id)
                               from UserRegMaster as um
                               left join RequestMaster as rm  
                               on rm.senderid = um.id
                               where rm.recieverid = @recieverid and status = 'Request Send';";

                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@recieverid", SqlDbType.BigInt, 8).Value = id;
                    using (SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        dtr.Load(dr);
                    }
                }
                conn.Close();
            }
            return dtr;
        }

        public static DataTable GetFriendList(long id)
        {
            DataTable dtr = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"select um.username , ud.user_id , ud.profile , rm.status , rm.isactive
                               from UserRegMaster as um
                               left join RequestMaster as rm  
                               on rm.recieverid = um.id
                               left join UserDetailsMaster as ud
                               on um.id = ud.id
                               where rm.senderid = @senderid and status = 'Confirm';";

                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@senderid", SqlDbType.BigInt, 8).Value = id;
                    using (SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        dtr.Load(dr);
                    }
                }
                conn.Close();
            }
            return dtr;
        }

        public static DataTable GetFollwingList(long id)
        {
            DataTable dtr = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"Select *
                               from UserRegMaster as um
                               left join UserDetailsMaster as ud
                               on um.id = ud.user_id
                               left join RequestMaster as rm 
                               on rm.recieverid =um.id
                               where rm.status = 'Request Send' and rm.senderid =@senderid ;";

                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@senderid", SqlDbType.BigInt, 8).Value = id;
                    using (SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        dtr.Load(dr);
                    }
                }
                conn.Close();
            }
            return dtr;
        }

        public static DataTable GetallId(long id)
        {
            DataTable dtr = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"Select *
                               from UserRegMaster as um
                               left join UserDetailsMaster as ud
                               on um.id = ud.user_id
			                  
                               where um.id != @id ;";

                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@id", SqlDbType.BigInt, 8).Value = id;
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