<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditorControl.ascx.cs" Inherits="MiniCMS.Controls.EditorControl" %>
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit.HTMLEditor" Assembly="AjaxControlToolkit, Version=4.5.7.1213, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

<ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server" />
<asp:Label ID="LabelError" runat="server" CssClass="failureNotification"></asp:Label>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="failureNotification" 
    ErrorMessage="The field name must be not empty" ControlToValidate="TextBoxNoteName" ValidationGroup="validate">
</asp:RequiredFieldValidator>
<asp:Panel ID="PanelEditor" runat="server">
    <br />
    <b>Note:</b>
    <cc1:Editor ID="EditorContent" runat="server" Width="100%" Height="400px" />
    <br />
    <b>
        Short Note:(preview to your note):</b>
    <cc1:Editor ID="EditorShortNote" runat="server" Width="100%" Height="200px" />
    &nbsp;<br />
    <asp:Label ID="LabelNoteName" runat="server" Font-Bold="True" Text="Name for your note:"></asp:Label>
    <asp:TextBox ID="TextBoxNoteName" runat="server" ValidationGroup="validate"></asp:TextBox>
    <asp:Button ID="ButtonSave" runat="server" Text="Save" ValidationGroup="validate" OnClick="ButtonSave_Click" />
</asp:Panel>


