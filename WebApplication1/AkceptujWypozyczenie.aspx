<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AkceptujWypozyczenie.aspx.cs" Inherits="WebApplication1.AkceptujWypozyczenie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Tytul" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="Tytul" HeaderText="Tytul" ReadOnly="True" SortExpression="Tytul" />
            <asp:BoundField DataField="Autor" HeaderText="Autor" SortExpression="Autor" />
            <asp:BoundField DataField="KtoWypozycza" HeaderText="KtoWypozycza" SortExpression="KtoWypozycza" />
            <asp:BoundField DataField="DoKiedy" HeaderText="DoKiedy" SortExpression="DoKiedy" />
            <asp:ButtonField text="Akceptuj Wypożyczenie" CommandName="Select"/> 
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [DoWypozyczenia]"
        ></asp:SqlDataSource>



    <h2> Historia wypożyczeń: </h2>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_HistoriiWypozyczen" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="ID_HistoriiWypozyczen" HeaderText="ID_HistoriiWypozyczen" InsertVisible="False" ReadOnly="True" SortExpression="ID_HistoriiWypozyczen" />
            <asp:BoundField DataField="Tytul" HeaderText="Tytul" SortExpression="Tytul" />
            <asp:BoundField DataField="Autor" HeaderText="Autor" SortExpression="Autor" />
            <asp:BoundField DataField="KtoWypozyczyl" HeaderText="KtoWypozyczyl" SortExpression="KtoWypozyczyl" />
            <asp:BoundField DataField="DataWypozyczenia" HeaderText="DataWypozyczenia" SortExpression="DataWypozyczenia" />
            <asp:BoundField DataField="DataZwrotu" HeaderText="DataZwrotu" SortExpression="DataZwrotu" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [HistoriaWypozyczen]"></asp:SqlDataSource>


<h2> Aktualnie wypożyczone: </h2>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Wypozyczonej" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:BoundField DataField="ID_Wypozyczonej" HeaderText="ID_Wypozyczonej" InsertVisible="False" ReadOnly="True" SortExpression="ID_Wypozyczonej" />
            <asp:BoundField DataField="Tytul" HeaderText="Tytul" SortExpression="Tytul" />
            <asp:BoundField DataField="Autor" HeaderText="Autor" SortExpression="Autor" />
            <asp:BoundField DataField="KtoWypozyczyl" HeaderText="KtoWypozyczyl" SortExpression="KtoWypozyczyl" />
            <asp:BoundField DataField="DataOddania" HeaderText="DataOddania" SortExpression="DataOddania" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Wypozyczone]"></asp:SqlDataSource>
</asp:Content>
