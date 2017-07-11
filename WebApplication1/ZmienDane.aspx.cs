using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ZmienDane : System.Web.UI.Page
    {

        protected void Button1_Click(object sender, EventArgs e)
        {

            string login = HttpContext.Current.User.Identity.Name;
            SqlConnection vid = new SqlConnection(@"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\aspnet-WebApplication1-20170402081813.mdf;Initial Catalog=aspnet-WebApplication1-20170402081813;Integrated Security=True"); //łączę się z Bazą Danych
            {


                SqlCommand xp = new SqlCommand("Insert into ZmianaDanych(Imie, Nazwisko, MiastoZamieszkania, UlicaZamieszkania, NumerTelefonu, Email) Values( @Imie, @Nazwisko, @MiastoZamieszkania, @UlicaZamieszkania, @NumerTelefonu, @Email)", vid); //zapytanie sql za pomocą którego wprowadzam wartosci do tabeli

                xp.Parameters.AddWithValue("@Imie", TextBox1.Text);
                xp.Parameters.AddWithValue("@Nazwisko", TextBox2.Text);
                xp.Parameters.AddWithValue("@MiastoZamieszkania", TextBox3.Text);
                xp.Parameters.AddWithValue("@UlicaZamieszkania", TextBox3.Text);
                xp.Parameters.AddWithValue("@NumerTelefonu", TextBox3.Text);
                xp.Parameters.AddWithValue("@Email", login);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();

                if (IsPostBack)
                {
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    



                }
                Response.Redirect("ZmienDane.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}