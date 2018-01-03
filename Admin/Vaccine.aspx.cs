using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using PresentationManager.Web.UI.MasterPages;

namespace SchoolNet
{
    public partial class Vaccine : SchoolNetBase
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Put user code to initialize the page here
                LoadVaccinationMethodLookup(VaccineMethod);
                LoadDiseaseLookup(Disease);
                LoadTimePeriodLookup(RevaccinationType);
                LoadUOMTypeLookup(DoseMetric);
            }
            LoadDataList();
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
            Save.Click += new EventHandler(Save_Click);
            Reset.Click += new EventHandler(Reset_Click);

        }
        #endregion
        #region Load LoadDataList
        private void LoadDataList()
        {
            DataSet _DataList = null;
            _DataList = DatabaseManager.Data.DBAccessManager.RetrieveVaccinesList();
            if (_DataList.Tables[0].Rows.Count > 0)
            {
                this.VaccineGrid.DataSource = _DataList;
                this.VaccineGrid.DataBind();
            }
            else
            {
                this.VaccineGrid.DataSource = null;
                this.VaccineGrid.DataBind();
            }

        }
        #endregion

        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid == true)
                {
                    Int32 Status = 0;

                    if (VaccineStatus1.Checked) { Status = 1; }
                    if (Tab1_KeyField.Text.ToString() == "") { Tab1_KeyField.Text = "0"; }
                    if (FirstVaccination.Text.ToString() == "") { FirstVaccination.Text = "0"; }
                    if (BoosterDose.Text.ToString() == "") { BoosterDose.Text = "0"; }
                    if (DoseQuantity.Text.ToString() == "") { DoseQuantity.Text = "0"; }
                    String Result = DatabaseManager.Data.DBAccessManager.AddUpdateVaccines(Int32.Parse(Tab1_KeyField.Text), VaccineName.Text, Int32.Parse(Disease.Text), Int32.Parse(VaccineMethod.Text), Int32.Parse(FirstVaccination.Text), Int32.Parse(BoosterDose.Text), Int32.Parse(RevaccinationType.Text), Description.Text, TradeName.Text, Int32.Parse(DoseQuantity.Text), Int32.Parse(DoseMetric.Text), Status, Int32.Parse(Page.User.Identity.Name.ToString()));
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
                }

            }
            catch (Exception exception)
            {
                this.AlertDiv.Visible = true;
                this.AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                this.message.Text = ErrorLogging.LogError(exception, "Unknown Exception Occured. Please contact support.");
            }
            LoadDataList(); // Refresh the Grid after Save.
        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            ResetFields();
            message.Text = "";
            AlertDiv.Visible = false;
        }
        private void ResetFields()
        {
            VaccineName.Text = "";
            VaccineMethod.SelectedIndex = -1;
            Disease.SelectedIndex = -1;
            Description.Text = "";
            FirstVaccination.Text = "";
            BoosterDose.Text = "";
            RevaccinationType.SelectedIndex = -1;
            TradeName.Text = "";
            DoseQuantity.Text = "";
            DoseMetric.SelectedIndex = -1;
            VaccineStatus1.Checked = true; VaccineStatus2.Checked = false;
            Tab1_KeyField.Text = "";
            
        }

        protected void VaccineGrid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                message.Text = "";
                AlertDiv.Visible = false;
                LoadVaccinationMethodLookup(VaccineMethod);
                LoadDiseaseLookup(Disease);
                LoadTimePeriodLookup(RevaccinationType);
                LoadUOMTypeLookup(DoseMetric);
                
                Tab1_KeyField.Text = VaccineGrid.DataKeys[e.Item.ItemIndex].ToString();
                VaccineName.Text = EmptyString(e.Item.Cells[0].Text);
                VaccineMethod.SelectedValue = EmptyString(e.Item.Cells[9].Text);
                Disease.SelectedValue = EmptyString(e.Item.Cells[8].Text); 
                Description.Text = EmptyString(e.Item.Cells[10].Text);
                FirstVaccination.Text = EmptyString(e.Item.Cells[3].Text);
                BoosterDose.Text = EmptyString(e.Item.Cells[4].Text);
                RevaccinationType.SelectedValue = EmptyString(e.Item.Cells[14].Text); 
                TradeName.Text = EmptyString(e.Item.Cells[11].Text);
                DoseQuantity.Text = EmptyString(e.Item.Cells[7].Text);
                DoseMetric.SelectedValue = EmptyString(e.Item.Cells[12].Text); 
                if (EmptyString(e.Item.Cells[13].Text) == "Active") { VaccineStatus1.Checked = true; } else { VaccineStatus2.Checked = true; }
            }
            LoadDataList();
        }
        protected void Grid_CancelCommand(object source, DataGridCommandEventArgs e)
        {
            VaccineGrid.EditItemIndex = -1;
            LoadDataList();
        }
     
    }
}
