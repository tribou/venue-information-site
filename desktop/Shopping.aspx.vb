
Partial Class desktop_Shopping
    Inherits System.Web.UI.Page

        Dim dtCart As New DataTable
        Dim myAdapter As New SqlDataAdapter


        Protected Sub gdvItems_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gdvItems.SelectedIndexChanged

            lblMessage.Text = ""

            If gdvItems.SelectedIndex = -1 Then

                gdvInventory.Visible = False
                imgItem.Visible = False

            Else
                gdvInventory.Visible = True
                Dim intRow As Integer
                Dim strImage As String = ""
                Dim strListingID As String = ""

                intRow = gdvItems.SelectedIndex

                'capture item id for image
                strListingID = gdvItems.DataKeys(intRow).Value.ToString

                'grab image string from database
                Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
                Dim selectStatement As String = "SELECT listingImage FROM Listings WHERE listingID = " & strListingID
                Dim myCommand As New SqlCommand(selectStatement, myConnection)

                Try
                    myConnection.Open()
                    Dim myReader As SqlDataReader = myCommand.ExecuteReader(Data.CommandBehavior.SingleRow)
                    If myReader.Read Then
                        strImage = myReader("listingImage").ToString
                    End If
                    If myConnection.State <> ConnectionState.Closed Then myConnection.Close()

                Catch ex As Exception

                    lblTest.Text = "Database connection is unavailable at this time. Please try back later."
                    If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
                    Exit Sub

                End Try

                'update image
                imgItem.ImageUrl = "~/desktop/images/" & strImage
                imgItem.Visible = True
                If myConnection.State <> ConnectionState.Closed Then myConnection.Close()

            End If




        End Sub


        Protected Sub gdvInventory_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gdvInventory.SelectedIndexChanged


            'capture index and row
            Dim intDex As Integer = gdvInventory.SelectedIndex
        Dim currentRow As GridViewRow = gdvInventory.Rows(intDex)
        Dim currentStore As GridViewRow = gdvItems.Rows(gdvItems.SelectedIndex)
        Dim strProductID As String
            Dim intStock As Integer
            Dim intQuantity As Integer
            lblMessage.Text = ""


        'get qty from row
            Dim txtQty As System.Web.UI.WebControls.TextBox = currentRow.FindControl("txtQty")

            If txtQty.Text <> "" Then
                Try
                    Dim intQty As Integer = CType(txtQty.Text, Integer)
                If intQty <= 0 Or intQty > 99 Then Throw New Exception
                    intQuantity = intQty

                Catch ex As Exception
                lblMessage.Text = "Please enter a number from 1-99"
                    txtQty.Text = "0"
                    gdvInventory.SelectedIndex = -1
                    Exit Sub
                End Try
                lblMessage.Text = ""

            Else
            lblMessage.Text = "Please enter a number from 1-99"
                txtQty.Text = "0"
                gdvInventory.SelectedIndex = -1
                Exit Sub
            End If


            'capture item id for stock amount
        strProductID = gdvInventory.DataKeys(intDex).Value.ToString



            'get stock amount
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim selectStatement As String = "SELECT pQuantity FROM Products WHERE productID = " & strProductID
        Dim myCommand As New SqlCommand(selectStatement, myConnection)

            Try
                myConnection.Open()
                Dim myReader As SqlDataReader = myCommand.ExecuteReader(Data.CommandBehavior.SingleRow)
            If myReader.Read Then intStock = CInt(myReader("pQuantity"))

            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()

            Catch ex As Exception

                lblMessage.Text = "Database connection is unavailable at this time. Please try back later."
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
                gdvInventory.SelectedIndex = -1
                Exit Sub

            End Try

            'compare qty with stock
            If intStock = 0 Then
                lblMessage.Text = "That item is out of stock. Please choose another item."
                txtQty.Text = "0"
                Exit Sub
            End If
            If intQuantity > intStock Then
                lblMessage.Text = "That order is too big for our current stock. Please enter an amount less than " & (intStock + 1).ToString & "."
                txtQty.Text = "0"
                Exit Sub
            End If


            'add item to shopping cart
            'check to see if session already exists
            Dim i As Integer
            If Session.Item("dtCart") Is Nothing Then

                'if not, define datatable
            dtCart.Columns.Add("ItemID", GetType(String))
            dtCart.Columns.Add("Store", GetType(String))
            dtCart.Columns.Add("Name", GetType(String))
            dtCart.Columns.Add("Description", GetType(String))
                dtCart.Columns.Add("Price", GetType(Decimal))
                dtCart.Columns.Add("Quantity", GetType(Integer))
                dtCart.Rows.Add()
                i = 0
            Else

                'if so, then get data
                i = Session("count")
                dtCart = Session("dtCart")

                'then check for redundancy
                For j = 0 To Session("count")
                If dtCart.Rows(j)("ItemID").ToString = strProductID Then
                    lblMessage.Text = "That item is already in your cart."
                    txtQty.Text = "0"
                    Exit Sub
                End If
                Next j

                'and add a row
                i += 1
                dtCart.Rows.Add()
            End If

            'update datatable with new item
        dtCart.Rows(i)("ItemID") = strProductID
        dtCart.Rows(i)("Store") = currentStore.Cells(1).Text
        dtCart.Rows(i)("Name") = currentRow.Cells(0).Text
        dtCart.Rows(i)("Description") = currentRow.Cells(1).Text
        dtCart.Rows(i)("Price") = CType(currentRow.Cells(2).Text, Decimal)
            dtCart.Rows(i)("Quantity") = intQuantity
            Session("count") = i
            Session("dtCart") = dtCart

            'notify the user
        lblMessage.Text = "Successfully added " & intQuantity.ToString & " " & dtCart.Rows(i)("Name").ToString
        lblMessage.Text &= "(s) from " & dtCart.Rows(i)("Store").ToString & " to your cart!"

            'reset qty to 0
            txtQty.Text = "0"



        End Sub

        Protected Sub btnGoToCart_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGoToCart.Click

        Response.Redirect("~/desktop/Cart.aspx")

        End Sub


End Class
