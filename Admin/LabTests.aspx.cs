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
    public partial class LabTests : SchoolNetBase
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here

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
            _DataList = DatabaseManager.Data.DBAccessManager.RetrieveLabTestList();
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
                    Int32 Status = 0, ltType = 0;
                    if (LabTestType1.Checked) { ltType = 1; }
                    if (LabTestStatus1.Checked) { Status = 1; }
                    if (Tab1_KeyField.Text.ToString() == "") { Tab1_KeyField.Text = "0"; }
                    String Result = DatabaseManager.Data.DBAccessManager.AddUpdateLabTestCodes(Int32.Parse(Tab1_KeyField.Text), LabTestCode.Text, LabTestName.Text, ltType, Status);

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
            LabTestName.Text = "";
            LabTestCode.Text = "";
            LabTestType1.Checked = true; LabTestType2.Checked = false;
            LabTestStatus1.Checked = true; LabTestStatus2.Checked = false; 
            Tab1_KeyField.Text = "";
            
        }
       
        protected void Grid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Tab1_KeyField.Text = LTCGrid.DataKeys[e.Item.ItemIndex].ToString();
                LabTestName.Text = EmptyString(e.Item.Cells[0].Text);
                LabTestCode.Text = EmptyString(e.Item.Cells[1].Text);
                if (EmptyString(e.Item.Cells[2].Text) == "Symptomatic") { LabTestType1.Checked = true; } else { LabTestType2.Checked = true; }
                if (EmptyString(e.Item.Cells[3].Text) == "Active") { LabTestStatus1.Checked = true; } else { LabTestStatus2.Checked = true; }
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
