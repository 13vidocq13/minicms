<%@ Page Title="Notes" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="NotesList.aspx.cs" Inherits="MiniCMS.Admin.NotesList" %>
<%@ Register tagPrefix="control" tagName="NotesListControl" src="~/Controls/NotesListControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <control:NotesListControl runat="server" ID="NotesListControl1"/>
</asp:Content>
