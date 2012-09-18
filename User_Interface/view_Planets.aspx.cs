using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class User_Interface_Wiew_Planets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Hide the paneels
        pnl_building_details.Visible = false;
        PanAddJob.Visible = false;

        String Poo = Request.QueryString["PlanetId"];
        
        if (Poo != null)
        {
            lab_planet_id.Text = Poo;
            //GrdPlanets.SelectedIndex = Convert.ToInt16(Poo);
            //GrdPlanets_SelectedIndexChanged(null, null);
        }

    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlPop.Update();
        GrdBuildings.DataBind();

    }
    protected void Building_Pop_Allocation(object sender, EventArgs e)
    {
        pnl_building_details.Visible = true;

        // Find remaining population and display it in the population window
        DataView dvSql = (DataView)SqlPop.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView drvSql in dvSql)
        {
            lab_pop_left.Text = drvSql["Pop_Left"].ToString();
        }

        //Get the current population allocated qty
        dvSql = (DataView)SqlBuildDetails.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView drvSql in dvSql)
        {
        txtAlocPop.Text = drvSql["Population_Allocation"].ToString();
        //Get the Building_Name
        lab_building.Text = drvSql["Building_Name"].ToString();
        }

        

        //Close the dataset
        dvSql.Dispose();
    }
    protected void Pop_Upd(object sender, SqlDataSourceCommandEventArgs e)
    {
        // -----------  Update the population for buildings ----------
        
        //Allocate the new poplation to the building
        e.Command.Parameters[1].Value = Convert.ToInt32(txtAlocPop.Text);
        //e.Command.Parameters["POP"].Value = txtAlocPop.ToString();
        
        
    }
    protected void butJobAdd_Click(object sender, EventArgs e)
    {
        PanAddJob.Visible = true;
    }

    protected void Job_Insert(object sender, SqlDataSourceCommandEventArgs e)
    {
        // -----------  Insert details for a new Job ----------

        //Allocate the new poplation to the building
        e.Command.Parameters[1].Value = Convert.ToInt32(lab_building.Text);
        e.Command.Parameters[2].Value = Convert.ToInt32(lab_pop_left.Text);
        e.Command.Parameters[3].Value = Convert.ToInt32(txtAlocPop.Text);
    }


    protected void But_add_Job_Click(object sender, EventArgs e)
    {
        //Add the buid request to the jobs
        SqlBuildQueDetails.Insert();
        grdJobQue.DataBind();
    }


}
