<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Szukaj.aspx.cs" Inherits="WebApplication1.Szukaj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <p>
        <asp:TextBox ID="TextBox1" placeHolder="Tytul" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox2" placeHolder="Autor" runat="server"></asp:TextBox>
        <asp:Button ID="SearchButton" runat="server" Text="Szukaj" OnClick="Search"/>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Tytul" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Tytul" HeaderText="Tytul" ReadOnly="True" SortExpression="Tytul" />
                <asp:BoundField DataField="Autor" HeaderText="Autor" SortExpression="Autor" />
                <asp:BoundField DataField="IloscEgzemplarzy" HeaderText="IloscEgzemplarzy" SortExpression="IloscEgzemplarzy" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Ksiazki]"
            >
        </asp:SqlDataSource>
    </p>
</asp:Content>



