<%@ Page Language="VB" AutoEventWireup="false" CodeFile="GPSwareInvoice.aspx.vb" Inherits="GPSwareInvoice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GPSware Order Invoice</title>
    <link href="GPSware.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="invoice" runat="server">
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

        	<h1>Invoice</h1>

            <h3>GPS-ware<br />
               <span style="font-size: 16px; font-style: italic">For All Your Location Needs</span></h3>
        <p style="font-size:14px">1234 Main Street<br />
            New York, NY 10026<br />
            Phone: (123) 456-7890<br />
            Fax: (123) 456-7891
               </p>
            <table class="style1">
                <tr>
                    <td style="font-weight: 700" width="80px">
                        Date:</td>
                    <td>
                        <asp:Label ID="lblDate" runat="server"></asp:Label>
                    </td>
                    <td width="80px">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="font-weight: 700" width="80px">
                        Invoice #:</td>
                    <td>
                        <asp:Label ID="lblInvoice" runat="server"></asp:Label>
                    </td>
                    <td width="80px">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="80px">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td width="80px">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="font-weight: 700" width="80px">
                        Bill To:</td>
                    <td>
                        <asp:Label ID="lblBill" runat="server"></asp:Label>
                    </td>
                    <td style="font-weight: 700" width="80px">
                        Ship To:</td>
                    <td>
                        <asp:Label ID="lblShip" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
 

        <table class="style3" border="1">
            <tr>
                <td bgcolor="#CCCCCC" colspan="4" style="font-weight: 700">
                    DESCRIPTION</td>
                <td bgcolor="#CCCCCC" style="font-weight: 700" width="100px">
                    TOTAL<br />
                    AMOUNT($)</td>
            </tr>
            <tr>
                <td class="style4" style="font-weight: 700" width="80px">
                    Item #</td>
                <td class="style4" style="font-weight: 700" width="400px">
                    Description</td>
                <td class="style4" style="font-weight: 700" width="80px">
                    Quantity</td>
                <td class="style4" style="font-weight: 700" width="90px">
                    Unit Price($)</td>
                <td bgcolor="#CCCCCC" width="100px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="80px">
                    &nbsp;</td>
                <td width="400px">
                    &nbsp;</td>
                <td width="80px">
                    &nbsp;</td>
                <td width="90px">
                    &nbsp;</td>
                <td width="100px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="80px" style="text-align: left">
                    &nbsp;<asp:Label ID="lblItem" runat="server"></asp:Label>
                </td>
                <td width="400px">
                    <asp:Label ID="lblDescription" runat="server"></asp:Label>
                </td>
                <td style="text-align: right" width="80px">
                    <asp:Label ID="lblQty" runat="server"></asp:Label>
                </td>
                <td style="text-align: right" width="90px">
                    <asp:Label ID="lblUnitPrice" runat="server"></asp:Label>
                </td>
                <td style="text-align: right" width="100px">
                    <asp:Label ID="lblUnitTotal" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="80px">
                    &nbsp;</td>
                <td width="400px">
                    &nbsp;</td>
                <td width="80px">
                    &nbsp;</td>
                <td width="90px">
                    &nbsp;</td>
                <td width="100px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" rowspan="5">
                    <span style="font-weight: 700">Paid By:</span>
                    <asp:Label ID="lblCard" runat="server"></asp:Label>
                </td>
                <td class="style2" width="90px">
                    SUBTOTAL:</td>
                <td style="text-align: right" width="100px" bgcolor="#CCCCCC">
                    <asp:Label ID="lblSubtotal" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" style="font-style: italic" width="90px">
                    TAX RATE:<br />
                    </td>
                <td style="text-align: right" width="100px">
                    <asp:Label ID="lblRate" runat="server" Text="5%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" width="90px">
                    SALES TAX:</td>
                <td style="text-align: right" width="100px" bgcolor="#CCCCCC">
                    <asp:Label ID="lblSalesTax" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" width="90px">
                    SHIPPING:</td>
                <td style="text-align: right" width="100px">
                    <asp:Label ID="lblShipping" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" width="90px">
                    TOTAL:</td>
                <td style="text-align: right" width="100px" bgcolor="#CCCCCC">
                    <asp:Label ID="lblTotal" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnBack" runat="server" Text="Go Back" PostBackUrl="~/GPSware.aspx" />

        </div>
        </div>
    </form>
</body>
</html>
