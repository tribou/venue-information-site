<%@ Page Title="" Language="VB" MasterPageFile="~/Master/Main.master" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
            </td>
            <td style="text-align: right; width: 400px;" width="200px">
                <asp:RadioButtonList ID="rblRegister" runat="server" AutoPostBack="True" 
                    style="text-align: left">
        <asp:ListItem Value="0">New Organization</asp:ListItem>
        <asp:ListItem Value="1">Returning Organization</asp:ListItem>
    </asp:RadioButtonList>

            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">

    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

            </td>
        </tr>
    </table>

    <asp:Panel ID="pnlExistingOrg" runat="server" Visible="False">
    <fieldset>
    <legend>Select an Existing Organization</legend>



        <table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td width="300px">
                    &nbsp;</td>
                <td width="300px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="text-align: right" width="300px">
                    Organization:</td>
                <td width="300px">
                    <asp:DropDownList ID="ddlOrganizations" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlOrganizations" DataTextField="orgName" DataValueField="orgID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlOrganizations" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CIS407_AtribouConnectionString %>" 
                        SelectCommand="SELECT [orgID], [orgName] FROM [Organizations]">
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>



        <br />
        <asp:DetailsView ID="dvwExistingOrg" runat="server" Height="50px" Width="125px" 
            AutoGenerateRows="False" DataKeyNames="orgID" DataSourceID="SqlOrgAll" 
            Visible="False" 
            style="position:relative; margin-left:auto; margin-right:auto;" 
            BorderStyle="None" GridLines="None" CellSpacing="2">
            <Fields>
                <asp:BoundField DataField="orgID" HeaderText="orgID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="orgID" Visible="False" />
                <asp:BoundField DataField="orgName" HeaderText="Name:" 
                    SortExpression="orgName" />
                <asp:BoundField DataField="orgAddress" HeaderText="Address:" 
                    SortExpression="orgAddress" />
                <asp:BoundField DataField="orgCity" HeaderText="City:" 
                    SortExpression="orgCity" />
                <asp:BoundField DataField="stateCode" HeaderText="State:" 
                    SortExpression="stateCode" />
                <asp:BoundField DataField="orgZip" HeaderText="Zip:" SortExpression="orgZip" />
                <asp:BoundField DataField="orgPhone" HeaderText="Phone:" 
                    SortExpression="orgPhone" />
                <asp:BoundField DataField="orgEmail" HeaderText="Email:" 
                    SortExpression="orgEmail" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlOrgAll" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CIS407_AtribouConnectionString %>" 
            SelectCommand="SELECT * FROM [Organizations] WHERE ([orgID] = @orgID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlOrganizations" Name="orgID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="text-align: center">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="text-align: center">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="text-align: center; font-size: smaller;">
                    *If any information is incorrect, please register as a new organization.</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="text-align: center">
                    <asp:Button ID="btnAddTeams" runat="server" Enabled="False" Text="Add Teams" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />



    </fieldset>
    </asp:Panel>

    <asp:Panel ID="pnlNewOrg" runat="server" Visible="False">
    <fieldset>
    <legend>Register a New Organization</legend>
    


        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
            ValidationGroup="validate" />
    


        <table class="style1">
            <tr>
                <td style="text-align: right">
                    &nbsp;</td>
                <td style="text-align: center; width: 400px;" width="200px" colspan="2">
                    <h4>
                        Organization
                    </h4>
                </td>
                <td>
                    &nbsp;</td>
                <td style="text-align: center; width: 400px;" width="200px" colspan="2">
                    <h4>
                        Contact Person
                    </h4>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right">
                    &nbsp;</td>
                <td colspan="2" style="text-align: center; width: 400px;" width="200px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    &nbsp;</td>
                <td width="200px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right">
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    Name:</td>
                <td width="200px">
                    <asp:TextBox ID="txtOrg" runat="server" TabIndex="1" MaxLength="128"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqOrg" runat="server" 
                        ControlToValidate="txtOrg" ErrorMessage="Enter an organization name." 
                        ForeColor="Red" ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regOrg" runat="server" 
                        ControlToValidate="txtOrg" 
                        ErrorMessage="Enter only letters or numbers for organization name." 
                        ForeColor="Red" ValidationExpression="^[\w ]{0,128}$" 
                        ValidationGroup="validate">*</asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    Name:</td>
                <td width="200px">
                    <asp:TextBox ID="txtName" runat="server" TabIndex="8" MaxLength="128"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqContact" runat="server" 
                        ControlToValidate="txtName" ErrorMessage="Enter a contact name." 
                        ForeColor="Red" ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regOrg5" runat="server" 
                        ControlToValidate="txtName" 
                        ErrorMessage="Enter only letters or numbers for contact name." ForeColor="Red" 
                        ValidationExpression="^[\w ]{0,128}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right">
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    Address:</td>
                <td width="200px">
                    <asp:TextBox ID="txtOrgAdd" runat="server" TabIndex="2" MaxLength="128"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqOrg0" runat="server" 
                        ControlToValidate="txtOrgAdd" ErrorMessage="Enter an organization address." 
                        ForeColor="Red" ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regOrg0" runat="server" 
                        ControlToValidate="txtOrgAdd" 
                        ErrorMessage="Enter only letters or numbers for organization address." 
                        ForeColor="Red" ValidationExpression="^[\w ]{0,128}$" 
                        ValidationGroup="validate">*</asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    Address:</td>
                <td width="200px">
                    <asp:TextBox ID="txtAddress" runat="server" TabIndex="9" MaxLength="128"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqContact0" runat="server" 
                        ControlToValidate="txtAddress" ErrorMessage="Enter a contact address." 
                        ForeColor="Red" ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regOrg6" runat="server" 
                        ControlToValidate="txtAddress" 
                        ErrorMessage="Enter only letters or numbers for contact address." 
                        ForeColor="Red" ValidationExpression="^[\w ]{0,128}$" 
                        ValidationGroup="validate">*</asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right">
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    City:</td>
                <td width="200px">
                    <asp:TextBox ID="txtOrgCity" runat="server" TabIndex="3" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqOrg1" runat="server" 
                        ControlToValidate="txtOrgCity" ErrorMessage="Enter an organization city." 
                        ForeColor="Red" ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regOrg1" runat="server" 
                        ControlToValidate="txtOrgCity" 
                        ErrorMessage="Enter only letters or numbers for organization city." 
                        ForeColor="Red" ValidationExpression="^[\w ]{0,50}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    City:</td>
                <td width="200px">
                    <asp:TextBox ID="txtCity" runat="server" TabIndex="10" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqContact1" runat="server" 
                        ControlToValidate="txtCity" ErrorMessage="Enter a contact city." 
                        ForeColor="Red" ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regOrg7" runat="server" 
                        ControlToValidate="txtCity" 
                        ErrorMessage="Enter only letters or numbers for contact city." ForeColor="Red" 
                        ValidationExpression="^[\w ]{0,50}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right">
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    State:</td>
                <td width="200px">
                    <asp:DropDownList ID="ddlStates2" runat="server" DataSourceID="SqlStates" 
                        DataTextField="StateName" DataValueField="StateCode" TabIndex="4">
                    </asp:DropDownList>
                        
                    <asp:RequiredFieldValidator ID="reqOrg5" runat="server" 
                        ControlToValidate="ddlStates2" ErrorMessage="Select an organization state." 
                        ForeColor="Red" InitialValue="Select a State..." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                        
                </td>
                <td>
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    State:</td>
                <td width="200px">
                    <asp:DropDownList ID="ddlStates" runat="server" DataSourceID="SqlStates" 
                        DataTextField="StateName" DataValueField="StateCode" TabIndex="11">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="reqOrg6" runat="server" 
                        ControlToValidate="ddlStates" ErrorMessage="Select a contact state." 
                        ForeColor="Red" InitialValue="Select a State..." ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlStates" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CIS407_AtribouConnectionString %>" 
                        SelectCommand="SELECT * FROM [States]"></asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right">
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    Zip:</td>
                <td width="200px">
                    <asp:TextBox ID="txtOrgZip" runat="server" TabIndex="5" MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqOrg2" runat="server" 
                        ControlToValidate="txtOrgZip" ErrorMessage="Enter an organization zip code." 
                        ForeColor="Red" ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regOrg2" runat="server" 
                        ControlToValidate="txtOrgZip" 
                        ErrorMessage="Enter a five-digit number for organization zip code." 
                        ForeColor="Red" ValidationExpression="^\d{5}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    Zip:</td>
                <td width="200px">
                    <asp:TextBox ID="txtZip" runat="server" TabIndex="12" MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqContact2" runat="server" 
                        ControlToValidate="txtZip" ErrorMessage="Enter a contact zip code." 
                        ForeColor="Red" ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regOrg8" runat="server" 
                        ControlToValidate="txtZip" 
                        ErrorMessage="Enter a five-digit number for contact zip code." ForeColor="Red" 
                        ValidationExpression="^\d{5}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right">
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    Phone:</td>
                <td width="200px">
                    <asp:TextBox ID="txtOrgPhone" runat="server" TabIndex="6" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqOrg3" runat="server" 
                        ControlToValidate="txtOrgPhone" ErrorMessage="Enter an organization phone." 
                        ForeColor="Red" ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regOrg3" runat="server" 
                        ControlToValidate="txtOrgPhone" 
                        ErrorMessage="Enter a ten-digit number for organization phone." ForeColor="Red" 
                        ValidationExpression="^\d{10}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    Phone:</td>
                <td width="200px">
                    <asp:TextBox ID="txtPhone" runat="server" TabIndex="13" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqContact3" runat="server" 
                        ControlToValidate="txtPhone" ErrorMessage="Enter a contact phone." 
                        ForeColor="Red" ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regOrg9" runat="server" 
                        ControlToValidate="txtPhone" 
                        ErrorMessage="Enter a ten-digit number for contact phone." ForeColor="Red" 
                        ValidationExpression="^\d{10}$" ValidationGroup="validate">*</asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right">
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    Email:</td>
                <td width="200px">
                    <asp:TextBox ID="txtOrgEmail" runat="server" TabIndex="7" MaxLength="128"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqOrg4" runat="server" 
                        ControlToValidate="txtOrgEmail" ErrorMessage="Enter an organization email." 
                        ForeColor="Red" ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regOrg4" runat="server" 
                        ControlToValidate="txtOrgEmail" 
                        ErrorMessage="Enter a valid organization email." ForeColor="Red" 
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="validate">*</asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    Email:</td>
                <td width="200px">
                    <asp:TextBox ID="txtEmail" runat="server" TabIndex="14" MaxLength="128"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqContact4" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Enter a contact email." 
                        ForeColor="Red" ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regOrg10" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Enter a valid contact email." 
                        ForeColor="Red" 
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="validate">*</asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right">
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    &nbsp;</td>
                <td style="text-align: right" width="200px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="text-align: left" width="100px">
                    &nbsp;</td>
                <td width="200px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right">
                    &nbsp;</td>
                <td style="text-align: right" width="100px">
                    &nbsp;</td>
                <td style="text-align: right" width="200px">
                    <asp:Button ID="btnSubmit" runat="server" TabIndex="15" Text="Submit" 
                        ValidationGroup="validate" Width="100px" />
                </td>
                <td>
                    &nbsp;</td>
                <td style="text-align: left" width="100px">
                    <asp:Button ID="btnReset" runat="server" TabIndex="16" Text="Reset Form" />
                </td>
                <td width="200px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>

    </fieldset>
    </asp:Panel>


</asp:Content>

