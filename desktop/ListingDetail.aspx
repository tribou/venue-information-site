<%@ Page Title="" Language="VB" MasterPageFile="~/desktop/masterPages/home.master" AutoEventWireup="false" CodeFile="ListingDetail.aspx.vb" Inherits="desktop_ListingDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="cssFiles/listingStyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">

    <div id="listingNavContainer">
    <div id="listingNav">
    
        <br />
        
        
</div></div>

    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlListingSource" 
        DataKeyNames="listingID" style="position:relative; margin-left:auto; margin-right:auto;">
        <EditItemTemplate>
            listingID:
            <asp:Label ID="listingIDLabel1" runat="server" 
                Text='<%# Eval("listingID") %>' />
            <br />
            listingName:
            <asp:TextBox ID="listingNameTextBox" runat="server" 
                Text='<%# Bind("listingName") %>' />
            <br />
            listingText:
            <asp:TextBox ID="listingTextTextBox" runat="server" 
                Text='<%# Bind("listingText") %>' />
            <br />
            listingImage:
            <asp:TextBox ID="listingImageTextBox" runat="server" 
                Text='<%# Bind("listingImage") %>' />
            <br />
            listingThumb:
            <asp:TextBox ID="listingThumbTextBox" runat="server" 
                Text='<%# Bind("listingThumb") %>' />
            <br />
            listingLayout:
            <asp:TextBox ID="listingLayoutTextBox" runat="server" 
                Text='<%# Bind("listingLayout") %>' />
            <br />
            ListCatID_FK:
            <asp:TextBox ID="ListCatID_FKTextBox" runat="server" 
                Text='<%# Bind("ListCatID_FK") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            listingName:
            <asp:TextBox ID="listingNameTextBox" runat="server" 
                Text='<%# Bind("listingName") %>' />
            <br />
            listingText:
            <asp:TextBox ID="listingTextTextBox" runat="server" 
                Text='<%# Bind("listingText") %>' />
            <br />
            listingImage:
            <asp:TextBox ID="listingImageTextBox" runat="server" 
                Text='<%# Bind("listingImage") %>' />
            <br />
            listingThumb:
            <asp:TextBox ID="listingThumbTextBox" runat="server" 
                Text='<%# Bind("listingThumb") %>' />
            <br />
            listingLayout:
            <asp:TextBox ID="listingLayoutTextBox" runat="server" 
                Text='<%# Bind("listingLayout") %>' />
            <br />
            ListCatID_FK:
            <asp:TextBox ID="ListCatID_FKTextBox" runat="server" 
                Text='<%# Bind("ListCatID_FK") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<table class="style1">
                <tr>
                    <td>
                        <asp:Label ID="listingNameLabel" runat="server" Font-Bold="True" 
                            Font-Size="Larger" Text='<%# Bind("listingName") %>' />
                    </td>
                    <td width="10px">
                        &nbsp;</td>
                    <td>
                        <img alt="Listing Logo" src="../desktop/images/<%# Eval("listingImage") %>" width="200px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td width="10px">
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="listingTextLabel" runat="server" 
                            Text='<%# Bind("listingText") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td width="10px">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td width="10px">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnShopping" runat="server" Text="Shop Online!" 
                            Visible='<%# Eval("listingInventory") %>' onclick="btnShopping_Click" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />

        </ItemTemplate>
        </asp:FormView>

    <asp:SqlDataSource ID="SqlListingSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
        SelectCommand="SELECT * FROM [Listings] WHERE ([listingID] = @listingID)">
        <SelectParameters>
            <asp:CookieParameter CookieName="listingID" Name="listingID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    &nbsp;<table class="style3">
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

    </asp:Content>

