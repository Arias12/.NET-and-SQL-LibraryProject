<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ZatwierdzDane.aspx.cs" Inherits="WebApplication1.ZatwierdzDane" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    
        <h2> Zatwierdz dane</h2>
    
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Email" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                <asp:BoundField DataField="MiastoZamieszkania" HeaderText="MiastoZamieszkania" SortExpression="MiastoZamieszkania" />
                <asp:BoundField DataField="UlicaZamieszkania" HeaderText="UlicaZamieszkania" SortExpression="UlicaZamieszkania" />
                <asp:BoundField DataField="NumerTelefonu" HeaderText="NumerTelefonu" SortExpression="NumerTelefonu" />
                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                <asp:ButtonField text="Zatwierdź dane" CommandName="Select"/> 
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [ZmianaDanych]" DeleteCommand="DELETE From [ZmianaDanych] WHERE [Email]=@Email"></asp:SqlDataSource>
    </p>
</asp:Content>
