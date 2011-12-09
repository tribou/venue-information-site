
Partial Class desktop_admin_Admin
    Inherits System.Web.UI.Page


    Protected Sub btnListing_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnListing.Click

        Response.Redirect("~/desktop/admin/Management.aspx")

    End Sub

    Protected Sub btnAdmin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdmin.Click

        Response.Redirect("~/desktop/listingAdmin/ListingAdmin.aspx")

    End Sub

    Protected Sub btnNotify_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNotify.Click

        Response.Redirect("~/desktop/admin/Notifications.aspx")

    End Sub
End Class
