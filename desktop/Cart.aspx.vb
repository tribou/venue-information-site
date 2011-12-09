
Partial Class desktop_Cart
    Inherits System.Web.UI.Page


    Dim myAdapter As SqlDataAdapter
    Dim dtCart As New DataTable


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'run the bind subprocedure if not a postback
        If Not Page.IsPostBack Then
            BindToGridView()
        End If


    End Sub



    Public Sub BindToGridView()


        'This subprocedure binds the session data to the data table and the data table to the grid view
        'session to data table
        dtCart = CType(Session("dtCart"), DataTable)

        'data table to grid view
        gdvCart.DataSource = dtCart
        gdvCart.DataBind()


    End Sub

    Protected Sub gdvCart_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gdvCart.RowDeleting

        'this procedure responds when the remove from cart button is pressed since it was assigned the command "delete"

        'first, get data from session into data table
        Dim dtCart As DataTable
        dtCart = CType(Session("dtCart"), DataTable)

        'then delete the current row
        dtCart.Rows(e.RowIndex).Delete()

        'then update session
        Session("dtCart") = dtCart
        Session("count") = Session("count") - 1

        'reset edit index
        gdvCart.EditIndex = -1

        'then update the gridview
        BindToGridView()


    End Sub

    Protected Sub gdvCart_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gdvCart.RowEditing

        'set the index for editing and bind the data
        gdvCart.EditIndex = e.NewEditIndex
        BindToGridView()

    End Sub

    Protected Sub gdvCart_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles gdvCart.RowCancelingEdit


        'clear label
        lblMessage.Text = ""

        'cancel editing index
        gdvCart.EditIndex = -1

        'rebind data
        BindToGridView()


    End Sub

    Protected Sub gdvCart_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gdvCart.RowUpdating


        Dim intStock As Integer
        Dim intQty As Integer

        'get session data
        Dim dtCart As DataTable = CType(Session("dtCart"), DataTable)

        'get quantity text box
        Dim txtQuantity As System.Web.UI.WebControls.TextBox = gdvCart.Rows(e.RowIndex).FindControl("txtQty")

        'get quantity
        Try
            intQty = CType(txtQuantity.Text, Integer)
            If intQty > 99 Or intQty < 1 Then Throw New Exception
        Catch ex As Exception
            lblMessage.Text = "Please enter a number from 1-99."
            txtQuantity.Text = dtCart.Rows(e.RowIndex)("Quantity").ToString
            Exit Sub
        End Try

        'get stock amount
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim selectStatement As String = "SELECT pQuantity FROM Products WHERE productID = " & dtCart.Rows(e.RowIndex)("ItemID").ToString
        Dim myCommand As New SqlCommand(selectStatement, myConnection)

        Try
            myConnection.Open()
            Dim myReader As SqlDataReader = myCommand.ExecuteReader(Data.CommandBehavior.SingleRow)
            If myReader.Read Then intStock = CInt(myReader("pQuantity"))
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        Catch ex As Exception
            lblMessage.Text = "Database connection is unavailable at this time. Please try back later."
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        End Try

        'compare quantity with stock
        If intQty > intStock Then
            lblMessage.Text = "That order is too big for our current stock. Please enter an amount less than " & (intStock + 1).ToString & "."
            txtQuantity.Text = dtCart.Rows(e.RowIndex)("Quantity").ToString
            Exit Sub
        End If

        'clear label
        lblMessage.Text = ""

        'update data table
        dtCart.Rows(e.RowIndex)("Quantity") = CType(txtQuantity.Text, Integer)

        'update session
        Session("dtCart") = dtCart

        'reset edit index
        gdvCart.EditIndex = -1

        'update gridview
        BindToGridView()


    End Sub

    Protected Sub btnOrder_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOrder.Click

        dtCart = Session("dtCart")
        lblMessage.Text = ""

        If gdvCart.Rows.Count > 0 Then
            Response.Redirect("~/desktop/account/Checkout.aspx")
        Else
            lblMessage.Text = "Please add items to cart before checking out"
            Exit Sub
        End If

    End Sub


    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Response.Redirect("~/desktop/Shopping.aspx")

    End Sub

    Protected Sub btnSaveCart_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveCart.Click

        'check login
        If Not Page.User.Identity.IsAuthenticated Then
            lblMessage.Text = "Please login before saving cart"
            Exit Sub
        End If

        'check cart
        dtCart = Session("dtCart")

        If gdvCart.Rows.Count < 1 Then
            lblMessage.Text = "Add items before saving cart"
            pnlSaveCart.Visible = False
            Exit Sub
        End If

        lblCartSave.Text = ""
        lblMessage.Text = ""
        btnSaveCart.Visible = False
        txtCartName.Text = ""
        pnlSaveCart.Visible = True
        txtCartName.Focus()


    End Sub

    Protected Sub lnkCancelSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkCancelSave.Click

        btnSaveCart.Visible = True
        pnlSaveCart.Visible = False
        txtCartName.Text = ""

    End Sub

    Protected Sub lnkSaveCart_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkSaveCart.Click

        'validation
        ''check length
        If txtCartName.Text.Length > 50 Then
            lblCartSave.Text = "Enter a name under 50 characters"
            txtCartName.Focus()
            Exit Sub
        End If

        ''check content
        Dim strCharacters As String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'.,-() "
        Dim valCharacters() As Char = strCharacters.ToCharArray

        For i = 0 To txtCartName.Text.Length - 1
            Dim blnCheck As Boolean = False

            For j = 0 To valCharacters.Length - 1
                If txtCartName.Text.Substring(i, 1) = valCharacters(j).ToString Then
                    blnCheck = True
                End If
            Next j

            If blnCheck = False Then
                lblCartSave.Text = "Valid characters are A-Z, a-z, 0-9, and '.,-()"
                txtCartName.Focus()
                Exit Sub
            End If

        Next i


        'save cart
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = "INSERT INTO ShoppingCarts (cartName, userID_FK) VALUES ('"
        sqlStatement &= txtCartName.Text & "', "
        sqlStatement &= "(SELECT userID FROM Users WHERE username = '" & Page.User.Identity.Name.ToLower
        sqlStatement &= "'));"


        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()
            myCommand.ExecuteNonQuery()
        Catch ex As Exception
            lblCartSave.Text = "Could not save cart at this time"
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try


        'save products
        sqlStatement = ""

        dtCart = Session("dtCart")

        For i = 0 To dtCart.Rows.Count - 1

            sqlStatement &= "INSERT INTO CartProducts (productID_FK, cartProdQuantity, cartID_FK) "
            sqlStatement &= "VALUES (" & dtCart.Rows(i)("ItemID") & ", " & dtCart.Rows(i)("Quantity")
            sqlStatement &= ", (SELECT cartID FROM ShoppingCarts WHERE cartName = '"
            sqlStatement &= txtCartName.Text & "')); "

        Next i

        myCommand = New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()
            myCommand.ExecuteNonQuery()
        Catch ex As Exception
            lblCartSave.Text = "Could not save cart at this time"
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try

        'cleanup
        lblMessage.Text = "Cart saved successfully"
        pnlSaveCart.Visible = False
        btnSaveCart.Visible = True

    End Sub
End Class
