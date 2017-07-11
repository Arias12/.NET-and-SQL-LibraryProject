<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>Przypisz role:</h3>
    
    

    
   
    
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:ButtonField text="Czytelnik" CommandName="Select"/> 
        </Columns>
    </asp:GridView>
    
   
    
     <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Id" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
         <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:ButtonField text="Pracownik" CommandName="Select"/> 
        </Columns>
    </asp:GridView>
   
    
    
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [Email] FROM [AspNetUsers]
where CzyAktywny='0'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [Email] FROM [AspNetUsers]
where CzyAktywny='0'"></asp:SqlDataSource>
    
   
    


    <h2>Usuń użytkownika:  </h2>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:CommandField DeleteText="Usuń użytkownika" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>




    
    

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [Email], [UserName] FROM [AspNetUsers] where Email&lt;&gt;'patrykbolek@onet.pl'" DeleteCommand="DELETE From [AspNetUsers] WHERE [Id]=@Id"></asp:SqlDataSource>




    <h2>Kary do zapłacenia:</h2>
    <p>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="Tytul" HeaderText="Tytul" SortExpression="Tytul" />
                <asp:BoundField DataField="Autor" HeaderText="Autor" SortExpression="Autor" />
                <asp:BoundField DataField="KtoWypozyczyl" HeaderText="KtoWypozyczyl" SortExpression="KtoWypozyczyl" />
                <asp:BoundField DataField="Kara" HeaderText="Kara" ReadOnly="True" SortExpression="Kara" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT W.Tytul, W.Autor, W.KtoWypozyczyl, DATEDIFF(day, W.DataOddania, HW.DataZwrotu) AS Kara FROM Wypozyczone AS W INNER JOIN HistoriaWypozyczen AS HW ON W.Tytul = HW.Tytul AND W.KtoWypozyczyl = HW.KtoWypozyczyl WHERE (DATEDIFF(day, W.DataOddania, HW.DataZwrotu) &gt; 0)"></asp:SqlDataSource>
    </p>

    

    </asp:Content>
