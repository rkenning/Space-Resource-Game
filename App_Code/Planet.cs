using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Planet
/// </summary>
public class Planet
{
	int location_Quad = 0;
    int location_zone = 0;
    int location_x = 0;
    int location_y = 0;

    public Planet (int user_id, int planet_id)
	{
        // Connect to the database
        //Grab connection string from web.config file
        string connStr = ConfigurationManager.ConnectionStrings["Local_TheGame"].ConnectionString;
        //Connect to database
        SqlConnection myConnection = new SqlConnection(connStr);
        myConnection.Open();

        
        // Grab planet details based on the user_id and planet_id
        


	}


}
