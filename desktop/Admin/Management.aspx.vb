
Partial Class desktop_admin_Admin
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("username") = Page.User.Identity.Name.ToLower
    End Sub

    Protected Sub ddlListings_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlListings.PreRender

        If Not Page.IsPostBack Then
            ddlListings.Items.Insert(0, "Select a Listing...")
        End If

    End Sub

    Protected Sub ddlListings_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlListings.SelectedIndexChanged

        lblMessage.Text = ""

        If ddlListings.SelectedIndex > 0 Then
            pnlEdit.Visible = False
            pnlListing.Visible = True
            Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
            Dim sqlStatement As String = ""

            'get listing info
            sqlStatement = "SELECT l.listingName, l.listingText, l.listingImage, l.listingThumb, c.ListCatName, l.listingInventory "
            sqlStatement &= "FROM Listings as l "
            sqlStatement &= "JOIN ListingCategories as c "
            sqlStatement &= "ON l.ListCatID_FK = c.ListCatID "
            sqlStatement &= "WHERE listingID = " & ddlListings.SelectedValue & ";"

            Dim myCommand As New SqlCommand(sqlStatement, myConnection)

            Dim strName, strText, strImage, strThumb, strCategory As String
            Dim blnInventory As Boolean

            Try
                myConnection.Open()
                Dim myReader As SqlDataReader = myCommand.ExecuteReader()
                If myReader.Read Then

                    strName = myReader("listingName").ToString
                    strText = myReader("listingText").ToString
                    strImage = myReader("listingImage").ToString
                    strThumb = myReader("listingThumb").ToString
                    strCategory = myReader("ListCatName").ToString
                    blnInventory = CType(myReader("listingInventory"), Boolean)


                End If

            Catch ex As Exception

                lblMessage.Text = "Listing could not be retrieved. Please try again later.<br />" & ex.ToString
                If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
                Exit Sub

            Finally
                If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            End Try


            'update listing info
            lblTitle.Text = strName
            lblText.Text = strText
            lblCategory.Text = strCategory
            strImage = "~/desktop/images/" & strImage
            strThumb = "~/desktop/images/thumbs/" & strThumb
            imgImage.ImageUrl = strImage
            imgThumb.ImageUrl = strThumb
            chkInventory.Checked = blnInventory
            pnlInventory.Visible = blnInventory
            gdvInventory.DataBind()

        Else
            pnlListing.Visible = False
            pnlEdit.Visible = False
            pnlInventory.Visible = False
            pnlAddProduct.Visible = False
        End If

    End Sub

    Protected Sub lnkEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkEdit.Click

        pnlInventory.Visible = False
        pnlListing.Visible = False
        pnlEdit.Visible = True
        lblImage.Text = ""

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = ""

        'get listing info
        sqlStatement = "SELECT l.listingName, l.listingText, l.listingImage, l.listingThumb, c.ListCatName, c.ListCatID "
        sqlStatement &= "FROM Listings as l "
        sqlStatement &= "JOIN ListingCategories as c "
        sqlStatement &= "ON l.ListCatID_FK = c.ListCatID "
        sqlStatement &= "WHERE listingID = " & ddlListings.SelectedValue & ";"

        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        Dim strName, strText, strImage, strThumb, strCategory As String
        Dim intCat As Integer

        Try
            myConnection.Open()
            Dim myReader As SqlDataReader = myCommand.ExecuteReader()
            If myReader.Read Then

                strName = myReader("listingName").ToString
                strText = myReader("listingText").ToString
                strImage = myReader("listingImage").ToString
                strThumb = myReader("listingThumb").ToString
                strCategory = myReader("ListCatName").ToString
                intCat = CType(myReader("ListCatID"), Integer)

            End If

        Catch ex As Exception

            lblMessage.Text = "Listing could not be retrieved. Please try again later.<br />" & ex.ToString
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub

        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try

        'fill with current data
        txtTitle.Text = strName
        txtText.Text = strText
        ddlCategories.SelectedValue = intCat



    End Sub

    Protected Sub lnkCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkCancel.Click

        pnlListing.Visible = True
        pnlEdit.Visible = False
        pnlAddProduct.Visible = False
        pnlInventory.Visible = chkInventory.Checked

    End Sub

    Protected Sub lnkSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkSave.Click

        'update images
        lblMessage.Text = ""
        Dim imageSavePath As String = "~/desktop/images/" & fupImage.FileName
        Dim thumbSavePath As String = "~/desktop/images/thumbs/" & fupThumb.FileName

        If fupImage.FileName <> "" Then
            Try
                Dim file As New FileInfo(fupImage.PostedFile.FileName)
                If CheckFileType(fupImage.FileName) Then
                    'image checks out

                    fupImage.SaveAs(MapPath(imageSavePath))

                Else
                    lblImage.Text = "Image is of unsupported format."
                    Exit Sub
                End If
            Catch ex As Exception
                lblImage.Text = "Image could not be uploaded."
                Exit Sub
            End Try
        End If

        If fupThumb.FileName <> "" Then
            Try
                Dim file As New FileInfo(fupThumb.PostedFile.FileName)
                If CheckFileType(fupThumb.FileName) Then
                    'thumb checks out

                    fupThumb.SaveAs(MapPath(thumbSavePath))

                Else
                    lblImage.Text = "Thumb is of unsupported format."
                    Exit Sub
                End If
            Catch ex As Exception
                lblImage.Text = "Thumb could not be uploaded.<br />" & ex.ToString
                Exit Sub
            End Try
        End If


        'update listings

        Dim strImageStatement, strThumbStatement As String

        If fupImage.FileName <> "" Or fupThumb.FileName <> "" Then
            'build sql statements for file images
            If fupImage.FileName <> "" Then
                strImageStatement = "listingImage = '" & fupImage.FileName
            Else
                strImageStatement = ""
            End If

            If fupThumb.FileName <> "" Then
                strThumbStatement = "listingThumb = '" & fupThumb.FileName
                If fupImage.FileName <> "" Then
                    strThumbStatement = "', " & strThumbStatement
                End If
            Else
                strThumbStatement = ""
            End If
        End If

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = ""

        'clean up text
        Dim strText, strName As String

        strText = txtText.Text
        strName = txtTitle.Text
        strText = strText.Replace("'", "''")
        strName = strName.Replace("'", "''")

        sqlStatement = "UPDATE Listings SET ListCatID_FK = " & ddlCategories.SelectedValue & ", listingName = '" & strName
        sqlStatement &= "', listingText = '" & strText
        If fupImage.FileName <> "" Or fupThumb.FileName <> "" Then
            sqlStatement &= "', " & strImageStatement & strThumbStatement
        End If
        sqlStatement &= "' WHERE listingID = " & ddlListings.SelectedValue & ";"


        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()
            myCommand.ExecuteNonQuery()

        Catch ex As Exception
            lblImage.Text = "Image(s) could not be uploaded to the database.  Please try again later or contact the web admin."
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub

        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try

        pnlEdit.Visible = False
        pnlListing.Visible = True
        pnlInventory.Visible = chkInventory.Checked
        ddlListings_SelectedIndexChanged(sender, e)


    End Sub

    Function CheckFileType(ByVal fileName As String) As Boolean

        Dim extension As String = Path.GetExtension(fileName)
        Select Case extension.ToLower()
            Case ".gif"
                Return True
            Case ".png"
                Return True
            Case ".jpg"
                Return True
            Case ".jpeg"
                Return True
            Case Else
                Return False
        End Select

    End Function

    Protected Sub chkInventory_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkInventory.CheckedChanged

        Dim blnInventory As Boolean = chkInventory.Checked

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = "UPDATE Listings SET listingInventory = "

        If blnInventory Then
            sqlStatement &= "1"
        Else
            sqlStatement &= "0"
        End If

        sqlStatement &= " WHERE listingID = " & ddlListings.SelectedValue & ";"

        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()
            myCommand.ExecuteNonQuery()
        Catch ex As Exception
            lblMessage.Text = "Database could not be reached at this time. Please try again later.<br />" & ex.ToString
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try

        ddlListings_SelectedIndexChanged(sender, e)
        pnlInventory.Visible = blnInventory

    End Sub

    Protected Sub lnkAddProduct_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkAddProduct.Click

        pnlEdit.Visible = False
        pnlInventory.Visible = False
        pnlListing.Visible = False
        pnlAddProduct.Visible = True

        txtName.Focus()


    End Sub


    Protected Sub lnkAddCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkAddCancel.Click

        pnlListing.Visible = True
        pnlAddProduct.Visible = False
        pnlEdit.Visible = False
        pnlInventory.Visible = chkInventory.Checked

    End Sub

    Protected Sub lnkAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkAdd.Click

        'capture text
        Dim strName As String = txtName.Text
        Dim strDesc As String = txtDesc.Text
        Dim strPrice As String = txtPrice.Text
        Dim strQty As String = txtQty.Text

        'clean text
        strName = strName.Replace("'", "''")
        strDesc = strDesc.Replace("'", "''")
        strPrice = strPrice.Replace("'", "''")
        strQty = strQty.Replace("'", "''")

        'send to database
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = "INSERT INTO Products (pName, pDescription, pPrice, pQuantity, listingID_FK) "
        sqlStatement &= "VALUES ('" & strName & "', '" & strDesc & "', " & strPrice & ", " & strQty & ", "
        sqlStatement &= ddlListings.SelectedValue & ");"
        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        'connect
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
        txtName.Text = ""
        txtDesc.Text = ""
        txtPrice.Text = ""
        txtQty.Text = ""
        pnlAddProduct.Visible = False
        pnlEdit.Visible = False
        pnlListing.Visible = True
        pnlInventory.Visible = chkInventory.Checked
        ddlListings_SelectedIndexChanged(sender, e)

    End Sub
End Class
