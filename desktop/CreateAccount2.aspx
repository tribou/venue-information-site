<%@ Page Title="" Language="VB" MasterPageFile="~/desktop/masterPages/home.master" AutoEventWireup="false" CodeFile="CreateAccount2.aspx.vb" Inherits="desktop_CreateAccount2" %>

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
                    Create Account</h2>
            </td>
            <td width="150px">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td width="150px">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td style="text-align: center">
                Please fill out the rest of this information to complete your registration.</td>
            <td width="150px">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="150px">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td width="150px">
                &nbsp;</td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
        ValidationGroup="validate" />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                First Name:</td>
            <td width="300px">
                <asp:TextBox ID="txtFirst" runat="server" MaxLength="50" TabIndex="1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqFirst" runat="server" 
                        ControlToValidate="txtFirst" ErrorMessage="Enter first name." ForeColor="Red" 
                        ToolTip="Enter first name." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regFirst" runat="server" 
                        ControlToValidate="txtFirst" 
                        ErrorMessage="Enter only letters or numbers for first name." ForeColor="Red" 
                        ToolTip="Enter only letters or numbers for first name." 
                        ValidationExpression="^[\w ]{0,50}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                Last Name:</td>
            <td width="300px">
                <asp:TextBox ID="txtLast" runat="server" MaxLength="50" TabIndex="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqLast" runat="server" 
                        ControlToValidate="txtLast" ErrorMessage="Enter last name." ForeColor="Red" 
                        ToolTip="Enter last name." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regLast" runat="server" 
                        ControlToValidate="txtLast" 
                        ErrorMessage="Enter only letters or numbers for last name." ForeColor="Red" 
                        ToolTip="Enter only letters or numbers for last name." 
                        ValidationExpression="^[\w ]{0,50}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                Address:</td>
            <td width="300px">
                <asp:TextBox ID="txtAddress" runat="server" MaxLength="128" TabIndex="3"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqAddress" runat="server" 
                        ControlToValidate="txtAddress" ErrorMessage="Enter address." ForeColor="Red" 
                        ToolTip="Enter address." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regAddress" runat="server" 
                        ControlToValidate="txtAddress" 
                        ErrorMessage="Enter only letters, numbers, or periods for address." ForeColor="Red" 
                        ToolTip="Enter only letters, numbers, or periods for address." 
                        ValidationExpression="^[\w. ]{0,128}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                Address Line 2:</td>
            <td width="300px">
                <asp:TextBox ID="txtAddress2" runat="server" MaxLength="128" TabIndex="4"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regAddress2" runat="server" 
                        ControlToValidate="txtAddress2" 
                        
                    ErrorMessage="Enter only letters, numbers, or periods for address line 2." ForeColor="Red" 
                        ToolTip="Enter only letters, numbers, or periods for address line 2." 
                        ValidationExpression="^[\w. ]{0,128}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                Address Line 3:</td>
            <td width="300px">
                <asp:TextBox ID="txtAddress3" runat="server" MaxLength="128" TabIndex="5"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regAddress3" runat="server" 
                        ControlToValidate="txtAddress3" 
                        
                    ErrorMessage="Enter only letters, numbers, or periods for address line 3." ForeColor="Red" 
                        ToolTip="Enter only letters, numbers, or periods for address line 3." 
                        ValidationExpression="^[\w. ]{0,128}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                City:</td>
            <td width="300px">
                <asp:TextBox ID="txtCity" runat="server" MaxLength="50" TabIndex="6"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqCity" runat="server" 
                        ControlToValidate="txtCity" ErrorMessage="Enter city." ForeColor="Red" 
                        ToolTip="Enter city." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regCity" runat="server" 
                        ControlToValidate="txtCity" ErrorMessage="Enter only letters for city." 
                        ForeColor="Red" ToolTip="Enter only letters for city." 
                        ValidationExpression="^[a-zA-Z ]{0,50}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                State:</td>
            <td width="300px">
                <asp:DropDownList ID="ddlStates" runat="server" DataSourceID="sqlStates" 
                    DataTextField="StateName" DataValueField="StateCode" TabIndex="7">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlStates" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
                    SelectCommand="SELECT * FROM [States]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                Zip Code:</td>
            <td width="300px">
                <asp:TextBox ID="txtZip" runat="server" MaxLength="5" TabIndex="8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqZip" runat="server" 
                        ControlToValidate="txtZip" ErrorMessage="Enter zip code." ForeColor="Red" 
                        ToolTip="Enter zip code." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regZip" runat="server" 
                        ControlToValidate="txtZip" ErrorMessage="Enter a five-digit zip code." 
                        ForeColor="Red" ToolTip="Enter a five-digit zip code." 
                        ValidationExpression="^\d{5}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                Country:</td>
            <td width="300px">
                <asp:DropDownList ID="ddlCountries" runat="server" DataSourceID="sqlCountries" 
                    DataTextField="name_en" DataValueField="id" TabIndex="9">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlCountries" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
                    SelectCommand="SELECT [id], [name_en] FROM [base_country]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                Phone:</td>
            <td width="300px">
                <asp:TextBox ID="txtPhone" runat="server" MaxLength="10" TabIndex="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqPhone" runat="server" 
                        ControlToValidate="txtPhone" ErrorMessage="Enter phone." ForeColor="Red" 
                        ToolTip="Enter phone." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regPhone" runat="server" 
                        ControlToValidate="txtPhone" ErrorMessage="Enter a ten-digit number for phone." 
                        ForeColor="Red" ToolTip="Enter a ten-digit number for phone." 
                        ValidationExpression="^\d{10}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                Text Messaging Number:</td>
            <td width="300px">
                <asp:TextBox ID="txtSMS" runat="server" MaxLength="10" TabIndex="11"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regText" runat="server" 
                        ControlToValidate="txtSMS" ErrorMessage="Enter a ten-digit number for text messaging number." 
                        ForeColor="Red" ToolTip="Enter a ten-digit number for text messaging number." 
                        ValidationExpression="^\d{10}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                Text Messaging Carrier:</td>
            <td width="300px">
                <asp:DropDownList ID="ddlCarriers" runat="server" DataSourceID="sqlCarriers" 
                    DataTextField="carrierName" DataValueField="carrierID" TabIndex="12">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlCarriers" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EBUS2ConnectionString %>" 
                    SelectCommand="SELECT [carrierID], [carrierName] FROM [Carriers] ORDER BY [carrierName]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                &nbsp;</td>
            <td width="300px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3" width="300px">
                &nbsp;</td>
            <td width="300px">
                <asp:Button ID="btnContinue" runat="server" Text="Continue" 
                    ValidationGroup="validate" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

