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
    public partial class PharmacyPurchase : SchoolNetBase
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here

            if (!Page.IsPostBack)
            {
                LoadPharmacyItemLookup(DrugId);
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
            _DataList = DatabaseManager.Data.DBAccessManager.RetrievePharmacyPurchaseList();
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
                    if (Tab1_KeyField.Text.ToString() == "") { Tab1_KeyField.Text = "0"; }
                    String Result = DatabaseManager.Data.DBAccessManager.AddUpdatePharmacyPurchase(Int32.Parse(Tab1_KeyField.Text), Int32.Parse(DrugId.SelectedValue), BillReference.Text, ConvertDMY_MDY(PurchaseDate), Int32.Parse(Quantity.Text), Double.Parse(UnitPrice.Text), ConvertDMY_MDY(ExpiryDate), Comments.Text, Int32.Parse(Page.User.Identity.Name.ToString()));

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
            DrugId.Visible = true;
            DrugId.SelectedIndex = -1;
            BillReference.Text = "";
            PurchaseDate.Text = "";
            ExpiryDate.Text = "";
            Quantity.Text = "";
            UnitPrice.Text = "";
            Comments.Text = "";
            LabelDrugName.Visible = false;
            LabelDrugName.Text = "";
            Tab1_KeyField.Text = "";
        }
       
        protected void Grid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Tab1_KeyField.Text = LTCGrid.DataKeys[e.Item.ItemIndex].ToString();
                DrugId.SelectedValue = EmptyString(e.Item.Cells[6].Text);
                DrugId.Visible = false;
                LabelDrugName.Text = EmptyString(e.Item.Cells[0].Text);
                LabelDrugName.Visible = true;
                BillReference.Text = EmptyString(e.Item.Cells[1].Text);
                PurchaseDate.Text = EmptyString(e.Item.Cells[4].Text);
                ExpiryDate.Text = EmptyString(e.Item.Cells[5].Text);
                UnitPrice.Text = EmptyString(e.Item.Cells[3].Text);
                Quantity.Text = EmptyString(e.Item.Cells[2].Text);
                Comments.Text = EmptyString(e.Item.Cells[7].Text);
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
