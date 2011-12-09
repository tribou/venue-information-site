<%@ Page Title="" Language="VB" MasterPageFile="~/desktop/masterPages/home.master" AutoEventWireup="false" CodeFile="Admin.aspx.vb" Inherits="desktop_admin_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style2
    {
        width: 100%;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">

    <h2 class="style1">
        Administration</h2>
    <br />
    <table class="style2">
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: center" width="200px">
                <strong style="font-size: medium">Listing Management</strong></td>
            <td style="text-align: center" width="200px">
                <h4>
                    Notifications</h4>
            </td>
            <td style="text-align: center" width="200px">
                <h4>
                    Listing
                    Administration</h4>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: center" width="200px">
                <asp:Button ID="btnListing" runat="server" Text="Select" />
            </td>
            <td style="text-align: center" width="200px">
                <asp:Button ID="btnNotify" runat="server" Text="Select" />
            </td>
            <td style="text-align: center" width="200px">
                <asp:Button ID="btnAdmin" runat="server" Text="Select" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td width="200px">
                &nbsp;</td>
            <td width="200px">
                &nbsp;</td>
            <td width="200px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td width="200px">
                &nbsp;</td>
            <td width="200px">
                &nbsp;</td>
            <td width="200px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
</table>
    <br />
&nbsp;

</asp:Content>

