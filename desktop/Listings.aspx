<%@ Page Title="" debug="true" Language="VB" MasterPageFile="~/desktop/masterPages/home.master" AutoEventWireup="false" CodeFile="Listings.aspx.vb" Inherits="desktop_Listings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="cssFiles/listingStyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        </style>
        <script type="text/javascript">
            function listingCookie(listingID) {

            var str = listingID

            document.cookie = "listingID=" + str

            }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    
    <div id="listingNavContainer">
    <div id="shoppingNav" class="navigationButton">
    
    <asp:LinkButton ID="lnkShopping" runat="server" CssClass="listingButton">Shopping</asp:LinkButton>
    </div><div id="foodNav" class="navigationButton">
    <asp:LinkButton ID="lnkFood" runat="server" CssClass="listingButton">Food</asp:LinkButton>
    </div><div id="entertainmentNav" class="navigationButton">
    <asp:LinkButton ID="lnkEntertainment" runat="server" CssClass="listingButton">Entertainment</asp:LinkButton>
        </div>
        
        
</div>
    <asp:MultiView ID="ListingMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="vwShopping" runat="server">

        <table class="listingTitle">
            <tr>
               
                <td>
                    <h2>Store Listings</h2></td>
            </tr>
            
        </table>

            <asp:ListView ID="ShoppingListView" runat="server" DataKeyNames="listingID" 
                DataSourceID="SqlListingsShopping">
                <AlternatingItemTemplate>
                    <span style="">
                    <table class="listingEntry">
            <tr>
                <td rowspan="2" class="listingLogo">
                    <img alt="<%# Eval("listingName") %> Logo" src="../desktop/images/thumbs/<%# Eval("listingThumb") %>" width="100px" />
                </td>
                <td class="listingName">
                <h3>
                    <a href="../desktop/ListingDetail.aspx" onclick="javascript: listingCookie(<%# Eval("listingID") %>)"><%# Eval("listingName") %></a>
                    </h3>
                </td>
            </tr>
            <tr>
                <td>
                <asp:Label ID="listingTextLabel" runat="server" 
                        Text='<%# listingText() %>' />

                </td>
            </tr>
        </table>
                    
                   
                    </span>
                </AlternatingItemTemplate>
                
                <EmptyDataTemplate>
                    <span>
                    <table class="listingPager">
                        <tr>
               
                            <td>
                                <h4>No listings are currently available.</h4>
                            </td>
                        </tr>
                    </table>
                    </span>
                </EmptyDataTemplate>
                
                <ItemTemplate>
                    <span style="">

                    <table class="listingEntry">
            <tr>
                <td rowspan="2" class="listingLogo">
                    <img alt="<%# Eval("listingName") %> Logo" src="../desktop/images/thumbs/<%# Eval("listingThumb") %>" width="100px" />
                </td>
                <td class="listingName">
                <h3>
                    <a href="../desktop/ListingDetail.aspx" onclick="javascript: listingCookie(<%# Eval("listingID") %>)"><%# Eval("listingName") %></a>
                    </h3>
                </td>
            </tr>
            <tr>
                <td>
                <asp:Label ID="listingTextLabel" runat="server" 
                        Text='<%# listingText() %>' />
                </td>
            </tr>
        </table>
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div ID="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                    <table class="listingPager">
                            <tr>
                            <td>
                        <asp:DataPager ID="DataPager2" runat="server">
                            <Fields>
                            
                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    
                            </Fields>
                        </asp:DataPager>
                        </td>
                                    </tr>
                                    </table>
                    </div>
                </LayoutTemplate>
                
            </asp:ListView>

            <asp:SqlDataSource ID="SqlListingsShopping" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
                
                SelectCommand="SELECT * FROM [Listings] WHERE ([ListCatID_FK] = @ListCatID_FK) ORDER BY [listingName] ASC">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="ListCatID_FK" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </asp:View>
        <asp:View ID="vwFood" runat="server">

        <table class="listingTitle">
            <tr>
               
                <td>
                    <h2>Food Listings</h2></td>
            </tr>
            
        </table>


            <asp:ListView ID="FoodListView" runat="server" DataKeyNames="listingID" 
                DataSourceID="SqlListingsFood">



                <AlternatingItemTemplate>
                    <span style="">
                    <table class="listingEntry">
            <tr>
                <td rowspan="2" class="listingLogo">
                    <img alt="<%# Eval("listingName") %> Logo" src="../desktop/images/thumbs/<%# Eval("listingThumb") %>" width="100px" />
                </td>
                <td class="listingName">
                <h3>
                <a href="../desktop/ListingDetail.aspx" onclick="javascript: listingCookie(<%# Eval("listingID") %>)"><%# Eval("listingName") %></a>
                    </h3>
                </td>
            </tr>
            <tr>
                <td>
                <asp:Label ID="listingTextLabel" runat="server" 
                        Text='<%# listingText() %>' />

                </td>
            </tr>
        </table>
                    </span>
                </AlternatingItemTemplate>
                
                <EmptyDataTemplate>
                    <span>
                    <table class="listingPager">
                        <tr>
               
                            <td>
                                <h4>No listings are currently available.</h4>
                            </td>
                        </tr>
                    </table>
                    </span>
                </EmptyDataTemplate>
                
                <ItemTemplate>
                    <span style="">
                    <table class="listingEntry">
            <tr>
                <td rowspan="2" class="listingLogo">
                    <img alt="<%# Eval("listingName") %> Logo" src="../desktop/images/thumbs/<%# Eval("listingThumb") %>" width="100px" />
                </td>
                <td class="listingName">
                <h3>
                <a href="../desktop/ListingDetail.aspx" onclick="javascript: listingCookie(<%# Eval("listingID") %>)"><%# Eval("listingName") %></a>
                    </h3>
                </td>
            </tr>
            <tr>
                <td>
                <asp:Label ID="listingTextLabel" runat="server" 
                        Text='<%# listingText() %>' />

                </td>
            </tr>
        </table>
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div ID="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">

                    <table class="listingPager">
                            <tr>
                            <td>

                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>

                        </td>
                        </tr>
                        </table>

                    </div>
                </LayoutTemplate>
                
            </asp:ListView>
            <asp:SqlDataSource ID="SqlListingsFood" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
                SelectCommand="SELECT * FROM [Listings] WHERE ([ListCatID_FK] = @ListCatID_FK) ORDER BY [listingName] ASC">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="ListCatID_FK" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="vwEntertainment" runat="server">

        <table class="listingTitle">
            <tr>
               
                <td>
                    <h2>Entertainment Listings</h2></td>
            </tr>
            
        </table>

            <asp:ListView ID="EntertainmentListView" runat="server" 
                DataKeyNames="listingID" DataSourceID="SqlListingsEntertainment">



                <AlternatingItemTemplate>
                    <span style="">
                    <table class="listingEntry">
            <tr>
                <td rowspan="2" class="listingLogo">
                    <img alt="<%# Eval("listingName") %> Logo" src="../desktop/images/thumbs/<%# Eval("listingThumb") %>" width="100px" />
                </td>
                <td class="listingName">
                <h3>
                <a href="../desktop/ListingDetail.aspx" onclick="javascript: listingCookie(<%# Eval("listingID") %>)"><%# Eval("listingName") %></a>
                    </h3>
                </td>
            </tr>
            <tr>
                <td>
                <asp:Label ID="listingTextLabel" runat="server" 
                        Text='<%# listingText() %>' />

                </td>
            </tr>
        </table>
                    </span>
                </AlternatingItemTemplate>
                
                <EmptyDataTemplate>
                    <span>
                    <table class="listingPager">
                        <tr>
               
                            <td>
                                <h4>No listings are currently available.</h4>
                            </td>
                        </tr>
                    </table>
                    </span>
                </EmptyDataTemplate>
                
                <ItemTemplate>
                    <span style="">
                    <table class="listingEntry">
            <tr>
                <td rowspan="2" class="listingLogo">
                    <img alt="<%# Eval("listingName") %> Logo" src="../desktop/images/thumbs/<%# Eval("listingThumb") %>" width="100px" />
                </td>
                <td class="listingName">
                <h3>
                <a href="../desktop/ListingDetail.aspx" onclick="javascript: listingCookie(<%# Eval("listingID") %>)"><%# Eval("listingName") %></a>
                    </h3>
                </td>
            </tr>
            <tr>
                <td>
                <asp:Label ID="listingTextLabel" runat="server" 
                        Text='<%# listingText() %>' />

                </td>
            </tr>
        </table>
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div ID="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                    <table class="listingPager">
                            <tr>
                            <td>
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                        </td>
                        </tr>
                        </table>
                    </div>
                </LayoutTemplate>
            
            </asp:ListView>
            <asp:SqlDataSource ID="SqlListingsEntertainment" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
                SelectCommand="SELECT * FROM [Listings] WHERE ([ListCatID_FK] = @ListCatID_FK) ORDER BY [listingName] ASC">
                <SelectParameters>
                    <asp:Parameter DefaultValue="3" Name="ListCatID_FK" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>

</asp:Content>

