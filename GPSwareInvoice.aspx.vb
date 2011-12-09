
Partial Class GPSwareInvoice
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


            'get date
            Dim strDate As String
        strDate = CType(Page.PreviousPage.FindControl("formDate"), TextBox).Text
            lblDate.Text = strDate

            'get invoice #
            Dim strInv As String
        strInv = DateAndTime.TimeOfDay.Hour.ToString.PadLeft(2, CChar("0"))
        strInv &= DateAndTime.TimeOfDay.Minute.ToString.PadLeft(2, CChar("0"))
        strInv &= DateAndTime.TimeOfDay.Second.ToString.PadLeft(2, CChar("0"))
        lblInvoice.Text = strInv

            'get bill to:
            Dim strBill, strName, strStreet, strCityState As String
            strName = CType(PreviousPage.FindControl("bName"), TextBox).Text
            strStreet = CType(PreviousPage.FindControl("bStreet"), TextBox).Text
            strCityState = CType(PreviousPage.FindControl("bCity"), TextBox).Text & ", "
            strCityState &= CType(PreviousPage.FindControl("bState"), DropDownList).SelectedValue.ToString & " "
            strCityState &= CType(PreviousPage.FindControl("bZip"), TextBox).Text
            strBill = strName & " <br />" & strStreet & " <br />" & strCityState
            lblBill.Text = strBill

            'get ship to:
            Dim strShip, sName, sStreet, sCityState As String
            sName = CType(PreviousPage.FindControl("sName"), TextBox).Text
            sStreet = CType(PreviousPage.FindControl("sStreet"), TextBox).Text
            sCityState = CType(PreviousPage.FindControl("sCity"), TextBox).Text & ", "
            sCityState &= CType(PreviousPage.FindControl("sState"), DropDownList).SelectedValue.ToString & " "
            sCityState &= CType(PreviousPage.FindControl("sZip"), TextBox).Text
            strShip = sName & " <br />" & sStreet & " <br />" & sCityState
            lblShip.Text = strShip

        'get item #
        lblItem.Text = CType(PreviousPage.FindControl("product"), DropDownList).SelectedIndex.ToString

            'get description
            lblDescription.Text = CType(PreviousPage.FindControl("product"), DropDownList).SelectedItem.ToString

            'get quantity
            lblQty.Text = CType(PreviousPage.FindControl("qty"), DropDownList).SelectedValue.ToString

        'get unit price
        Dim strProduct As String
        strProduct = CType(PreviousPage.FindControl("product"), DropDownList).SelectedValue.ToString
        lblUnitPrice.Text = CType(strProduct.Split("_")(0), String)

            'get total for unit price * quantity
            lblUnitTotal.Text = CType(PreviousPage.FindControl("sub1"), TextBox).Text

        'get card type
        Dim txtCard As String
        Try
            txtCard = CType(PreviousPage.FindControl("cCard"), RadioButtonList).SelectedItem.ToString
            lblCard.Text = txtCard
        Catch ex As Exception
            lblCard.Text = "N/A"
        End Try

        'get subtotal
        lblSubtotal.Text = lblUnitTotal.Text

        'get sales tax
        lblSalesTax.Text = CType(PreviousPage.FindControl("sub2"), TextBox).Text

        'get shipping
        lblShipping.Text = CType(PreviousPage.FindControl("sub3"), TextBox).Text

        'get total
        Dim strTotal As String
        strTotal = CType(PreviousPage.FindControl("total"), TextBox).Text
        strTotal.Insert(0, "$")
        lblTotal.Text = strTotal

    End Sub
End Class
