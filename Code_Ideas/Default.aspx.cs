using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



//Define new data view based on the required Datasource
DataView dvSql = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

//Define the size of array based on the number of records in the recordset
String[] Test = new String[dvSql.Count];
int rec_count = 0;

//Loop through the recordset 
foreach (DataRowView drvSql in dvSql)
{
    rec_count ++;
	//Set array element to the value of the field
	Test[rec_count] = drvSql["Field"].ToString();
}

    }
}
