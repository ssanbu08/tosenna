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

namespace SchoolNet
{
    public partial class ManageEmployee : SchoolNetBase
    {
       // protected HtmlInputFile Tab8_FileName;
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
 
            if (!Page.IsPostBack)
            {
               
            }
            
            LoadDataList();
            if (this.keyField.Text.ToString() != "")
            {
                LoadEContactList();
                LoadDependentsList();
                
                
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

            ECGrid.PageIndexChanged += new DataGridPageChangedEventHandler(ECGrid_PageIndexChanged);
            DOCGrid.PageIndexChanged +=new DataGridPageChangedEventHandler(DOCGrid_PageIndexChanged);
            tab1.Click += new EventHandler(tab1_Click);
            tab2.Click += new EventHandler(tab2_Click); 
            tab3.Click += new EventHandler(tab3_Click);
            tab4.Click += new EventHandler(tab4_Click);
              
            Personal_Save.Click +=new EventHandler(Personal_Save_Click);
            Contact_Save.Click +=new EventHandler(Contact_Save_Click);
            DP_Save.Click +=new EventHandler(DP_Save_Click);
            DP_Cancel.Click +=new EventHandler(DP_Cancel_Click);
            EC_Save.Click +=new EventHandler(EC_Save_Click);
            EC_Cancel.Click +=new EventHandler(EC_Cancel_Click);
            Doc_Upload.Click +=new EventHandler(Doc_Upload_Click);
            Tab1_Back.Click += new EventHandler(Tab_Back_Click);
            Tab2_Back.Click += new EventHandler(Tab_Back_Click);
            Tab3_Back.Click += new EventHandler(Tab_Back_Click);
            Tab4_Back.Click += new EventHandler(Tab_Back_Click);
            
        }
        #endregion
        
         protected void Tab_Back_Click(object sender, EventArgs e)
        {
            TabSettings();
            this.keyField.Text = "";
            EmpGrid.EditItemIndex = -1;
            this.EmpSearchBox.Visible = true;
            this.searchDataArea.Visible = true;
            this.EditArea.Visible = false;


        }

        #region Load LoadDataList
        private void LoadDataList()
        {
            try
            {
                DataSet _DataList = null;
                if (ViewState["myDataSet"] == null)   // No such value in view state, take appropriate action.
                {
                    _DataList = DatabaseManager.Data.DBAccessManager.RetrieveEmployeeListByStatusMenu(-1, Int32.Parse(Page.User.Identity.Name.ToString()));
                    if (_DataList.Tables[0].Rows.Count > 0)
                    {
                        this.EmpGrid.DataSource = _DataList;
                        this.EmpGrid.DataBind();
                        emptyRow.Text = "";
                        emptyRow.Visible = false;
                        SetViewState(_DataList);

                    }
                    else
                    {
                        this.EmpGrid.DataSource = null;
                        this.EmpGrid.DataBind();
                        emptyRow.Visible = true;
                        emptyRow.CssClass = "errorMessage";
                        emptyRow.Text = "There are no matching records found.";
                    }
                }
                else  // If it is avaiable in the viewstate bind it from there.
                {
                    _DataList = GetViewState();
                    this.EmpGrid.DataSource = _DataList;
                    this.EmpGrid.DataBind();

                }
            }
            catch (Exception exception)
            {
                EmpGrid.CurrentPageIndex = 0;
                EmpGrid.DataBind();
            }


        }
        #endregion
    

        private void TabSettings()
        {
            tab1.CssClass = "";
            tab2.CssClass = "";
            tab3.CssClass = "";
            tab4.CssClass = "";

            message.Visible = false;
            GeneralInfoTab.Visible = false;
            ContactInfoTab.Visible = false;
            DependentTab.Visible = false;
            EmergencyContactTab.Visible = false;
            EmployeeDocumentsTab.Visible = false;
            
        }
        protected void tab1_Click(object sender, EventArgs e)
        {
            TabSettings();
            tab1.CssClass = "active";
            GeneralInfoTab.Visible = true;

        }
        protected void tab2_Click(object sender, EventArgs e)
        {
            TabSettings();
            tab2.CssClass = "active";
            ContactInfoTab.Visible = true;
        }
        protected void tab3_Click(object sender, EventArgs e)
        {
            TabSettings();
            tab3.CssClass = "active";
            LoadDependentsList();
            DependentTab.Visible = true;
            DPmessage.Text = "";
            DPmessage.Visible = false;
            //  ResetDPFields();
        }
        protected void tab4_Click(object sender, EventArgs e)
        {
            TabSettings();
            tab4.CssClass = "active";
            LoadEContactList();
            EmergencyContactTab.Visible = true;
            ECmessage.Text = "";
            ECmessage.Visible = false;
  
        }
 

