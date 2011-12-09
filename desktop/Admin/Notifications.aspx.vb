Imports System.Net.Mail


Partial Class desktop_admin_Notifications
    Inherits System.Web.UI.Page

    Protected Sub lnkCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkCancel.Click

        Response.Redirect("~/desktop/admin/Admin.aspx")

    End Sub

    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSend.Click

        'get message
        Dim strMessage As String = txtMessage.Text
        lblMessage.Text = ""

        'get address
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("EBUS2ConnectionString").ConnectionString)
        Dim sqlStatement As String = "SELECT u.sms, c.carrierExtension FROM Users as u JOIN Carriers as c "
        sqlStatement &= "ON u.carrierID_FK = c.carrierID WHERE u.username = '" & ddlUsers.SelectedValue & "';"

        Dim myCommand As New SqlCommand(sqlStatement, myConnection)
        Dim strAddress As String = ""

        Try
            myConnection.Open()
            Dim myReader As SqlDataReader = myCommand.ExecuteReader
            If myReader.Read Then
                strAddress = myReader("sms").ToString
                strAddress &= myReader("carrierExtension").ToString
            End If
        Catch ex As Exception
            lblMessage.Text = "Could not retrieve user information.<br />" & ex.ToString
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub
        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try


        'compose message
        Dim mm As New MailMessage("atribou@murraystate.edu", strAddress, "Listing Notification", strMessage)

        'send message
        Dim smtp As New SmtpClient

        Try
            smtp.Send(mm)
        Catch ex As Exception
            lblMessage.Text = "Message could not send."
            Exit Sub
        End Try

        lblMessage.Text = "Message sent successfully!"

        txtMessage.Text = ""


    End Sub
End Class
