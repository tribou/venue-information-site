<%@ Page Title="" Language="VB" MasterPageFile="~/desktop/masterPages/home.master" AutoEventWireup="false" CodeFile="ListingAdmin.aspx.vb" Inherits="desktop_listingAdmin_ListingAdmin" %>

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
                Listing Administration</h2>
        </td>
        <td width="150px">
            &nbsp;</td>
    </tr>
</table>


    <table class="style1">
        <tr>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center" width="150px">
                <asp:LinkButton ID="lnkAddListing" runat="server" ForeColor="Blue">Add New Listing</asp:LinkButton>
            </td>
            <td style="text-align: center" width="150px">
                <asp:LinkButton ID="lnkAssign" runat="server" ForeColor="Blue">Assign Managers</asp:LinkButton>
            </td>
            <td style="text-align: center" width="150px">
                <asp:LinkButton ID="lnkDelete" runat="server" ForeColor="Blue">Delete Listings</asp:LinkButton>
            </td>
            <td style="text-align: center">
                &nbsp;</td>
        </tr>
    </table>
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    <asp:Panel ID="pnlAdd" runat="server" Visible="False">
    <fieldset><legend>Add Listing</legend>
        <table class="style1">
            <tr>
                <td width="125px">
                    <asp:LinkButton ID="lnkAddSave" runat="server" ForeColor="Blue" 
                        ValidationGroup="addListing">Add</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="lnkAddCancel" runat="server" ForeColor="Blue">Cancel</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
                <td class="style3" width="300px">
                    Listing Name:</td>
                <td width="300px">
                    <asp:TextBox ID="txtName" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqName" runat="server" 
                        ControlToValidate="txtName" ErrorMessage="* Enter a name." ForeColor="Red" 
                        ValidationGroup="addListing"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td width="125px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="125px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3" width="300px">
                    Category:</td>
                <td width="300px">
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
                <td width="125px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="125px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style3" width="300px">
                    &nbsp;</td>
                <td width="300px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td width="125px">
                    &nbsp;</td>
            </tr>
        </table>
        </fieldset>
    </asp:Panel>
    <asp:Panel ID="pnlAssign" runat="server" Visible="False">
    <fieldset><legend>Assign Managers</legend>
    
            <table class="style1">
                <tr>
                    <td width="125px">
                        <asp:LinkButton ID="lnkClose" runat="server" ForeColor="Blue">Close</asp:LinkButton>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td style="text-align: right" width="300px">
                        Listing:</td>
                    <td width="300px">
                        <asp:DropDownList ID="ddlListings" runat="server" DataSourceID="sqlListings" 
                            DataTextField="listingName" DataValueField="listingID" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sqlListings" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
                            
                            SelectCommand="SELECT [listingID], [listingName] FROM [Listings] ORDER BY [listingName]">
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td width="125px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="125px">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td width="125px">
                        &nbsp;</td>
                </tr>
        </table>


        <asp:Panel ID="pnlLists" runat="server" Visible="False">
        
            <table class="style1">
                <tr>
                    <td width="100px">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td style="text-align: center" width="150px">
                        <strong>Users</strong></td>
                    <td width="100px">
                        &nbsp;</td>
                    <td style="text-align: center" width="150px">
                        <strong>Managers</strong></td>
                    <td>
                        &nbsp;</td>
                    <td width="100px">
                        &nbsp;</td>
                </tr>
        </table>
        <table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
                <td rowspan="4" style="text-align: center" width="150px">
                    <asp:ListBox ID="lstUsers" runat="server" Height="200px" Width="150px">
                    </asp:ListBox>
                </td>
                <td style="text-align: center" width="100px">
                    &nbsp;</td>
                <td rowspan="4" style="text-align: center" width="150px">
                    <asp:ListBox ID="lstManagers" runat="server" Height="200px" Width="150px">
                    </asp:ListBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: center" width="100px">
                    <asp:Button ID="btnAdd" runat="server" Text="&gt;&gt;" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: center" width="100px">
                    <asp:Button ID="btnRemove" runat="server" Text="&lt;&lt;" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: center" width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        </asp:Panel>

    </fieldset>
    </asp:Panel>
    <asp:Panel ID="pnlDelete" runat="server" Visible="False">
    <fieldset><legend>Delete Listings</legend>
    
    

        <table class="style1">
            <tr>
                <td width="125px">
                    <asp:LinkButton ID="lnkDeleteCancel" runat="server" ForeColor="Blue">Close</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
                <td style="text-align: right" width="300px">
                    Listing:</td>
                <td width="300px">
                    <asp:DropDownList ID="ddlListingsDelete" runat="server" 
                        DataSourceID="sqlDelete" DataTextField="listingName" DataValueField="listingID">
                    </asp:DropDownList>
                    &nbsp;
                    <asp:Button ID="btnDelete" runat="server" 
                        onclientclick="javascript: return confirm('Are you sure you want to delete this listing?');" 
                        Text="Delete" />
                    <asp:SqlDataSource ID="sqlDelete" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
                        SelectCommand="SELECT [listingID], [listingName] FROM [Listings] ORDER BY [listingName]">
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
                <td width="125px">
                    &nbsp;</td>
            </tr>
        </table>
    
    

    </fieldset>
    </asp:Panel>
</asp:Content>

