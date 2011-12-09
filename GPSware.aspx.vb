
Partial Class GPSware
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'fix drop down value problem
        If Not Page.IsPostBack Then
            For i = 0 To product.Items.Count - 1
                product.Items(i).Value &= "_" & product.Items(i).Text
            Next i


        End If

        'set formDate to current date
        Dim strDate As String
        strDate = DateAndTime.DateString
        formDate.Text = strDate

    End Sub

    Protected Sub cbBill_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbBill.CheckedChanged

        'Copy all shipping cells to billing
        If cbBill.Checked Then
            bName.Text = sName.Text
            bStreet.Text = sStreet.Text
            bCity.Text = sCity.Text
            bState.SelectedIndex = sState.SelectedIndex
            bZip.Text = sZip.Text
        Else
            bName.Text = ""
            bStreet.Text = ""
            bCity.Text = ""
            bState.SelectedIndex = 0
            bZip.Text = ""
        End If

    End Sub

    Protected Sub cbCredit_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbCredit.CheckedChanged

        'Show credit card panel when checked
        If cbCredit.Checked Then
            ccPanel.Visible = True
        Else
            ccPanel.Visible = False
        End If

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        'Clear all user data
        product.SelectedIndex = 0
        qty.SelectedIndex = 0
        sub1.Text = "0.00"
        sub2.Text = "0.00"
        sub3.Text = "0.00"
        shipping.SelectedIndex = -1
        total.Text = "0.00"
        sName.Text = ""
        sStreet.Text = ""
        sState.SelectedIndex = 0
        sCity.Text = ""
        sZip.Text = ""
        cbBill.Checked = False
        cbCredit.Checked = False
        bName.Text = ""
        bStreet.Text = ""
        bCity.Text = ""
        bState.SelectedIndex = 0
        bZip.Text = ""
        cName.Text = ""
        cCard.SelectedIndex = -1
        cNumber.Text = ""
        expMonth.SelectedIndex = 0
        expYear.SelectedIndex = 0
        ccPanel.Visible = False

    End Sub

    Protected Sub product_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles product.SelectedIndexChanged

        'Calculate total for sub1 and sub2
        Dim decTotal, decTemp As Decimal

        If product.SelectedIndex <> 0 And qty.SelectedIndex <> 0 Then
            decTemp = CType(product.SelectedValue.Split("_")(0), Decimal)
            decTotal = decTemp * qty.SelectedValue
            sub1.Text = decTotal.ToString("F2")
            sub2.Text = (decTotal * 0.05D).ToString("F2")
        Else
            sub1.Text = "0.00"
            sub2.Text = "0.00"
            sub3.Text = "0.00"
            shipping.SelectedIndex = -1
        End If

        'Calculate overall total
        total.Text = (Decimal.Parse(sub1.Text) + Decimal.Parse(sub2.Text) + Decimal.Parse(sub3.Text)).ToString

    End Sub

    Protected Sub qty_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles qty.SelectedIndexChanged

        'Calculate total for sub1 and sub2
        Dim decTotal, decTemp As Decimal

        If product.SelectedIndex <> 0 And qty.SelectedIndex <> 0 Then
            decTemp = CType(product.SelectedValue.Split("_")(0), Decimal)
            decTotal = decTemp * qty.SelectedValue
            sub1.Text = decTotal.ToString("F2")
            sub2.Text = (decTotal * 0.05D).ToString("F2")
        Else
            sub1.Text = "0.00"
            sub2.Text = "0.00"
            sub3.Text = "0.00"
            shipping.SelectedIndex = -1
        End If

        'Calculate overall total
        total.Text = (Decimal.Parse(sub1.Text) + Decimal.Parse(sub2.Text) + Decimal.Parse(sub3.Text)).ToString

    End Sub

    Protected Sub shipping_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles shipping.SelectedIndexChanged

        'Calculate total for sub3
        Dim decTotal As Decimal

        If product.SelectedIndex <> 0 And qty.SelectedIndex <> 0 Then
            decTotal = shipping.SelectedValue
            sub3.Text = decTotal.ToString("F2")
        Else
            sub3.Text = "0.00"
            shipping.SelectedIndex = -1
        End If

        'Calculate overall total
        total.Text = (Decimal.Parse(sub1.Text) + Decimal.Parse(sub2.Text) + Decimal.Parse(sub3.Text)).ToString

    End Sub

    Protected Sub productValidate_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles productValidate.ServerValidate

        ''Drop-down validator
        'Make sure a correct option is selected
        Dim strValue As String
        strValue = args.Value.ToString
        If strValue = "0" Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If

    End Sub

    Protected Sub qtyValidate_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles qtyValidate.ServerValidate

        ''Drop-down validator
        'Make sure a correct option is selected
        Dim strValue As String
        strValue = args.Value.ToString
        If strValue = "0" Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If

    End Sub

    Protected Sub sStateValidate_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles sStateValidate.ServerValidate

        ''Drop-down validator
        'Make sure a correct option is selected
        Dim strValue As String
        strValue = args.Value.ToString
        If strValue = "0" Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If

    End Sub

    Protected Sub bStateValidate_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles bStateValidate.ServerValidate

        ''Drop-down validator
        'Make sure a correct option is selected
        Dim strValue As String
        strValue = args.Value.ToString
        If strValue = "0" Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If

    End Sub

    Protected Sub ccMonthValidate_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles ccMonthValidate.ServerValidate

        ''Drop-down validator
        'Make sure a correct option is selected
        Dim strValue As String
        strValue = args.Value.ToString
        If strValue = "0" Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If

    End Sub

    Protected Sub ccYearValidate_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles ccYearValidate.ServerValidate

        ''Drop-down validator
        'Make sure a correct option is selected
        Dim strValue As String
        strValue = args.Value.ToString
        If strValue = "0" Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If

    End Sub

    Protected Sub shippingValidate_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles shippingValidate.ServerValidate

        ''Radio button list validator
        'Make sure a selection is made
        Dim strValue As String
        strValue = args.Value.ToString
        If strValue = "" Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If

    End Sub

    Protected Sub cCardValidate_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles cCardValidate.ServerValidate

        ''Radio button list validator
        'Make sure a selection is made
        Dim strValue As String
        strValue = args.Value.ToString
        If strValue = "" Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click


        If Page.IsValid = True Then
            Server.Transfer("~/GPSwareInvoice.aspx")
        End If

    End Sub
End Class
