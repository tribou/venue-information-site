
Partial Class desktop_account_Checkout
    Inherits System.Web.UI.Page

    Dim dtCart As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = "SELECT u.fName, u.lName, u.address, u.addressLn2, u.addressLn3, "
        sqlStatement &= "u.city, u.stateCode_FK, u.zip, c.name_en "
        sqlStatement &= "FROM Users as u JOIN States as s ON u.stateCode_FK = s.StateCode "
        sqlStatement &= "JOIN base_country as c ON u.base_country_FK = c.id WHERE u.username = '"
        sqlStatement &= Page.User.Identity.Name.ToLower & "';"

        Dim strLabel As String = ""
        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()
            Dim myReader As SqlDataReader = myCommand.ExecuteReader

            If myReader.Read Then

                strLabel = myReader("fName").ToString & " "
                strLabel &= myReader("lName").ToString & "<br />"
                strLabel &= myReader("address").ToString & "<br />"
                If Not String.IsNullOrWhiteSpace(myReader("addressLn2")) Then
                    strLabel &= myReader("addressLn2").ToString & "<br />"
                End If
                If Not String.IsNullOrWhiteSpace(myReader("addressLn3")) Then
                    strLabel &= myReader("addressLn3").ToString & "<br />"
                End If
                strLabel &= myReader("city").ToString & ", "
                strLabel &= myReader("stateCode_FK").ToString & " "
                strLabel &= myReader("zip").ToString & "<br />"
                strLabel &= myReader("name_en").ToString

            End If

        Catch ex As Exception
            lblAddress.Text = "Could not connect to database at this time.<br />" & ex.ToString
            Exit Sub
        End Try

        lblAddress.Text = strLabel

        dtCart = Session("dtCart")
        Dim strOrder As String = ""
        Dim decTot As Decimal = 0

        For i = 0 To dtCart.Rows.Count - 1
            strOrder &= "<tr><td width=""150px"">&nbsp;</td><td>"
            strOrder &= dtCart.Rows(i)("Store") & "&nbsp;</td><td class=""style6"">"
            strOrder &= dtCart.Rows(i)("Name") & "&nbsp;</td><td class=""style5"">"
            Dim decPrice As Decimal = CType(dtCart.Rows(i)("Price"), Decimal)
            strOrder &= decPrice.ToString("C") & "&nbsp;</td><td class=""style3"" width=""80px"">"
            Dim decQty As Decimal = CType(dtCart.Rows(i)("Quantity"), Decimal)
            strOrder &= decQty.ToString("N0") & "&nbsp;</td><td class=""style5"">"
            Dim decTotal As Decimal = decPrice * decQty
            decTot += decTotal
            strOrder &= decTotal.ToString("C") & "&nbsp;</td><td width=""150px"">&nbsp;</td></tr>"
        Next i

        lblOrder.Text = strOrder

        lblSubTotal.Text = decTot.ToString("C")

        lblShip.Text = "$10.95"

        lblTotal.Text = (10.95D + decTot).ToString("C")

    End Sub

    Protected Sub btnShop_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShop.Click

        Response.Redirect("~/desktop/Cart.aspx")

    End Sub

    Protected Sub btnPayment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayment.Click

        'save order
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = "EXEC procInsertOrder '" & Page.User.Identity.Name.ToLower
        sqlStatement &= "', true, null;"

        Dim strOrderID As String = ""
        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()
            Dim myReader As SqlDataReader = myCommand.ExecuteReader
            If myReader.HasRows Then
                If myReader.Read Then
                    strOrderID = myReader(0).ToString
                End If
            End If
        Catch ex As Exception

            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Response.Redirect("~/desktop/Home.aspx")
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try


        'save products
        sqlStatement = ""

        Session("orderID") = strOrderID
        dtCart = Session("dtCart")

        For i = 0 To dtCart.Rows.Count - 1

            sqlStatement &= "INSERT INTO dbo.OrderProducts (orderID_FK, productID_FK, quantity, price) "
            sqlStatement &= "VALUES (" & strOrderID & ", " & dtCart.Rows(i)("ItemID") & ", " & dtCart.Rows(i)("Quantity")
            sqlStatement &= ", " & dtCart.Rows(i)("Price") & ");"

        Next i

        myCommand = New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()
            myCommand.ExecuteNonQuery()
        Catch ex As Exception
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()

            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try


        'send email
        sqlStatement = ""
        Dim strEmail As String = ""
        sqlStatement = "SELECT email FROM Users WHERE username = '" & Page.User.Identity.Name.ToLower & "';"

        myCommand = New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()
            Dim myReader As SqlDataReader = myCommand.ExecuteReader
            If myReader.Read Then
                strEmail = myReader("email").ToString
            End If
        Catch ex As Exception
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try



        Response.Redirect("~/desktop/account/confirmation.aspx")

    End Sub

    Protected Sub lnkEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkEdit.Click

        Response.Redirect("~/desktop/account/Account.aspx")

    End Sub
End Class
