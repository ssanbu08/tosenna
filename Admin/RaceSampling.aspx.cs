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
    public partial class RaceSampling : SchoolNetBase
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadRaceCattlesLookup(AnimalID);
                LoadTrainers(TrainerID);
                LoadRaceEventsLookup(RaceID);
                LoadLocationByLocationType(LocationID, 2);
                LoadRacePlaceTypeLookup(PlaceTypeID);
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

        protected void GetTrainerIDByCattleID(object sender, EventArgs e)
        {
            TrainerID.SelectedValue = GetTrainerIDByCattleID(Int32.Parse(AnimalID.SelectedValue)).ToString();
        }

        protected void GetLocationIDByRaceID(object sender, EventArgs e)
        {
            LocationID.SelectedValue = GetLocationIDByRaceID(Int32.Parse(RaceID.SelectedValue)).ToString();
        }

        #region Load LoadDataList
        private void LoadDataList()
        {
            DataSet _DataList = null;
            _DataList = DatabaseManager.Data.DBAccessManager.RetrieveRaceSamplingList();
            if (_DataList.Tables[0].Rows.Count > 0)
            {
                this.RSGrid.DataSource = _DataList;
                this.RSGrid.DataBind();
            }
            else
            {
                this.RSGrid.DataSource = null;
                this.RSGrid.DataBind();
            }

        }
        #endregion

        protected void Save_Click(object sender, EventArgs e)
        {
            try {
                if (Page.IsValid == true)
                {
                    if (Tab1_KeyField.Text.ToString() == "") { Tab1_KeyField.Text = "0"; }
                    String Result = DatabaseManager.Data.DBAccessManager.AddUpdateCattleRaceSampling(Int32.Parse(Tab1_KeyField.Text), Int32.Parse(AnimalID.Text), Int32.Parse(TrainerID.Text), Int32.Parse(RaceID.Text), Int32.Parse(LocationID.Text), Int32.Parse(TrialNumber.Text), ConvertDMY_MDY(SamplingStartTime), Duration.Text, Int32.Parse(PlaceTypeID.Text),0,0, Int32.Parse(Page.User.Identity.Name.ToString()));
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
            AnimalID.SelectedIndex = -1;
            TrainerID.SelectedIndex = -1;
            RaceID.SelectedIndex = -1;
            LocationID.SelectedIndex = -1;
            TrialNumber.Text = "";
            SamplingStartTime.Text = "";
            Duration.Text = "";
            PlaceTypeID.SelectedIndex = -1;
            Tab1_KeyField.Text = "";
            
        }

        protected void RSGrid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                message.Text = "";
                AlertDiv.Visible = false;
                Tab1_KeyField.Text = RSGrid.DataKeys[e.Item.ItemIndex].ToString();
                AnimalID.SelectedValue = EmptyString(e.Item.Cells[9].Text);
                TrainerID.SelectedValue = EmptyString(e.Item.Cells[10].Text); 
                RaceID.SelectedValue = EmptyString(e.Item.Cells[11].Text); 
                LocationID.SelectedValue = EmptyString(e.Item.Cells[12].Text); 
                TrialNumber.Text = EmptyString(e.Item.Cells[1].Text);
                SamplingStartTime.Text = EmptyString(e.Item.Cells[8].Text);
                Duration.Text = EmptyString(e.Item.Cells[2].Text);
                PlaceTypeID.SelectedValue = EmptyString(e.Item.Cells[13].Text);
            }
            LoadDataList();
        }

        protected void RSGrid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int SampleID = (int)RSGrid.DataKeys[(int)e.Item.ItemIndex];
            RSGrid.EditItemIndex = -1;
            DeleteRaceSampling(SampleID);
        }

        private void DeleteRaceSampling(Int32 SampleID)
        {
            try
            {
                String result = DatabaseManager.Data.DBAccessManager.DeleteRaceSampling(SampleID);
                this.AlertDiv.Visible = true;
                if (result == "")
                {
                    this.AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                    this.message.Text = "Successfully Deleted";
                }

            }
            catch (Exception exception)
            {
                this.AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                this.message.Text = ErrorLogging.LogError(exception, "Error Occured:Could not delete the record. Please check the data");
            }
            ResetFields();
            LoadDataList();
        }

    }
}
