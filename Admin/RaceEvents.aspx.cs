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
using System.Globalization;

namespace SchoolNet
{
    public partial class RaceEvents : SchoolNetBase
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadLocationByLocationType(RaceLocation, 2);
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
            _DataList = DatabaseManager.Data.DBAccessManager.RetrieveRaceEventsList();
            if (_DataList.Tables[0].Rows.Count > 0)
            {
                this.REGrid.DataSource = _DataList;
                this.REGrid.DataBind();
            }
            else
            {
                this.REGrid.DataSource = null;
                this.REGrid.DataBind();
            }

        }
        #endregion

        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid == true)
                {
                    String RaceStartDT = "", RaceEndDT = "";
                    if (Tab1_KeyField.Text.ToString() == "") { Tab1_KeyField.Text = "0"; }
                    if (FourthPrize.Text.ToString() == "") { FourthPrize.Text = "0"; }
                    if (FivthPrize.Text.ToString() == "") { FivthPrize.Text = "0"; }
                    if (SixthPrize.Text.ToString() == "") { SixthPrize.Text = "0"; }
                    if (SeventhPrize.Text.ToString() == "") { SeventhPrize.Text = "0"; }
                    this.AlertDiv.Visible = true;
                    try {
                        String[] dates = RaceSchedule.Text.ToString().Split('-');
                        if (DateTime.Parse(dates[0], CultureInfo.GetCultureInfo("en-GB")) >= DateTime.Parse(dates[1], CultureInfo.GetCultureInfo("en-GB")))
                        {
                            this.AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                            this.message.Text = "Start Date Time is greater then End Date Time";
                        }
                        else
                        {
                            RaceStartDT = DateTime.Parse(dates[0], CultureInfo.GetCultureInfo("en-GB")).ToString();
                            RaceEndDT = DateTime.Parse(dates[1], CultureInfo.GetCultureInfo("en-GB")).ToString();
                            String Result = DatabaseManager.Data.DBAccessManager.AddUpdateRaceEvents(Int32.Parse(Tab1_KeyField.Text), RaceName.Text, RaceDescription.Text, RaceOrganiser.Text, Int32.Parse(RaceLocation.Text), RaceSchedule.Text, RaceStartDT, RaceEndDT, Int32.Parse(RaceDistance.Text), -1, -1, Int32.Parse(FirstPrize.Text), Int32.Parse(SecondPrize.Text), Int32.Parse(ThirdPrize.Text), Int32.Parse(FourthPrize.Text), Int32.Parse(FivthPrize.Text), Int32.Parse(SixthPrize.Text), Int32.Parse(SeventhPrize.Text), Int32.Parse(Page.User.Identity.Name.ToString()));
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
                    }
                    catch(Exception ex){
                        this.AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                        this.message.Text = ErrorLogging.LogError(ex, "Race Schedule is not in Proper Format. Please check");
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
            RaceName.Text = "";
            RaceLocation.SelectedIndex = -1;
            RaceOrganiser.Text = "";
            RaceDescription.Text = "";
            RaceSchedule.Text = "";
            RaceStartTime.Text = "";
            RaceEndTime.Text = "";
            RaceDistance.Text = "";
            FirstPrize.Text = "";
            SecondPrize.Text = "";
            ThirdPrize.Text = "";
            FourthPrize.Text = "";
            FivthPrize.Text = "";
            SixthPrize.Text = "";
            SeventhPrize.Text = "";
            Tab1_KeyField.Text = "";
            
        }

        protected void REGrid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                message.Text = "";
                AlertDiv.Visible = false;
                Tab1_KeyField.Text = REGrid.DataKeys[e.Item.ItemIndex].ToString();
                RaceName.Text = EmptyString(e.Item.Cells[0].Text);
                RaceLocation.SelectedValue = EmptyString(e.Item.Cells[9].Text);
                RaceOrganiser.Text = EmptyString(e.Item.Cells[1].Text);
                RaceDescription.Text = EmptyString(e.Item.Cells[8].Text);
                RaceSchedule.Text = EmptyString(e.Item.Cells[3].Text);
                RaceDistance.Text = EmptyString(e.Item.Cells[4].Text);
                FirstPrize.Text = EmptyString(e.Item.Cells[5].Text);
                SecondPrize.Text = EmptyString(e.Item.Cells[6].Text);
                ThirdPrize.Text = EmptyString(e.Item.Cells[7].Text);
                FourthPrize.Text = EmptyString(e.Item.Cells[10].Text);
                FivthPrize.Text = EmptyString(e.Item.Cells[11].Text);
                SixthPrize.Text = EmptyString(e.Item.Cells[12].Text);
                SeventhPrize.Text = EmptyString(e.Item.Cells[13].Text); 
            }
            LoadDataList();
        }
        protected void REGrid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int RaceID = (int)REGrid.DataKeys[(int)e.Item.ItemIndex];
            REGrid.EditItemIndex = -1;
            DeleteRaceSampling(RaceID);
        }

        private void DeleteRaceSampling(Int32 RaceID)
        {
            try
            {
                String result = DatabaseManager.Data.DBAccessManager.DeleteRaceEvents(RaceID);
                this.AlertDiv.Visible = true;
                if (result == "")
                {
                    this.AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                    this.message.Text = "Successfully Deleted";
                }
                else
                {
                    this.AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                    this.message.Text = result;
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
