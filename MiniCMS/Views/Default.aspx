<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MiniCMS.Views._Default" Culture="auto" UICulture="auto" %>
<%@ Register tagPrefix="control" tagName="NotesListControl" src="~/Controls/NotesListControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <control:NotesListControl runat="server" ID="NotesListControl1"/>
</asp:Content>
