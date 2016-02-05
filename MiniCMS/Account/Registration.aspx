<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="MiniCMS.Account.Registration" %>
<%@ Register tagPrefix="control" tagName="Registration" src="~/Controls/RegistrationControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <control:Registration ID="Registration1" runat="server" />
</asp:Content>
