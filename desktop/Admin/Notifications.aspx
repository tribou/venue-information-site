<%@ Page Title="" Language="VB" MasterPageFile="~/desktop/masterPages/home.master" AutoEventWireup="false" CodeFile="Notifications.aspx.vb" Inherits="desktop_admin_Notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <table class="style1">
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td style="text-align: center">
                <h2>
                    Notifications</h2>
            </td>
            <td width="150px">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td width="150px">
                &nbsp;</td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                User:</td>
            <td width="300px">
                <asp:DropDownList ID="ddlUsers" runat="server" DataSourceID="sqlUserSMS" 
                    DataTextField="Name" DataValueField="username">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlUserSMS" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" SelectCommand="SELECT username, fName + ' ' + lName + ' - ' + username AS 'Name'
FROM Users
WHERE sms is not null
ORDER BY username ASC"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                Message:</td>
            <td width="300px">
                <asp:TextBox ID="txtMessage" runat="server" Height="80px" MaxLength="160" 
                    TextMode="MultiLine" Width="200px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                &nbsp;</td>
            <td width="300px">
                <asp:RequiredFieldValidator ID="reqMessage" runat="server" 
                    ControlToValidate="txtMessage" ErrorMessage="Enter a message." ForeColor="Red" 
                    ValidationGroup="validate"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                <asp:LinkButton ID="lnkCancel" runat="server" ForeColor="Blue">Cancel</asp:LinkButton>
            </td>
            <td width="300px">
                <asp:Button ID="btnSend" runat="server" Text="Send Message" 
                    ValidationGroup="validate" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

