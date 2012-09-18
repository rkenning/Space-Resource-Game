using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
            //Grab connection string from web.config file
            string connStr = ConfigurationManager.ConnectionStrings["DASP"].ConnectionString;
            //Connect to database
            SqlConnection myConnection = new SqlConnection(connStr);
            myConnection.Open();
            //Add SQL string to SQLcommand object
            SqlCommand myCommand = new SqlCommand("exec Test_proc", myConnection);
            //Execute SQL command
            myCommand.ExecuteNonQuery();
    }
}
