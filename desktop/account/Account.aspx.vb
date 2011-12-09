
Partial Class desktop_account_Account
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        lblMessage.Text = ""
        Session("username") = Page.User.Identity.Name.ToLower

        'get user info
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = "SELECT u.fName, u.lName, u.address, u.addressLn2, u.addressLn3, u.city, s.StateName, "
        sqlStatement &= "u.zip, b.name_en, u.phone, u.sms, c.carrierName "
        sqlStatement &= "FROM Users as u JOIN Carriers as c ON u.carrierID_FK = c.carrierID "
        sqlStatement &= "JOIN base_country as b ON u.base_country_FK = b.id JOIN States as s ON u.stateCode_FK = s.StateCode "
        sqlStatement &= "WHERE u.username = '" & Page.User.Identity.Name.ToLower.ToString & "';"

        Dim myCommand As New SqlCommand(sqlStatement, myConnection)
        Dim strFirst, strLast, strAddress, strAddress2, strAddress3, strCity, strState, strZip, strCountry, strPhone, strText, strCarrier As String


        Try

            myConnection.Open()
            Dim myReader As SqlDataReader = myCommand.ExecuteReader
            If myReader.Read Then

                strFirst = myReader("fName").ToString
                strLast = myReader("lName").ToString
                strAddress = myReader("address").ToString
                strAddress2 = myReader("addressLn2").ToString
                strAddress3 = myReader("addressLn3").ToString
                strCity = myReader("city").ToString
                strState = myReader("StateName").ToString
                strZip = myReader("zip").ToString
                strCountry = myReader("name_en").ToString
                strPhone = myReader("phone").ToString
                strText = myReader("sms").ToString
                strCarrier = myReader("carrierName").ToString

            Else
                Throw New Exception
            End If

        Catch ex As Exception
            lblMessage.Text = "We're sorry, but we could not access your user information at this time.<br />" & ex.ToString
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try


        'alter info
        If strAddress2 <> "" Then strAddress2 = strAddress2.Insert(0, "<br />")
        If strAddress3 <> "" Then strAddress3 = strAddress3.Insert(0, "<br />")
        If strPhone <> "" Then strPhone = strPhone.Insert(3, "-")
        If strPhone <> "" Then strPhone = strPhone.Insert(7, "-")
        If strText <> "" Then strText = strText.Insert(3, "-")
        If strText <> "" Then strText = strText.Insert(7, "-")

        'assign to labels
        lblFirst.Text = strFirst
        lblLast.Text = strLast
        lblAddress.Text = strAddress
        lblAddress2.Text = strAddress2
        lblAddress3.Text = strAddress3
        lblCity.Text = strCity
        lblState.Text = strState
        lblZip.Text = strZip
        lblCountry.Text = strCountry
        lblPhone.Text = strPhone
        lblText.Text = strText
        lblCarrier.Text = strCarrier


    End Sub

    Protected Sub btnCart_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCart.Click

        Response.Redirect("~/desktop/Cart.aspx")

    End Sub

    Protected Sub lnkEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkEdit.Click

        pnlViewPersonal.Visible = False
        pnlEditPersonal.Visible = True

        lblMessage.Text = ""

        'get user info
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = "SELECT u.fName, u.lName, u.address, u.addressLn2, u.addressLn3, u.city, s.StateCode, "
        sqlStatement &= "u.zip, b.id, u.phone, u.sms, c.carrierID "
        sqlStatement &= "FROM Users as u JOIN Carriers as c ON u.carrierID_FK = c.carrierID "
        sqlStatement &= "JOIN base_country as b ON u.base_country_FK = b.id JOIN States as s ON u.stateCode_FK = s.StateCode "
        sqlStatement &= "WHERE u.username = '" & Page.User.Identity.Name.ToLower.ToString & "';"

        Dim myCommand As New SqlCommand(sqlStatement, myConnection)
        Dim strFirst, strLast, strAddress, strAddress2, strAddress3, strCity, strState, strZip, strCountry, strPhone, strText, strCarrier As String


        Try

            myConnection.Open()
            Dim myReader As SqlDataReader = myCommand.ExecuteReader
            If myReader.Read Then

                strFirst = myReader("fName").ToString
                strLast = myReader("lName").ToString
                strAddress = myReader("address").ToString
                strAddress2 = myReader("addressLn2").ToString
                strAddress3 = myReader("addressLn3").ToString
                strCity = myReader("city").ToString
                strState = myReader("StateCode").ToString
                strZip = myReader("zip").ToString
                strCountry = myReader("id").ToString
                strPhone = myReader("phone").ToString
                strText = myReader("sms").ToString
                strCarrier = myReader("carrierID").ToString

            Else
                Throw New Exception
            End If

        Catch ex As Exception
            lblMessage.Text = "We're sorry, but we could not access your user information at this time.<br />" & ex.ToString
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try


        'fill text boxes
        txtFirst.Text = strFirst
        txtLast.Text = strLast
        txtAddress.Text = strAddress
        txtAddress2.Text = strAddress2
        txtAddress3.Text = strAddress3
        txtCity.Text = strCity
        txtZip.Text = strZip
        txtPhone.Text = strPhone
        txtText.Text = strText
        ddlState.SelectedValue = strState
        ddlCountry.SelectedValue = strCountry
        ddlCarrier.SelectedValue = strCarrier


    End Sub

    Protected Sub lnkCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkCancel.Click

        'clear data
        txtFirst.Text = ""
        txtLast.Text = ""
        txtAddress.Text = ""
        txtAddress2.Text = ""
        txtAddress3.Text = ""
        txtCity.Text = ""
        txtZip.Text = ""
        txtPhone.Text = ""
        txtText.Text = ""

        pnlEditPersonal.Visible = False
        pnlViewPersonal.Visible = True

    End Sub

    Protected Sub lnkSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkSave.Click

        'update user info
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = "UPDATE Users SET fName = '" & txtFirst.Text & "', lName = '" & txtLast.Text
        sqlStatement &= "', address = '" & txtAddress.Text & "', addressLn2 = '" & txtAddress2.Text & "', addressLn3 = '"
        sqlStatement &= txtAddress3.Text & "', city = '" & txtCity.Text & "', StateCode_FK = '" & ddlState.SelectedValue
        sqlStatement &= "', zip = " & txtZip.Text & ", base_country_FK = " & ddlCountry.SelectedValue & ", phone = "
        sqlStatement &= txtPhone.Text & ", sms = " & txtText.Text & ", carrierID_FK = " & ddlCarrier.SelectedValue
        sqlStatement &= " WHERE username = '" & Page.User.Identity.Name.ToLower.ToString & "';"

        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        Try

            myConnection.Open()
            myCommand.ExecuteNonQuery()

        Catch ex As Exception

            lblMessage.Text = "Your profile could not be updated at this time. Please try again later."
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try

        lnkCancel_Click(sender, e)
        Page_Load(sender, e)

    End Sub
End Class
