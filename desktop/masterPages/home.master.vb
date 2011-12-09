
Partial Class masterPages_home
    Inherits System.Web.UI.MasterPage

    Protected Sub btnListings_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnListings.Click

        Response.Redirect("~/desktop/Listings.aspx")

    End Sub

    Protected Sub btnHome_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHome.Click

        Response.Redirect("~/desktop/Home.aspx")

    End Sub



    Protected Sub LoginStatus1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoginStatus1.PreRender

        If Not LoginStatus1.LogoutText Is Nothing Then
            Dim strTxt As String = "Logout, " & Page.User.Identity.Name
            strTxt &= "</a> | <a href=""/CIS425_Project_Tribou/desktop/account/Account.aspx"">My Account"
            LoginStatus1.LogoutText = strTxt
        End If

    End Sub

    Protected Sub lnkAdmin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkAdmin.Click

        Response.Redirect("~/desktop/admin/Admin.aspx")

    End Sub
End Class

