using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.NetworkInformation;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace CRUD
{
    public partial class UserDisplay : System.Web.UI.Page
    {
        private SqlConnection con;
        public void connect()
        {
            String newCon = WebConfigurationManager.ConnectionStrings["webapi_conn"].ToString();
            con = new SqlConnection(newCon);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            connect();
            con.Open();
            if (!IsPostBack)
            {
                displayUser();
            }
        }
        public void displayUser()
        {
            connect();
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbUser", con);
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView.DataSource = dt;
            this.DataBind();
        }
        protected void Create_Click(object sender, EventArgs e)
        {
            connect();
            con.Open();
            SqlCommand cmd = new SqlCommand("addUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName", inputUsername.Value);
            cmd.Parameters.AddWithValue("@UserNo", int.Parse(inputUserNo.Value));

            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                //Response.Write("Successfully adding new data");
                displayUser();
            }
            else
            {
                Response.Write("Error");
            }

            con.Close();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["dt"] as DataTable;
            string userID = "";

            foreach (DictionaryEntry item in e.Values)
            {
                if (item.Key == "UserID")
                {
                    userID = (string)item.Value;
                }
            }

            connect();
            SqlCommand cmd = new SqlCommand("deleteUser", con);
            cmd.CommandType = CommandType.StoredProcedure;   
            //cmd.Parameters.AddWithValue("@Action", "DELETE");
            cmd.Parameters.AddWithValue("@UserID", userID);
            cmd.Connection = con;
            con.Open();

            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                //Response.Write("Successfully deleting selected data");
                displayUser();
            }
            else
            {
                Response.Write("Error");
            }

            con.Close();
            displayUser();

        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView.EditIndex = e.NewEditIndex;
            displayUser();
        }

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            GridView.EditIndex = -1;
            displayUser();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            //GridViewRow row = GridView.Rows[e.RowIndex];
            //int userId = Convert.ToInt32(GridView.DataKeys[e.RowIndex].Values[0]);
            //string username = (row.FindControl("txtUserName") as TextBox).Text;
            //int userNo = Convert.ToInt32(row.FindControl("txtUserNo") as TextBox);

            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["dt"] as DataTable;
            string userID = "";
            string userName = "";
            string userNo = "";


            foreach (DictionaryEntry item in e.NewValues)
            {
                if (item.Key == "UserID")
                {
                    userID = (string)item.Value;
                }
                if (item.Key == "UserName")
                {
                    userName = (string)item.Value;
                }
                if (item.Key == "UserNo")
                {
                    userNo = (string)item.Value;
                }
            }

            //GridViewRow row = GridView.Rows[e.RowIndex];
            //int userID = Convert.ToInt32(GridView.DataKeys[e.RowIndex].Values[0]);
            //TextBox userName = GridView.Rows[e.RowIndex].FindControl("txtUserName") as TextBox;
            //TextBox userNo = GridView.Rows[e.RowIndex].FindControl("txtUserNo") as TextBox;

            connect();
            SqlCommand cmd = new SqlCommand("updateUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", userID);
            cmd.Parameters.AddWithValue("@UserName", userName);
            cmd.Parameters.AddWithValue("@UserNo", Convert.ToInt32(userNo));
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            displayUser();
            GridView.EditIndex = -1;
            displayUser();
        }
    }
}