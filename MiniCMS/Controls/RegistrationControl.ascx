<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RegistrationControl.ascx.cs" Inherits="MiniCMS.Controls.RegistrationControl" %>

<div>
    <asp:Label ID="LabelError" runat="server" Text="" CssClass="failureNotification"></asp:Label>
    <br />
    <fieldset class="register">
        <legend>Registration</legend>
        <p>
            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="TextBoxUserName">User Name:</asp:Label>
            <asp:TextBox ID="TextBoxUserName" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="TextBoxUserName"
                CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required."
                ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="TextBoxEmail">E-mail:</asp:Label>
            <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="textEntry"></asp:TextBox>
            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="TextBoxEmail"
                CssClass="failureNotification" ErrorMessage="E-mail is required." ToolTip="E-mail is required."
                ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="TextBoxPassword">Password:</asp:Label>
            <asp:TextBox ID="TextBoxPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="TextBoxPassword"
                CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required."
                ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="TextBoxConfirmPassword">Confirm Password:</asp:Label>
            <asp:TextBox ID="TextBoxConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="TextBoxConfirmPassword" CssClass="failureNotification" Display="Dynamic"
                ErrorMessage="Confirm Password is required." ID="ConfirmPasswordRequired" runat="server"
                ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="TextBoxConfirmPassword" ControlToValidate="TextBoxPassword"
                CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
        </p>
    </fieldset>
    <p>
        <asp:Button ID="ButtonRegister" runat="server" Text="Register"
            ValidationGroup="RegisterUserValidationGroup" OnClick="ButtonRegister_Click" />
    </p>
</div>
