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
    public partial class PharmacyMaster : SchoolNetBase
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
            if (!Page.IsPostBack) { 
                LoadDrugTypeLookup(DrugType);
                LoadUOMTypeLookup(UOMTypeID);
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
            _DataList = DatabaseManager.Data.DBAccessManager.RetrievePharmacyMasterList();
            if (_DataList.Tables[0].Rows.Count > 0)
            {
                this.LTCGrid.DataSource = _DataList;
                this.LTCGrid.DataBind();
            }
            else
            {
                this.LTCGrid.DataSource = null;
                this.LTCGrid.DataBind();
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
                    if (DrugStatus1.Checked) { Status = 1; }
                    if (Tab1_KeyField.Text.ToString() == "") { Tab1_KeyField.Text = "0"; }
                    if (Unitweight.Text.ToString() == "") { Unitweight.Text = "0"; }
                    if (MinStockLevel.Text.ToString() == "") { MinStockLevel.Text = "0"; }
                    if (MaxStockLevel.Text.ToString() == "") { MaxStockLevel.Text = "0"; }
                    if (ReorderLevel.Text.ToString() == "") { ReorderLevel.Text = "0"; }
                    String Result = DatabaseManager.Data.DBAccessManager.AddUpdatePharmacyItemMaster(Int32.Parse(Tab1_KeyField.Text), DrugName.Text, DrugCode.Text, DrugDescription.Text, Int32.Parse(DrugType.SelectedValue), Int32.Parse(Unitweight.Text), Int32.Parse(UOMTypeID.SelectedValue), Int32.Parse(MinStockLevel.Text), Int32.Parse(MaxStockLevel.Text), Int32.Parse(ReorderLevel.Text), 0, Status, Int32.Parse(Page.User.Identity.Name.ToString()));

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
            DrugName.Text = "";
            DrugCode.Text = "";
            DrugDescription.Text = "";
            DrugType.SelectedIndex = -1;
            Unitweight.Text = "";
            UOMTypeID.SelectedIndex = -1;
            MinStockLevel.Text = "";
            MaxStockLevel.Text = "";
            ReorderLevel.Text = "";
            DrugStatus1.Checked = true; DrugStatus2.Checked = false; 
            Tab1_KeyField.Text = "";
            
        }
       
        protected void Grid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Tab1_KeyField.Text = LTCGrid.DataKeys[e.Item.ItemIndex].ToString();
                DrugName.Text = EmptyString(e.Item.Cells[0].Text);
                DrugCode.Text = EmptyString(e.Item.Cells[1].Text);
                DrugDescription.Text = EmptyString(e.Item.Cells[2].Text);
                DrugType.SelectedValue = EmptyString(e.Item.Cells[6].Text);
                Unitweight.Text = EmptyString(e.Item.Cells[7].Text);
                UOMTypeID.SelectedValue = EmptyString(e.Item.Cells[8].Text);
                if (EmptyString(e.Item.Cells[5].Text) == "Active") { DrugStatus1.Checked = true; } else { DrugStatus2.Checked = true; }
                MinStockLevel.Text = EmptyString(e.Item.Cells[9].Text);
                MaxStockLevel.Text = EmptyString(e.Item.Cells[10].Text);
                ReorderLevel.Text = EmptyString(e.Item.Cells[11].Text);
            }
            LoadDataList();
        }
        protected void Grid_CancelCommand(object source, DataGridCommandEventArgs e)
        {
            LTCGrid.EditItemIndex = -1;
            LoadDataList();
        }
     
    }
}
