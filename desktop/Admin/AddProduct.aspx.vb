
Partial Class desktop_admin_AddProduct
    Inherits System.Web.UI.Page

    Protected Sub lnkCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkCancel.Click

        Response.Redirect("~/desktop/admin/Management.aspx")

    End Sub
End Class
