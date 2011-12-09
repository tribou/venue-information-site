<%@ Page Title="" Language="VB" MasterPageFile="~/desktop/masterPages/home.master" AutoEventWireup="false" CodeFile="Management.aspx.vb" Inherits="desktop_admin_Admin" %>

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
        .style3
        {
            text-align: right;
        }
    .style4
    {
        text-align: left;
    }
    .style5
    {
        width: 100%;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">

    <h2 class="style1">
        Listing

        Management Page</h2>
    <table class="style2">
        <tr>
            <td>
                Select Listing to Edit:</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="ddlListings" runat="server" AutoPostBack="True" 
                    DataSourceID="sqlListings" DataTextField="listingName" 
                    DataValueField="listingID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlListings" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" SelectCommand="SELECT l.listingID, l.listingName
FROM AdminRoles as a
JOIN Listings as l
ON a.listingID_FK = l.listingID
JOIN Users as u
ON a.userID_FK = u.userID
WHERE u.username = @username ORDER BY l.listingName ASC">
                    <SelectParameters>
                        <asp:SessionParameter Name="username" SessionField="username" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:Panel ID="pnlListing" runat="server" Visible="False">
    <fieldset><legend>Listing</legend>
    

    
        <table class="style2">
            <tr>
                <td width="100px">
                    <asp:LinkButton ID="lnkEdit" runat="server" ForeColor="Blue">Edit Listing</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
                <td class="style3" width="200px">
                    Title:</td>
                <td>
                    <asp:Label ID="lblTitle" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3" width="200px">
                    Category:</td>
                <td>
                    <asp:Label ID="lblCategory" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3" width="200px">
                    Text:</td>
                <td>
                    <asp:Label ID="lblText" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3" width="200px">
                    Thumbnail Image:</td>
                <td>
                    <asp:Image ID="imgThumb" runat="server" Width="100px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3" width="200px">
                    Image:</td>
                <td>
                    <asp:Image ID="imgImage" runat="server" Width="300px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3" width="200px">
                    Inventory:</td>
                <td>
                    <asp:CheckBox ID="chkInventory" runat="server" AutoPostBack="True" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    

    
    </fieldset>
    </asp:Panel>
    <asp:Panel ID="pnlEdit" runat="server" Visible="False">
    <fieldset><legend>Edit Listing</legend>



        <table class="style2">
            <tr>
                <td width="100px">
                    <asp:LinkButton ID="lnkSave" runat="server" ForeColor="Blue">Save</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="lnkCancel" runat="server" ForeColor="Blue">Cancel</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    Edit Title:</td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    Edit Category:</td>
                <td>
                    <asp:DropDownList ID="ddlCategories" runat="server" 
                        DataSourceID="sqlCategories" DataTextField="ListCatName" 
                        DataValueField="ListCatID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sqlCategories" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
                        SelectCommand="SELECT * FROM [ListingCategories]"></asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    Edit Text:</td>
                <td>
                    <asp:TextBox ID="txtText" runat="server" Height="150px" TextMode="MultiLine" 
                        Width="400px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    Edit Thumbnail:</td>
                <td>
                    <asp:FileUpload ID="fupThumb" runat="server" />
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    Edit Image:</td>
                <td>
                    <asp:FileUpload ID="fupImage" runat="server" />
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;<asp:Label ID="lblImage" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>



    </fieldset>
    </asp:Panel>
    <asp:Panel ID="pnlInventory" runat="server" Visible="False">
    <fieldset><legend>Inventory</legend>
    
        <table class="style5">
            <tr>
                <td width="100px">
                    <asp:LinkButton ID="lnkAddProduct" runat="server" ForeColor="Blue">Add Product</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
                <td width="100px">
                    &nbsp;</td>
            </tr>
        </table>
    
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
            ValidationGroup="validate" />
    
        <asp:GridView ID="gdvInventory" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="productID" DataSourceID="sqlListingProducts" 
            EmptyDataText="There are no products in this inventory." 
            style="position:relative; margin-left:auto; margin-right:auto;" 
            AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" ValidationGroup="validate" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" 
                            onclientclick="javascript: return confirm('Are you sure you want to delete this product?');" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Name" SortExpression="pName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pName") %>' 
                            MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqName" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="Enter a product name." 
                            ForeColor="Red" ToolTip="Enter a product name." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("pName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="pDescription">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("pDescription") %>' 
                            MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqDesc" runat="server" 
                            ControlToValidate="TextBox2" ErrorMessage="Enter a description." 
                            ForeColor="Red" ToolTip="Enter a description." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("pDescription") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price" SortExpression="pPrice">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("pPrice") %>' 
                            MaxLength="14" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqPrice" runat="server" 
                            ControlToValidate="TextBox3" ErrorMessage="Enter a price." ForeColor="Red" 
                            ToolTip="Enter a price." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regPrice" runat="server" 
                            ControlToValidate="TextBox3" 
                            ErrorMessage="Please use valid price format. (xx.xx)" ForeColor="Red" 
                            ValidationExpression="^\d{0,9}(\.\d{2})?$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("pPrice", "{0:F2}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity" SortExpression="pQuantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("pQuantity") %>' 
                            MaxLength="9" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqQuantity" runat="server" 
                            ControlToValidate="TextBox4" ErrorMessage="Enter a quantity." ForeColor="Red" 
                            ToolTip="Enter a quantity." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regQuantity" runat="server" 
                            ControlToValidate="TextBox4" 
                            ErrorMessage="Enter a quantity between -999999999 and 999999999." 
                            ForeColor="Red" ValidationExpression="^-?\d{1,9}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("pQuantity") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="productID" HeaderText="productID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="productID" 
                    Visible="False" />
                <asp:BoundField DataField="listingID_FK" HeaderText="listingID_FK" 
                    SortExpression="listingID_FK" Visible="False" ReadOnly="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="First" LastPageText="Last" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="sqlListingProducts" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
            
            SelectCommand="SELECT * FROM [Products] WHERE ([listingID_FK] = @listingID_FK) ORDER BY [pName]" 
            DeleteCommand="DELETE FROM [Products] WHERE [productID] = @productID" 
            InsertCommand="INSERT INTO [Products] ([pName], [pPrice], [pDescription], [pQuantity], [listingID_FK]) VALUES (@pName, @pPrice, @pDescription, @pQuantity, @listingID_FK)" 
            UpdateCommand="UPDATE [Products] SET [pName] = @pName, [pPrice] = @pPrice, [pDescription] = @pDescription, [pQuantity] = @pQuantity WHERE [productID] = @productID">
            <DeleteParameters>
                <asp:Parameter Name="productID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="pName" Type="String" />
                <asp:Parameter Name="pPrice" Type="Double" />
                <asp:Parameter Name="pDescription" Type="String" />
                <asp:Parameter Name="pQuantity" Type="Int32" />
                <asp:Parameter Name="listingID_FK" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlListings" Name="listingID_FK" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="pName" Type="String" />
                <asp:Parameter Name="pPrice" Type="Double" />
                <asp:Parameter Name="pDescription" Type="String" />
                <asp:Parameter Name="pQuantity" Type="Int32" />
                <asp:Parameter Name="listingID_FK" Type="Int32" />
                <asp:Parameter Name="productID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </fieldset>
    </asp:Panel>
    <asp:Panel ID="pnlAddProduct" runat="server" Visible="False">
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" 
            ValidationGroup="validate" />
        <table class="style1">
            <tr>
                <td style="text-align: left" width="100px">
                    <asp:LinkButton ID="lnkAdd" runat="server" ForeColor="Blue" 
                        ValidationGroup="validate">Add</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="lnkAddCancel" runat="server" ForeColor="Blue">Cancel</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    Product Name:</td>
                <td class="style4">
                    <asp:TextBox ID="txtName" runat="server" MaxLength="100" 
                Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqName0" runat="server" 
                ControlToValidate="txtName" ErrorMessage="Enter a product name." 
                ForeColor="Red" ToolTip="Enter a product name." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    Description:</td>
                <td class="style4">
                    <asp:TextBox ID="txtDesc" runat="server" MaxLength="100" 
                Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqDesc0" runat="server" 
                ControlToValidate="txtDesc" ErrorMessage="Enter a description." ForeColor="Red" 
                ToolTip="Enter a description." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    Price:</td>
                <td class="style4">
                    <asp:TextBox ID="txtPrice" runat="server" MaxLength="14" 
                Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqPrice0" runat="server" ControlToValidate="txtPrice" 
                ErrorMessage="Enter a price." ForeColor="Red" ToolTip="Enter a price." 
                ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regPrice0" runat="server" ControlToValidate="txtPrice" 
                ErrorMessage="Please use valid price format. (xx.xx)" ForeColor="Red" 
                ValidationExpression="^\d{0,9}(\.\d{2})?$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    Quantity:</td>
                <td class="style4">
                    <asp:TextBox ID="txtQty" runat="server" MaxLength="9" 
                Width="50px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqQuantity0" runat="server" ControlToValidate="txtQty" 
                ErrorMessage="Enter a quantity." ForeColor="Red" ToolTip="Enter a quantity." 
                ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regQuantity0" runat="server" ControlToValidate="txtQty" 
                ErrorMessage="Enter a quantity between -999999999 and 999999999." 
                ForeColor="Red" ValidationExpression="^-?\d{1,9}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
</asp:Panel>

</asp:Content>

