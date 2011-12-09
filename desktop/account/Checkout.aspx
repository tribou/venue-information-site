<%@ Page Title="" Language="VB" MasterPageFile="~/desktop/masterPages/home.master" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="desktop_account_Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            text-align: center;
        }
        .style4
        {
            text-align: center;
            font-weight: bold;
        }
        .style5
        {
            text-align: right;
            font-weight: 700;
        }
        .style6
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <table class="style1">
    <tr>
        <td style="text-align: center" width="150px">
            &nbsp;</td>
        <td style="text-align: center">
            <h2>
                Checkout Page</h2>
        </td>
        <td style="text-align: center" width="150px">
            &nbsp;</td>
    </tr>
</table>
    <table class="style1">
        <tr>
            <td style="text-align: right; font-weight: 700" width="150px">
                Ship To:&nbsp;
            </td>
            <td>
&nbsp;<asp:Label ID="lblAddress" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td width="150px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right" width="150px">
                <asp:LinkButton ID="lnkEdit" runat="server" ForeColor="Blue">Edit</asp:LinkButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td width="150px">
                &nbsp;</td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td class="style4">
                Store</td>
            <td class="style4">
                Product</td>
            <td class="style4">
                Price</td>
            <td class="style4" width="80px">
                Quantity</td>
            <td style="text-align: center; font-weight: 700">
                Total Price</td>
            <td width="150px">
                &nbsp;</td>
        </tr>
        <asp:Label ID="lblOrder" runat="server"></asp:Label>
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style6">
                
                &nbsp;</td>
            <td class="style5">
                
            </td>
            <td class="style3" width="80px">
                
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td width="150px">
                &nbsp;</td>
        </tr>
        </table>
    <table class="style1">
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td rowspan="3">
                *This ordering system is for demonstration purposes only.&nbsp; By selecting 
                &quot;Checkout with AutoPay,&quot; you are in no way accepting an offer for a purchase of 
                any kind.</td>
            <td class="style5" width="200px">
                Sub-total:</td>
            <td width="200px">
                <asp:Label ID="lblSubTotal" runat="server"></asp:Label>
            </td>
            <td width="150px">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td class="style5" width="200px">
                Shipping:</td>
            <td width="200px">
                <asp:Label ID="lblShip" runat="server"></asp:Label>
            </td>
            <td width="150px">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td class="style5" width="200px">
                Total:</td>
            <td width="200px">
                <asp:Label ID="lblTotal" runat="server"></asp:Label>
            </td>
            <td width="150px">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style5" width="200px">
                &nbsp;</td>
            <td width="200px">
                &nbsp;</td>
            <td style="text-align: center" width="150px">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style5" width="200px">
                <asp:Button ID="btnShop" runat="server" Text="Go Back to Cart" />
            </td>
            <td width="200px">
                <asp:Button ID="btnPayment" runat="server" Text="Checkout with AutoPay" />
            </td>
            <td style="text-align: center" width="150px">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

