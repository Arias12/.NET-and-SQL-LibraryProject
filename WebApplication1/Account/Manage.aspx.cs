using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Owin;
using WebApplication1.Models;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1.Account
{
    
    public partial class Manage : System.Web.UI.Page
    {
        string login = HttpContext.Current.User.Identity.Name;
        
        string DataWypozyczenia = DateTime.Now.ToString("yyyy-MM-dd");
        static string connectionString = @"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\aspnet-WebApplication1-20170402081813.mdf;Initial Catalog=aspnet-WebApplication1-20170402081813;Integrated Security=True";
        protected string SuccessMessage
        {
            get;
            private set;
        }

        private bool HasPassword(ApplicationUserManager manager)
        {
            return manager.HasPassword(User.Identity.GetUserId());
        }

        public bool HasPhoneNumber { get; private set; }

        public bool TwoFactorEnabled { get; private set; }

        public bool TwoFactorBrowserRemembered { get; private set; }

        public int LoginsCount { get; set; }

        protected void Page_Load()
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            HasPhoneNumber = String.IsNullOrEmpty(manager.GetPhoneNumber(User.Identity.GetUserId()));

            // Enable this after setting up two-factor authentientication
            //PhoneNumber.Text = manager.GetPhoneNumber(User.Identity.GetUserId()) ?? String.Empty;

            TwoFactorEnabled = manager.GetTwoFactorEnabled(User.Identity.GetUserId());

            LoginsCount = manager.GetLogins(User.Identity.GetUserId()).Count;

            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

            if (!IsPostBack)
            {
                // Determine the sections to render
                if (HasPassword(manager))
                {
                    ChangePassword.Visible = true;
                }
                else
                {
                    CreatePassword.Visible = true;
                    ChangePassword.Visible = false;
                }

                // Render success message
                var message = Request.QueryString["m"];
                if (message != null)
                {
                    // Strip the query string from action
                    Form.Action = ResolveUrl("~/Account/Manage");

                    SuccessMessage =
                        message == "ChangePwdSuccess" ? "Your password has been changed."
                        : message == "SetPwdSuccess" ? "Your password has been set."
                        : message == "RemoveLoginSuccess" ? "The account was removed."
                        : message == "AddPhoneNumberSuccess" ? "Phone number has been added"
                        : message == "RemovePhoneNumberSuccess" ? "Phone number was removed"
                        : String.Empty;
                    successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
                }
            }
        }


        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        // Remove phonenumber from user
        protected void RemovePhone_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var result = manager.SetPhoneNumber(User.Identity.GetUserId(), null);
            if (!result.Succeeded)
            {
                return;
            }
            var user = manager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                Response.Redirect("/Account/Manage?m=RemovePhoneNumberSuccess");
            }
        }

        // DisableTwoFactorAuthentication
        protected void TwoFactorDisable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), false);

            Response.Redirect("/Account/Manage");
        }

        //EnableTwoFactorAuthentication 
        protected void TwoFactorEnable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), true);

            Response.Redirect("/Account/Manage");
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = GridView2.SelectedRow.Cells[0].Text;

            string tytul = GridView2.SelectedRow.Cells[1].Text;
            string autor = GridView2.SelectedRow.Cells[2].Text;
            string ktoWypozyczyl = GridView2.SelectedRow.Cells[3].Text;
            string doKiedy = GridView2.SelectedRow.Cells[4].Text;
            string dataZwrotu= DateTime.Now.ToString("yyyy-MM-dd");

           


            string query4 = "Update [Ksiazki] set IloscEgzemplarzy+=1 where Tytul='" + tytul + "'";  //po wypożyczeniu książki liczba egzemplarzy zwiększa się o 1
            using (SqlConnection polacz = new SqlConnection(connectionString))
            using (SqlCommand komenda = new SqlCommand(query4, polacz))
            {
                komenda.Parameters.Add("@Tytul", SqlDbType.VarChar, 50).Value = tytul;


                polacz.Open();
                komenda.ExecuteNonQuery();
                polacz.Close();

            }


            string query3 = "Insert into [HistoriaWypozyczen] (Tytul, Autor, KtoWypozyczyl,DataWypozyczenia, DataZwrotu ) Select Wypozyczone.Tytul,Wypozyczone.Autor,Wypozyczone.KtoWypozyczyl,Wypozyczone.DataWypozyczenia, @DataZwrotu FROM Wypozyczone where Wypozyczone.ID_Wypozyczonej=@Id ";   //wypożyczona ksiażka zostaje wprowadzona do bazy danych i przetrzymywana w celu monitorowania historii wypożyczeń
            using (SqlConnection polacz = new SqlConnection(connectionString))
            using (SqlCommand komenda = new SqlCommand(query3, polacz))
            {
                komenda.Parameters.Add("@Id", SqlDbType.VarChar, 50).Value = id;
                komenda.Parameters.Add("@DataZwrotu", SqlDbType.VarChar, 50).Value = dataZwrotu;



                polacz.Open();
                komenda.ExecuteNonQuery();
                polacz.Close();

            }
            string query = "Delete from [Wypozyczone] where ID_Wypozyczonej='" + id + "'"; //usuwam z wypożyczonych oddaną książkę
            using (SqlConnection polacz = new SqlConnection(connectionString))
            using (SqlCommand komenda = new SqlCommand(query, polacz)) //łączę z bazą i wykonuje zapytanie
            {
                komenda.Parameters.Add("@Id", SqlDbType.VarChar, 50).Value = id;



                polacz.Open();
                komenda.ExecuteNonQuery();
                polacz.Close();
            }

            Response.Redirect("/Account/Manage.aspx"); //odświeżam stronę


        }
    }
}