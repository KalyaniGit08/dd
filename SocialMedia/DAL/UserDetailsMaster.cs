using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SocialMedia.DAL
{
    public class UserDetailsMaster
    {
        public long id { get; set; }
        public long user_id { get; set; }
        public string username { get; set; }
        public string mobile { get; set; }
        public string birthday { get; set; }
        public string gender { get; set; }
        public string profile { get; set; }
        public string state { get; set; }
        public string country { get; set; }
        public string address { get; set; }
        public bool? isactive { get; set; }
        public long created_by { get; set; }
        public DateTime? created_date { get; set; }

        public void Add()
        {
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"Insert into [UserDetailsMaster]
                            (
                           [user_id] ,
                           [username] ,
                           [mobile],
                           [birthday],
                           [gender] ,
                           [profile] ,
                           [state] ,
                           [country],
                           [address] ,
                           [isactive] ,
                           [created_by] ,
                           [created_date]
                       )
                         values(
                            @user_id ,
                            @username,
                            @mobile,
                            @birthday,
                            @gender,
                            @profile ,
                            @state,
                            @country,
                            @address,
                            @isactive ,
                            @created_by,
                            @created_date
                         ) ";
                
                sql += "Select Scope_Identity()";
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@user_id", SqlDbType.BigInt,8).Value = user_id;
                    cmd.Parameters.Add("@username", SqlDbType.NVarChar, 50).Value = username == null ? (object)DBNull.Value : username;
                    cmd.Parameters.Add("@mobile", SqlDbType.NVarChar, 50).Value = mobile == null ? (object)DBNull.Value : mobile;
                    cmd.Parameters.Add("@birthday", SqlDbType.NVarChar, 50).Value = birthday == null ? (object)DBNull.Value : birthday;
                    cmd.Parameters.Add("@gender", SqlDbType.NVarChar, 50).Value = gender == null ? (object)DBNull.Value : gender;
                    cmd.Parameters.Add("@profile", SqlDbType.NVarChar, 50).Value = profile == null ? (object)DBNull.Value : profile;
                    cmd.Parameters.Add("@state", SqlDbType.NVarChar, 50).Value = state == null ? (object)DBNull.Value : state;
                    cmd.Parameters.Add("@country", SqlDbType.NVarChar, 50).Value = country == null ? (object)DBNull.Value : country;
                    cmd.Parameters.Add("@address", SqlDbType.NVarChar, 50).Value = address == null ? (object)DBNull.Value : address;
                    cmd.Parameters.Add("@isactive", SqlDbType.Bit, 1).Value = isactive;
                    cmd.Parameters.Add("@created_date", SqlDbType.DateTime, 8).Value = created_date == null ? (object)DBNull.Value : created_date;
                    cmd.Parameters.Add("@created_by", SqlDbType.BigInt, 8).Value = created_by ;

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
                string sql = @"Update [UserDetailsMaster]
                            SET 
                             [username]  = @username,
                             [mobile]  = @mobile,
                             [birthday]  = @birthday,
                             [gender]    = @gender,
                             [profile]   = @profile ,
                             [state]    = @state,
                             [country]   = @country,
                             [address]   = @address 
                       where user_id=@user_id ";



                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@user_id", SqlDbType.BigInt, 8).Value = user_id;
                    cmd.Parameters.Add("@username", SqlDbType.NVarChar, 50).Value = username == null ? (object)DBNull.Value : username;
                    cmd.Parameters.Add("@mobile", SqlDbType.NVarChar, 50).Value = mobile == null ? (object)DBNull.Value : mobile;
                    cmd.Parameters.Add("@birthday", SqlDbType.NVarChar, 50).Value = birthday == null ? (object)DBNull.Value : birthday;
                    cmd.Parameters.Add("@gender", SqlDbType.NVarChar, 50).Value = gender == null ? (object)DBNull.Value : gender;
                    cmd.Parameters.Add("@profile", SqlDbType.NVarChar, 50).Value = profile == null ? (object)DBNull.Value : profile;
                    cmd.Parameters.Add("@state", SqlDbType.NVarChar, 50).Value = state == null ? (object)DBNull.Value : state;
                    cmd.Parameters.Add("@country", SqlDbType.NVarChar, 50).Value = country == null ? (object)DBNull.Value : country;
                    cmd.Parameters.Add("@address", SqlDbType.NVarChar, 50).Value = address == null ? (object)DBNull.Value : address;
                    cmd.ExecuteNonQuery();

                }
                conn.Close();
            }
        }

        public static DataTable Getall(long id)
        {
            DataTable dtr = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(con))
            {
                string sql = @"select * from UserDetailsMaster where user_id=@user_id  ;";

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