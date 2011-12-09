

Partial Class desktop_Listings
    Inherits System.Web.UI.Page

    Public Function listingText() As String

        Dim strTxt As String = ""

        If Eval("listingText").ToString.Length < 200 Then
            strTxt = Eval("listingText").ToString
        Else
            strTxt = Eval("listingText").ToString.Substring(0, 200)
            strTxt &= "..."
        End If

        Return strTxt

    End Function


    Protected Sub lnkShopping_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkShopping.Click

        ListingMultiView.ActiveViewIndex = 0

    End Sub

    Protected Sub lnkFood_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkFood.Click

        ListingMultiView.ActiveViewIndex = 1

    End Sub

    Protected Sub lnkEntertainment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkEntertainment.Click

        ListingMultiView.ActiveViewIndex = 2

    End Sub

    Protected Sub ShoppingListView_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ShoppingListView.PreRender

        If ShoppingListView.Items.Count <= 10 And ShoppingListView.Items.Count <> 0 Then CType(ShoppingListView.FindControl("DataPager2"), DataPager).Visible = False

    End Sub

    Protected Sub FoodListView_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FoodListView.PreRender

        If FoodListView.Items.Count <= 10 And FoodListView.Items.Count <> 0 Then CType(FoodListView.FindControl("DataPager1"), DataPager).Visible = False

    End Sub

    Protected Sub EntertainmentListView_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles EntertainmentListView.PreRender

        If EntertainmentListView.Items.Count <= 10 And EntertainmentListView.Items.Count <> 0 Then CType(EntertainmentListView.FindControl("DataPager1"), DataPager).Visible = False

    End Sub
End Class
