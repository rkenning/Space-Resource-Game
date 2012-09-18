<%@ Page Title="" Language="C#" MasterPageFile="~/User_Interface/MasterPage.master" AutoEventWireup="true" CodeFile="view_Planets.aspx.cs" Inherits="User_Interface_Wiew_Planets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Planet_view_Styles.css" rel="stylesheet" type="text/css" />



    <style type="text/css">
        .style1
        {
            width: 127px;
        }
        .style2
        {
            width: 105px;
        }
        </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class=PlanetGrid>
        Planet ID :
        <asp:Label ID="lab_planet_id" runat="server" Text=""></asp:Label>
    </div>

    <div class="Planet_Detail">

    
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataSourceID="SqlDataSource2" Height="140px" Width="219px" 
            DataKeyNames="Planet_Id">
            <Fields>
                <asp:BoundField DataField="Planet_Id" HeaderText="Planet_Id" 
                    SortExpression="Planet_Id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Planet_Name" HeaderText="Planet_Name" 
                    SortExpression="Planet_Name" />
                <asp:BoundField DataField="Loc_Quad" HeaderText="Loc_Quad" 
                    SortExpression="Loc_Quad" />
                <asp:BoundField DataField="Loc_Zone" HeaderText="Loc_Zone" 
                    SortExpression="Loc_Zone" />
                <asp:BoundField DataField="Loc_X" HeaderText="Loc_X" 
                    SortExpression="Loc_X" />
                <asp:BoundField DataField="Loc_Y" HeaderText="Loc_Y" 
                    SortExpression="Loc_Y" />
                <asp:BoundField DataField="Population" HeaderText="Population" 
                    SortExpression="Population" />
                <asp:BoundField DataField="Planet_Size" HeaderText="Planet_Size" 
                    SortExpression="Planet_Size" />
            </Fields>
            <HeaderTemplate>
                Planet Details
            </HeaderTemplate>
        </asp:DetailsView>
    
    </div>
    
    <div class="Planet_Buildings">
        <asp:GridView ID="GrdBuildings" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource3" AllowSorting="True" Height="102px" 
            DataKeyNames="Building_Ref_Id" onselectedindexchanged="Building_Pop_Allocation">
            <Columns>
                
                <asp:BoundField DataField="Building_Name" HeaderText="Building_Name" 
                    SortExpression="Building_Name" />
                <asp:BoundField DataField="Quantity_Of_Buildings" 
                    HeaderText="Quantity_Of_Buildings" SortExpression="Quantity_Of_Buildings" />
                <asp:BoundField DataField="Building_Size" HeaderText="Building_Size" 
                    SortExpression="Building_Size" />
                <asp:BoundField DataField="Population_Allocation" 
                    HeaderText="Population_Allocation" 
                    SortExpression="Population_Allocation" />
                <asp:BoundField DataField="Current_Population_Qty" 
                    HeaderText="Current_Population_Qty" SortExpression="Current_Population_Qty" />
                <asp:CommandField SelectText="Allocate Population" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>

    </div>
    
    <!-----------------------------
    -- Building population panel
    ------------------------------>
    
    <asp:Panel ID="pnl_building_details" runat="server" 
    CssClass="BuildingDetails">
        <p>
            <table style="width:100%;">
                <tr>
                    <td class="style2">
                        Building</td>
                    <td class="style1">
                        <asp:Label ID="lab_building" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Total Avaiable Population</td>
                    <td class="style1">
                        <asp:Label ID="lab_pop_left" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label1" runat="server" Text="Population Allocation"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="txtAlocPop" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="labMes" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style1">
                        <asp:Button ID="Button3" runat="server" Text="Close" />
                        <asp:Button ID="Button2" runat="server" Text="Allocate" 
                            onclick="Button2_Click" />
                    </td>
                    <td>
                      
                    </td>
                </tr>
            </table>
        </p>
    </asp:Panel>
    
<!-------------------------------
-- Planet Job Queue
------------------------------->  
<div class="Planet_Build_Que">
     <p>Planet Job Summary</p>
     <div class="Planet_Build_Que_Scroll">
     <asp:GridView ID="grdJobQue" runat="server" AutoGenerateColumns="False" 
         DataSourceID="SqlBuildQueDetails">
         <Columns>
             <asp:BoundField DataField="Building_Name" HeaderText="Building_Name" 
                 SortExpression="Building_Name" />
             <asp:BoundField DataField="Resource_Curr_Qty" HeaderText="Resource_Curr_Qty" 
                 SortExpression="Resource_Curr_Qty" />
             <asp:BoundField DataField="Pop_Curr_Qty" HeaderText="Pop_Curr_Qty" 
                 SortExpression="Pop_Curr_Qty" />
             <asp:BoundField DataField="Build_Resource_Qty_Requirement" 
                 HeaderText="Build Rec Qty" 
                 SortExpression="Build_Resource_Qty_Requirement" />
             <asp:BoundField DataField="Build_Pop_Requirement" 
                 HeaderText="Build Pop Rec" SortExpression="Build_Pop_Requirement" />
         </Columns>
    </asp:GridView>
     
    </div>
    <asp:Button ID="butJobAdd" runat="server" Text="Add Job" 
         onclick="butJobAdd_Click" />
    </div>    
   

