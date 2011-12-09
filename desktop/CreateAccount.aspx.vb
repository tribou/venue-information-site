
Partial Class desktop_CreateAccount
    Inherits System.Web.UI.Page

    Protected Sub CreateUserWizard1_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizard1.CreatedUser

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = ""
        Dim strUser As String = CreateUserWizard1.UserName.ToLower
        Dim strEmail As String = CreateUserWizard1.Email

        sqlStatement = "INSERT INTO [Users] (username, email) VALUES ('" & strUser & "', '" & strEmail & "');"

        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()
            myCommand.ExecuteNonQuery()

        Catch ex As Exception

            lblMessage.Text = "There was an error creating your account. Please contact the website admin.<br />" & ex.ToString
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try



    End Sub

    Protected Sub CreateUserWizard1_ContinueButtonClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizard1.ContinueButtonClick

        

    End Sub
End Class
