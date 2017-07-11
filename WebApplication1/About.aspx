<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication1.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  

    
    <p>         Aktualny spis książek .
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Height="189px" Width="714px" DataKeyNames="Tytul" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Tytul"  HeaderText="Tytul" ReadOnly="True" SortExpression="Tytul" />
                <asp:BoundField DataField="Autor" HeaderText="Autor" SortExpression="Autor" />
                <asp:BoundField DataField="IloscEgzemplarzy" HeaderText="IloscEgzemplarzy" SortExpression="IloscEgzemplarzy" />
                 
                <asp:CommandField ShowDeleteButton="True" />
                 
            </Columns>
        </asp:GridView>
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Ksiazki] " DeleteCommand="DELETE From [Ksiazki] WHERE [Tytul]=@Tytul"></asp:SqlDataSource>
       
    </p>
    <p>&nbsp;</p>
    <p>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" style="top: 548px; left: 135px; position: absolute; height: 16px; width: 145px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" style="top: 548px; left: 455px; position: absolute; height: 16px; width: 145px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="RequiredFieldValidator" style="top: 541px; left: 662px; position: absolute; height: 16px; width: 145px"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="RegularExpressionValidator" style="top: 545px; left: 638px; position: absolute; height: 16px; width: 175px" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
</p>
    <p>&nbsp;</p>
    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dodaj ksiażki: 
        </h2>
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Zatwierdz" />
    </p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Tytul"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" placeholder="Autor"></asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server" placeholder="Ilosc Egzemplarzy"></asp:TextBox>
    </p>
    <p>&nbsp;</p>

</asp:Content>
