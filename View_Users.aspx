<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View_Users.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            EmptyDataText="There are no data records to display.">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DASP %>" 
            ProviderName="<%$ ConnectionStrings:Local_TheGame.ProviderName %>" 
            
            SelectCommand="SELECT [Email_address], [User_name], [User_Tag], [User_Id] FROM [Gm_User_Details]">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
