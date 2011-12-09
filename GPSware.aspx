<%@ Page Language="VB" AutoEventWireup="false" CodeFile="GPSware.aspx.vb" Inherits="GPSware" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GPS-ware</title>
    <link href="GPSware.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="order" runat="server">

<div id="container">

	<div id="left_col">
	<h2>Links</h2>
	<br />
	Home Page<br />
		Product Catalog<br />
		Order Form<br />
		Maps Online<br />
		Contact Us<br />
		<br />
		Countries<br />
		States<br />
		National Parks<br />
		Hiking Trails<br />
		Cities<br />
		Astronimical<br />
		Natural<br />
		<br />
		GoMap 1.0<br />
		Drive Planner 2.0<br />
		Hiker 1.0<br />
		G-Receiver I<br />
		G-Receiver II<br />
		G-Receiver III<br />
		<br />
		Downloads<br />
		Tech Support<br />
		FAQs</div>

	<div id="page_content">
		<div id="banner">
	<img src="gpsware.jpg" alt="GPSware logo" />
	</div>
		<hr />
        <div id="date" style="text-align: right">
    &nbsp;Date: 
            <asp:TextBox ID="formDate" runat="server" Width="80px" 
                ReadOnly="True" style="text-align: right"></asp:TextBox>
    </div>
	<h1>Order Form</h1>
    
	    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            BackColor="#FFFF99" ForeColor="Red" 
            
            
            
            HeaderText="ERROR SUMMARY &lt;br /&gt;Before the form can be submitted, the following items must be fixed:" 
            ClientIDMode="Static" />
    
	<fieldset>
        <legend>Select a Product</legend>
        
        <table class="style1">
            <tr>
                <td width="100px">
                    Product:<asp:CustomValidator 
                        ID="productValidate" runat="server" ControlToValidate="product" 
                        Display="Dynamic" EnableClientScript="False" 
                        ErrorMessage="Product selection is required." ForeColor="Red">*</asp:CustomValidator>
                </td>
                <td>
                    <asp:DropDownList ID="product" runat="server" AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="0">Products from GPS-ware</asp:ListItem>
                        <asp:ListItem Value="19.95">GoMap 1.0</asp:ListItem>
                        <asp:ListItem Value="29.95">Drive Planner 2.0</asp:ListItem>
                        <asp:ListItem Value="29.95">Hiker 1.0</asp:ListItem>
                        <asp:ListItem Value="149.50">G-Receiver I</asp:ListItem>
                        <asp:ListItem Value="199.50">G-Receiver II</asp:ListItem>
                        <asp:ListItem Value="249.50">G-Receiver III</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;<asp:DropDownList ID="qty" runat="server" AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="0">Quantity</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CustomValidator ID="qtyValidate" runat="server" ControlToValidate="qty" 
                        CssClass="verticalAlign" Display="Dynamic" EnableClientScript="False" 
                        ErrorMessage="Quantity selection is required." ForeColor="Red">*</asp:CustomValidator>
                </td>
                <td align="right" class="style2">
                    <asp:TextBox ID="sub1" runat="server" ReadOnly="True" style="text-align: right" 
                        Width="80px">0.00</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="100px">
                    Tax (5%):</td>
                <td>
                    &nbsp;</td>
                <td align="right" class="style2">
                    <asp:TextBox ID="sub2" runat="server" ReadOnly="True" style="text-align: right" 
                        Width="80px">0.00</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td valign="top" width="100px">
                    Shipping:<asp:CustomValidator 
                        ID="shippingValidate" runat="server" ControlToValidate="shipping" 
                        Display="Dynamic" EnableClientScript="False"
                        ErrorMessage="Shipping selection is required." ForeColor="Red" 
                        ValidateEmptyText="True">*</asp:CustomValidator>
                </td>
                <td>
                    <asp:RadioButtonList ID="shipping" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="7.95">Standard (3-5 days): $7.95</asp:ListItem>
                        <asp:ListItem Value="9.95">Express (2 days): $9.95</asp:ListItem>
                        <asp:ListItem Value="12.95">Next Day (1 day): $12.95</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td align="right" class="style2" valign="top">
                    <asp:TextBox ID="sub3" runat="server" ReadOnly="True" style="text-align: right" 
                        Width="80px">0.00</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td align="right" class="style2">
                    
                    <span class="style5">
                    
                    <strong>TOTAL:</strong></span>
                    <asp:TextBox ID="total" runat="server" ReadOnly="True" 
                        style="text-align: right" Width="80px">0.00</asp:TextBox>
                </td>
            </tr>
        </table>
        
        </fieldset>
        <fieldset>
            <legend>Shipping Address</legend>
            
            <table class="style1">
                <tr>
                    <td width="100px">
                        Name:<asp:RequiredFieldValidator 
                            ID="sNameValidate" runat="server" ControlToValidate="sName" Display="Dynamic" 
                            EnableClientScript="False" ErrorMessage="Shipping name is required." 
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="sName" runat="server" Width="307px" 
                            MaxLength="50" Font-Names="Courier New"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top" width="100px">
                        Street:<asp:RequiredFieldValidator 
                            ID="sStreetValidate" runat="server" ControlToValidate="sStreet" 
                            Display="Dynamic" EnableClientScript="False" 
                            ErrorMessage="Shipping street address is required." ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="sStreet" runat="server" Height="50px" TextMode="MultiLine" 
                            Width="427px" Font-Names="Courier New"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="100px">
                        City:<asp:RequiredFieldValidator 
                            ID="sCityValidate" runat="server" ControlToValidate="sCity" Display="Dynamic" 
                            EnableClientScript="False" ErrorMessage="Shipping city is required." 
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="sCity" runat="server" Width="225px" 
                            Font-Names="Courier New"></asp:TextBox>
