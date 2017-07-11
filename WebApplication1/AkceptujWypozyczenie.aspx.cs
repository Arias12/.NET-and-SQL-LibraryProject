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
    public partial class AkceptujWypozyczenie : System.Web.UI.Page
    {
        static string connectionString = @"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\aspnet-WebApplication1-20170402081813.mdf;Initial Catalog=aspnet-WebApplication1-20170402081813;Integrated Security=True";  //łączę się z Bazą Danych
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            string tytul = GridView1.SelectedRow.Cells[0].Text;
            string autor = GridView1.SelectedRow.Cells[1].Text;
            string ktoWypozyczyl = GridView1.SelectedRow.Cells[2].Text;
            string doKiedy = GridView1.SelectedRow.Cells[3].Text;
            string DataWypozyczenia= DateTime.Now.ToString("yyyy-MM-dd");
            

            string query = "Insert into [Wypozyczone] (Tytul, Autor, KtoWypozyczyl, DataOddania, DataWypozyczenia ) values (@Tytul, @Autor, @KtoWypozyczyl, @DataOddania, @DataWypozyczenia)";
            using (SqlConnection polacz = new SqlConnection(connectionString))
            using (SqlCommand komenda = new SqlCommand(query, polacz))
            {
                komenda.Parameters.Add("@Tytul", SqlDbType.VarChar, 50).Value = tytul;
                komenda.Parameters.Add("@Autor", SqlDbType.VarChar, 50).Value = autor;
                komenda.Parameters.Add("@KtoWypozyczyl", SqlDbType.VarChar, 50).Value = ktoWypozyczyl;
                komenda.Parameters.Add("@DataOddania", SqlDbType.VarChar, 50).Value = doKiedy;
                komenda.Parameters.Add("@DataWypozyczenia", SqlDbType.VarChar, 50).Value = DataWypozyczenia;


                polacz.Open();
                komenda.ExecuteNonQuery();
                polacz.Close();

            }
          



            



            string query4 = "Update [Ksiazki] set IloscEgzemplarzy-=1 where Tytul='" + tytul + "'";  //po wypożyczeniu książki liczba egzemplarzy zmniejsza się o 1
            using (SqlConnection polacz = new SqlConnection(connectionString))
            using (SqlCommand komenda = new SqlCommand(query4, polacz))
            {
                komenda.Parameters.Add("@Tytul", SqlDbType.VarChar, 50).Value = tytul;
                
                
                polacz.Open();
                komenda.ExecuteNonQuery();
                polacz.Close();

            }


            string query2 = "Delete from [doWypozyczenia] where Tytul='" + tytul + "'";  //wypożyczone książki usuwam z bazy ksiązek do wypożyczenia
            using (SqlConnection polacz = new SqlConnection(connectionString))
            using (SqlCommand komenda = new SqlCommand(query2, polacz))
            {
                komenda.Parameters.Add("@Tytul", SqlDbType.VarChar, 50).Value = tytul;



                polacz.Open();
                komenda.ExecuteNonQuery();
                polacz.Close();

            }



            Response.Redirect("AkceptujWypozyczenie.aspx");

        }
    }
}