        #region  LoadDependentsList
        private void LoadDependentsList()
        {
            DataTable _empDependentDataTable = null;
            try
            {                
                DataSet _DataList = null;
                _DataList = DatabaseManager.Data.DBAccessManager.RetrieveEmployeeInfo(Int32.Parse(this.keyField.Text.ToString()));
                if (_DataList.Tables[1].Rows.Count > 0)  // Employee Dependent Information.
                {
                     _empDependentDataTable = _DataList.Tables[1];
                    this.DPGrid.DataSource = _empDependentDataTable;
                    this.DPGrid.DataBind();
                    DPmessage.Text = "";
                    DPmessage.Visible = false;
                    emptyRow2.Text = "";
                    emptyRow2.Visible = false;

                }
                else
                {
                  
                    this.DPGrid.DataSource = null;
                    this.DPGrid.DataBind();
                }
            }
            catch (Exception exception)
            {
                if (DPGrid.CurrentPageIndex >= DPGrid.PageCount)
                {
                    DPGrid.CurrentPageIndex -= 1;
                    this.DPGrid.DataSource = _empDependentDataTable;
                    this.DPGrid.DataBind();

                }
                else
                {
                    ErrorLogging.LogError(exception, " ");
                }
            }
         }
        #endregion
        #region LoadEContactList
        private void LoadEContactList()
        {
            DataTable _empECDataTable = null;
            try
            {
                DataSet _DataList = null;
                _DataList = DatabaseManager.Data.DBAccessManager.RetrieveEmployeeInfo(Int32.Parse(this.keyField.Text.ToString()));
                if (_DataList.Tables[2].Rows.Count > 0)  // Employee Emergency Contacts Information.
                {
                   
                    _empECDataTable = _DataList.Tables[2];
                    this.ECGrid.DataSource = _empECDataTable;
                    this.ECGrid.DataBind();
                    ECmessage.Text = "";
                    ECmessage.Visible = false;
                    emptyRow1.Text = "";
                    emptyRow1.Visible = false;

                }
                else
                {
                    this.ECGrid.DataSource = null;
                    this.ECGrid.DataBind();
                }
            }
            catch (Exception exception)
            {
                if (ECGrid.CurrentPageIndex >= ECGrid.PageCount)
                {
                    ECGrid.CurrentPageIndex -= 1; 
                    this.ECGrid.DataSource = _empECDataTable;
                    this.ECGrid.DataBind();
                    
                }
                else
                {
                    ErrorLogging.LogError(exception, " ");
                }
            }
        }
        #endregion
        
   
        protected void Personal_Save_Click(object sender, EventArgs e)
        {
           
         try
			{
                if (Page.IsValid == true)
                {


                    String Result = DatabaseManager.Data.DBAccessManager.Update_Emp_GeneralInfo(Int32.Parse(keyField.Text.ToString()), Tab1_FName.Text.ToString(), Tab1_MidName.Text.ToString(), Tab1_LName.Text.ToString(), ConvertDMY_MDY(Tab1_DOB), this.Tab1_Citizenship.Text.ToString(), this.Tab1_VisaNumber.Text.ToString(), ConvertDMY_MDY(Tab1_VisaIssueDate), ConvertDMY_MDY(Tab1_VisaExpiryDate), Tab1_PassportNo.Text.ToString(), ConvertDMY_MDY(Tab1_PassportExpiryDate), ConvertDMY_MDY(Tab1_PassportIssueDate), Int32.Parse(Tab1_GenderType.SelectedValue), Int32.Parse(Tab1_MaritalStatus.SelectedValue), -1, Int32.Parse(Tab1_VisaType.SelectedValue), Int32.Parse(Tab1_PassportCountryDDList.SelectedValue), Int32.Parse(Tab1_VisaCountryDDList.SelectedValue), Tab1_LaborCardNo.Text.ToString(), ConvertDMY_MDY(Tab1_LaborCardIssueDate), ConvertDMY_MDY(Tab1_LaborCardExpiryDate), Int32.Parse(Tab1_LaborCardCountryDDList.SelectedValue), this.Tab1_BVisaNumber.Text.ToString(), ConvertDMY_MDY(Tab1_BVisaIssueDate), ConvertDMY_MDY(Tab1_BVisaExpiryDate),Int32.Parse(Tab1_BVisaCountryDDList.SelectedValue),Tab1_PersonID.Text.ToString(),Int32.Parse(Page.User.Identity.Name.ToString()));

                    this.message.Visible = true;
                    this.message.CssClass = "errorMessage";
                    if (Result == "")
                    {
                        this.message.Text = "Successfully saved.";

                    }
                    else
                    {
                        this.message.Text = Result;
                        this.message.CssClass = "errorMessage";

                    }
                }			
			}
			catch(Exception exception)
			{
				this.message.Visible = true;
				this.message.Text    = ErrorLogging.LogError(exception,"Unknown Exception Occured. Please contact support.");
				this.message.CssClass="errorMessage";
			}
            //LoadEmployeePositionList();
            LoadEmployeeInformation(Int32.Parse(this.keyField.Text));
	    }
        protected void Contact_Save_Click(object sender, EventArgs e)
        {

            try
            {
                if (Page.IsValid == true)
                {
                    String Result = DatabaseManager.Data.DBAccessManager.Update_Emp_ContactInfo(Int32.Parse(keyField.Text.ToString()), Tab2_HAddress1.Text.ToString(), Tab2_HAddress2.Text.ToString(), Tab2_HCity.Text.ToString(), Tab2_HState.Text.ToString(), Int32.Parse(Tab2_CountryDDList.SelectedValue), Tab2_WAddress1.Text.ToString(), Tab2_WAddress2.Text.ToString(), Tab2_WCity.Text.ToString(), Tab2_WState.Text.ToString(), Int32.Parse(Tab2_WCountryDDList.SelectedValue), Tab2_HPhone.Text.ToString(), Tab2_Mobile.Text.ToString(), Tab2_WPhone.Text.ToString(), Tab2_WorkEmail.Text.ToString(), 0, 0, 0, "");

                    this.message.Visible = true;
                    this.message.CssClass = "errorMessage";
                    if (Result == "")
                    {
                        this.message.Text = "Successfully saved.";
                    }
                    else
                    {
                        this.message.Text = Result;
                        this.message.CssClass = "errorMessage";
                    }
                }

            }
            catch (Exception exception)
            {
                this.message.Visible = true;
                this.message.Text = ErrorLogging.LogError(exception,"Unknown Exception Occured. Please contact support.");
                this.message.CssClass = "errorMessage";
            }
            LoadEmployeeInformation(Int32.Parse(this.keyField.Text));
        }
        protected void DP_Save_Click(object sender, EventArgs e)
        {

            try
            {
                if (Page.IsValid == true)
                {
                    String Result = DatabaseManager.Data.DBAccessManager.Update_Emp_DependentInfo(Int32.Parse(keyField.Text.ToString()), Tab3_Name.Text.ToString(), Int32.Parse(Tab3_RelationshipDDList.SelectedValue), ConvertDMY_MDY(Tab3_DOB), Int32.Parse(Tab3_GenderType.SelectedValue), Tab3_PassportNo.Text.ToString(), Int32.Parse(Tab3_PassportCountryDDList.SelectedValue), ConvertDMY_MDY(Tab3_PassportIssueDate), ConvertDMY_MDY(Tab3_PassportExpiryDate), Tab3_VisaNumber.Text.ToString(), Int32.Parse(Tab3_VisaType.SelectedValue), ConvertDMY_MDY(Tab3_VisaIssueDate), ConvertDMY_MDY(Tab3_VisaExpiryDate), Int32.Parse(Tab3_VisaIssueCountryID.SelectedValue));

                    this.DPmessage.Visible = true;
                    this.DPmessage.CssClass = "errorMessage";
                    if (Result == "")
                    {
                        this.DPmessage.Text = "Successfully saved.";
                        ResetDPFields();
                    }
                    else
                    {
                        this.DPmessage.Text = Result;
                        this.DPmessage.CssClass = "errorMessage";
                    }
                }
                this.LoadDependentsList(); // Refresh the grid after save

            }
            catch (Exception exception)
            {
                this.DPmessage.Visible = true;
                this.DPmessage.Text = ErrorLogging.LogError(exception,"Unknown Exception Occured. Please contact support.");
                this.DPmessage.CssClass = "errorMessage";
            }
        }

