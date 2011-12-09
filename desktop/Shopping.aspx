<%@ Page Title="" Language="VB" MasterPageFile="~/desktop/masterPages/home.master" AutoEventWireup="false" CodeFile="Shopping.aspx.vb" Inherits="desktop_Shopping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">

<table class="style1">
            <tr>
                <td style="text-align: center" width="200px">
                    &nbsp;</td>
                <td style="text-align: center">
                    <h2>
                    <strong>Online Shop</strong></h2>
                </td>
                <td style="text-align: center" width="200px">
                    <asp:Button ID="btnGoToCart" runat="server" 
                        Text="Shopping Cart" Width="150px" />
                </td>
            </tr>
        </table>
        <table class="style1">
            <tr>
                <td width="200px" rowspan="2" class="tableStyle1">
    
                    <asp:GridView ID="gdvItems" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="listingID" DataSourceID="SqlDataSource1" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" style="position:relative; margin-top: 10px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                            <asp:BoundField DataField="listingName" HeaderText="Store" 
                                SortExpression="listingName" HtmlEncode="False" />
                            <asp:BoundField DataField="listingID" HeaderText="listingID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="listingID" Visible="False" />
                            <asp:BoundField DataField="listingText" HeaderText="listingText" 
                                SortExpression="listingText" Visible="False" />
                            <asp:BoundField DataField="listingImage" HeaderText="listingImage" SortExpression="listingImage" 
                                Visible="False" />
                            <asp:BoundField DataField="listingThumb" HeaderText="listingThumb" 
                                SortExpression="listingThumb" Visible="False" />
                            <asp:BoundField DataField="listingLayout" HeaderText="listingLayout" 
                                SortExpression="listingLayout" Visible="False" />
                            <asp:BoundField DataField="ListCatID_FK" HeaderText="ListCatID_FK" 
                                SortExpression="ListCatID_FK" Visible="False" />
                            <asp:CheckBoxField DataField="listingInventory" HeaderText="listingInventory" 
                                SortExpression="listingInventory" Visible="False" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
            
                        SelectCommand="SELECT * FROM [Listings] WHERE ([listingInventory] = @listingInventory)">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="listingInventory" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
                <td style="text-align: center;">
    
                    <asp:Image ID="imgItem" runat="server" Visible="False" 
                        style="text-align: center" Width="200px" />
    
                    <br />
    
                    <asp:Label ID="lblTest" runat="server"></asp:Label>
    
                </td>
            </tr>
            <tr>
                <td width="500px">
                    <br />
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <asp:GridView ID="gdvInventory" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="productID" DataSourceID="sqlInventory" 
                        style="position: relative; margin-left: auto; margin-right: auto; margin-top: 10px;" 
                        CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="pName" HeaderText="Product" 
                                SortExpression="pName" HtmlEncode="False" />
                            <asp:BoundField DataField="pDescription" 
                                HeaderText="Description" SortExpression="pDescription" 
                                HtmlEncode="False" />
                            <asp:BoundField DataField="pPrice" HeaderText="Price" 
                                SortExpression="pPrice" DataFormatString="{0:c}" />
                            <asp:BoundField DataField="IN_STOCK" HeaderText="In Stock" 
                                ReadOnly="True" SortExpression="IN_STOCK" >
                            <HeaderStyle Width="100px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtQty" runat="server" Height="20px" MaxLength="2" 
                                        Width="30px">0</asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" SelectText="Add to Cart" 
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="productID" HeaderText="productID" 
                                SortExpression="productID" InsertVisible="False" ReadOnly="True" 
                                Visible="False" />
                            <asp:BoundField DataField="listingID_FK" HeaderText="listingID_FK" 
                                SortExpression="listingID_FK" Visible="False" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle Font-Bold="False" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="sqlInventory" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
                        SelectCommand="SELECT p.productID, p.listingID_FK, p.pName, p.pDescription, p.pPrice, 
	CASE 
		WHEN p.pQuantity = 0 THEN 'No'
		WHEN p.pQuantity BETWEEN 1 AND 99 THEN 'Low Quantity'
		WHEN p.pQuantity &gt; 99 THEN 'Yes'
	END AS IN_STOCK
FROM Products AS p 
WHERE (p.listingID_FK = @listingID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gdvItems" Name="listingID" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>


</asp:Content>

