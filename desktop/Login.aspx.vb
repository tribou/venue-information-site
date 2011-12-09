
Partial Class desktop_Login
    Inherits System.Web.UI.Page

    Protected Sub lnkRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkRegister.Click

        Response.Redirect("~/desktop/CreateAccount.aspx")

    End Sub

    Protected Sub lnkForgot_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkForgot.Click

        Response.Redirect("~/desktop/PasswordRecovery.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Login1.FindControl("UserName").Focus()

    End Sub
End Class
