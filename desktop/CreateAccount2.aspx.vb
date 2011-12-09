
Partial Class desktop_CreateAccount2
    Inherits System.Web.UI.Page

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        lblMessage.Text = ""

        'capture data
        Dim strData() As String = {txtFirst.Text, txtLast.Text, txtAddress.Text, txtAddress2.Text, txtAddress3.Text, _
                                  txtCity.Text, ddlStates.SelectedValue, txtZip.Text, ddlCountries.SelectedValue, _
                                   txtPhone.Text, txtSMS.Text, ddlCarriers.SelectedValue}

        'clean data
        For i = 0 To strData.Length - 1
            strData(i).Replace("'", "''")
        Next i

        'build statement
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = "UPDATE Users SET fName = '" & strData(0) & "', lName = '" & strData(1)
        sqlStatement &= "', address = '" & strData(2) & "', addressLn2 = '" & strData(3) & "', addressLn3 = '"
        sqlStatement &= strData(4) & "', city = '" & strData(5) & "', stateCode_FK = '" & strData(6) & "', zip = "
        sqlStatement &= strData(7) & ", base_country_FK = " & strData(8) & ", phone = " & strData(9) & ", sms = "
        sqlStatement &= strData(10) & ", carrierID_FK = " & strData(11) & " WHERE username = '"
        sqlStatement &= Page.User.Identity.Name.ToString.ToLower & "';"

        'update record
        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()
            myCommand.ExecuteNonQuery()
        Catch ex As Exception
            lblMessage.Text = "We're sorry, but we couldn't update your account at this time.<br />" & ex.ToString
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try

        Response.Redirect("~/desktop/account/Account.aspx")

    End Sub
End Class