        protected void DP_Cancel_Click(object sender, EventArgs e)
        {
            Tab3_DOB.Text = "";
            Tab3_GenderType.SelectedIndex = -1;
            Tab3_Name.Text = "";
            Tab3_PassportCountryDDList.SelectedIndex = -1;
            Tab3_PassportExpiryDate.Text = "";
            Tab3_PassportIssueDate.Text = "";
            Tab3_PassportNo.Text = "";
            Tab3_RelationshipDDList.SelectedIndex = -1;
            Tab3_VisaExpiryDate.Text = "";
            Tab3_VisaIssueDate.Text = "";
            Tab3_VisaNumber.Text = "";
            Tab3_VisaType.SelectedIndex = -1;
            Tab3_VisaIssueCountryID.SelectedIndex = -1;
            DPmessage.Text = "";
        }


        protected void EC_Cancel_Click(object sender, EventArgs e)
        {
            Tab4_ContactPrioirtyDDList.SelectedIndex = -1;
            Tab4_EmailAddress.Text = "";
            Tab4_HomePhone.Text = "";
            Tab4_MobilePhone.Text = "";
            Tab4_Name.Text = "";
            Tab4_RelationshipDDList.SelectedIndex = -1;
            Tab4_WorkPhone.Text = "";
            ECmessage.Text = "";
        }
        protected void EC_Save_Click(object sender, EventArgs e)
        {

            try
            {
                if (Page.IsValid == true)
                {
                    String Result = DatabaseManager.Data.DBAccessManager.Update_Emp_EContactInfo(Int32.Parse(keyField.Text.ToString()), Tab4_Name.Text.ToString(), Int32.Parse(Tab4_RelationshipDDList.SelectedValue), Int32.Parse(Tab4_ContactPrioirtyDDList.SelectedValue), Tab4_HomePhone.Text.ToString(), Tab4_MobilePhone.Text.ToString(), Tab4_WorkPhone.Text.ToString(), Tab4_EmailAddress.Text.ToString());

                    this.ECmessage.Visible = true;
                    this.ECmessage.CssClass = "errorMessage";
                    if (Result == "")
                    {
                        this.ECmessage.Text = "Successfully saved.";
                        ResetEContactFields();
                    }
                    else
                    {
                        this.ECmessage.Text = Result;
                        this.ECmessage.CssClass = "errorMessage";
                    }
                }
                LoadEContactList(); // Refresh the Grid after Save.

            }
            catch (Exception exception)
            {
                this.ECmessage.Visible = true;
                this.ECmessage.Text = ErrorLogging.LogError(exception,"Unknown Exception Occured. Please contact support.");
                this.ECmessage.CssClass = "errorMessage";
            }
        }


