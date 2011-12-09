<%@ Page Title="" Language="VB" MasterPageFile="~/desktop/masterPages/home.master" AutoEventWireup="false" CodeFile="AddProduct.aspx.vb" Inherits="desktop_admin_AddProduct" %>

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
                    Add Product</h2>
            </td>
            <td width="150px">
                &nbsp;</td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
        ValidationGroup="validate" />
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                Store:</td>
            <td>
                <asp:Label ID="lblStore" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                Product Name:</td>
            <td>
                <asp:TextBox ID="txtName" runat="server" MaxLength="100" Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqName" runat="server" 
                            ControlToValidate="txtName" ErrorMessage="Enter a product name." 
                            ForeColor="Red" ToolTip="Enter a product name." 
                    ValidationGroup="validate">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                Description:</td>
            <td>
                <asp:TextBox ID="txtDesc" runat="server" MaxLength="100" Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqDesc" runat="server" 
                            ControlToValidate="txtDesc" ErrorMessage="Enter a description." 
                            ForeColor="Red" ToolTip="Enter a description." 
                    ValidationGroup="validate">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                Price:</td>
            <td>
                <asp:TextBox ID="txtPrice" runat="server" MaxLength="14" Width="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqPrice" runat="server" 
                            ControlToValidate="txtPrice" ErrorMessage="Enter a price." 
                            ForeColor="Red" ToolTip="Enter a price." 
                    ValidationGroup="validate">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regPrice" runat="server" 
                            ControlToValidate="txtPrice" 
                            ErrorMessage="Please use valid price format. (xx.xx)" ForeColor="Red" 
                            ValidationExpression="^\d{0,9}(\.\d{2})?$" 
                    ValidationGroup="validate">*</asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                Quantity:</td>
            <td>
                <asp:TextBox ID="txtQty" runat="server" MaxLength="9" Width="50px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqQuantity" runat="server" 
                            ControlToValidate="txtQty" ErrorMessage="Enter a quantity." 
                            ForeColor="Red" ToolTip="Enter a quantity." 
                    ValidationGroup="validate">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regQuantity" runat="server" 
                            ControlToValidate="txtQty" 
                            ErrorMessage="Enter a quantity between -999999999 and 999999999." ForeColor="Red" 
                            ValidationExpression="^-?\d{1,9}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                <asp:LinkButton ID="lnkAdd" runat="server" ForeColor="Blue" 
                    ValidationGroup="validate">Add</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lnkCancel" runat="server" ForeColor="Blue">Cancel</asp:LinkButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

