<%@ Page Title="" Language="VB" MasterPageFile="~/desktop/masterPages/home.master" AutoEventWireup="false" CodeFile="Cart.aspx.vb" Inherits="desktop_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">


<table class="style1">
            <tr>
                <td style="text-align: center" width="200px">
                    <asp:Button ID="btnContinue" runat="server" style="text-align: center" 
                        Text="Continue Shopping" Width="150px" />
                </td>
                <td style="text-align: center">
                    <h2>
                    <strong>Shopping Cart</strong></h2>
                </td>
                <td style="text-align: center" width="200px">
                    <asp:Button ID="btnOrder" runat="server" Text="Checkout" Width="150px" />
                </td>
            </tr>
            <tr>
                <td width="200px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td width="200px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="width: 400px; padding-right: auto; padding-left: auto;" 
                    width="200px">
                    
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    
                    <asp:GridView ID="gdvCart" runat="server" AutoGenerateColumns="False" 
                        style="position: relative; margin: auto;" CellPadding="4" ForeColor="#333333" 
                        GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnRemove" runat="server" 
                                        onclientclick="javascript: return confirm('Are you sure you want to remove this item?', 'Remove Item')" 
                                        Text="Remove from Cart" CommandName="Delete" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Store" HeaderText="Store" 
                                ReadOnly="True" HtmlEncode="False" />
                            <asp:BoundField DataField="Name" HeaderText="Name" 
                                HtmlEncode="False" NullDisplayText="-" ReadOnly="True" />
                            <asp:BoundField DataField="Description" HeaderText="Description" HtmlEncode="False" 
                                ReadOnly="True" />
                            <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" 
                                HtmlEncode="False" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtQty" runat="server" MaxLength="2" 
                                        style="text-align: center" Text='<%# Bind("Quantity") %>' Width="20px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" EditText="Edit Quantity" 
                                ShowEditButton="True"></asp:CommandField>
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle Font-Bold="True" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
            </tr>
        </table>


    <table class="style1">
        <tr>
            <td width="200px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td width="200px">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="200px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td style="text-align: center" width="200px">
                <asp:Button ID="btnSaveCart" runat="server" Text="Save Cart" Width="150px" />
                <br />
            </td>
        </tr>
        <tr>
            <td width="200px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td style="text-align: center" width="200px">
                <asp:Panel ID="pnlSaveCart" runat="server" Visible="False">
                    <strong>Enter Cart Name:</strong><br />&nbsp;<asp:Label ID="lblCartSave" 
                        runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtCartName" runat="server" MaxLength="50"></asp:TextBox>
                    <br />
                    <asp:LinkButton ID="lnkSaveCart" runat="server" ForeColor="Blue">Save</asp:LinkButton>
&nbsp;
                    <asp:LinkButton ID="lnkCancelSave" runat="server" ForeColor="Blue">Cancel</asp:LinkButton>
                </asp:Panel>
            </td>
        </tr>
    </table>


</asp:Content>

