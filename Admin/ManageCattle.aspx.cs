using PresentationManager.Web.UI.MasterPages;
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace SchoolNet
{
    public partial class ManageCattle : SchoolNetBase
    {
       // protected HtmlInputFile Tab8_FileName;
        public int EmpId;
        public String AssignedVetId;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            EmpId = Int32.Parse(Page.User.Identity.Name.ToString());

            if (!Page.IsPostBack)
            {
            }
            else
            {
            }
      
            LoadDataList();
            if (this.keyField.Text.ToString() != "")
            {
                LoadCattleLabTests();
                LoadCattleVaccinations();
                LoadCattleDrugsUsage();
                LoadCattleTreatments();
                LoadCattleDocs();
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

            tab1.Click += new EventHandler(tab1_Click);
            tab2.Click += new EventHandler(tab2_Click);
            tab3.Click += new EventHandler(tab3_Click);
            tab4.Click += new EventHandler(tab4_Click);
            tab5.Click += new EventHandler(tab5_Click);
            tab6.Click += new EventHandler(tab6_Click);
            tab8.Click += new EventHandler(tab8_Click);

            Save_Cattle.Click += new EventHandler(Save_cattle_Click);
            Tab3_Save.Click += new EventHandler(Tab3_Save_Click);
            Tab3_Reset.Click += new EventHandler(Tab3_Reset_Click);
            Tab4_Save.Click += new EventHandler(Tab4_Save_Click);
            Tab4_Reset.Click += new EventHandler(Tab4_Reset_Click);
            Tab5_Save.Click += new EventHandler(Tab5_Save_Click);
            Tab5_Reset.Click += new EventHandler(Tab5_Reset_Click);
            
            Tab5S_Save.Click += new EventHandler(Tab5S_Save_Click);
            Tab5S_Reset.Click += new EventHandler(Tab5S_Reset_Click);

            Tab8_Save.Click += new EventHandler(Tab8_Save_Click);
            Tab8_Reset.Click += new EventHandler(Tab8_Reset_Click);

            //            tab7.Click += new EventHandler(tab7_Click);
//            tab8.Click += new EventHandler(tab8_Click);  
            
            Tab1_Back.Click += new EventHandler(Tab_Back_Click);
          
            Tab2_LocType.SelectedIndexChanged += new EventHandler(Tab2_LocType_SelectedIndexChanged);
        }
        #endregion
       

        protected void Tab2_LocType_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadLocationByLocationType(Tab2_Location, Int32.Parse(Tab2_LocType.SelectedValue));
        }
        protected void Tab5_LocType_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadLocationByLocationType(TreatmentLocationID, Int32.Parse(TreatmentLocationType.SelectedValue));  
        }
        protected void DOB_TextChanged(object sender, EventArgs e)
        {
            LoadMaleParentLookup(Tab2_MaleParent, Tab2_DOB.Text.ToString());
            LoadFemaleParentLookup(Tab2_FemaleParent, Tab2_DOB.Text.ToString());
        }

        protected void Tab3_Reset_Click(object sender, EventArgs e)
        {
            ResetCattleLabTests();
            Tab3_message.Text = "";
            Tab3_AlertDiv.Visible = false;
        }

        protected void Tab4_Reset_Click(object sender, EventArgs e)
        {
            ResetCattleVaccinations();
            Tab4_message.Text = "";
            Tab4_AlertDiv.Visible = false;
        }

        protected void Tab5_Reset_Click(object sender, EventArgs e)
        {
            ResetCattleTreatments();
            Tab5_message.Text = "";
            Tab5_AlertDiv.Visible = false;
        }
        protected void Tab5S_Reset_Click(object sender, EventArgs e)
        {
            ResetCattleDrugsUsage();
            Tab5S_message.Text = "";
            Tab5S_AlertDiv.Visible = false;
        }
        protected void Tab8_Reset_Click(object sender, EventArgs e)
        {
            ResetCattleDocuments();
            Tab8_message.Text = "";
            Tab8_AlertDiv.Visible = false;
        }

        private void ResetCattleLabTests()
        {
            Tab3_LabTestCode.SelectedIndex = -1;
            Tab3_Veternerian.SelectedIndex = -1;
            Tab3_LabTestDate.Text = "";
            Tab3_Notes.Text = "";
            Tab3_KeyField.Text = "";
        }

        private void ResetCattleVaccinations()
        {
            Tab4_VaccineID.SelectedIndex = -1;
            Tab4_VaccinationDate.Text = "";
            Tab4_NextVaccination.Text = "";
            Tab4_Remarks.Text = "";
            Tab4_KeyField.Text = "";
        }
        private void ResetCattleTreatments()
        {
            TreatmentType.SelectedIndex = -1;
            DiseaseID.SelectedIndex = -1;
            PrescriptionID.Text = "";
            TreatmentDate.Text = "";
            CaseDescription.Text = "";
            Findings.Text = "";
            Treatment.Text = "";
            ClinicalRelevance.Text = "";
            TreatmentVeternarian.SelectedValue = VetID_Hidden.Text.ToString();
            TreatmentLocationType.SelectedValue = LocType_Hidden.Text.ToString();
            LoadLocationByLocationType(TreatmentLocationID, Int32.Parse(TreatmentLocationType.SelectedValue));
            TreatmentLocationID.SelectedValue = LocID_Hidden.Text.ToString();
            FollowupDate.Text = "";
            FollowupAlert1.Checked = false; FollowupAlert2.Checked = true;
            Tab5_KeyField.Text = "";
        }
        private void ResetCattleDrugsUsage()
        {
            Tab5S_KeyField.Text = "";
            Tab5S_DrugID.SelectedIndex = -1;
            //Tab5S_Prescription.Text = "";
            Tab5S_Quantity.Text = "";
            Tab5S_Notes.Text = "";
        }

        private void ResetCattleDocuments()
        {
            Tab8_DocumentName.Text = "";
            Tab8_DocumentType.SelectedIndex = -1;
            Tab8_Comments.Text = "";
        }

         protected void Tab_Back_Click(object sender, EventArgs e)
        {
            TabSettings();
            this.keyField.Text = "";
            Grid.EditItemIndex = -1;
            this.EmpSearchBox.Visible = true;
            this.searchDataArea.Visible = true;
            this.EditArea.Visible = false;
        }

        #region LoadDataList
        private void LoadDataList()
        {
            try
            {
                DataSet _DataList = null;
                if (ViewState["myDataSet"] == null)   // No such value in view state, take appropriate action.
                {

                    /*_DataList = DatabaseManager.Data.DBAccessManager.RetrieveCattleList_Search(Srch_CattleTagId.Text.ToString(),
                        Srch_CattleName.Text.ToString(),Int32.Parse(Srch_CattleGroup.SelectedValue),Int32.Parse(Srch_BreedType.SelectedValue),
                        Int32.Parse(Srch_CattleStatus.SelectedValue), Int32.Parse(Srch_Division.SelectedValue), 
                        Int32.Parse(Srch_Location.SelectedValue), -1, -1, Int32.Parse(Page.User.Identity.Name.ToString())); */

                    _DataList = DatabaseManager.Data.DBAccessManager.RetrieveCattleListByStatusMenu(-1, Int32.Parse(Page.User.Identity.Name.ToString()));

                    
                    if (_DataList.Tables[0].Rows.Count > 0)
                    {
                        
                        this.Grid.DataSource = _DataList;
                        this.Grid.DataBind();
              //          this.Grid.ShowHeader = false;
                        emptyRow.Text = "";
                        emptyRow.Visible = false;
                        SetViewState(_DataList);
                    }
                    else
                    {
                        this.Grid.DataSource = null;
                        this.Grid.DataBind();
                        emptyRow.Visible = true;
                        emptyRow.CssClass = "errorMessage";
                        emptyRow.Text = "There are no matching records found.";
                        //Export.Visible = false;
                    }
                }
                else  // If it is avaiable in the viewstate bind it from there.
                {
                    _DataList = GetViewState();
                    this.Grid.DataSource = _DataList;
                    this.Grid.DataBind();

                }
            }
            catch (Exception exception)
            {
                 Grid.CurrentPageIndex = 0;
                 Grid.DataBind();
            }


        }
        #endregion

    
      
        private void TabSettings()
        {
            message.Text = "";
            AlertDiv.Visible = false;
            Tab3_message.Text = "";
            Tab3_AlertDiv.Visible = false;
            Tab4_message.Text = "";
            Tab4_AlertDiv.Visible = false;
            Tab5_message.Text = "";
            Tab5_AlertDiv.Visible = false;
            Tab5S_message.Text = "";
            Tab5S_AlertDiv.Visible = false;
            Tab8_message.Text = "";
            Tab8_AlertDiv.Visible = false;
            CattleInfoTab.Visible = false;
            EditCattleTab.Visible = false;
            CattleLabTestTab.Visible = false;
            VaccinationTab.Visible = false;
            CattleTreatmentsTab.Visible = false;

            RaceHistory.Visible = false;
            DocumentsTab.Visible = false;
            CompensationTab.Visible = false;
            tab1.CssClass = "";
            tab2.CssClass = "";
            tab3.CssClass = "";
            tab4.CssClass = "";
            tab5.CssClass = "";
            tab6.CssClass = "";
            tab8.CssClass = "";
         /*   tab7.CssClass = ""; */
            
        }
        protected void tab1_Click(object sender, EventArgs e)
        {
            TabSettings();
            tab1.CssClass = "active";
            CattleInfoTab.Visible = true;
            LoadCattleInformation(Int32.Parse(this.keyField.Text));
        }
        protected void tab2_Click(object sender, EventArgs e)
        {
            TabSettings();
            tab2.CssClass = "active";
            EditCattleTab.Visible = true;
            LoadCattleInformation(Int32.Parse(this.keyField.Text));
        }
        protected void tab3_Click(object sender, EventArgs e)
        {
            TabSettings();
            tab3.CssClass = "active";
            CattleLabTestTab.Visible = true;
            LoadLabTestsLookup(Tab3_LabTestCode);
            LoadVeterinarians(Tab3_Veternerian);
            if (!VetID_Hidden.Text.ToString().Equals(""))
            {
                Tab3_Veternerian.SelectedValue = VetID_Hidden.Text.ToString();
            }
            LoadCattleLabTests();

        }
        protected void tab4_Click(object sender, EventArgs e)
        {
            TabSettings();
            tab4.CssClass = "active";
            VaccinationTab.Visible = true;
            LoadVaccinesLookup(Tab4_VaccineID);
            LoadCattleVaccinations();
        }
        protected void tab5_Click(object sender, EventArgs e)
        {
            TabSettings();
            tab5.CssClass = "active";
            CattleTreatmentsTab.Visible = true;
            ManageDrugsUsage.Visible = false;
            ManageTreatments.Visible = true;
            LoadTreatmentTypeLookup(TreatmentType);
            LoadDiseaseLookup(DiseaseID);
            LoadLocationType(TreatmentLocationType);
            if (!LocType_Hidden.Text.ToString().Equals(""))
            {
                TreatmentLocationType.SelectedValue = LocType_Hidden.Text.ToString();
            }
            LoadLocationByLocationType(TreatmentLocationID, Int32.Parse(TreatmentLocationType.SelectedValue));
            if (!LocID_Hidden.Text.ToString().Equals(""))
            {
                TreatmentLocationID.SelectedValue = LocID_Hidden.Text.ToString();
            }
            LoadVeterinarians(TreatmentVeternarian);
            if (!VetID_Hidden.Text.ToString().Equals(""))
            {
                TreatmentVeternarian.SelectedValue = VetID_Hidden.Text.ToString();
            }
            LoadCattleTreatments();
        }
        
        protected void tab8_Click(object sender, EventArgs e)
        {
            TabSettings();
            tab8.CssClass = "active";
            DocumentsTab.Visible = true;
            LoadCattleDocumentTypeLookup(Tab8_DocumentType);
            LoadCattleDocs();
         }
        protected void tab6_Click(object sender, EventArgs e)
        {
            TabSettings();
            tab6.CssClass = "active";
            RaceHistory.Visible = true;
            LoadRaceResultsByCattleID();
        }
        protected void tab7_Click(object sender, EventArgs e)
        {
            TabSettings();
            // tab7.CssClass = "active";
            CompensationTab.Visible = true;
        }
        protected void Save_cattle_Click(object sender, EventArgs e)
        {
            Int32 BornOutside; Int32 CattleStatus = (int)Constants.AnimalStatusType.InHouse;
            try
            {
                if (Page.IsValid == true)
                {

                    if (Tab2_BornOutside1.Checked) { BornOutside = 1; } else { BornOutside = 0; }

                    //   if (Tab1_MicrochipID.Text == "") { Tab1_MicrochipID.Text = "0"; }
                    if (Tab2_BirthWeight.Text == "") { Tab2_BirthWeight.Text = "0"; }
                    if (Tab2_BirthHeight.Text == "") { Tab2_BirthHeight.Text = "0"; }
                    if (keyField.Text.ToString() == "") { keyField.Text = "0"; }
                    String Result = DatabaseManager.Data.DBAccessManager.AddUpdateCattle(Int32.Parse(keyField.Text), Tab2_CattleName.Text.ToString(),
                        Tab2_CattleShortName.Text.ToString(), Tab2_AnimalTagId.Text.ToString(), -1, CattleStatus, Int32.Parse(Tab2_BreedType.SelectedValue), Tab2_MicrochipID.Text.ToString(), Int32.Parse(Tab2_Trainer.SelectedValue), Int32.Parse(Tab2_Veterinary.SelectedValue), Int32.Parse(Tab2_Location.SelectedValue), Int32.Parse(Tab2_GenderType.SelectedValue), ConvertDMY_MDY(Tab2_DOB),
                        BornOutside, Double.Parse(Tab2_BirthWeight.Text), Double.Parse(Tab2_BirthHeight.Text), Int32.Parse(Tab2_MaleParent.SelectedValue), Int32.Parse(Tab2_FemaleParent.SelectedValue), Tab2_CattleColor.Text.ToString(), ConvertDMY_MDY(Tab2_AnimalAdopted), "", Tab2_Notes.Text.ToString(), EmpId);

                    AlertDiv.Visible = true;

                    if (Result == "")
                    {
                        AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                        message.Text = "Successfully saved.";
        //                Tab2_ResetFields();

                    }
                    else
                    {
                        AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                        message.Text = Result;
                    }
                }
                else
                {
                    AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                    message.Text = "Error:Could not save the information. Please check the inputs";
                    //this.message.CssClass = "errorMessage";
                }

            }
            catch (Exception exception)
            {
                AlertDiv.Visible = true;
                AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                message.Text = ErrorLogging.LogError(exception, "Unknown Exception Occured. Please contact support.");
                //  this.message.CssClass = "errorMessage";
            }
            LoadCattleInformation(Int32.Parse(this.keyField.Text));
        }
        
        
        protected void Grid_EditCommand(object source, DataGridCommandEventArgs e)
        {

            this.keyField.Text = Grid.DataKeys[e.Item.ItemIndex].ToString();
            // Grid.EditItemIndex = e.Item.ItemIndex;
            this.EmpSearchBox.Visible = false;
            this.searchDataArea.Visible = false;
            this.EditArea.Visible = true;
            tab1.CssClass = "active";
            this.CattleInfoTab.Visible = true;
            LoadCattleInformation(Int32.Parse(this.keyField.Text));
        }
        private void LoadCattleInformation(Int32 EmpId)
        {
            // Load dropdown Controls.
            LoadLocationType(Tab2_LocType);
            LoadLocationByLocationType(Tab2_Location, Int32.Parse(Tab2_LocType.SelectedValue));
            LoadGenderType(Tab2_GenderType);
            LoadBreedType(Tab2_BreedType);
            LoadCattleStatus(Tab2_CattleStatus);
            LoadVeterinarians(Tab2_Veterinary);
            LoadTrainers(Tab2_Trainer);
            LoadMaleParentLookup(Tab2_MaleParent, Tab2_DOB.Text.ToString());
            LoadFemaleParentLookup(Tab2_FemaleParent, Tab2_DOB.Text.ToString());
           // Gather Employee Information.
            try
            {
             DataSet _DataList = null;
             _DataList = DatabaseManager.Data.DBAccessManager.RetrieveCattleInfo(EmpId);
            if (_DataList.Tables.Count > 0)
            {
                if (_DataList.Tables[0].Rows.Count > 0) // General Employee/Job details Information
                {
                    DataRow _employeeDataRow = _DataList.Tables[0].Rows[0];

                    lblAnimalTagID.Text = _employeeDataRow["AnimalTagID"].ToString();
                    lblCattleName.Text = _employeeDataRow["AnimalName"].ToString();
                    lblShortName.Text = _employeeDataRow["ShortName"].ToString();
                    lblChipID.Text = _employeeDataRow["MicrochipID"].ToString();
                    lblCattleStatus.Text = _employeeDataRow["StatusTypeName"].ToString();
                    lblCattleGroup.Text = _employeeDataRow["AnimalGroup"].ToString();
                    lblGenderName.Text = _employeeDataRow["GenderName"].ToString();
                    lblDOB.Text = _employeeDataRow["DOB"].ToString();
                    lblAge.Text = _employeeDataRow["CattleAge"].ToString();
                    lblMaleParent.Text = _employeeDataRow["MaleParentName"].ToString();
                    lblFemaleParent.Text = _employeeDataRow["FemaleParentName"].ToString();
                    lblColor.Text = _employeeDataRow["AnimalColor"].ToString();
                    lblNotes.Text = _employeeDataRow["Notes"].ToString();
                    lblFarmLocation.Text = _employeeDataRow["LocationName"].ToString();
                    lblLocationType.Text = _employeeDataRow["LocationTypeName"].ToString();
                    lblVeternerian.Text = _employeeDataRow["AssignedVet"].ToString();
                    lblTrainer.Text = _employeeDataRow["AssignedTrainer"].ToString();
                    lblBornOutside.Text = _employeeDataRow["IsBornOutside"].ToString();
                    lblBWeight.Text = _employeeDataRow["BirthWeight"].ToString() + " KGs";
                    lblBHeight.Text = _employeeDataRow["BirthHeight"].ToString() + " CMs";
                    lblAdoptedDate.Text = _employeeDataRow["AdoptedDate"].ToString();
                    lblDisplacedDate.Text = _employeeDataRow["DisplacedDate"].ToString();
                    lblModifiedBy.Text = _employeeDataRow["Employee_ID"].ToString();
                    lblModifiedOn.Text = _employeeDataRow["EditedDate"].ToString();

                    Tab2_AnimalTagId.Text = _employeeDataRow["AnimalTagID"].ToString();
                    Tab2_DOB.Text = _employeeDataRow["DOB"].ToString();
                    Tab2_CattleName.Text = _employeeDataRow["AnimalName"].ToString();
                    Tab2_CattleShortName.Text = _employeeDataRow["ShortName"].ToString();
                    Tab2_MicrochipID.Text = _employeeDataRow["MicrochipID"].ToString();
                    Tab2_BirthWeight.Text = _employeeDataRow["BirthWeight"].ToString();
                    Tab2_BirthHeight.Text = _employeeDataRow["BirthHeight"].ToString();
                    Tab2_CattleColor.Text = _employeeDataRow["AnimalColor"].ToString();
                    Tab2_Notes.Text = _employeeDataRow["Notes"].ToString();

                    if (_employeeDataRow["BornOutside"].ToString() == "1")
                    { Tab2_BornOutside1.Checked = true; }
                    else
                    { Tab2_BornOutside1.Checked = false; }


                    Tab2_AnimalAdopted.Text = _employeeDataRow["AdoptedDate"].ToString();
                    Tab2_AnimalDisplaced.Text = _employeeDataRow["DisplacedDate"].ToString();
                    if (_employeeDataRow["GenderTypeID"].ToString() != "")
                    {
                        Tab2_GenderType.SelectedValue = _employeeDataRow["GenderTypeID"].ToString();
                    }
                    if (_employeeDataRow["BreedTypeID"].ToString() != "")
                    {
                        Tab2_BreedType.SelectedValue = _employeeDataRow["BreedTypeID"].ToString();
                    }
                    if (_employeeDataRow["StatusTypeID"].ToString() != "")
                    {
                        Tab2_CattleStatus.SelectedValue = _employeeDataRow["StatusTypeID"].ToString();
                    }
                    if (_employeeDataRow["LocationTypeID"].ToString() != "")
                    {
                        Tab2_LocType.SelectedValue = _employeeDataRow["LocationTypeID"].ToString();
                        LocType_Hidden.Text = _employeeDataRow["LocationTypeID"].ToString();
                        LoadLocationByLocationType(Tab2_Location, Int32.Parse(Tab2_LocType.SelectedValue));
                    }
                    if (_employeeDataRow["FarmLocationID"].ToString() != "")
                    {
                        Tab2_Location.SelectedValue = _employeeDataRow["FarmLocationID"].ToString();
                        LocID_Hidden.Text = _employeeDataRow["FarmLocationID"].ToString();
                    }
                    if (_employeeDataRow["AssignedTrainerID"].ToString() != "")
                    {
                        Tab2_Trainer.SelectedValue = _employeeDataRow["AssignedTrainerID"].ToString();
                    }
                    if (_employeeDataRow["AssignedVetID"].ToString() != "")
                    {
                        AssignedVetId = _employeeDataRow["AssignedVetID"].ToString();
                        Tab2_Veterinary.SelectedValue = AssignedVetId;
                        VetID_Hidden.Text = AssignedVetId;
                    }
                    if (_employeeDataRow["MaleParent"].ToString() != "")
                    {
                        Tab2_MaleParent.SelectedValue = _employeeDataRow["MaleParent"].ToString();
                    }
                    else
                    {
                        Tab2_MaleParent.SelectedIndex = -1;
                    }
                    if (_employeeDataRow["FemaleParent"].ToString() != "")
                    {
                        Tab2_FemaleParent.SelectedValue = _employeeDataRow["FemaleParent"].ToString();
                    }
                    else
                    {
                        Tab2_FemaleParent.SelectedIndex = -1;
                    }
                    // Job Details Tab Information.

                }
            }
        }
     catch(Exception exception)
     {
        ErrorLogging.LogError(exception, "");
     }
           
        }

        #region LoadCattleLabTests
        private void LoadCattleLabTests()
        {
            DataTable _empLTTable = null;
            try
            {
                DataSet _DataList = null;
                _DataList = DatabaseManager.Data.DBAccessManager.RetrieveCattleLabTests(Int32.Parse(this.keyField.Text.ToString()));
                if (_DataList.Tables[0].Rows.Count > 0)  // Employee Emergency Contacts Information.
                {

                    _empLTTable = _DataList.Tables[0];
                    this.LTCGrid.DataSource = _empLTTable;
                    this.LTCGrid.DataBind();
                }
                else
                {
                    this.LTCGrid.DataSource = null;
                    this.LTCGrid.DataBind();
                }
            }
            catch (Exception exception)
            {

                ErrorLogging.LogError(exception, "Unknown Exception Occured. Please contact support.");                
            }
        }
        #endregion

        #region LoadCattleVaccinations
        private void LoadCattleVaccinations()
        {
            DataTable _empLTTable = null;
            try
            {
                DataSet _DataList = null;
                _DataList = DatabaseManager.Data.DBAccessManager.RetrieveCattleVaccinations(Int32.Parse(this.keyField.Text.ToString()));
                if (_DataList.Tables[0].Rows.Count > 0)  // Employee Emergency Contacts Information.
                {

                    _empLTTable = _DataList.Tables[0];
                    this.CVGrid.DataSource = _empLTTable;
                    this.CVGrid.DataBind();
                }
                else
                {
                    this.CVGrid.DataSource = null;
                    this.CVGrid.DataBind();
                }
            }
            catch (Exception exception)
            {
                ErrorLogging.LogError(exception, "Unknown Exception Occured. Please contact support.");
            }
        }
        #endregion

        #region LoadCattleTreatments
        private void LoadCattleTreatments()
        {
            DataTable _empLTTable = null;
            try
            {
                DataSet _DataList = null;
                _DataList = DatabaseManager.Data.DBAccessManager.RetrieveCattleTreatments(Int32.Parse(this.keyField.Text.ToString()));
                if (_DataList.Tables[0].Rows.Count > 0)  
                {
                    _empLTTable = _DataList.Tables[0];
                    this.CTMTGrid.DataSource = _empLTTable;
                    this.CTMTGrid.DataBind();
                }
                else
                {
                    this.CTMTGrid.DataSource = null;
                    this.CTMTGrid.DataBind();
                }
            }
            catch (Exception exception)
            {
                ErrorLogging.LogError(exception, "Unknown Exception Occured. Please contact support.");
            }
        }
        #endregion

        #region LoadCattleDrugsUsage
        private void LoadCattleDrugsUsage()
        {
            DataTable _empLTTable = null;
            try
            {
                if (Tab5_KeyField.Text.ToString() == "") { Tab5_KeyField.Text = "0"; }
                DataSet _DataList = null;
                _DataList = DatabaseManager.Data.DBAccessManager.RetrieveCattleDrugsUsage(Int32.Parse(this.Tab5_KeyField.Text.ToString()));
                if (_DataList.Tables[0].Rows.Count > 0)  // Employee Emergency Contacts Information.
                {
                    _empLTTable = _DataList.Tables[0];
                    this.CDUGrid.DataSource = _empLTTable;
                    this.CDUGrid.DataBind();
                }
                else
                {
                    this.CDUGrid.DataSource = null;
                    this.CDUGrid.DataBind();
                }
            }
            catch (Exception exception)
            {
                ErrorLogging.LogError(exception, "Unknown Exception Occured. Please contact support.");
            }
        }
        #endregion

        #region  LoadCattleDocs
        private void LoadCattleDocs()
        {
            DataTable _DocDataTable = null;
            try
            {
                DataSet _DataList = null;
                _DataList = DatabaseManager.Data.DBAccessManager.RetrieveCattleDocuments(Int32.Parse(this.keyField.Text.ToString()));
                if (_DataList.Tables[0].Rows.Count > 0)  // Employee Emergency Contacts Information.
                {

                    _DocDataTable = _DataList.Tables[0];
                    this.DOCGrid.DataSource = _DocDataTable;
                    this.DOCGrid.DataBind();
                }
                else
                {
                    this.DOCGrid.DataSource = null;
                    this.DOCGrid.DataBind();
                }
            }
            catch (Exception exception)
            {

                ErrorLogging.LogError(exception, "Unknown Exception Occured. Please contact support.");
            }
        }
        #endregion


        protected void Tab3_Save_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid == true)
                {
                    if (Tab3_KeyField.Text.ToString() == "") { Tab3_KeyField.Text = "0"; }
                    String Result = DatabaseManager.Data.DBAccessManager.AddUpdateCattleLabTests(Int32.Parse(Tab3_KeyField.Text), 
                        Int32.Parse(keyField.Text.ToString()), Int32.Parse(Tab3_LabTestCode.Text), "", ConvertDMY_MDY(Tab3_LabTestDate), Tab3_Notes.Text, Int32.Parse(Tab3_Veternerian.Text), EmpId);

                    this.Tab3_AlertDiv.Visible = true;
                    if (Result == "")
                    {
                        this.Tab3_AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                        this.Tab3_message.Text = "Successfully saved.";
                        ResetCattleLabTests();
                    }
                    else
                    {
                        this.Tab3_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                        this.Tab3_message.Text = Result;
                    }
                }
                else
                {
                    this.Tab3_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                    this.Tab3_message.Text = "Error:Could not save the information. Please check the inputs";
                }

            }
            catch (Exception exception)
            {
                this.Tab3_AlertDiv.Visible = true;
                this.Tab3_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                this.Tab3_message.Text = ErrorLogging.LogError(exception, "Unknown Exception Occured. Please contact support.");
            }
             LoadCattleLabTests(); // Refresh the Grid after Save.
        }

        protected void Tab4_Save_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid == true)
                {
                    if (Tab4_KeyField.Text.ToString() == "") { Tab4_KeyField.Text = "0"; }
                    String Result = DatabaseManager.Data.DBAccessManager.AddUpdateCattleVaccinations(Int32.Parse(Tab4_KeyField.Text),
                        Int32.Parse(keyField.Text.ToString()), Int32.Parse(Tab4_VaccineID.Text), ConvertDMY_MDY(Tab4_VaccinationDate), ConvertDMY_MDY(Tab4_NextVaccination), Tab4_Remarks.Text, EmpId);

                    this.Tab4_AlertDiv.Visible = true;
                    if (Result == "")
                    {
                        this.Tab4_AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                        this.Tab4_message.Text = "Successfully saved.";
                        ResetCattleVaccinations();
                    }
                    else
                    {
                        this.Tab4_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                        this.Tab4_message.Text = Result;
                    }
                }
                else
                {
                    this.Tab4_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                    this.Tab4_message.Text = "Error:Could not save the information. Please check the inputs";
                }

            }
            catch (Exception exception)
            {
                this.Tab4_AlertDiv.Visible = true;
                this.Tab4_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                this.Tab4_message.Text = ErrorLogging.LogError(exception, "Unknown Exception Occured. Please contact support.");
            }
            LoadCattleVaccinations(); // Refresh the Grid after Save.
        }

        protected void Tab5_Save_Click(object sender, EventArgs e)
        {
            Int32 FollowupAlert;
            try
            {
                if (Page.IsValid == true)
                {
                    if (Tab5_KeyField.Text.ToString() == "") { Tab5_KeyField.Text = "0"; }
                    if (FollowupAlert1.Checked) { FollowupAlert = 1; } else { FollowupAlert = 0; }
                    String Result = DatabaseManager.Data.DBAccessManager.AddUpdateCattleTreatments(Int32.Parse(Tab5_KeyField.Text), Int32.Parse(keyField.Text.ToString()), PrescriptionID.Text,
                        Int32.Parse(TreatmentType.SelectedValue), ConvertDMY_MDY(TreatmentDate), Int32.Parse(DiseaseID.SelectedValue), CaseDescription.Text, Findings.Text, Treatment.Text, ClinicalRelevance.Text,
                        ConvertDMY_MDY(FollowupDate), Int32.Parse(TreatmentVeternarian.SelectedValue), Int32.Parse(TreatmentLocationID.SelectedValue), FollowupAlert, EmpId);

                    this.Tab5_AlertDiv.Visible = true;
                    if (Result == "")
                    {
                        this.Tab5_AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                        this.Tab5_message.Text = "Successfully saved.";
                        ResetCattleTreatments();
                    }
                    else
                    {
                        this.Tab5_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                        this.Tab5_message.Text = Result;
                    }
                }
                else
                {
                    this.Tab5_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                    this.Tab5_message.Text = "Error:Could not save the information. Please check the inputs";
                }

            }
            catch (Exception exception)
            {
                this.Tab5_AlertDiv.Visible = true;
                this.Tab5_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                this.Tab5_message.Text = ErrorLogging.LogError(exception, "Unknown Exception Occured. Please contact support.");
            }
            LoadCattleTreatments(); // Refresh the Grid after Save.
        }

        protected void Tab5S_Save_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid == true)
                {
                    if (Tab5S_KeyField.Text.ToString() == "") { Tab5S_KeyField.Text = "0"; }
                    if (Tab5S_Quantity.Text.ToString() == "") { Tab5S_Quantity.Text = "0"; }
                    String Result = DatabaseManager.Data.DBAccessManager.AddUpdateCattleDrugsUsage(Int32.Parse(Tab5S_KeyField.Text.ToString()), Int32.Parse(Tab5_KeyField.Text), Int32.Parse(Tab5S_DrugID.SelectedValue), Int32.Parse(Tab5S_Quantity.Text.ToString()), Tab5S_Notes.Text, EmpId);

                    this.Tab5S_AlertDiv.Visible = true;
                    if (Result == "")
                    {
                        this.Tab5S_AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                        this.Tab5S_message.Text = "Successfully saved.";
                        ResetCattleDrugsUsage();
                    }
                    else
                    {
                        this.Tab5S_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                        this.Tab5S_message.Text = Result;
                    }
                }
                else
                {
                    this.Tab5S_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                    this.Tab5S_message.Text = "Error:Could not save the information. Please check the inputs";
                }

            }
            catch (Exception exception)
            {
                this.Tab5S_AlertDiv.Visible = true;
                this.Tab5S_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                this.Tab5S_message.Text = ErrorLogging.LogError(exception, "Unknown Exception Occured. Please contact support.");
            }
            LoadCattleDrugsUsage(); // Refresh the Grid after Save.
        }

        protected void Tab8_Save_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                if (Tab8_FileName.PostedFile != null && Tab8_FileName.PostedFile.FileName != "")
                    try
                    {
                        HttpPostedFile myFile = Tab8_FileName.PostedFile;
                        String Ext = System.IO.Path.GetExtension(myFile.FileName);
                     /*   if (myFile.ContentLength <= 2048)
                        {   */
                            String FilePath = Server.MapPath(Page.ResolveUrl("~\\Documents\\" + Int32.Parse(keyField.Text.ToString()) + "_" + Tab8_DocumentName.Text.ToString() + Ext));

                            this.Tab8_AlertDiv.Visible = true;
                            myFile.SaveAs(FilePath);
                            String ActualFileName = Int32.Parse(keyField.Text.ToString()) + "_" + Tab8_DocumentName.Text.ToString() + Ext;

                            String Result = DatabaseManager.Data.DBAccessManager.AddCattleDocuments(Int32.Parse(keyField.Text.ToString()), Int32.Parse(Tab8_DocumentType.SelectedValue), ActualFileName, FilePath, Tab8_Comments.Text.ToString());

                            if (Result == "")
                            {
                                this.Tab8_message.Text = "Successfully saved.";
                                this.Tab8_AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                                ResetCattleDocuments();
                            }

                            else
                            {
                                this.Tab8_message.Text = Result;
                                this.Tab8_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";

                            }

                        /*   }
                           else
                          {
                              this.Tab8_message.Text = "The attached file is more than 4mb.";
                              this.Tab8_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                          }
                          */
                    }
                    catch (Exception exception)
                    {
                        this.Tab8_message.Text = ErrorLogging.LogError(exception, "Unknown Exception Occured.Please contact Support.");
                        this.Tab8_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                    }
                else
                {
                    this.Tab8_message.Text = "You have not specified a file.";
                    this.Tab8_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                }
            }
            LoadCattleDocs();
        }


        protected void CVGrid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Tab4_KeyField.Text = CVGrid.DataKeys[e.Item.ItemIndex].ToString();
                Tab4_VaccinationDate.Text = EmptyString(e.Item.Cells[1].Text);
                Tab4_NextVaccination.Text = EmptyString(e.Item.Cells[2].Text);
                Tab4_Remarks.Text = EmptyString(e.Item.Cells[3].Text);
                Tab4_VaccineID.SelectedValue = EmptyString(e.Item.Cells[4].Text);
            }
            LoadCattleVaccinations();
        }

        protected void LTCGrid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Tab3_KeyField.Text = LTCGrid.DataKeys[e.Item.ItemIndex].ToString();
                Tab3_Notes.Text = EmptyString(e.Item.Cells[2].Text);
                Tab3_LabTestDate.Text = EmptyString(e.Item.Cells[1].Text);
                Tab3_LabTestCode.SelectedValue = EmptyString(e.Item.Cells[4].Text);
                Tab3_Veternerian.SelectedValue = EmptyString(e.Item.Cells[5].Text);
            }
            LoadCattleLabTests();
        }

        protected void CTMTGrid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Tab5_KeyField.Text = CTMTGrid.DataKeys[e.Item.ItemIndex].ToString();
                TreatmentType.SelectedValue = EmptyString(e.Item.Cells[10].Text);
                DiseaseID.SelectedValue = EmptyString(e.Item.Cells[11].Text);
                PrescriptionID.Text = EmptyString(e.Item.Cells[0].Text);
                TreatmentDate.Text = EmptyString(e.Item.Cells[1].Text);
                CaseDescription.Text = EmptyString(e.Item.Cells[4].Text);
                Findings.Text = EmptyString(e.Item.Cells[5].Text);
                Treatment.Text = EmptyString(e.Item.Cells[6].Text);
                ClinicalRelevance.Text = EmptyString(e.Item.Cells[7].Text);
                FollowupDate.Text = EmptyString(e.Item.Cells[8].Text);
                TreatmentVeternarian.SelectedValue = EmptyString(e.Item.Cells[12].Text);
                TreatmentLocationType.SelectedValue = EmptyString(e.Item.Cells[13].Text);
                LoadLocationByLocationType(TreatmentLocationID, Int32.Parse(TreatmentLocationType.SelectedValue));
                TreatmentLocationID.SelectedValue = EmptyString(e.Item.Cells[14].Text);
                if (EmptyString(e.Item.Cells[9].Text) == "1") { FollowupAlert1.Checked = true; } else { FollowupAlert2.Checked = true; }
            }
            LoadCattleTreatments();
        }

        protected void CTMTGrid_UpdateCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                ResetCattleTreatments();
                ResetCattleDrugsUsage();
                Tab5_message.Text = "";
                Tab5_AlertDiv.Visible = false;
                Tab5S_message.Text = "";
                Tab5S_AlertDiv.Visible = false;
                Tab5_KeyField.Text = CTMTGrid.DataKeys[e.Item.ItemIndex].ToString();
                ManageTreatments.Visible = false;
                ManageDrugsUsage.Visible = true;
                //Tab5S_Prescription.Text = EmptyString(e.Item.Cells[0].Text);
                LoadPharmacyItemLookup(Tab5S_DrugID);
            }
            LoadCattleDrugsUsage();
        }

        protected void CDUGrid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Tab5S_KeyField.Text = CDUGrid.DataKeys[e.Item.ItemIndex].ToString();
                Tab5_KeyField.Text = EmptyString(e.Item.Cells[4].Text);
                Tab5S_Quantity.Text = EmptyString(e.Item.Cells[2].Text);
                Tab5S_Notes.Text = EmptyString(e.Item.Cells[3].Text);
                Tab5S_DrugID.SelectedValue = EmptyString(e.Item.Cells[5].Text);
            }
            LoadCattleDrugsUsage();
        }

        protected void CDUGrid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int UsageID = (int)CDUGrid.DataKeys[(int)e.Item.ItemIndex];
            CDUGrid.EditItemIndex = -1;
            DeleteCattleDrugsUsage(UsageID);

        }

        protected void DOCGrid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int documentID = (int)DOCGrid.DataKeys[(int)e.Item.ItemIndex];
            DeleteCattleDocument(documentID);
      //      DOCGrid.EditItemIndex = -1;
            //Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void LTCGrid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int ID = (int)LTCGrid.DataKeys[(int)e.Item.ItemIndex];
            LTCGrid.EditItemIndex = -1;
            DeleteCattleLabTests(ID);
        }

        protected void CTMTGrid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int ID = (int)CTMTGrid.DataKeys[(int)e.Item.ItemIndex];
            CTMTGrid.EditItemIndex = -1;
            DeleteCattleTreatments(ID);

        }
        protected void CVGrid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int ID = (int)CVGrid.DataKeys[(int)e.Item.ItemIndex];
            CVGrid.EditItemIndex = -1;
            DeleteCattleVaccinations(ID);

        }

        private void DeleteCattleLabTests(Int32 ID)
        {
            try
            {
                String result = DatabaseManager.Data.DBAccessManager.DeleteCattleLabTests(Int32.Parse(keyField.Text.ToString()), ID);
                this.Tab3_AlertDiv.Visible = true;
                if (result == "")
                {
                    this.Tab3_AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                    this.Tab3_message.Text = "Successfully Deleted";
                }
                else
                {
                    this.Tab3_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                    this.Tab3_message.Text = result;
                }

            }
            catch (Exception exception)
            {
                this.Tab3_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                this.Tab3_message.Text = ErrorLogging.LogError(exception, "Error Occured:Could not delete it. Please check the data");
            }
            ResetCattleLabTests();
            LoadCattleLabTests();
        }

        private void DeleteCattleTreatments(Int32 ID)
        {
            try
            {
                String result = DatabaseManager.Data.DBAccessManager.DeleteCattleTreatments(Int32.Parse(keyField.Text.ToString()), ID);
                this.Tab5_AlertDiv.Visible = true;
                if (result == "")
                {
                    this.Tab5_AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                    this.Tab5_message.Text = "Successfully Deleted";
                }
                else
                {
                    this.Tab5_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                    this.Tab5_message.Text = result;
                }

            }
            catch (Exception exception)
            {
                this.Tab5_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                this.Tab5_message.Text = ErrorLogging.LogError(exception, "Error Occured:Could not delete it. Please check the data");
            }
            ResetCattleTreatments();
            LoadCattleTreatments();
        }

        private void DeleteCattleVaccinations(Int32 ID)
        {
            try
            {
                String result = DatabaseManager.Data.DBAccessManager.DeleteCattleVaccinations(Int32.Parse(keyField.Text.ToString()), ID);
                this.Tab4_AlertDiv.Visible = true;
                if (result == "")
                {
                    this.Tab4_AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                    this.Tab4_message.Text = "Successfully Deleted";
                }
                else
                {
                    this.Tab4_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                    this.Tab4_message.Text = result;
                }

            }
            catch (Exception exception)
            {
                this.Tab4_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                this.Tab4_message.Text = ErrorLogging.LogError(exception, "Error Occured:Could not delete it. Please check the data");
            }
            ResetCattleVaccinations();
            LoadCattleVaccinations();
        }

        private void DeleteCattleDocument(Int32 DocumentID)
        {
            String document = DatabaseManager.Data.DBAccessManager.DeleteCattleDocument(Int32.Parse(keyField.Text.ToString()), DocumentID);
            this.Tab8_AlertDiv.Visible = true;
            if (document != "")
            {
                try
                {
                    this.Tab8_message.Text = "Successfully Deleted";
                    this.Tab8_AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                    System.IO.File.Delete(document);
                }
                catch (Exception exception)
                {
                    this.Tab8_message.Text = ErrorLogging.LogError(exception, "Error Occured:Could not delete the file.");
                    this.Tab8_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                }
            }

            else
            {
                this.Tab8_message.Text = "Unknown Exception Occured. Please contact support.";
                this.Tab8_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
            }
      //      DOCGrid.CurrentPageIndex = 0;
            ResetCattleDocuments();
            LoadCattleDocs();

        }


        private void DeleteCattleDrugsUsage(Int32 UsageID)
        {
            try
            {
                String result = DatabaseManager.Data.DBAccessManager.DeleteCattleDrugsUsage(Int32.Parse(Tab5_KeyField.Text.ToString()), UsageID, EmpId);
                this.Tab5S_AlertDiv.Visible = true;
                if (result == "")
                {
                    this.Tab5S_AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                    this.Tab5S_message.Text = "Successfully Deleted";
                }

            }
            catch (Exception exception)
            {
                this.Tab5S_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                this.Tab5S_message.Text = ErrorLogging.LogError(exception, "Error Occured:Could not delete the contact. Please check the data");
            }
            LoadCattleDrugsUsage();
            ResetCattleDrugsUsage();
        }

        private void LoadRaceResultsByCattleID()
        {
            Tab6_AlertDiv.Visible = false;
            try
            {
                DataSet _DataList = null;
                _DataList = DatabaseManager.Data.DBAccessManager.RetrieveRaceResultsByCattleID(Int32.Parse(this.keyField.Text.ToString()));

                if (_DataList.Tables[0].Rows.Count > 0)
                {
                    this.SHGrid.DataSource = _DataList;
                    this.SHGrid.DataBind();
                    Tab6_AlertDiv.Attributes["class"] = "alert alert-success alert-dismissible fade in";
                    Tab6_message.Text = "";
                }
                else
                {
                    this.SHGrid.DataSource = null;
                    this.SHGrid.DataBind();
                    Tab6_AlertDiv.Visible = true;
                    Tab6_AlertDiv.Attributes["class"] = "alert alert-danger alert-dismissible fade in";
                    Tab6_message.Text = "There are no matching records found.";
                }

            }
            catch (Exception exception)
            {
                //SHGrid.CurrentPageIndex = 0;
                SHGrid.DataBind();
            }


        }

    }
}