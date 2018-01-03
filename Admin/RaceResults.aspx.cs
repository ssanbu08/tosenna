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
    public partial class RaceResults : SchoolNetBase
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadRaceCattlesLookup(AnimalID);
                LoadTrainers(TrainerID);
                LoadRacesPastWeekLookup(RaceID);
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


        #region Load LoadDataList
        private void LoadDataList()
        {
            DataSet _DataList = null;
            _DataList = DatabaseManager.Data.DBAccessManager.RetrieveRaceEventResultsList();
            if (_DataList.Tables[0].Rows.Count > 0)
            {
                this.RRGrid.DataSource = _DataList;
                this.RRGrid.DataBind();
            }
            else
            {
                this.RRGrid.DataSource = null;
                this.RRGrid.DataBind();
            }

        }
        #endregion

        protected void Save_Click(object sender, EventArgs e)
        {
            try {
                if (Page.IsValid == true)
                {
                    if (Tab1_KeyField.Text.ToString() == "") { Tab1_KeyField.Text = "0"; }
                    String Result = DatabaseManager.Data.DBAccessManager.AddUpdateCattleRaceResults(Int32.Parse(Tab1_KeyField.Text), Int32.Parse(AnimalID.Text), Int32.Parse(TrainerID.Text), Int32.Parse(RaceID.Text), Duration.Text, Int32.Parse(PlaceTypeID.Text), Int32.Parse(Page.User.Identity.Name.ToString()));
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
            Duration.Text = "";
            PlaceTypeID.SelectedIndex = -1;
            Tab1_KeyField.Text = "";
            
        }

        protected void RRGrid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                message.Text = "";
                AlertDiv.Visible = false;
                Tab1_KeyField.Text = RRGrid.DataKeys[e.Item.ItemIndex].ToString();
                AnimalID.SelectedValue = EmptyString(e.Item.Cells[7].Text);
                TrainerID.SelectedValue = EmptyString(e.Item.Cells[8].Text); ;
                RaceID.SelectedValue = EmptyString(e.Item.Cells[9].Text); 
                Duration.Text = EmptyString(e.Item.Cells[2].Text);
                PlaceTypeID.SelectedValue = EmptyString(e.Item.Cells[10].Text);
            }
            LoadDataList();
        }
        protected void RRGrid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int ID = (int)RRGrid.DataKeys[(int)e.Item.ItemIndex];
            RRGrid.EditItemIndex = -1;
            DeleteRaceEventResults(ID);
        }

        private void DeleteRaceEventResults(Int32 ID)
        {
            try
            {
                String result = DatabaseManager.Data.DBAccessManager.DeleteRaceEventResults(ID);
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