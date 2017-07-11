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
    public partial class Szukaj : System.Web.UI.Page
    {
        
        SqlConnection connectionString =new SqlConnection( @"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\aspnet-WebApplication1-20170402081813.mdf;Initial Catalog=aspnet-WebApplication1-20170402081813;Integrated Security=True");  //łączę się z Bazą Danych
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)  //cała funkcja ma za zadanie odświęzyć po wyszukiwaniu 
           {
               SzukajKsiazek();
               SearchButton.Visible = true;
            }
        }

        protected void Search(object sender, EventArgs e) //po naciśnięciu przycisku przeszukuje spis książek
        {
                          
            SzukajKsiazek();  //wywołanie funkcji
            
        }

        private void SzukajKsiazek()
        {
            string value = TextBox1.Text;
            string value2 = TextBox2.Text; //zapisuje wartości z textboxów jako String 
            value = value.Replace("'", "['']");
            value2 = value2.Replace("'", "['']");
            SqlDataSource1.SelectCommand = "SELECT * FROM Ksiazki WHERE  (Tytul LIKE '%" + value.ToString() + "%' AND Autor LIKE'%" + value2.ToString() + "%' )"; //zapytanie, które sprawdza zawartość TextBoxów i wyszukuje w bazie danych książki o określonym tytule i autorze
            SearchButton.Visible = true;
        }


    }
}