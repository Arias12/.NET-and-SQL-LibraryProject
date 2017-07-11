<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wypozycz.aspx.cs" Inherits="WebApplication1.Wypozycz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



 


    <asp:TextBox ID="TextBox1" placeHolder="Tytul" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox2" placeHolder="Autor" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Szukaj" OnClick="Search"/>
        </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1"  runat="server"  AutoGenerateColumns="False" DataKeyNames="Tytul" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="491px">
            <Columns>
                <asp:BoundField DataField="Tytul" HeaderText="Tytul" ReadOnly="True" SortExpression="Tytul" />
                <asp:BoundField DataField="Autor" HeaderText="Autor" SortExpression="Autor" />
                <asp:BoundField DataField="IloscEgzemplarzy" HeaderText="IloscEgzemplarzy" SortExpression="IloscEgzemplarzy" />
              
                   
              

                   <asp:ButtonField text="Wypozycz" CommandName="Select"/> 
        
                 </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Ksiazki]"
            >
        </asp:SqlDataSource>


</asp:Content>
