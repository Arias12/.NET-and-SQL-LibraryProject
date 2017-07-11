using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;
using System.Configuration;

namespace WebApplication1
{
    public partial class About : Page
    {

       

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection vid = new SqlConnection(@"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\aspnet-WebApplication1-20170402081813.mdf;Initial Catalog=aspnet-WebApplication1-20170402081813;Integrated Security=True"); //łączę się z Bazą Danych
               {
               

                    SqlCommand xp = new SqlCommand("Insert into Ksiazki( Tytul, Autor, IloscEgzemplarzy) Values( @Tytul, @Autor, @IloscEgzemplarzy)", vid); //zapytanie sql za pomocą którego wprowadzam wartosci z TextBoxów do tabeli
                    
                    xp.Parameters.AddWithValue("@Tytul", TextBox1.Text); //jako tytul wprowadzam zawartosc pierwszego textboxa
                    xp.Parameters.AddWithValue("@Autor", TextBox2.Text);
                    xp.Parameters.AddWithValue("@IloscEgzemplarzy", TextBox3.Text);

                    vid.Open(); //otwierm połączenie z Baza Danych
                    xp.ExecuteNonQuery(); //wykonuje zapytanie
                    vid.Close(); //kończę połączenie z bazą

                    if (IsPostBack)
                    {
                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        TextBox3.Text = "";


                    
                    }
                Response.Redirect("About.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}