        protected void Doc_Upload_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                if (Tab8_FileName.PostedFile != null && Tab8_FileName.PostedFile.FileName != "")
                    try
                    {
                        HttpPostedFile myFile = Tab8_FileName.PostedFile;
                        String Ext = System.IO.Path.GetExtension(myFile.FileName);
                        

                        String FilePath = Server.MapPath(Page.ResolveUrl("~\\Documents\\" + Int32.Parse(keyField.Text.ToString()) + "_" + Tab8_DocumentName.Text.ToString() + Ext));

                        this.docmessage.Visible = true;
                        this.docmessage.CssClass = "errorMessage";
                        myFile.SaveAs(FilePath);
                        String ActualFileName = Int32.Parse(keyField.Text.ToString()) + "_" + Tab8_DocumentName.Text.ToString() + Ext;

                        String Result = DatabaseManager.Data.DBAccessManager.Update_Emp_Documents(Int32.Parse(keyField.Text.ToString()), Int32.Parse(Tab8_DocumentType.SelectedValue), ActualFileName, FilePath, Tab8_Comments.Text.ToString());

                        if (Result == "")
                        {
                            this.docmessage.Text = "Successfully saved.";
                            this.docmessage.CssClass = "errorMessage";
                            ResetDOCFields();
                            
                        }

                        else
                        {
                            this.docmessage.Text = Result;
                            this.docmessage.CssClass = "errorMessage";

                        }

                    }
                    catch (Exception exception)
                    {
                        this.docmessage.Text = ErrorLogging.LogError(exception, "Unknown Exception Occured.Please contact Support.");
                        this.docmessage.CssClass = "errorMessage";
                    }
                else
                {
                    this.docmessage.Text = "You have not specified a file.";
                }
            }
            //LoadEmployeeDocs();  
        }

        private void ResetDPFields()
        {
            Tab3_Name.Text = "";
            Tab3_RelationshipDDList.SelectedIndex = -1;
            Tab3_DOB.Text = "";
            Tab3_GenderType.SelectedIndex = -1;
            Tab3_PassportNo.Text = "";
            Tab3_PassportCountryDDList.SelectedIndex = -1;
            Tab3_PassportIssueDate.Text = "";
            Tab3_PassportExpiryDate.Text = "";
            Tab3_VisaNumber.Text = "";
            Tab3_VisaType.SelectedIndex = -1;
            Tab3_VisaIssueDate.Text = "";
            Tab3_VisaExpiryDate.Text = "";
            Tab3_VisaIssueCountryID.SelectedIndex = -1;
        }
        private void ResetEContactFields()
        {
            Tab4_Name.Text = "";
            Tab4_RelationshipDDList.SelectedIndex = -1;
            Tab4_ContactPrioirtyDDList.SelectedIndex = -1;
            Tab4_HomePhone.Text = "";
            Tab4_MobilePhone.Text = "";
            Tab4_WorkPhone.Text = "";
            Tab4_EmailAddress.Text = "";
        }
        private void ResetDOCFields()
        {
            Tab8_DocumentName.Text = "";
            Tab8_DocumentType.SelectedIndex = -1;
            Tab8_Comments.Text = "";
        }
        private void DeleteEmployeeDocument(Int32 DocumentID)
        {
            String document = DatabaseManager.Data.DBAccessManager.DeleteEmployeeDocument(Int32.Parse(keyField.Text.ToString()), DocumentID);

            if (document != "")
            {
                try
                {
                    System.IO.File.Delete(document);
                }
                catch (Exception exception)
                {
                    this.docmessage.Text = ErrorLogging.LogError(exception,"Error Occured:Could not delete the file.");
                    this.docmessage.CssClass = "errorMessage";
                }
            }

            else
            {
                this.docmessage.Text = document;
                this.docmessage.CssClass = "errorMessage";

            }
            DOCGrid.CurrentPageIndex = 0;
            ResetDOCFields();
            // LoadEmployeeDocs();


        }

        private void DeleteEContact(Int32 EContactID)
        {
            try
            {
                String result = DatabaseManager.Data.DBAccessManager.DeleteEmployeeEContact(Int32.Parse(keyField.Text.ToString()), EContactID);

                if (result != "")
                {
                    this.ECmessage.Text = result;
                    this.ECmessage.CssClass = "errorMessage";

                }
                
            }
            catch (Exception exception)
            {

                this.ECmessage.Text = ErrorLogging.LogError(exception,"Error Occured:Could not delete the contact. Please check the data");
                this.ECmessage.CssClass = "errorMessage";

            }
            ECGrid.CurrentPageIndex = 0;
            LoadEContactList();
            ResetEContactFields();

        }
        private void DeleteDependent(Int32 DependentID)
        {
            try
            {
                String result = DatabaseManager.Data.DBAccessManager.DeleteEmployeeDependent(Int32.Parse(keyField.Text.ToString()), DependentID);

                if (result != "")
                {
                    this.DPmessage.Text = result;
                    this.DPmessage.CssClass = "errorMessage";

                }
               
            }
            catch (Exception exception)
            {
                this.DPmessage.Text = ErrorLogging.LogError(exception, "Unknown Exception Occured.Please contact Support.");
                this.DPmessage.CssClass = "errorMessage";

            }
            DPGrid.CurrentPageIndex = 0;
            LoadDependentsList();
            ResetDPFields();

        }

        //This is invoked when the grid column is Clicked for Sorting, 
        //Clicking again will Toggle Descending/Ascending through the Sort Expression
       


       

        protected void Search_Click(object sender, EventArgs e)
        {
            SetViewState(null);
            LoadDataList();       

        }
       
        protected void ECGrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            ECGrid.CurrentPageIndex = e.NewPageIndex;
            LoadEContactList();

           
        }
        protected void ECGrid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            Tab4_Name.Text = EmptyString(e.Item.Cells[0].Text);
            if (EmptyString(e.Item.Cells[1].Text) != "")
            {
                Tab4_RelationshipDDList.SelectedValue = Tab4_RelationshipDDList.Items.FindByText(e.Item.Cells[1].Text).Value;
            }
            if (EmptyString(e.Item.Cells[2].Text) != "")
            {
                Tab4_ContactPrioirtyDDList.SelectedValue = Tab4_ContactPrioirtyDDList.Items.FindByText(e.Item.Cells[2].Text).Value;
            }
            Tab4_HomePhone.Text = EmptyString(e.Item.Cells[3].Text);
            Tab4_MobilePhone.Text = EmptyString(e.Item.Cells[4].Text);
            Tab4_WorkPhone.Text = EmptyString(e.Item.Cells[5].Text);
            Tab4_EmailAddress.Text = EmptyString(e.Item.Cells[6].Text);
            ECGrid.EditItemIndex = -1;
        }
        protected void ECGrid_CancelCommand(object source, DataGridCommandEventArgs e)
        {
            //ECGrid.EditItemIndex = -1;
            
        }
        protected void ECGrid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int EContactID = (int)ECGrid.DataKeys[(int)e.Item.ItemIndex];
            ECGrid.EditItemIndex = -1;
            DeleteEContact(EContactID);

        }
        protected void ECGrid_UpdateCommand(object source, DataGridCommandEventArgs e)
        {
        
        }
        protected void DPGrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
             DPGrid.CurrentPageIndex = e.NewPageIndex;
             LoadDependentsList();

        }
        protected void DPGrid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            Tab3_Name.Text = EmptyString(e.Item.Cells[0].Text);
            if (EmptyString(e.Item.Cells[1].Text) != "")
            {
                Tab3_RelationshipDDList.SelectedValue = Tab3_RelationshipDDList.Items.FindByText(EmptyString(e.Item.Cells[1].Text)).Value;
            }
            Tab3_DOB.Text = EmptyString(e.Item.Cells[2].Text);
            if (EmptyString(e.Item.Cells[3].Text) != "")
            {
                Tab3_GenderType.SelectedValue = Tab3_GenderType.Items.FindByText(EmptyString(e.Item.Cells[3].Text)).Value;
            }
            Tab3_PassportNo.Text = EmptyString(e.Item.Cells[4].Text);
            if (EmptyString(e.Item.Cells[5].Text) != "")
            {
                Tab3_PassportCountryDDList.SelectedValue = Tab3_PassportCountryDDList.Items.FindByText(EmptyString(e.Item.Cells[5].Text)).Value;
            }
            Tab3_PassportIssueDate.Text = EmptyString(e.Item.Cells[6].Text);
            Tab3_PassportExpiryDate.Text = EmptyString(e.Item.Cells[7].Text);
            Tab3_VisaNumber.Text = EmptyString(e.Item.Cells[8].Text);
            Tab3_VisaIssueDate.Text = EmptyString(e.Item.Cells[10].Text);
            Tab3_VisaExpiryDate.Text = EmptyString(e.Item.Cells[11].Text);
            if (EmptyString(e.Item.Cells[12].Text) != "")
            {
                Tab3_VisaIssueCountryID.SelectedValue = Tab3_VisaIssueCountryID.Items.FindByValue(EmptyString(e.Item.Cells[12].Text)).Value;
            }
            if (EmptyString(e.Item.Cells[9].Text) != "")
            {
                Tab3_VisaType.SelectedValue = Tab3_VisaType.Items.FindByValue(EmptyString(e.Item.Cells[9].Text)).Value;
            }

         

            DPGrid.EditItemIndex = -1;
        }
        protected void DPGrid_CancelCommand(object source, DataGridCommandEventArgs e)
        {
            //ECGrid.EditItemIndex = -1;

        }
        protected void DPGrid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int dependentID = (int)DPGrid.DataKeys[(int)e.Item.ItemIndex];
            DPGrid.EditItemIndex = -1;
            DeleteDependent(dependentID);
            
        }
        protected void DPGrid_UpdateCommand(object source, DataGridCommandEventArgs e)
        {

        }
        protected void DOCGrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            DOCGrid.CurrentPageIndex = e.NewPageIndex;
            //  LoadEmployeeDocs();

        }
        protected void DOCGrid_EditCommand(object source, DataGridCommandEventArgs e)
        {
        }
        protected void DOCGrid_CancelCommand(object source, DataGridCommandEventArgs e)
        {
            //ECGrid.EditItemIndex = -1;

        }
        protected void DOCGrid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int documentID = (int)DOCGrid.DataKeys[(int)e.Item.ItemIndex];            
            DeleteEmployeeDocument(documentID);
            DOCGrid.EditItemIndex = -1;
            //Response.Redirect(Request.Url.AbsoluteUri);

        }
        protected void DOCGrid_UpdateCommand(object source, DataGridCommandEventArgs e)
        {

        }

        protected void Grid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            DataSet myDataSet = GetViewState();
            DataTable myDataTable = myDataSet.Tables[0];
            DataView _dataView = SortDataTable(myDataTable, true);
            EmpGrid.DataSource = _dataView;
            EmpGrid.CurrentPageIndex = e.NewPageIndex;
            EmpGrid.DataBind();
            // Rebind the sorted data into ViewState
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            dt = _dataView.ToTable();
            ds.Merge(dt);
            SetViewState(ds);

          //  Grid.CurrentPageIndex = e.NewPageIndex;
         //   LoadDataList();
        }
        protected void Grid_EditCommand(object source, DataGridCommandEventArgs e)
        {

            this.keyField.Text = EmpGrid.DataKeys[e.Item.ItemIndex].ToString();
           // Grid.EditItemIndex = e.Item.ItemIndex;
            this.EmpSearchBox.Visible = false;
            this.searchDataArea.Visible = false;
            this.EditArea.Visible = true;
            this.GeneralInfoTab.Visible = true;
            LoadEmployeeInformation(Int32.Parse(this.keyField.Text));
        }
        private void LoadEmployeeInformation(Int32 EmpId)
        {
       
           // Load dropdown Controls.
            LoadVisaType(this.Tab1_VisaType);
            LoadVisaType(this.Tab3_VisaType);
            LoadCountryList(this.Tab1_PassportCountryDDList);
            LoadCountryList(this.Tab1_VisaCountryDDList);
            LoadCountryList(Tab1_BVisaCountryDDList);
            LoadCountryList(this.Tab2_CountryDDList);
            LoadCountryList(this.Tab2_WCountryDDList);
            LoadCountryList(this.Tab3_PassportCountryDDList);
            LoadCountryList(Tab1_LaborCardCountryDDList);
            LoadCountryList(Tab3_VisaIssueCountryID);            
            LoadGenderType(this.Tab3_GenderType);
            LoadRelationshipType(this.Tab3_RelationshipDDList);
            LoadRelationshipType(this.Tab4_RelationshipDDList);
            ContactPriorityType(this.Tab4_ContactPrioirtyDDList);
            LoadDocumentType(Tab8_DocumentType);

            
           // Gather Employee Information.
            try
            {
             DataSet _DataList = null;
             _DataList = DatabaseManager.Data.DBAccessManager.RetrieveEmployeeInfo(EmpId);
            if (_DataList.Tables.Count > 0)
            {
                if (_DataList.Tables[0].Rows.Count > 0) // General Employee/Job details Information
                {
                  DataRow _employeeDataRow = _DataList.Tables[0].Rows[0];
                  Tab1_FName.Text = _employeeDataRow["F_Name"].ToString();
                  Tab1_MidName.Text = _employeeDataRow["Mid_Initial"].ToString();
                  Tab1_LName.Text = _employeeDataRow["L_Name"].ToString();
                  lblEmployeeName.Text = Tab1_FName.Text + " " + Tab1_MidName.Text + " " + Tab1_LName.Text;
                  lblJobCatagory.Text = _employeeDataRow["JobCatagoryName"].ToString();
                  lblEmployeeID.Text = _employeeDataRow["Employee_ID"].ToString();
                  lblDivision.Text = _employeeDataRow["DivisionName"].ToString();
                  lblDivisionLocation.Text = _employeeDataRow["DivisionLocationName"].ToString();
                  LoadGenderType(this.Tab1_GenderType);
                  Tab1_GenderType.SelectedValue = _employeeDataRow["GenderID"].ToString();
                  Tab1_DOB.Text = _employeeDataRow["DOB"].ToString();
                  LoadMaritalStatus(this.Tab1_MaritalStatus);
                  Tab1_MaritalStatus.SelectedValue = _employeeDataRow["MaritalStatus_ID"].ToString();
                
                  Tab1_Citizenship.Text = _employeeDataRow["Citizenship"].ToString();

                  if (_employeeDataRow["Photo_Path"].ToString() != "")
                  {
                      this.profile.ImageUrl = Page.ResolveUrl("~\\PhotoProfiles\\" + _employeeDataRow["Photo_Path"].ToString());

                  }
                  else
                  {
                      this.profile.ImageUrl = Page.ResolveUrl("~\\PhotoProfiles\\" +"d_Photo.jpg");
                  }
                  Tab1_Age.Text = _employeeDataRow["Age"].ToString();
                  
                  // Job Details Tab Information.

                                     

                 // Immigration Information
                  if (_employeeDataRow["Visa_TypeID"].ToString() != "")
                  {
                    Tab1_VisaType.SelectedValue = _employeeDataRow["Visa_TypeID"].ToString();
                  }
                  
                  if (_employeeDataRow["PP_IssueCountryID"].ToString() != "")
                  {
                    Tab1_PassportCountryDDList.SelectedValue = _employeeDataRow["PP_IssueCountryID"].ToString();
                  }
                  
                  if (_employeeDataRow["Visa_IssueCountryID"].ToString() != "")
                  {
                      Tab1_VisaCountryDDList.SelectedValue = _employeeDataRow["Visa_IssueCountryID"].ToString();
                  }
                  Tab1_PassportNo.Text = _employeeDataRow["PassportNumber"].ToString();
                  Tab1_VisaNumber.Text = _employeeDataRow["Visa_Number"].ToString();
                  Tab1_VisaExpiryDate.Text = _employeeDataRow["Visa_ExpiryDate"].ToString();
                  Tab1_VisaIssueDate.Text = _employeeDataRow["Visa_IssueDate"].ToString();
                  Tab1_PassportIssueDate.Text = _employeeDataRow["PP_IssueDate"].ToString();
                  Tab1_PassportExpiryDate.Text = _employeeDataRow["PP_ExpiryDate"].ToString();
                  Tab1_LaborCardNo.Text = _employeeDataRow["LaborCardNumber"].ToString();
                  Tab1_LaborCardIssueDate.Text = _employeeDataRow["LaborCardIssueDate"].ToString();
                  Tab1_LaborCardExpiryDate.Text = _employeeDataRow["LaborCardExpiryDate"].ToString();
                  if (_employeeDataRow["LaborCardIssueCountryID"].ToString() != "")
                  {
                      Tab1_LaborCardCountryDDList.SelectedValue = _employeeDataRow["LaborCardIssueCountryID"].ToString();
                  }
                 //Business Visa
                  Tab1_BVisaNumber.Text = _employeeDataRow["BVisa_Number"].ToString();
                  Tab1_BVisaExpiryDate.Text = _employeeDataRow["BVisa_ExpiryDate"].ToString();
                  Tab1_BVisaIssueDate.Text = _employeeDataRow["BVisa_IssueDate"].ToString();
                  if (_employeeDataRow["BVisa_IssueCountryID"].ToString() != "")
                  {
                      Tab1_BVisaCountryDDList.SelectedValue = _employeeDataRow["BVisa_IssueCountryID"].ToString();
                  }                    
                 // Employee Contact Information.
                  Tab2_HAddress1.Text = _employeeDataRow["Home_Addr1"].ToString();
                  Tab2_HAddress2.Text = _employeeDataRow["Home_Addr2"].ToString();
                  Tab2_WAddress1.Text = _employeeDataRow["Work_Addr1"].ToString();
                  Tab2_WAddress2.Text = _employeeDataRow["Work_Addr2"].ToString();
                  Tab2_HCity.Text     = _employeeDataRow["City"].ToString();
                  Tab2_HState.Text = _employeeDataRow["Home_State"].ToString();
                  if (_employeeDataRow["Home_CountryID"].ToString() != "")
                  {
                    Tab2_CountryDDList.SelectedValue = _employeeDataRow["Home_CountryID"].ToString();
                  }   
                  if (_employeeDataRow["Work_CountryID"].ToString() != "")
                  {
                    Tab2_WCountryDDList.SelectedValue = _employeeDataRow["Work_CountryID"].ToString();
                  }
                  Tab2_WCity.Text = _employeeDataRow["Work_City"].ToString();
                  Tab2_WState.Text = _employeeDataRow["Work_State"].ToString();
                  Tab2_HPhone.Text = _employeeDataRow["Home_Phone"].ToString();
                  Tab2_Mobile.Text = _employeeDataRow["Mobile_Phone"].ToString();
                  Tab2_WPhone.Text = _employeeDataRow["Work_Phone"].ToString();
                  Tab2_WorkEmail.Text = _employeeDataRow["Work_Email"].ToString();
                  lblWorkPhone.Text = _employeeDataRow["Work_Phone"].ToString();
                  lblMobile.Text = _employeeDataRow["Mobile_Phone"].ToString();
                  lblEmailAddress.Text = _employeeDataRow["Work_Email"].ToString();
              }



              if (_DataList.Tables[1].Rows.Count > 0)  // Employee Dependent Information.
              {
                  DataRow _empDependentDataRow = _DataList.Tables[3].Rows[0];
                  DataTable _empDependentDataTable = _DataList.Tables[3];

                  if (_DataList.Tables[3].Rows.Count > 0)
                  {
                      this.DPGrid.DataSource = _empDependentDataTable;
                      this.DPGrid.DataBind();
                  }
                  else
                  {
                      emptyRow2.Visible = true;
                      emptyRow2.Text = "There are no dependents information found.";
                      emptyRow2.CssClass = "errorMessage";
                  }
                             
              }
              else
              {
                  emptyRow2.Visible = true;
                  emptyRow2.Text = "There are no dependents information found.";
                  emptyRow2.CssClass = "errorMessage";
              }

              if (_DataList.Tables[2].Rows.Count > 0)  // Employee Emergency contact Information.
              {
                  DataRow _empECDataRow = _DataList.Tables[4].Rows[0];
                  DataTable _empECDataTable = _DataList.Tables[4];

                  if (_DataList.Tables[4].Rows.Count > 0)
                  {
                      this.ECGrid.DataSource = _empECDataTable;
                      this.ECGrid.DataBind();

                      if (_empECDataRow["Contact_Priority"].ToString() != "")
                      {
                          Tab4_ContactPrioirtyDDList.SelectedValue = _empECDataRow["Contact_Priority"].ToString();
                      }
                      if (_empECDataRow["RelationshipId"].ToString() != "")
                      {
                          Tab4_RelationshipDDList.SelectedValue = _empECDataRow["RelationshipId"].ToString();
                      }
                  }
                  else
                  {
                      emptyRow1.Visible = true;
                      emptyRow1.Text = "There are no records found.";
                      emptyRow1.CssClass = "errorMessage";
                  }

              }
              else
              {
                  emptyRow1.Visible = true;
                  emptyRow1.Text = "There are no records found.";
                  emptyRow1.CssClass = "errorMessage";
              }


            }
        }
     catch(Exception exception)
     {
        ErrorLogging.LogError(exception, "");
     }
           
        }
        protected void Grid_CancelCommand(object source, DataGridCommandEventArgs e)
        {
            EmpGrid.EditItemIndex = -1;
            LoadDataList();
        }
        protected void Grid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
          
        }
       

    

    }
}