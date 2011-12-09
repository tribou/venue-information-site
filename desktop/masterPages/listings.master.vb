
Partial Class desktop_masterPages_listings
    Inherits System.Web.UI.MasterPage

    Protected Sub menuCategories_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles menuCategories.MenuItemClick

        MultiView1.ActiveViewIndex = CType(menuCategories.SelectedValue, Integer)

    End Sub
End Class

