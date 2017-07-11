using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Wypozycz : System.Web.UI.Page
    {
        static string connectionString = @"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\aspnet-WebApplication1-20170402081813.mdf;Initial Catalog=aspnet-WebApplication1-20170402081813;Integrated Security=True";  //łączę się z Bazą Danych
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SzukajKsiazek();
                Button1.Visible = true;
                
            }
        }

        protected void Search(object sender, EventArgs e)
        {

            SzukajKsiazek();

        }

        private void SzukajKsiazek() //opisane w szukaj.aspx
        {
            string value = TextBox1.Text;
            string value2 = TextBox2.Text;
            value = value.Replace("'", "['']");
            value2 = value2.Replace("'", "['']");
            SqlDataSource1.SelectCommand = "SELECT * FROM Ksiazki WHERE  (Tytul LIKE '%" + value.ToString() + "%' AND Autor LIKE'%" + value2.ToString() + "%' )"; //zapytanie, które sprawdza zawartość TextBoxów i wyszukuje w bazie danych książki o określonym tytule i autorze
            Button1.Visible = true;
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String ktoWypozycza = HttpContext.Current.User.Identity.Name;
            string tytul = GridView1.SelectedRow.Cells[0].Text;
            string autor = GridView1.SelectedRow.Cells[1].Text;
            string doKiedy = "12/10/2018";  //niestety, liczne próby utworzenia za omocą jQuery kalendarza, który generowałby datę spełzły na niczym
            string login = Context.User.Identity.GetUserName();
            
            string query = "Insert into [DoWypozyczenia] (Tytul, Autor, KtoWypozycza, DoKiedy ) values (@Tytul, @Autor, @KtoWypozycza, @DoKiedy)";
            using (SqlConnection polacz = new SqlConnection(connectionString))
            using (SqlCommand komenda = new SqlCommand(query, polacz))
            {
                komenda.Parameters.Add("@Tytul", SqlDbType.VarChar, 50).Value = tytul;
                komenda.Parameters.Add("@Autor", SqlDbType.VarChar, 50).Value = autor;
                komenda.Parameters.Add("@KtoWYpozycza", SqlDbType.VarChar, 50).Value = ktoWypozycza;
                komenda.Parameters.Add("@DoKiedy", SqlDbType.VarChar, 50).Value = doKiedy;


                polacz.Open();
                komenda.ExecuteNonQuery();
                polacz.Close();

            }
            Response.Redirect("Wypozycz.aspx");
        }

    }
}