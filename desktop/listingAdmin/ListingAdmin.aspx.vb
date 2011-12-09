
Partial Class desktop_listingAdmin_ListingAdmin
    Inherits System.Web.UI.Page

    Protected Sub lnkAddListing_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkAddListing.Click

        ResetForm()
        pnlAdd.Visible = True

    End Sub

    Public Sub FillManagers(ByVal listingID As String)

        lblMessage.Text = ""

        'setup connection
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = ""

        'get number of current listing managers
        sqlStatement = "SELECT COUNT(u.userID) AS 'NumUsers' FROM Users as u JOIN AdminRoles as r ON u.userID = r.userID_FK "
        sqlStatement &= "WHERE r.listingID_FK = " & listingID

        Dim myCommand As New SqlCommand(sqlStatement, myConnection)
        Dim intCount As Integer

        Try
            myConnection.Open()
            Dim myReader As SqlDataReader = myCommand.ExecuteReader()
            If myReader.Read Then
                intCount = CType(myReader("NumUsers"), Integer)
                If intCount = 0 Then
                    If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
                    lstManagers.Items.Clear()
                    Exit Sub
                End If
            Else
                If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
                Exit Sub
            End If
        Catch ex As Exception
            lblMessage.Text = "Connection to the database could not be made at this time.<br />" & ex.ToString
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try


        'get current listing managers
        sqlStatement = "SELECT u.userID, u.username FROM Users as u JOIN AdminRoles as r ON u.userID = r.userID_FK "
        sqlStatement &= "WHERE r.listingID_FK = " & listingID & " ORDER BY u.username ASC"

        myCommand = New SqlCommand(sqlStatement, myConnection)

        Dim strUser(intCount), strUserID(intCount) As String
        Dim i As Integer = 0

        Try
            myConnection.Open()
            Dim myReader As SqlDataReader = myCommand.ExecuteReader()
            Do While myReader.Read

                strUserID(i) = myReader("userID").ToString
                strUser(i) = myReader("username").ToString
                i += 1

            Loop
        Catch ex As Exception
            lblMessage.Text = "Connection to the database could not be made at this time.<br />" & ex.ToString
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try


        'fill current listing managers
        lstManagers.Items.Clear()
        For j = 0 To strUser.Length - 1
            lstManagers.Items.Add(strUser(j))
        Next j


    End Sub

    Public Sub FillUsers(ByVal listingID As String)

        lblMessage.Text = ""

        'setup connection
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = ""

        'get number of current users
        sqlStatement = "SELECT COUNT(u.userID) AS 'NumUsers' FROM Users as u"

        Dim myCommand As New SqlCommand(sqlStatement, myConnection)
        Dim intCount As Integer

        Try
            myConnection.Open()
            Dim myReader As SqlDataReader = myCommand.ExecuteReader()
            If myReader.Read Then
                intCount = CType(myReader("NumUsers"), Integer)

                If intCount = 0 Then
                    If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
                    Exit Sub
                End If
            Else
                If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
                Exit Sub
            End If
        Catch ex As Exception
            lblMessage.Text = "Connection to the database could not be made at this time.<br />" & ex.ToString
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try


        'get current users
        sqlStatement = "SELECT u.username FROM Users as u"
        sqlStatement &= " ORDER BY u.username ASC"

        myCommand = New SqlCommand(sqlStatement, myConnection)

        Dim strUser(intCount), strUserID(intCount) As String
        Dim i As Integer = 0

        Try
            myConnection.Open()
            Dim myReader As SqlDataReader = myCommand.ExecuteReader()
            Do While myReader.Read

                strUser(i) = myReader("username").ToString
                i += 1

            Loop
        Catch ex As Exception
            lblMessage.Text = "Connection to the database could not be made at this time.<br />" & ex.ToString
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try


        'fill current users not in managers list
        lstUsers.Items.Clear()
        For j = 0 To strUser.Length - 1
            Dim lstUser As New ListItem(strUser(j), strUser(j))
            If Not lstManagers.Items.Contains(lstUser) Then
                lstUsers.Items.Add(strUser(j))
            End If
        Next j

    End Sub

    Public Sub ResetForm()

        lblMessage.Text = ""
        pnlAdd.Visible = False
        pnlAssign.Visible = False
        pnlDelete.Visible = False
        pnlLists.Visible = False

    End Sub

    Protected Sub lnkAddCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkAddCancel.Click

        ResetForm()

    End Sub

    Protected Sub lnkClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkClose.Click

        ResetForm()

    End Sub

    Protected Sub lnkAddSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkAddSave.Click

        'get info and cleanup
        Dim strName As String = txtName.Text
        strName = strName.Replace("'", "''")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = "INSERT INTO Listings (listingName, ListCatID_FK) VALUES ('"
        sqlStatement &= strName & "', " & ddlCategories.SelectedValue & ");"

        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        'insert into database
        Try
            myConnection.Open()
            myCommand.ExecuteNonQuery()

        Catch ex As Exception
            lblMessage.Text = "Could not connect to database. Please try again later."
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try

        'cleanup
        ddlListings.DataBind()
        ddlListingsDelete.DataBind()
        txtName.Text = ""
        ResetForm()

    End Sub

    Protected Sub lnkAssign_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkAssign.Click

        ResetForm()
        pnlAssign.Visible = True

        If ddlListings.Items.Count > 0 Then ddlListings.SelectedIndex = 0

    End Sub


    Protected Sub ddlListings_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlListings.SelectedIndexChanged

        If ddlListings.SelectedIndex > 0 Then

            pnlLists.Visible = True

            'clear lists
            lstUsers.Items.Clear()
            lstManagers.Items.Clear()

            'fill current listing managers
            FillManagers(ddlListings.SelectedValue)

            'then fill users
            FillUsers(ddlListings.SelectedValue)

        Else
            ResetForm()
            pnlAssign.Visible = True
        End If




    End Sub

    Protected Sub ddlListings_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlListings.PreRender

        If Not ddlListings.Items(0).Text = "Select a Listing..." Then
            ddlListings.Items.Insert(0, "Select a Listing...")
        End If

    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click


        lblMessage.Text = ""
        'get added username
        Dim strUsername As String = lstUsers.SelectedValue

        'assign role
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = "INSERT INTO AdminRoles (userID_FK, listingID_FK) VALUES "
        sqlStatement &= "((SELECT u.userID FROM Users as u WHERE u.username = '"
        sqlStatement &= strUsername & "'), " & ddlListings.SelectedValue & ");"

        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()
            myCommand.ExecuteNonQuery()
        Catch ex As Exception
            lblMessage.Text = "Could not connect to database. Try again later."
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try

        'refresh managers list
        FillManagers(ddlListings.SelectedValue)
        'refresh users list
        FillUsers(ddlListings.SelectedValue)


    End Sub

    Protected Sub btnRemove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemove.Click

        lblMessage.Text = ""
        'get removed username
        Dim strUsername As String = lstManagers.SelectedValue

        'remove role
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = "DELETE FROM AdminRoles WHERE userID_FK = "
        sqlStatement &= "(SELECT u.userID FROM Users as u WHERE u.username = '"
        sqlStatement &= strUsername & "') "
        sqlStatement &= "AND listingID_FK = " & ddlListings.SelectedValue & ";"

        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()
            myCommand.ExecuteNonQuery()
        Catch ex As Exception
            lblMessage.Text = "Could not connect to database. Try again later."
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try

        'refresh managers list
        FillManagers(ddlListings.SelectedValue)
        'refresh users list
        FillUsers(ddlListings.SelectedValue)

    End Sub

    Protected Sub lnkDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkDelete.Click

        ResetForm()
        pnlDelete.Visible = True

    End Sub

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click

        'get listingID
        Dim strListingID As String = ddlListingsDelete.SelectedValue

        'delete from database
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = "DELETE FROM Listings WHERE listingID = " & strListingID

        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()
            myCommand.ExecuteNonQuery()
        Catch ex As Exception
            lblMessage.Text = "Could not delete at this time.<br />" & ex.ToString
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try

        ddlListingsDelete.DataBind()
        ResetForm()

    End Sub

    Protected Sub lnkDeleteCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkDeleteCancel.Click

        ddlListingsDelete.SelectedIndex = 0
        ResetForm()

    End Sub
End Class
