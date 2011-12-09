<%@ Page Title="" Language="VB" MasterPageFile="~/desktop/masterPages/home.master" AutoEventWireup="false" CodeFile="confirmation.aspx.vb" Inherits="desktop_account_confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <table class="style1">
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td style="text-align: center">
                <h2>
                    Order Confirmation</h2>
            </td>
            <td width="150px">
                &nbsp;</td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td width="300px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td width="150px">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td width="300px">
                Your order confirmation number is
                <asp:Label ID="lblConfirm" runat="server"></asp:Label>
                .<br />
                An email with your order information will be sent out shortly.</td>
            <td>
                &nbsp;</td>
            <td width="150px">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td width="300px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td width="150px">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

