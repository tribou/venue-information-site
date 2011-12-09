<%@ Page Title="" Language="VB" MasterPageFile="~/desktop/masterPages/home.master" AutoEventWireup="false" CodeFile="Account.aspx.vb" Inherits="desktop_account_Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            text-align: right;
        }
    </style>
    <link href="../cssFiles/listingStyles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <h2 class="style1">
        <table class="style3">
            <tr>
                <td width="150px">
                    &nbsp;</td>
                <td>
    Manage Your Account</td>
                <td width="150px">
                    <asp:Button ID="btnCart" runat="server" Text="Shopping Cart" />
                </td>
            </tr>
        </table>
    </h2>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
        ValidationGroup="validate" />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

    <asp:Panel ID="pnlViewPersonal" runat="server"><fieldset><legend>Personal Information</legend>
        
        
        <table cellpadding="5" cellspacing="0" class="style3">
            <tr>
                <td width="125px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style4" width="200px">
                    &nbsp;</td>
                <td width="200px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td width="125px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="125px">
                    <asp:LinkButton ID="lnkEdit" runat="server" ForeColor="Blue">Edit</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
                <td class="style4" width="200px">
                    First Name:</td>
                <td width="200px">
                    <asp:Label ID="lblFirst" runat="server"></asp:Label>
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
                <td class="style4" width="200px">
                    Last Name:</td>
                <td width="200px">
                    <asp:Label ID="lblLast" runat="server"></asp:Label>
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
                <td class="style4" width="200px">
                    Address:</td>
                <td width="200px">
                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                    <asp:Label ID="lblAddress2" runat="server"></asp:Label>
                    <asp:Label ID="lblAddress3" runat="server"></asp:Label>
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
                <td class="style4" width="200px">
                    City:</td>
                <td width="200px">
                    <asp:Label ID="lblCity" runat="server"></asp:Label>
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
                <td class="style4" width="200px">
                    State:</td>
                <td width="200px">
                    <asp:Label ID="lblState" runat="server"></asp:Label>
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
                <td class="style4" width="200px">
                    Zip Code:</td>
                <td width="200px">
                    <asp:Label ID="lblZip" runat="server"></asp:Label>
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
                <td class="style4" width="200px">
                    Country:</td>
                <td width="200px">
                    <asp:Label ID="lblCountry" runat="server"></asp:Label>
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
                <td class="style4" width="200px">
                    Phone:</td>
                <td width="200px">
                    <asp:Label ID="lblPhone" runat="server"></asp:Label>
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
                <td class="style4" width="200px">
                    Text Messaging:</td>
                <td width="200px">
                    <asp:Label ID="lblText" runat="server"></asp:Label>
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
                <td class="style4" width="200px">
                    Text Messaging Carrier:</td>
                <td width="200px">
                    <asp:Label ID="lblCarrier" runat="server"></asp:Label>
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
                <td class="style4" width="200px">
                    &nbsp;</td>
                <td width="200px">
                    &nbsp;</td>
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
                <td class="style4" width="200px">
                    &nbsp;</td>
                <td width="200px">
                    &nbsp;</td>
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
                <td class="style4" width="200px">
                    &nbsp;</td>
                <td width="200px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td width="125px">
                    &nbsp;</td>
            </tr>
        </table>
    
    </fieldset></asp:Panel>


    <asp:Panel ID="pnlEditPersonal" runat="server" Visible="False"><fieldset><legend>Edit Personal Information</legend>
    
    <table cellpadding="5" cellspacing="0" class="style3">
            <tr>
                <td width="125px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style4" width="200px">
                    &nbsp;</td>
                <td width="200px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td width="125px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="125px">
                    <asp:LinkButton ID="lnkSave" runat="server" ForeColor="Blue" 
                        ValidationGroup="validate">Save</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="lnkCancel" runat="server" ForeColor="Blue">Cancel</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
                <td class="style4" width="200px">
                    First Name:</td>
                <td width="200px">
                    <asp:TextBox ID="txtFirst" runat="server" MaxLength="128" 
                        ValidationGroup="validate"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqFirst0" runat="server" 
                        ControlToValidate="txtFirst" Display="Dynamic" ErrorMessage="Enter first name." 
                        ForeColor="Red" ToolTip="Enter first name." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regFirst0" runat="server" 
                        ControlToValidate="txtFirst" 
                        ErrorMessage="Enter only letters or numbers for first name." ForeColor="Red" 
                        ToolTip="Enter only letters or numbers for first name." 
                        ValidationExpression="^[\w ]{0,50}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
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
                <td class="style4" width="200px">
                    Last Name:</td>
                <td width="200px">
                    <asp:TextBox ID="txtLast" runat="server" MaxLength="128" 
                        ValidationGroup="validate"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqLast0" runat="server" 
                        ControlToValidate="txtLast" Display="Dynamic" ErrorMessage="Enter last name." 
                        ForeColor="Red" ToolTip="Enter last name." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regLast0" runat="server" 
                        ControlToValidate="txtLast" 
                        ErrorMessage="Enter only letters or numbers for last name." ForeColor="Red" 
                        ToolTip="Enter only letters or numbers for last name." 
                        ValidationExpression="^[\w ]{0,50}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
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
                <td class="style4" width="200px">
                    Address:</td>
                <td width="200px">
                    <asp:TextBox ID="txtAddress" runat="server" MaxLength="128" 
                        ValidationGroup="validate"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqAddress0" runat="server" 
                        ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="Enter address." 
                        ForeColor="Red" ToolTip="Enter address." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regAddress4" runat="server" 
                        ControlToValidate="txtAddress" 
                        ErrorMessage="Enter only letters, numbers, or periods for address." 
                        ForeColor="Red" ToolTip="Enter only letters, numbers, or periods for address." 
                        ValidationExpression="^[\w. ]{0,128}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
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
                <td class="style4" width="200px">
                    Address Line 2:</td>
                <td width="200px">
                    <asp:TextBox ID="txtAddress2" runat="server" MaxLength="128" 
                        ValidationGroup="validate"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regAddress5" runat="server" 
                        ControlToValidate="txtAddress2" 
                        ErrorMessage="Enter only letters, numbers, or periods for address line 2." 
                        ForeColor="Red" 
                        ToolTip="Enter only letters, numbers, or periods for address line 2." 
                        ValidationExpression="^[\w. ]{0,128}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
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
                <td class="style4" width="200px">
                    Address Line 3:</td>
                <td width="200px">
                    <asp:TextBox ID="txtAddress3" runat="server" MaxLength="128" 
                        ValidationGroup="validate"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regAddress6" runat="server" 
                        ControlToValidate="txtAddress3" 
                        ErrorMessage="Enter only letters, numbers, or periods for address line 3." 
                        ForeColor="Red" 
                        ToolTip="Enter only letters, numbers, or periods for address line 3." 
                        ValidationExpression="^[\w. ]{0,128}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
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
                <td class="style4" width="200px">
                    City:</td>
                <td width="200px">
                    <asp:TextBox ID="txtCity" runat="server" MaxLength="128" 
                        ValidationGroup="validate"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqCity0" runat="server" 
                        ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="Enter city." 
                        ForeColor="Red" ToolTip="Enter city." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regCity0" runat="server" 
                        ControlToValidate="txtCity" ErrorMessage="Enter only letters for city." 
                        ForeColor="Red" ToolTip="Enter only letters for city." 
                        ValidationExpression="^[a-zA-Z ]{0,50}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
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
                <td class="style4" width="200px">
                    State:</td>
                <td width="200px">
                    <asp:DropDownList ID="ddlState" runat="server" DataSourceID="SqlStates" 
                        DataTextField="StateName" DataValueField="StateCode">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlStates" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
                        SelectCommand="SELECT * FROM [States]"></asp:SqlDataSource>
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
                <td class="style4" width="200px">
                    Zip Code:</td>
                <td width="200px">
                    <asp:TextBox ID="txtZip" runat="server" MaxLength="128" 
                        ValidationGroup="validate"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqZip0" runat="server" 
                        ControlToValidate="txtZip" Display="Dynamic" ErrorMessage="Enter zip code." 
                        ForeColor="Red" ToolTip="Enter zip code." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regZip0" runat="server" 
                        ControlToValidate="txtZip" ErrorMessage="Enter a five-digit zip code." 
                        ForeColor="Red" ToolTip="Enter a five-digit zip code." 
                        ValidationExpression="^\d{5}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
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
                <td class="style4" width="200px">
                    Country:</td>
                <td width="200px">
                    <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="SqlCountries" 
                        DataTextField="name_en" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlCountries" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
                        SelectCommand="SELECT [id], [name_en] FROM [base_country]">
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
                <td class="style4" width="200px">
                    Phone:</td>
                <td width="200px">
                    <asp:TextBox ID="txtPhone" runat="server" MaxLength="128" 
                        ValidationGroup="validate"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqPhone0" runat="server" 
                        ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Enter phone." 
                        ForeColor="Red" ToolTip="Enter phone." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regPhone0" runat="server" 
                        ControlToValidate="txtPhone" ErrorMessage="Enter a ten-digit number for phone." 
                        ForeColor="Red" ToolTip="Enter a ten-digit number for phone." 
                        ValidationExpression="^\d{10}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
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
                <td class="style4" width="200px">
                    Text Messaging:</td>
                <td width="200px">
                    <asp:TextBox ID="txtText" runat="server" MaxLength="128" 
                        ValidationGroup="validate"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regText0" runat="server" 
                        ControlToValidate="txtText" 
                        ErrorMessage="Enter a ten-digit number for text messaging number." 
                        ForeColor="Red" ToolTip="Enter a ten-digit number for text messaging number." 
                        ValidationExpression="^\d{10}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
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
                <td class="style4" width="200px">
                    Text Messaging Carrier:</td>
                <td width="200px">
                    <asp:DropDownList ID="ddlCarrier" runat="server" DataSourceID="SqlCarriers" 
                        DataTextField="carrierName" DataValueField="carrierID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlCarriers" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
                        
                        SelectCommand="SELECT [carrierID], [carrierName] FROM [Carriers] ORDER BY [carrierName]">
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
                <td class="style4" width="200px">
                    &nbsp;</td>
                <td width="200px">
                    &nbsp;</td>
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
                <td class="style4" width="200px">
                    &nbsp;</td>
                <td width="200px">
                    &nbsp;</td>
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
                <td class="style4" width="200px">
                    &nbsp;</td>
                <td width="200px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td width="125px">
                    &nbsp;</td>
            </tr>
        </table>

    </fieldset></asp:Panel>
    </asp:Content>