&nbsp;State:<asp:CustomValidator ID="sStateValidate" runat="server" ControlToValidate="sState" 
                            Display="Dynamic" EnableClientScript="False" 
                            ErrorMessage="Shipping state is required." ForeColor="Red">*</asp:CustomValidator>
&nbsp;<asp:DropDownList ID="sState" runat="server">
                            <asp:ListItem Value="0">State</asp:ListItem>
                            <asp:ListItem>AL</asp:ListItem>
                            <asp:ListItem>AK</asp:ListItem>
                            <asp:ListItem>IL</asp:ListItem>
                            <asp:ListItem>IN</asp:ListItem>
                            <asp:ListItem>KY</asp:ListItem>
                            <asp:ListItem>MO</asp:ListItem>
                            <asp:ListItem>TN</asp:ListItem>
                        </asp:DropDownList>
&nbsp;Zip:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="sZip" EnableClientScript="False" 
                            ErrorMessage="Shipping zip code (5-digit) is required." ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="sZipValidate" runat="server" ControlToValidate="sZip" 
                            Display="Dynamic" EnableClientScript="False" 
                            ErrorMessage="Shipping zip code (5-digit) is required." ForeColor="Red" 
                            ValidationExpression="^\d{5}$">*</asp:RegularExpressionValidator>
&nbsp;<asp:TextBox ID="sZip" runat="server" MaxLength="5" Width="80px" 
                            Font-Names="Courier New"></asp:TextBox>
                    </td>
                </tr>
            </table>
            
            </fieldset>
            <fieldset>
                <legend>Billing Address</legend>
                
            <table class="style1">
                <tr>
                    <td colspan="2">
                        <asp:CheckBox ID="cbBill" runat="server" Text="Same as Shipping Address" 
                            AutoPostBack="True" />
&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="cbCredit" runat="server" 
                            Text="Bill me now with my credit card" AutoPostBack="True" />
                    </td>
                </tr>
                <tr>
                    <td width="100px">
                        Name:<asp:RequiredFieldValidator 
                            ID="bNameValidate" runat="server" ControlToValidate="bName" Display="Dynamic" 
                            EnableClientScript="False" ErrorMessage="Billing name is required." 
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="bName" runat="server" Width="307px" 
                            MaxLength="50" Font-Names="Courier New"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top" width="100px">
                        Street:<asp:RequiredFieldValidator 
                            ID="bStreetValidate" runat="server" ControlToValidate="bStreet" 
                            Display="Dynamic" EnableClientScript="False" 
                            ErrorMessage="Billing street address is required." ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="bStreet" runat="server" Height="50px" TextMode="MultiLine" 
                            Width="427px" Font-Names="Courier New"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="100px">
                        City:<asp:RequiredFieldValidator 
                            ID="bCityValidate" runat="server" ControlToValidate="bCity" Display="Dynamic" 
                            EnableClientScript="False" ErrorMessage="Billing city is required." 
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="bCity" runat="server" Width="225px" 
                            Font-Names="Courier New"></asp:TextBox>
&nbsp;State:<asp:CustomValidator ID="bStateValidate" runat="server" ControlToValidate="bState" 
                            Display="Dynamic" EnableClientScript="False" 
                            ErrorMessage="Billing state is requried." ForeColor="Red">*</asp:CustomValidator>
