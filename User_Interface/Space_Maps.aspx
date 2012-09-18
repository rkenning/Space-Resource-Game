<%@ Page Title="" Language="C#" MasterPageFile="~/User_Interface/MasterPage.master" AutoEventWireup="true" CodeFile="Space_Maps.aspx.cs" Inherits="User_Interface_Space_Maps" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlMap" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DASP %>" 
        SelectCommand="SELECT * FROM [qry_Map] WHERE ([Loc_Zone] = @Loc_Zone)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Loc_Zone" 
                PropertyName="SelectedValue" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
        
    <asp:SqlDataSource ID="SQLZones" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DASP %>" 
        SelectCommand="SELECT DISTINCT Loc_Zone FROM qry_Map"></asp:SqlDataSource>

         
         <div class=MapMain> 
        <p>Zone Selection : <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SQLZones" 
                 DataTextField="Loc_Zone" DataValueField="Loc_Zone" AutoPostBack="True" 
                Height="20px" Width="145px">
            <asp:ListItem Value="1" Selected="True">Zone 1</asp:ListItem>
            <asp:ListItem Value="2">Zone 2</asp:ListItem>
         </asp:DropDownList></p>

         <asp:Table ID="tab_Map" runat="server" BorderStyle="Solid" BorderWidth="0px" 
                 BorderColor="Black" CellPadding="0" CellSpacing="0" 
                 Width="637px" Font-Bold="True" GridLines="Both" HorizontalAlign="Center"></asp:Table>
        </div> 
        
        <div class=MapDetails>
            <p>Map Details:</p>
            <p>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SQLMapDetails">
                    <ItemTemplate>
                        Loc_Zone:
                        <asp:Label ID="Loc_ZoneLabel" runat="server" Text='<%# Eval("Loc_Zone") %>' />
                        <br />
                        Loc_X:
                        <asp:Label ID="Loc_XLabel" runat="server" Text='<%# Eval("Loc_X") %>' />
                        <br />
                        Loc_Y:
                        <asp:Label ID="Loc_YLabel" runat="server" Text='<%# Eval("Loc_Y") %>' />
                        <br />
                        Planet_Name:
                        <asp:Label ID="Planet_NameLabel" runat="server" Text='<%# Eval("Planet_Name") %>' />
                        <br />
                        <asp:Label ID="labPlanet1" runat="server" Text='<%# Eval("Planet_Id") %>'></asp:Label>
                        <br />
                        <asp:LinkButton ID="PlanetLink" runat="server" 
                            CommandArgument='<%# Eval("Planet_Id") %>' onclick="PlanetLink_Click">View Planet Details</asp:LinkButton>
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SQLMapDetails" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DASP %>" 
                    
                    SelectCommand="SELECT [Loc_Zone], [Loc_X], [Loc_Y], [Planet_Name], [cords], [Planet_Id] FROM [qry_Map] WHERE ([cords] = @cords)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="labPlanet" Name="cords" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
        </div>


<asp:Label ID="labPlanet" runat="server" Text="" Visible="False"></asp:Label>
</asp:Content>

