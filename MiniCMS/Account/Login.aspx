<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MiniCMS.Account.Login" %>
<%@ Register TagPrefix="control" TagName="Login" Src="~/Controls/LoginControl.ascx" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <control:Login ID="Login1" runat="server" />
</asp:Content>
