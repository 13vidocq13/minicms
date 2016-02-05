<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="MiniCMS.Controls.LoginControl" %>

<p class="validation-summary-errors">
    <asp:Label ID="LabelError" runat="server" Text="" CssClass="failureNotification"></asp:Label>
</p>
<fieldset class="register">
    <legend>Login</legend>
    <p>
        <asp:Label ID="LabelUserName" runat="server" AssociatedControlID="TextboxUserName">User name</asp:Label>
        <asp:TextBox runat="server" ID="TextboxUserName" CssClass="textEntry" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextboxUserName" CssClass="failureNotification" ErrorMessage="The user name field is required." />
    </p>
    <p>
        <asp:Label ID="LabelPassword" runat="server" AssociatedControlID="TextBoxPassword">Password</asp:Label>
        <asp:TextBox runat="server" ID="TextBoxPassword" TextMode="Password" CssClass="textEntry" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" CssClass="failureNotification" ErrorMessage="The password field is required." />
    </p>
    <asp:Button runat="server" Text="Login" ID="ButtonLogin" OnClick="ButtonLogin_Click" Style="height: 26px" />
    <p>
        <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" NavigateUrl="~/Account/Registration.aspx">Register</asp:HyperLink>
        if you don't have an account.
    </p>
</fieldset>
