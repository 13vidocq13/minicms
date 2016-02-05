<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NotesListControl.ascx.cs" Inherits="MiniCMS.Controls.NotesListControl" %>
<%@ Register TagPrefix="control" TagName="Pager" Src="PagerControl.ascx" %>

<asp:Panel ID="PanelNotes" runat="server">
    <asp:Label ID="Labelerror" runat="server" Text="" CssClass="error"></asp:Label>
    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
        <HeaderTemplate>
            <table style="width: 100%">
                <tr>
                    <td>
                        <h3><b><u>
                            <asp:Label ID="LabelManageYourNotes" runat="server" Text="Manage your notes"></asp:Label></u></b></h3>
                        <br />
                    </td>
                    <td colspan="2">
                        <h3>
                            <asp:LinkButton ID="LinkButtonAddNote" runat="server" PostBackUrl="~/Admin/Edit.aspx">Add</asp:LinkButton>
                        </h3>
                    </td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <b>
                        <%# DataBinder.Eval(Container.DataItem, "Name") %></b>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButtonEdit" PostBackUrl='<%# Page.ResolveUrl("~/Admin/Edit.aspx?noteId=") + DataBinder.Eval(Container.DataItem, "Id" )%>' runat="server">Edit</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandName="delete" OnClientClick="return confirm('Are you sure you want delete');" 
                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id") %>'>Delete</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td><%# DataBinder.Eval(Container.DataItem, "ShortNote") %></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:LinkButton ID="LinkButtonReadMore" PostBackUrl='<%# Page.ResolveUrl("~/Views/NotesPreview.aspx?noteId=") + DataBinder.Eval(Container.DataItem, "Id" )%>' runat="server">Read more...</asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <SeparatorTemplate>
            <tr>
                <td colspan="3">
                    <hr>
                </td>
            </tr>
        </SeparatorTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <control:Pager runat="server" ID="PagerControl1" />
    <asp:HiddenField ID="HiddenFieldCurrentPage" runat="server" />
</asp:Panel>
