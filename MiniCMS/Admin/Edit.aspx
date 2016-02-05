<%@ Page Title="Edit Note" Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MiniCMS.Admin.Edit" MasterPageFile="~/Site.master" %>
<%@ Register tagPrefix="control" tagName="EditorControl" src="~/Controls/EditorControl.ascx" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <control:EditorControl ID="EditorControl1" runat="server" />
</asp:Content>