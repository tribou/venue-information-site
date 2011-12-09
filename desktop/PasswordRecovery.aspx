<%@ Page Title="" Language="VB" MasterPageFile="~/desktop/masterPages/home.master" AutoEventWireup="false" CodeFile="PasswordRecovery.aspx.vb" Inherits="desktop_PasswordRecovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">

    <strong style="text-align: center">Password Recovery<br />
    </strong>&nbsp;
    
    <br />
    
    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" style="position:relative; margin:auto;">
        <MailDefinition BodyFileName="~/desktop/ChangePassword.txt" 
            From="artsocialmarketing@gmail.com" Subject="Your New Password">
        </MailDefinition>
    </asp:PasswordRecovery>

</asp:Content>