<!-------------------------------
-- Planet Add Job Queue Panel
------------------------------->  
    <asp:Panel ID="PanAddJob" runat="server" CssClass="AddJobDetails">
        <table style="width: 100%; height: 88px; max-height: 40px;">
            <tr>
                <td>
                    <p>Select Building</p>
                </td>
                <td>
                    <asp:DropDownList ID="DDBuilding" runat="server" 
                        DataSourceID="SqlBuildingTypes" DataTextField="Building_Name" 
                        DataValueField="Building_Id" Height="30px" Width="170px">
                    </asp:DropDownList>
                </td>

            </tr>
            <tr>
                <td>
                   <p>Qty to Build</p>
                </td>
                <td>
                    <asp:TextBox ID="txtBuildingQty" runat="server" Width="144px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="But_add_Job" runat="server" Text="Add Job" 
                        onclick="But_add_Job_Click" />
                    <asp:Button ID="Button4" runat="server" Text="Close" 
                        onclick="But_add_Job_Click" />
                </td>
            </tr>
        </table>

    </asp:Panel>

<!-------------------------------- 
Datasources
  ---------------------------------->
  <div class="Datasource">
      <asp:SqlDataSource ID="SqlBuildingTypes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DASP %>" 
            SelectCommand="SELECT [Building_Id], [Building_Name], [Building_Size] FROM [Gm_Building_Types]">
          </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlBuildQueDetails" runat="server" 
         ConnectionString="<%$ ConnectionStrings:DASP %>" 
         
          SelectCommand="SELECT Gm_Planet_Building_Que.Planet_Id, Gm_Planet_Building_Que.Resource_Curr_Qty, Gm_Planet_Building_Que.Pop_Curr_Qty, Gm_Building_Types.Building_Name, Gm_Building_Types.Build_Resource_Qty_Requirement, Gm_Building_Types.Build_Pop_Requirement FROM Gm_Building_Types INNER JOIN Gm_Planet_Building_Que ON Gm_Building_Types.Building_Id = Gm_Planet_Building_Que.Building_Id WHERE (Gm_Planet_Building_Que.Planet_Id = @Planet_Id)" 
          
          InsertCommand="INSERT INTO Gm_Planet_Building_Que(User_Id, Planet_Id, Building_Id) VALUES ( @User , @Planet, @Building_id)" 
          oninserting="Job_Insert">
         <SelectParameters>
             <asp:QueryStringParameter Name="Planet_Id" QueryStringField="PlanetId" />
         </SelectParameters>
          <InsertParameters>
              <asp:Parameter Name="User" />
              <asp:Parameter Name="Planet" />
              <asp:Parameter Name="Building_id" />
          </InsertParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlPop" runat="server"
                            ConnectionString="<%$ ConnectionStrings:DASP %>" 
                            SelectCommand="SELECT Population - (SELECT SUM(Population_Allocation) AS Expr1 FROM Gm_Planet_Buildings AS a WHERE (Planet_Id = Planet_Id)) AS pop_left FROM Gm_Planet_Details WHERE (Planet_Id = @Planet_id)" 
                            UpdateCommand="UPDATE Gm_Planet_Buildings SET Population_Allocation = @POP WHERE (Building_Ref_Id = @BUILD)" 
                            onupdating="Pop_Upd">
                            <SelectParameters>
                              <asp:QueryStringParameter DefaultValue="1" Name="Planet_Id" 
                    QueryStringField="Planet_Id" Type="Decimal" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="GrdBuildings" Name="BUILD" 
                                PropertyName="SelectedValue" />
                                <asp:Parameter Name="POP" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlBuildDetails" runat="server"
                            ConnectionString="<%$ ConnectionStrings:DASP %>"                             
                            
                            SelectCommand="SELECT Gm_Planet_Buildings.Building_Ref_Id, Gm_Planet_Buildings.Population_Allocation, Gm_Building_Types.Building_Name FROM Gm_Planet_Buildings INNER JOIN Gm_Building_Types ON Gm_Planet_Buildings.Building_Type_Id = Gm_Building_Types.Building_Id WHERE (Gm_Planet_Buildings.Building_Ref_Id = @Building_Ref_Id)" >
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GrdBuildings" Name="Building_Ref_Id" 
                                    PropertyName="SelectedValue" Type="Decimal" />
                            </SelectParameters>
                        </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DASP %>" 
            
            SelectCommand="SELECT Gm_Building_Types.Building_Name, Gm_Building_Types.Building_Size, Gm_Building_Types.Resource_Type, Gm_Planet_Buildings.Population_Allocation, Gm_Planet_Buildings.Current_Population_Qty, Gm_Planet_Buildings.Planet_Id, Gm_Planet_Buildings.Building_Ref_Id, Gm_Planet_Buildings.Quantity_Of_Buildings FROM Gm_Building_Types INNER JOIN Gm_Planet_Buildings ON Gm_Building_Types.Building_Id = Gm_Planet_Buildings.Building_Type_Id WHERE (Gm_Planet_Buildings.Planet_Id = @Planet_Id)" 
            
            
            
            UpdateCommand="UPDATE Gm_Planet_Buildings SET Planet_Id =, Building_Ref_Id =, Population_Allocation =">
            <SelectParameters>
                   <asp:QueryStringParameter DefaultValue="1" Name="Planet_Id" 
                    QueryStringField="PlanetId" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DASP %>" 
            SelectCommand="SELECT * FROM [Gm_Planet_Details] WHERE ([Planet_Id] = @Planet_Id)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="" Name="Planet_Id" 
                    QueryStringField="PlanetId" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>