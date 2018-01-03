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
    public partial class PharmacyStock : SchoolNetBase
    {
       // protected HtmlInputFile Tab8_FileName;
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
 
            if (!Page.IsPostBack)
            {
               
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
            Tab1_Back.Click += new EventHandler(Tab_Back_Click);
        }
        #endregion
        
         protected void Tab_Back_Click(object sender, EventArgs e)
        {
            this.keyField.Text = "";
            PSGrid.EditItemIndex = -1;
            this.EmpSearchBox.Visible = true;
            this.searchDataArea.Visible = true;
            this.EditArea.Visible = false;
            LoadDataList();
        }

        #region Load LoadDataList
        private void LoadDataList()
        {
            try
            {
                DataSet _DataList = null;
                
                    _DataList = DatabaseManager.Data.DBAccessManager.RetrievePharmacyStockList();
                    if (_DataList.Tables[0].Rows.Count > 0)
                    {
                        this.PSGrid.DataSource = _DataList;
                        this.PSGrid.DataBind();
                        //PSGrid.Items[3].CssClass = "btn btn-xs btn-success";
                        //PSGrid.Items["ItemStatus"].CssClass = "";

                        emptyRow.Text = "";
                        emptyRow.Visible = false;
                        SetViewState(_DataList);
                    }
                    else
                    {
                        this.PSGrid.DataSource = null;
                        this.PSGrid.DataBind();
                        emptyRow.Visible = true;
                        emptyRow.CssClass = "errorMessage";
                        emptyRow.Text = "There are no matching records found.";
                    }
            }
            catch (Exception exception)
            {
                PSGrid.CurrentPageIndex = 0;
                PSGrid.DataBind();
            }
        }
        #endregion
    
        protected void Grid_EditCommand(object source, DataGridCommandEventArgs e)
        {

            this.keyField.Text = PSGrid.DataKeys[e.Item.ItemIndex].ToString();
           // Grid.EditItemIndex = e.Item.ItemIndex;
            this.EmpSearchBox.Visible = false;
            this.searchDataArea.Visible = false;
            this.EditArea.Visible = true;
            LoadPharmacyStockHistory(Int32.Parse(this.keyField.Text));
        }
        private void LoadPharmacyStockHistory(Int32 PharmacyItemID)
        {

            try
            {   
                DataSet _DataList = null;
                _DataList = DatabaseManager.Data.DBAccessManager.RetrievePharmacyStockHistory(PharmacyItemID);
                if (_DataList.Tables[0].Rows.Count > 0)
                {
                    this.SHGrid.DataSource = _DataList;
                    this.SHGrid.DataBind();
                    emptyRow.Text = "";
                    emptyRow.Visible = false;
                }
                else
                {
                    this.SHGrid.DataSource = null;
                    this.SHGrid.DataBind();
                    emptyRow.Visible = true;
                    emptyRow.CssClass = "errorMessage";
                    emptyRow.Text = "There are no matching records found.";
                }
                
            }
            catch (Exception exception)
            {
                SHGrid.CurrentPageIndex = 0;
                SHGrid.DataBind();
            }   
        }

        protected string FindStockStatusClass(string StockStatus) {
            if (StockStatus.Equals("In Stock"))
                return "btn btn-xs btn-round btn-success";
            else
                return "btn btn-xs btn-round btn-danger";
        }
    }
}