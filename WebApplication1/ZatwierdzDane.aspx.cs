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
    public partial class ZatwierdzDane : System.Web.UI.Page
    {
        static string connectionString = @"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\aspnet-WebApplication1-20170402081813.mdf;Initial Catalog=aspnet-WebApplication1-20170402081813;Integrated Security=True";  //łączę się z Bazą Danych
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            string email = GridView1.SelectedRow.Cells[5].Text;
            string numerTelefonu = GridView1.SelectedRow.Cells[4].Text;
            string ulicaZamieszkania = GridView1.SelectedRow.Cells[3].Text;
            string miastoZamieszkania = GridView1.SelectedRow.Cells[2].Text;
            string nazwisko = GridView1.SelectedRow.Cells[1].Text;
            string imie = GridView1.SelectedRow.Cells[0].Text;



            string query = "Insert into ZmienioneDane values (@Imie, @Nazwisko, @MiastoZamieszkania, @UlicaZamieszkania, @NumerTelefonu, @Email)";
            using (SqlConnection polacz = new SqlConnection(connectionString))
            using (SqlCommand komenda = new SqlCommand(query, polacz))
            {
                komenda.Parameters.Add("@Imie", SqlDbType.VarChar, 50).Value = imie;
                komenda.Parameters.Add("@Nazwisko", SqlDbType.VarChar, 50).Value = nazwisko;
                komenda.Parameters.Add("@MiastoZamieszkania", SqlDbType.VarChar, 50).Value = miastoZamieszkania;
                komenda.Parameters.Add("@UlicaZamieszkania", SqlDbType.VarChar, 50).Value = ulicaZamieszkania;
                komenda.Parameters.Add("@NumerTelefonu", SqlDbType.VarChar, 50).Value = numerTelefonu;
                komenda.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = email;


                polacz.Open();
                komenda.ExecuteNonQuery();
                polacz.Close();

            }


            string query2 = "Delete from ZmianaDanych where Email='" + email + "'"; 
            using (SqlConnection polacz = new SqlConnection(connectionString))
            using (SqlCommand komenda = new SqlCommand(query2, polacz))
            {
                
                komenda.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = email;


                polacz.Open();
                komenda.ExecuteNonQuery();
                polacz.Close();

            }

            Response.Redirect("ZatwierdzDane.aspx");  //odświeżam stronę
        }
    }
}