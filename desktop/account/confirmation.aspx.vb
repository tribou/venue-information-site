
Partial Class desktop_account_confirmation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'update confirmation number
        lblConfirm.Text = Session("orderID")

    End Sub
End Class
