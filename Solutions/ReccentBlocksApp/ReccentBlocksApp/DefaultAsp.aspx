<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DefaultAsp.aspx.vb" Inherits="ReccentBlocksApp.DefaultAsp" Async="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <asp:Button ID="runButton" runat="server" Text="Run" />
        <asp:TextBox ID="inputBox" runat="server" TextMode="Number" Width="65px"></asp:TextBox>
        
    </div>
        <p>
            <asp:Label ID="outputLabel" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
