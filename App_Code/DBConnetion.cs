using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for DBConnetion
/// </summary>
public class DBConnetion

       
{
	public DBConnetion()
	{
        //Grab connection string from web.config file
        string connStr = ConfigurationManager.ConnectionStrings["Local_TheGame"].ConnectionString;
        //Connect to database
        SqlConnection myConnection = new SqlConnection(connStr);
        myConnection.Open();
        
        //
		// TODO: Add constructor logic here
		//
	}
}
