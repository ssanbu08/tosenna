using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Globalization;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using PresentationManager.Web.UI.MasterPages;
using System.Windows.Forms;

namespace SchoolNet
{
    public partial class RaceStatistics : SchoolNetBase
    {
       // protected HtmlInputFile Tab8_FileName;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               
            }
            LoadDataList();
            LoadStatisticsByTrainerList();
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
            Tab1_Back.Click += new EventHandler(Tab_Back_Click);
            tab1.Click += new EventHandler(tab1_Click);
            tab2.Click += new EventHandler(tab2_Click);
        }
        #endregion
        
         protected void Tab_Back_Click(object sender, EventArgs e)
        {
            this.keyField.Text = "";
            SCGrid.EditItemIndex = -1;
            this.EmpSearchBox.Visible = true;
         //   this.StatisticsByCattle.Visible = true;
            this.EditArea.Visible = false;
            this.RaceHistoryByTrainerID.Visible = false;
            this.RaceHistoryByCattleID.Visible = false;
            if (tab2.CssClass == "active")
            {
                this.StatisticsByTrainer.Visible = true;
                this.StatisticsByCattle.Visible = false;
                LoadStatisticsByTrainerList();
            }
            else {
                this.StatisticsByCattle.Visible = true;
                this.StatisticsByTrainer.Visible = false;
                LoadDataList();
            }
            
        }

         protected void tab1_Click(object sender, EventArgs e)
         {
             TabSettings();
             tab1.CssClass = "active";
             StatisticsByCattle.Visible = true;
             LoadDataList();
         }

         protected void tab2_Click(object sender, EventArgs e)
         {
             TabSettings();
             tab2.CssClass = "active";
             StatisticsByTrainer.Visible = true;
             LoadStatisticsByTrainerList();
         }
         private void TabSettings()
         {
             StatisticsByCattle.Visible = false;
             StatisticsByTrainer.Visible = false;
             tab1.CssClass = "";
             tab2.CssClass = "";

         }


        #region Load LoadDataList
        private void LoadDataList()
        {
            try
            {
                DataSet _DataList = null;

                _DataList = DatabaseManager.Data.DBAccessManager.RetrieveRaceStatistics();
                    if (_DataList.Tables[0].Rows.Count > 0)
                    {
                        this.SCGrid.DataSource = _DataList;
                        this.SCGrid.DataBind();
                        emptyRow.Text = "";
                        emptyRow.Visible = false;
                        SetViewState(_DataList);
                    }
                    else
                    {
                        this.SCGrid.DataSource = null;
                        this.SCGrid.DataBind();
                        emptyRow.Visible = true;
                        emptyRow.CssClass = "errorMessage";
                        emptyRow.Text = "There are no matching records found.";
                    }
            }
            catch (Exception exception)
            {
                SCGrid.CurrentPageIndex = 0;
                SCGrid.DataBind();
            }
        }
        #endregion

        #region LoadStatisticsByTrainerList
        private void LoadStatisticsByTrainerList()
        {
            try
            {
                DataSet _DataList = null;

                _DataList = DatabaseManager.Data.DBAccessManager.RetrieveRaceTrainerStatistics();
                if (_DataList.Tables[0].Rows.Count > 0)
                {
                    this.STGrid.DataSource = _DataList;
                    this.STGrid.DataBind();
                    emptyRow.Text = "";
                    emptyRow.Visible = false;
                    SetViewState(_DataList);
                }
                else
                {
                    this.STGrid.DataSource = null;
                    this.STGrid.DataBind();
                    emptyRow.Visible = true;
                    emptyRow.CssClass = "errorMessage";
                    emptyRow.Text = "There are no matching records found.";
                }
            }
            catch (Exception exception)
            {
                STGrid.CurrentPageIndex = 0;
                STGrid.DataBind();
            }
        }
        #endregion
    

        protected void Grid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
            this.keyField.Text = SCGrid.DataKeys[e.Item.ItemIndex].ToString();
            this.EmpSearchBox.Visible = false;
            this.StatisticsByCattle.Visible = false;
            this.StatisticsByTrainer.Visible = false;
            this.EditArea.Visible = true;
            this.RaceHistoryByCattleID.Visible = true;
            this.RaceHistoryByTrainerID.Visible = false;
            LoadRaceResultsByCattleID(Int32.Parse(this.keyField.Text));
                }
        }

        protected void STGrid_UpdateCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                this.keyField.Text = STGrid.DataKeys[e.Item.ItemIndex].ToString();
                this.EmpSearchBox.Visible = false;
                this.StatisticsByCattle.Visible = false;
                this.StatisticsByTrainer.Visible = false;
                this.EditArea.Visible = true;
                this.RaceHistoryByTrainerID.Visible = true;
                this.RaceHistoryByCattleID.Visible = false;
                LoadRaceResultsByTrainerID(Int32.Parse(this.keyField.Text));
            }
        }

        private void LoadRaceResultsByCattleID(Int32 AnimalID)
        {

            try
            {   
                DataSet _DataList = null;
                _DataList = DatabaseManager.Data.DBAccessManager.RetrieveRaceResultsByCattleID(AnimalID);
                if (_DataList.Tables[0].Rows.Count > 0)
                {
                    this.RHCGrid.DataSource = _DataList;
                    this.RHCGrid.DataBind();
                    emptyRow.Text = "";
                    emptyRow.Visible = false;
                }
                else
                {
                    this.RHCGrid.DataSource = null;
                    this.RHCGrid.DataBind();
                    emptyRow.Visible = true;
                    emptyRow.CssClass = "errorMessage";
                    emptyRow.Text = "There are no matching records found.";
                }
                
            }
            catch (Exception exception)
            {
                RHCGrid.CurrentPageIndex = 0;
                RHCGrid.DataBind();
            }   
        }

        private void LoadRaceResultsByTrainerID(Int32 TrainerID)
        {

            try
            {
                DataSet _DataList = null;
                _DataList = DatabaseManager.Data.DBAccessManager.RetrieveRaceResultsByTrainerID(TrainerID);
                if (_DataList.Tables[0].Rows.Count > 0)
                {
                    this.RHTGrid.DataSource = _DataList;
                    this.RHTGrid.DataBind();
                    emptyRow.Text = "";
                    emptyRow.Visible = false;
                }
                else
                {
                    this.RHTGrid.DataSource = null;
                    this.RHTGrid.DataBind();
                    emptyRow.Visible = true;
                    emptyRow.CssClass = "errorMessage";
                    emptyRow.Text = "There are no matching records found.";
                }

            }
            catch (Exception exception)
            {
                RHTGrid.CurrentPageIndex = 0;
                RHTGrid.DataBind();
            }
        }

        protected string FindAverageSpeedClass(Double AvgSpeed)
        {
            if (AvgSpeed >= 60.00)
                return "btn btn-xs btn-round btn-success";
            else if (AvgSpeed >= 40.00)
                return "btn btn-xs btn-round btn-info";
            else if (AvgSpeed >= 35.00)
                return "btn btn-xs btn-round btn-warning";
            else
                return "btn btn-xs btn-round btn-danger";
        }
    }
}