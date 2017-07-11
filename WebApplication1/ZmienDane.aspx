<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ZmienDane.aspx.cs" Inherits="WebApplication1.ZmienDane" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <p>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</p>
    <p>
        <asp:TextBox ID="TextBox1" placeholder="Imie" runat="server" Height="30px" Width="178px"></asp:TextBox>
        <asp:TextBox ID="TextBox2" placeholder="Nazwisko" runat="server" Height="33px" Width="155px"></asp:TextBox>
        <asp:TextBox ID="TextBox3" placeholder="MiastoZamieszkania" runat="server" Height="38px" Width="164px"></asp:TextBox>
        <asp:TextBox ID="TextBox4" placeholder="UlicaZamieszkania" runat="server" Height="35px" Width="148px"></asp:TextBox>
        <asp:TextBox ID="TextBox5" placeholder="NumerTelefonu" runat="server" Height="32px" Width="164px"></asp:TextBox>
    </p>
    <p>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Dodaj" OnClick="Button1_Click" Width="168px" />
    </p>
<p>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RegularExpressionValidator" style="top: 154px; left: 175px; position: absolute; height: 16px; width: 175px" ValidationExpression="[A-Z]{1}[a-z]{2,}">np: Patryk</asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" style="top: 153px; left: 400px; position: absolute; height: 16px; width: 175px" ValidationExpression="[A-Z]{1}[a-z]{2,}">np: Kowalski</asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="RegularExpressionValidator" style="top: 151px; left: 550px; position: absolute; height: 16px; width: 175px">np: Warszawa</asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="RegularExpressionValidator" style="top: 152px; left: 700px; position: absolute; height: 16px; width: 175px" ValidationExpression="([A-Z]{1}[a-z]{2,}\s+){1,}[0-9]{1,}">np: Plac Trzech Krzyży 12</asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="RegularExpressionValidator" style="top: 153px; left: 900px; position: absolute; height: 16px; width: 175px" ValidationExpression="[0-9]{9}">np: 606102203</asp:RegularExpressionValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
<p>
        &nbsp;</p>
<p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Email" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                <asp:BoundField DataField="MiastoZamieszkania" HeaderText="MiastoZamieszkania" SortExpression="MiastoZamieszkania" />
                <asp:BoundField DataField="UlicaZamieszkania" HeaderText="UlicaZamieszkania" SortExpression="UlicaZamieszkania" />
                <asp:BoundField DataField="NumerTelefonu" HeaderText="NumerTelefonu" SortExpression="NumerTelefonu" />
                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [ZmianaDanych]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
