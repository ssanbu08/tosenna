using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Globalization;
using System.Web.Security;
using System.Web.UI;
using System.Net.Mail;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using PresentationManager.Web.UI.MasterPages;

namespace SchoolNet
{
    public partial class AddCattle : SchoolNetBase
    {
        public int EmpId;
        protected void Page_Load(object sender, EventArgs e)
        {
            EmpId = Int32.Parse(Page.User.Identity.Name.ToString());
            if (!Page.IsPostBack)
            {
                LoadLocationType(Tab1_LocType);
                LoadLocationByLocationType(Tab1_Location, Int32.Parse(Tab1_LocType.SelectedValue));
                LoadGenderType(Tab1_GenderType);
                LoadBreedType(Tab1_BreedType);
                LoadVeterinarians(Tab1_Veterinary);
                LoadTrainers(Tab1_Trainer);
                LoadMaleParentLookup(Tab1_MaleParent, Tab1_DOB.Text.ToString());
                LoadFemaleParentLookup(Tab1_FemaleParent, Tab1_DOB.Text.ToString());
            }
            
            else
            {
                if (Int32.Parse(Tab1_Location.SelectedValue) == -1)
                {
                    LoadLocationByLocationType(Tab1_Location, Int32.Parse(Tab1_LocType.SelectedValue));
                }
            }

        }
        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
            this.EnableViewState = true;
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            Save_Cattle.Click +=new EventHandler(Save_Cattle_Click);
            Cancel.Click +=new EventHandler(Cancel_Click);
            //Tab1_LocType.SelectedIndexChanged += new EventHandler(Tab1_LocType_SelectedIndexChanged);
            Tab1_DOB.TextChanged += new EventHandler(DOB_TextChanged);
            
        }
        #endregion

        
        protected void Tab1_LocType_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadLocationByLocationType(Tab1_Location, Int32.Parse(Tab1_LocType.SelectedValue));
        }

        protected void DOB_TextChanged(object sender, EventArgs e)
        {
            LoadMaleParentLookup(Tab1_MaleParent, Tab1_DOB.Text.ToString());
            LoadFemaleParentLookup(Tab1_FemaleParent, Tab1_DOB.Text.ToString());
        }

        protected void Save_Cattle_Click(object sender, EventArgs e)
        {
            Int32 BornOutside; Int32 CattleStatus = (int)Constants.AnimalStatusType.InHouse;
            try
            {
                if (Page.IsValid == true)
                {

                    if (Tab1_BornOutside1.Checked) { BornOutside = 1; } else { BornOutside = 0; }

                 //   if (Tab1_MicrochipID.Text == "") { Tab1_MicrochipID.Text = "0"; }
                    if (Tab1_BirthWeight.Text == "") { Tab1_BirthWeight.Text = "0"; }
                    if (Tab1_BirthHeight.Text == "") { Tab1_BirthHeight.Text = "0"; }
                    if (Tab1_KeyField.Text.ToString() == "") { Tab1_KeyField.Text = "0"; }
                    String Result = DatabaseManager.Data.DBAccessManager.AddUpdateCattle(Int32.Parse(Tab1_KeyField.Text), Tab1_CattleName.Text.ToString(),
                        Tab1_CattleShortName.Text.ToString(), Tab1_AnimalTagId.Text.ToString(), -1, CattleStatus, Int32.Parse(Tab1_BreedType.SelectedValue), Tab1_MicrochipID.Text.ToString(), Int32.Parse(Tab1_Trainer.SelectedValue), Int32.Parse(Tab1_Veterinary.SelectedValue), Int32.Parse(Tab1_Location.SelectedValue), Int32.Parse(Tab1_GenderType.SelectedValue), ConvertDMY_MDY(Tab1_DOB),
                        BornOutside, Double.Parse(Tab1_BirthWeight.Text), Double.Parse(Tab1_BirthHeight.Text), Int32.Parse(Tab1_MaleParent.SelectedValue), Int32.Parse(Tab1_FemaleParent.SelectedValue), Tab1_CattleColor.Text.ToString(), ConvertDMY_MDY(Tab1_AnimalAdopted), "", Tab1_Notes.Text.ToString(), EmpId); 
                        
                    this.AlertDiv.Visible = true;
                    
                    if (Result == "")
                    {
                        this.AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                        this.message.Text = "Successfully saved.";
                        ResetFields();

                    }
                    else
                    {
                        this.AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                        this.message.Text = Result;
                    }
                }
                else
                {
                    this.AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                    this.message.Text = "Error:Could not save the information. Please check the inputs";
                    //this.message.CssClass = "errorMessage";
                }

            }
            catch (Exception exception)
            {
                this.AlertDiv.Visible = true;
                this.AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                this.message.Text = ErrorLogging.LogError(exception,"Unknown Exception Occured. Please contact support.");
              //  this.message.CssClass = "errorMessage";
            }   
        }


        private void NotifyEmployee_PortaLoginViaEmail(string EmpName, string Employee_EmailAddress,string userName, string Password)
        {
            string HRSystemLink = ConfigurationManager.AppSettings["HRSystemURL"].ToString();
            string FromAddressDisplayName = ConfigurationManager.AppSettings["FromEmailDisplayName"].ToString();

            string subject = "Ark HRMS Alerting Service:AON HRM System Login Credentials";

            string bodycontent = "<html><body leftmargin=10 style=\"font-family: Arial;font-size:11\">" +
                                 "<P><br> Hello " + EmpName + "," +
                                "<br><br>You have received this email because HR Administrator has created login credentials for you to access AON HR System." +
                                "<br> You can click  <a href id=a1 runat=server href="+HRSystemLink+">"+FromAddressDisplayName+ "</a> link in order to login." +
                                "<br>If you have not made this request, Please contact your HR administrator" +
                                "<br><br>Your UserName/Email Address : " + userName +
                                "<br>Password : " + Password +
                                "<br><br>You may want to change your password once logged in and note down your login credentials for future access." +
                                "<br><br><br><font-size:14>THIS IS AN AUTOMATED,UNMONITORED EMAIL.PLEASE DO NOT REPLY OR FORWARD TO THIS EMAIL ADDRESS." +
                                "</P></body></HTML>";

            try
            {
                string fromEmail = ConfigurationManager.AppSettings["FromEmail"].ToString();
                MailMessage message = new MailMessage();
                message.IsBodyHtml = true;
                message.From = new MailAddress(fromEmail, FromAddressDisplayName);

                if (Employee_EmailAddress.Trim() != "")
                {
                    message.To.Add(Employee_EmailAddress.Trim());
                }

                message.Subject = subject;
                message.Body = bodycontent;

                SmtpClient smtp = new SmtpClient();
                smtp.Send(message);
                this.message.Visible = true;
                this.message.Text = "Employee login credentials have been sent to employee's work email account on our system.";
                this.message.CssClass = "errorMessage";

            }
            catch (Exception exception)
            {
                this.message.Visible = true;
                this.message.Text = ErrorLogging.LogError(exception, "There was an error in sending email notification.");
                this.message.CssClass = "errorMessage";

            }

        }



        protected void Cancel_Click(object sender, EventArgs e)
        {
            ResetFields();
            message.Text = "";
            AlertDiv.Visible = false;
        }

        private void ResetFields()
        {
            Tab1_CattleName.Text = "";
            Tab1_CattleShortName.Text = "";
            Tab1_DOB.Text = "";
            Tab1_GenderType.SelectedIndex = -1;
            Tab1_BreedType.SelectedIndex = -1;
         //   Tab1_CattleGroup.SelectedIndex = -1;
            Tab1_AnimalTagId.Text = "";
            Tab1_MicrochipID.Text = "";
            Tab1_Trainer.SelectedIndex = -1;
            Tab1_Veterinary.SelectedIndex = -1;
            Tab1_LocType.SelectedIndex = -1;       
            Tab1_Location.SelectedIndex = -1;       
            
            Tab1_BornOutside1.Checked = true;
            Tab1_BornOutside2.Checked = false;

            Tab1_BirthWeight.Text = "";
            Tab1_BirthHeight.Text = "";
            Tab1_MaleParent.SelectedIndex = -1;
            Tab1_FemaleParent.SelectedIndex = -1;
            Tab1_CattleColor.Text = "";
            Tab1_AnimalAdopted.Text = "";
         //   Tab1_DisplacedDate.Text = "";
            Tab1_Notes.Text = "";
            
        }

    }
}
