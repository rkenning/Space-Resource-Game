using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;


public partial class User_Interface_Space_Maps : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Draw_Map();
    }

    void Draw_Map()
    {
        int row = 0;
        int numrows = 31;
        int numcells = 31;

        String[,] mapcords = new String[numrows,numcells];
        

        int array_counter_x=0;
        int array_counter_y = 0;

        Color poo1 = Color.FromName("Linen");
        Color poo2 = Color.FromName("Linen");
        Color poo3 = Color.FromName("SpringGreen");
        Color Gray = Color.FromName("Gray");
        Color blue = Color.FromName("Blue");
        Color black = Color.FromName("Black");
        

        // Grab the map localtion details for the current zone
        DataView dvSql = (DataView)SqlMap.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView drvSql in dvSql)
        {

            array_counter_x = Convert.ToInt32(drvSql["Loc_X"].ToString());
            array_counter_y = Convert.ToInt32(drvSql["Loc_Y"].ToString());
            mapcords[array_counter_x,array_counter_y] = "1";
            

            
        }

        
        for (int i = 0; i < numrows; i++)
        {
            TableRow r = new TableRow();
            row++;
            for (int j = 0; j < numcells; j++)
            {
                TableCell c = new TableCell();
                //Set the default back colour
                //Add first colume for numbers
                c.BackColor = black;
                c.BorderColor = Gray;
                if (i==0)
                {
                    
                    c.BackColor = poo1;
                    if (j!=0) 
                        c.Controls.Add(new LiteralControl(j.ToString("00")));
                    
                }
                else if (j == 0)
                {
                    
                    c.BackColor = poo2;
                    if (i!=0)
                        c.Controls.Add(new LiteralControl(i.ToString("00")));
                    
                }

                else if (mapcords[j,i] == "1") 
                {
                    // It's a planet to display an image button with the planet
                    c.HorizontalAlign = HorizontalAlign.Center;                    
                    c.ToolTip = "Plannet";
                    ImageButton ryan = new ImageButton();
                    ryan.ImageUrl= "Planet.gif";
                    c.Controls.Add(ryan);

                    String Cords = DropDownList1.SelectedValue+
                        j.ToString("00") + i.ToString("00");
                    
                    ryan.CommandArgument = Cords;

                    ryan.Click += new ImageClickEventHandler(Map_Click);

                    
                        
                    
                }
                else
                    c.Controls.Add(new LiteralControl("&nbsp"));
                    r.Cells.Add(c);
            }
            tab_Map.Rows.Add(r);
            tab_Map.Visible = true;
        }

    }

    void Map_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgBtn = (ImageButton)sender;
        labPlanet.Text = imgBtn.CommandArgument.ToString();
    }


    protected void PlanetLink_Click(object sender, EventArgs e)
    {

        LinkButton transfer = (LinkButton)sender;
        string url;
        url = "view_Planets.aspx?PlanetId=" + transfer.CommandArgument.ToString();
        Response.Redirect(url);
    }
}
