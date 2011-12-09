
Partial Class Register
    Inherits System.Web.UI.Page


    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rblRegister.SelectedIndexChanged

        If Page.IsPostBack Then
            If rblRegister.SelectedIndex = 0 Then
                pnlNewOrg.Visible = True
                pnlExistingOrg.Visible = False
                txtOrg.Focus()
            ElseIf rblRegister.SelectedIndex = 1 Then
                pnlExistingOrg.Visible = True
                pnlNewOrg.Visible = False
            Else
                pnlExistingOrg.Visible = False
                pnlNewOrg.Visible = False
            End If
        End If

    End Sub

    Protected Sub ddlOrganizations_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlOrganizations.PreRender

        If Page.IsPostBack Then
            If ddlOrganizations.Items.Count > 0 Then
                If Not ddlOrganizations.Items(0).Text = "Select an Organization..." Then
                    ddlOrganizations.Items.Insert(0, "Select an Organization...")
                End If
            Else
                ddlOrganizations.Items.Insert(0, "Select an Organization...")
            End If
        End If

    End Sub

    Protected Sub ddlStates2_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlStates2.PreRender

        If Page.IsPostBack Then
            If Not ddlStates2.Items(0).Text = "Select a State..." Then
                ddlStates2.Items.Insert(0, "Select a State...")
            End If
        End If

    End Sub

    Protected Sub ddlStates_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlStates.PreRender

        If Page.IsPostBack Then
            If Not ddlStates.Items(0).Text = "Select a State..." Then
                ddlStates.Items.Insert(0, "Select a State...")
            End If
        End If

    End Sub

    Protected Sub btnReset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReset.Click

        txtOrg.Text = ""
        txtOrgAdd.Text = ""
        txtOrgCity.Text = ""
        ddlStates2.SelectedIndex = 0
        txtOrgZip.Text = ""
        txtOrgEmail.Text = ""
        txtOrgPhone.Text = ""

        txtName.Text = ""
        txtAddress.Text = ""
        txtCity.Text = ""
        ddlStates.SelectedIndex = 0
        txtZip.Text = ""
        txtEmail.Text = ""
        txtPhone.Text = ""
        txtOrg.Focus()

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        'submit new organization
        lblMessage.Text = ""
        btnSubmit.Enabled = False
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("CIS407_AtribouConnectionString").ConnectionString)
        Dim sqlStatement, strNewOrgID As String


        'add new org with stored procedure
        sqlStatement = "EXEC procInsertOrg '" & txtOrg.Text & "', '" & txtOrgAdd.Text & "', '"
        sqlStatement &= txtOrgCity.Text & "', '" & ddlStates2.SelectedValue.ToString & "', "
        sqlStatement &= txtOrgZip.Text & ", " & txtOrgPhone.Text & ", '" & txtOrgEmail.Text
        sqlStatement &= "';"

        Dim myCommand As New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()

            'retrieve orgID from procedure
            Dim myReader As SqlDataReader = myCommand.ExecuteReader()
            If myReader.HasRows Then
                If myReader.Read Then
                    strNewOrgID = myReader(0).ToString
                End If
            End If

        Catch ex As Exception
            lblMessage.Text = "Registration is currently down for maintenance. Please try again later.<br />" & ex.ToString
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub

        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try

        'store orgID and orgName in session
        Session("orgID") = strNewOrgID
        Session("orgName") = txtOrg.Text

        'add contact person
        sqlStatement = "INSERT INTO ContactPersons(contactName, contactAddress, contactCity, stateCode, contactZip, "
        sqlStatement &= "contactPhone, contactEmail, orgID) VALUES ('" & txtName.Text & "', '" & txtAddress.Text & "', '"
        sqlStatement &= txtCity.Text & "', '" & ddlStates2.SelectedValue.ToString & "', "
        sqlStatement &= txtZip.Text & ", " & txtPhone.Text & ", '" & txtEmail.Text & "', " & Session("orgID").ToString
        sqlStatement &= ");"

        myCommand = New SqlCommand(sqlStatement, myConnection)

        Try
            myConnection.Open()
            myCommand.ExecuteNonQuery()
            
        Catch ex As Exception
            lblMessage.Text = "Registration is currently down for maintenance. Please try again later.<br />" & ex.ToString
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
            Exit Sub

        Finally
            If myConnection.State <> ConnectionState.Closed Then myConnection.Close()
        End Try

        'transfer to teams page
        Server.Transfer("~/Teams.aspx")

    End Sub

    Protected Sub ddlOrganizations_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlOrganizations.SelectedIndexChanged

        If ddlOrganizations.SelectedIndex > 0 Then
            btnAddTeams.Enabled = True
            dvwExistingOrg.Visible = True
        Else
            btnAddTeams.Enabled = False
            dvwExistingOrg.Visible = False
        End If

    End Sub

    Protected Sub btnAddTeams_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddTeams.Click

        Session("orgID") = ddlOrganizations.SelectedValue.ToString
        Session("orgName") = ddlOrganizations.SelectedItem.ToString
        Server.Transfer("~/Teams.aspx")

    End Sub
End Class