&nbsp;<asp:DropDownList ID="bState" runat="server">
                            <asp:ListItem Value="0">State</asp:ListItem>
                            <asp:ListItem>AL</asp:ListItem>
                            <asp:ListItem>AK</asp:ListItem>
                            <asp:ListItem>IL</asp:ListItem>
                            <asp:ListItem>IN</asp:ListItem>
                            <asp:ListItem>KY</asp:ListItem>
                            <asp:ListItem>MO</asp:ListItem>
                            <asp:ListItem>TN</asp:ListItem>
                        </asp:DropDownList>
&nbsp;Zip:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="bZip" EnableClientScript="False" 
                            ErrorMessage="Billing zip code (5-digit) required." ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="bZipValidate" runat="server" ControlToValidate="bZip" 
                            Display="Dynamic" EnableClientScript="False" 
                            ErrorMessage="Billing zip code (5-digit) is required." ForeColor="Red" 
                            ValidationExpression="^\d{5}$">*</asp:RegularExpressionValidator>
&nbsp;<asp:TextBox ID="bZip" runat="server" MaxLength="5" Width="80px" 
                            Font-Names="Courier New"></asp:TextBox>
                    </td>
                </tr>
            </table>
            
                </fieldset>
        <asp:Panel ID="ccPanel" runat="server" Visible="False">
        <fieldset>
            <legend>Credit Card Information</legend>
            
            <table class="style1">
                <tr>
                    <td width="100px">
                        Name:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="cName" EnableClientScript="False" 
                            ErrorMessage="Name on credit card is required." ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="cName" runat="server" Width="307px" 
                            Font-Names="Courier New"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top" width="100px">
                        Card:<asp:CustomValidator ID="cCardValidate" runat="server" 
                            ControlToValidate="cCard" Display="Dynamic" EnableClientScript="False" 
                            ErrorMessage="Credit card type is required." ForeColor="Red" 
                            ValidateEmptyText="True">*</asp:CustomValidator>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="cCard" runat="server" RepeatColumns="3" 
                            Width="425px">
                            <asp:ListItem Value="amex">American Express</asp:ListItem>
                            <asp:ListItem Value="citi">CitiBank</asp:ListItem>
                            <asp:ListItem Value="diners">Diner&#39;s Club</asp:ListItem>
                            <asp:ListItem Value="disco">Discover</asp:ListItem>
                            <asp:ListItem Value="master">MasterCard</asp:ListItem>
                            <asp:ListItem Value="visa">Visa</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td width="100px">
                        Number:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="cNumber" EnableClientScript="False" 
                            ErrorMessage="Credit card number (16 digits, numbers only) is required." 
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="ccNumberValidate" runat="server" 
                            ControlToValidate="cNumber" Display="Dynamic" EnableClientScript="False" 
                            ErrorMessage="Credit card number (16 digits, numbers only) is required." 
                            ForeColor="Red" ValidationExpression="^\d{16}$">*</asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="cNumber" runat="server" Width="225px" 
                            MaxLength="16" Font-Names="Courier New"></asp:TextBox>
                        &nbsp;Expiration:<asp:CustomValidator ID="ccMonthValidate" runat="server" 
                            ControlToValidate="expMonth" Display="Dynamic" EnableClientScript="False" 
                            ErrorMessage="Credit card expiration month is required." ForeColor="Red">*</asp:CustomValidator>
                        &nbsp;<asp:DropDownList ID="expMonth" runat="server">
                            <asp:ListItem Selected="True" Value="0">MM</asp:ListItem>
                            <asp:ListItem>01</asp:ListItem>
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem>04</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>09</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;/ <asp:DropDownList ID="expYear" runat="server">
                            <asp:ListItem Value="0">YYYY</asp:ListItem>
                            <asp:ListItem>2011</asp:ListItem>
                            <asp:ListItem>2012</asp:ListItem>
                            <asp:ListItem>2013</asp:ListItem>
                            <asp:ListItem>2014</asp:ListItem>
                            <asp:ListItem>2015</asp:ListItem>
                        </asp:DropDownList>
                        <asp:CustomValidator ID="ccYearValidate" runat="server" 
                            ControlToValidate="expYear" CssClass="verticalAlign" Display="Dynamic" 
                            EnableClientScript="False" 
                            ErrorMessage="Credit card expiration year is required." ForeColor="Red">*</asp:CustomValidator>
                    </td>
                </tr>
            </table>
            
            </fieldset>
        </asp:Panel>
        <div id="buttons">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Order" />
	&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" 
                CausesValidation="False" UseSubmitBehavior="False" /></div>
	</div>
</div>


</form>
</body>
</html>
