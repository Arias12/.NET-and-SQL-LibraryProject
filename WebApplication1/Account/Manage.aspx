<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="WebApplication1.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h4>Change your account settings</h4>
                <hr />
                <dl class="dl-horizontal">
                    <dt>Password:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="false" ID="ChangePassword" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" />
                    </dd>
                    <dt>External Logins:</dt>
                    <dd><%: LoginsCount %>
                        <asp:HyperLink NavigateUrl="/Account/ManageLogins" Text="[Manage]" runat="server" />

                    </dd>
                    

                    <dt>Two-Factor Authentication:</dt>
                    <dd>
                        <p>
                            There are no two-factor authentication providers configured. See <a href="http://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                            for details on setting up this ASP.NET application to support two-factor authentication.
                        </p>
                    </dd>
                    <li>
                        <br />
                    </li>
                </dl>
                
                    <h2> Historia wypożyczeń:</h2>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_HistoriiWypozyczen" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="ID_HistoriiWypozyczen" HeaderText="ID_HistoriiWypozyczen" ReadOnly="True" SortExpression="ID_HistoriiWypozyczen" InsertVisible="False" />
                            <asp:BoundField DataField="Tytul" HeaderText="Tytul" SortExpression="Tytul" />
                            <asp:BoundField DataField="Autor" HeaderText="Autor" SortExpression="Autor" />
                            <asp:BoundField DataField="KtoWypozyczyl" HeaderText="KtoWypozyczyl" SortExpression="KtoWypozyczyl" />
                            <asp:BoundField DataField="DataWypozyczenia" HeaderText="DataWypozyczenia" SortExpression="DataWypozyczenia" />
                            <asp:BoundField DataField="DataZwrotu" HeaderText="DataZwrotu" SortExpression="DataZwrotu" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [HistoriaWypozyczen]">
                    </asp:SqlDataSource>
                </p>

                <h2> Aktualnie wypożyczone:</h2>
                <p> &nbsp;</p>
                <p> 
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Wypozyczonej" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="ID_Wypozyczonej" HeaderText="ID_Wypozyczonej" InsertVisible="False" ReadOnly="True" SortExpression="ID_Wypozyczonej" />
                            <asp:BoundField DataField="Tytul" HeaderText="Tytul" SortExpression="Tytul" />
                            <asp:BoundField DataField="Autor" HeaderText="Autor" SortExpression="Autor" />
                            <asp:BoundField DataField="KtoWypozyczyl" HeaderText="KtoWypozyczyl" SortExpression="KtoWypozyczyl" />
                            <asp:BoundField DataField="DataOddania" HeaderText="DataOddania" SortExpression="DataOddania" />
                            <asp:ButtonField Text="Zwróć" CommandName="Select"/>
                            
                            
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Wypozyczone]" ></asp:SqlDataSource>
                </p>

                      
                
                
                
                
                
                
                
                
                
                
                
                
                  <% if (TwoFactorEnabled)
                          { %> 
                        <%--
                        Enabled
                        <asp:LinkButton Text="[Disable]" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />
                        --%>
                        <% }
                          else
                          { %> 
                        <%--
                        Disabled
                        <asp:LinkButton Text="[Enable]" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />
                        --%>
                        <% } %>
            </div>
        </div>
    </div>

</asp:Content>
