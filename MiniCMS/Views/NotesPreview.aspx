<%@ Page Title="Note" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NotesPreview.aspx.cs" Inherits="MiniCMS.Views.NotesPreview" %>
<%@ Register tagPrefix="control" tagName="NotesPreview" src="~/Controls/NotesPreviewControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <control:NotesPreview ID="NotesPreview1" runat="server" />
</asp:Content>
