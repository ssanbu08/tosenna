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
using skmControls2.GoogleChart;
using System.Collections.Generic;
using InfoSoftGlobal;
using System.Web.Services; 

namespace SchoolNet
{
    public partial class Dashboard : SchoolNetBase
    {
        public int EmpId;
        
        string[] color = new string[12];
        
        protected void Page_Load(object sender, EventArgs e)
        {
            EmpId = Int32.Parse(Page.User.Identity.Name.ToString());
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

        }
        #endregion

        public List<AlertBoardInputs> recentTreatments = new List<AlertBoardInputs>();
        public List<AlertBoardInputs> recentLabTests = new List<AlertBoardInputs>();
        public List<AlertBoardInputs> upcomingTreatments = new List<AlertBoardInputs>();
        public List<ProgressBarInputs> leastStockDrugs = new List<ProgressBarInputs>();
        public List<TopProfiles> topTrainers = new List<TopProfiles>();
        public List<AlertBoardInputs> nextRaces = new List<AlertBoardInputs>();
        public List<TopProfiles> topRacers = new List<TopProfiles>();

        #region Load LoadDataList
        private void LoadDataList()
        {
            try
            {
                DataSet _DataList = null;
                _DataList = DatabaseManager.Data.DBAccessManager.RetrieveDashboardData();
                
                if (_DataList.Tables.Count > 0)
                {
                    if (_DataList.Tables[0].Rows.Count > 0) 
                    {
                        DataRow _employeeDataRow = _DataList.Tables[0].Rows[0];
                        lblCattles.Text = _employeeDataRow["AvailableCattles"].ToString();
                        lblMaleCattles.Text = _employeeDataRow["MaleCattles"].ToString();
                        lblFemaleCattles.Text = _employeeDataRow["FemaleCattles"].ToString();
                    }
                    else
                    {
                        lblCattles.Text = "0";
                        lblMaleCattles.Text = "0";
                        lblFemaleCattles.Text = "0";
                    }
                    if (_DataList.Tables[1].Rows.Count > 0) 
                    {
                        DataRow _employeeDataRow = _DataList.Tables[1].Rows[0];
                        lblEmployees.Text = _employeeDataRow["ActiveEmployees"].ToString();
                        lblVeterinarians.Text = _employeeDataRow["TotalVets"].ToString();
                        lblTrainers.Text = _employeeDataRow["TotalTrainers"].ToString();
                    }
                    else
                    {
                        lblEmployees.Text = "0";
                        lblVeterinarians.Text = "0";
                        lblTrainers.Text = "0";
                    }
                    if (_DataList.Tables[2].Rows.Count > 0)
                    {
                        DataRow _employeeDataRow = _DataList.Tables[2].Rows[0];
                        lblDrugItems.Text = _employeeDataRow["DrugItemsCount"].ToString();
                    }
                    else
                    {
                        lblDrugItems.Text = "0";
                    }
                    if (_DataList.Tables[3].Rows.Count > 0)
                    {
                        DataRow _employeeDataRow = _DataList.Tables[3].Rows[0];
                        lblLocations.Text = _employeeDataRow["LocationCount"].ToString();
                    }
                    else
                    {
                        lblLocations.Text = "0";
                    }
                    if (_DataList.Tables[7].Rows.Count > 0)
                    {
                        foreach (DataRow row in _DataList.Tables[7].Rows)
                        {
                            var recentTreatment = new AlertBoardInputs();
                            recentTreatment.monthVal = row["MonthLabel"].ToString();
                            recentTreatment.dayVal = Int32.Parse(row["DayLabel"].ToString());
                            recentTreatment.title = row["Title"].ToString();
                            recentTreatment.description = row["Description"].ToString();
                            recentTreatments.Add(recentTreatment);
                        }
                    }
                    if (_DataList.Tables[8].Rows.Count > 0)
                    {
                        foreach (DataRow row in _DataList.Tables[8].Rows)
                        {
                            var recentLabTest = new AlertBoardInputs();
                            recentLabTest.monthVal = row["MonthLabel"].ToString();
                            recentLabTest.dayVal = Int32.Parse(row["DayLabel"].ToString());
                            recentLabTest.title = row["Title"].ToString();
                            recentLabTest.description = row["Description"].ToString();
                            recentLabTests.Add(recentLabTest);
                        }
                    }
                    if (_DataList.Tables[9].Rows.Count > 0)
                    {
                        foreach (DataRow row in _DataList.Tables[9].Rows)
                        {
                            var upcomingTreatment = new AlertBoardInputs();
                            upcomingTreatment.monthVal = row["MonthLabel"].ToString();
                            upcomingTreatment.dayVal = Int32.Parse(row["DayLabel"].ToString());
                            upcomingTreatment.title = row["Title"].ToString();
                            upcomingTreatment.description = row["Description"].ToString();
                            upcomingTreatments.Add(upcomingTreatment);
                        }
                    }
                    if (_DataList.Tables[10].Rows.Count > 0)
                    {
                        foreach (DataRow row in _DataList.Tables[10].Rows)
                        {
                            var leastStockDrug = new ProgressBarInputs();
                            leastStockDrug.item = row["ItemName"].ToString();
                            leastStockDrug.itemType = row["DrugTypeName"].ToString();
                            leastStockDrug.mainvalue = int.Parse(row["CurrentStock"].ToString());
                            leastStockDrug.valuePercent = float.Parse(row["Availability"].ToString());
                            leastStockDrug.valuedemo = float.Parse(row["AvailabilityDemo"].ToString());
                            leastStockDrugs.Add(leastStockDrug);
                        }
                    }
                    if (_DataList.Tables[12].Rows.Count > 0)
                    {
                        foreach (DataRow row in _DataList.Tables[12].Rows)
                        {
                            var nextRace = new AlertBoardInputs();
                            nextRace.monthVal = row["MonthLabel"].ToString();
                            nextRace.dayVal = Int32.Parse(row["DayLabel"].ToString());
                            nextRace.title = row["Title"].ToString();
                            nextRace.description = row["Description"].ToString();
                            nextRaces.Add(nextRace);
                        }
                    }
                    if (_DataList.Tables[13].Rows.Count > 0)
                    {
                        foreach (DataRow row in _DataList.Tables[13].Rows)
                        {
                            var trainer = new TopProfiles();
                            trainer.ID = Int32.Parse(row["TrainerID"].ToString());
                            trainer.Name = row["TrainerName"].ToString();
                            trainer.prizeMoney = row["CurrencyPrize"].ToString();
                            trainer.wins = row["Wins"].ToString();
                            trainer.runs = Int32.Parse(row["Runs"].ToString());
                            topTrainers.Add(trainer);
                        }
                    }
                    if (_DataList.Tables[14].Rows.Count > 0)
                    {
                        foreach (DataRow row in _DataList.Tables[14].Rows)
                        {
                            var racer = new TopProfiles();
                            racer.ID = Int32.Parse(row["AnimalID"].ToString());
                            racer.Name = row["AnimalName"].ToString();
                            racer.prizeMoney = row["CurrencyPrize"].ToString();
                            racer.wins = row["Wins"].ToString();
                            racer.runs = Int32.Parse(row["Runs"].ToString());
                            topRacers.Add(racer);
                        }
                    }

                }
            }
            catch (Exception exception)
            {
                ErrorLogging.LogError(exception, "Unknown Exception Occured. Please contact support.");
                
            }

        }
        #endregion


        [WebMethod]
        public static List<PieChartInputs> GetChartAnimalGroup()
        {
            List<PieChartInputs> pieCharthartInputs = new List<PieChartInputs>();
            DataSet _DataList = null;
            _DataList = DatabaseManager.Data.DBAccessManager.RetrieveDashboardData();
            if (_DataList.Tables.Count > 0)
            {
                if (_DataList.Tables[4].Rows.Count > 0)
                {
                    foreach (DataRow row in _DataList.Tables[4].Rows)
                    {
                        var pieCharthartInput = new PieChartInputs();
                        pieCharthartInput.label = row["AnimalGroupName"].ToString();
                        pieCharthartInput.value = Int32.Parse(row["AnimalGroupCount"].ToString());
                        pieCharthartInputs.Add(pieCharthartInput);
                    } 
                }
            }
            return pieCharthartInputs; 
        }

        [WebMethod]
        public static List<PieChartInputs> GetChartBreedType()
        {
            List<PieChartInputs> pieCharthartInputs = new List<PieChartInputs>();
            DataSet _DataList = null;
            _DataList = DatabaseManager.Data.DBAccessManager.RetrieveDashboardData();
            if (_DataList.Tables.Count > 0)
            {
                if (_DataList.Tables[5].Rows.Count > 0)
                {
                    foreach (DataRow row in _DataList.Tables[5].Rows)
                    {
                        var pieCharthartInput = new PieChartInputs();
                        pieCharthartInput.label = row["TypeName"].ToString();
                        pieCharthartInput.value = Int32.Parse(row["TypeCount"].ToString());
                        pieCharthartInputs.Add(pieCharthartInput);
                    }
                }
            }
            return pieCharthartInputs;
        }

        [WebMethod]
        public static List<PieChartInputs> GetChartEmpJobCatagory()
        {
            List<PieChartInputs> pieCharthartInputs = new List<PieChartInputs>();
            DataSet _DataList = null;
            _DataList = DatabaseManager.Data.DBAccessManager.RetrieveDashboardData();
            if (_DataList.Tables.Count > 0)
            {
                if (_DataList.Tables[6].Rows.Count > 0)
                {
                    foreach (DataRow row in _DataList.Tables[6].Rows)
                    {
                        var pieCharthartInput = new PieChartInputs();
                        pieCharthartInput.label = row["TypeName"].ToString();
                        pieCharthartInput.value = Int32.Parse(row["TypeCount"].ToString());
                        pieCharthartInputs.Add(pieCharthartInput);
                    }
                }
            }
            return pieCharthartInputs;
        }

        [WebMethod]
        public static List<PieChartInputs> GetMonthlyDrugPurchase()
        {
            List<PieChartInputs> pieCharthartInputs = new List<PieChartInputs>();
            DataSet _DataList = null;
            _DataList = DatabaseManager.Data.DBAccessManager.RetrieveDashboardBarchartData();
            if (_DataList.Tables.Count > 0)
            {
                if (_DataList.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in _DataList.Tables[0].Rows)
                    {
                        var pieCharthartInput = new PieChartInputs();
                        pieCharthartInput.label = row["Label"].ToString();
                        pieCharthartInput.value = Int32.Parse(row["Procurement"].ToString());
                        pieCharthartInputs.Add(pieCharthartInput);
                    }
                }
            }
            return pieCharthartInputs;
        }

        [WebMethod]
        public static List<PieChartInputs> GetChartDailyDrugsConsumed()
        {
            List<PieChartInputs> pieCharthartInputs = new List<PieChartInputs>();
            DataSet _DataList = null;
            _DataList = DatabaseManager.Data.DBAccessManager.RetrieveChartDailyDrugsConsumed();
            if (_DataList.Tables.Count > 0)
            {
                if (_DataList.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in _DataList.Tables[0].Rows)
                    {
                        var pieCharthartInput = new PieChartInputs();
                        pieCharthartInput.label = row["DateLabel"].ToString();
                        pieCharthartInput.value = Int32.Parse(row["DrugsConsumed"].ToString());
                        pieCharthartInputs.Add(pieCharthartInput);
                    }
                }
            }
            return pieCharthartInputs;
        }

        [WebMethod]
        public static List<PieChartInputs> GetChartCattleTreatmentTypes()
        {
            List<PieChartInputs> pieCharthartInputs = new List<PieChartInputs>();
            DataSet _DataList = null;
            _DataList = DatabaseManager.Data.DBAccessManager.RetrieveDashboardData();
            if (_DataList.Tables.Count > 0)
            {
                if (_DataList.Tables[11].Rows.Count > 0)
                {
                    foreach (DataRow row in _DataList.Tables[11].Rows)
                    {
                        var pieCharthartInput = new PieChartInputs();
                        pieCharthartInput.label = row["TypeName"].ToString();
                        pieCharthartInput.value = Int32.Parse(row["TypeCount"].ToString());
                        pieCharthartInputs.Add(pieCharthartInput);
                    }
                }
            }
            return pieCharthartInputs;
        }


        public class PieChartInputs
        {
            public string label { get; set; }
            public int value { get; set; }
        }
        public class AlertBoardInputs
        {
            public string monthVal { get; set; }
            public int dayVal { get; set; }
            public string title { get; set; }
            public string description { get; set; }

        }

        public class ProgressBarInputs
        {
            public string item { get; set; }
            public string itemType { get; set; }
            public int mainvalue { get; set; } 
            public float valuedemo { get; set; }
            public float valuePercent { get; set; }

        }

        public class TopProfiles
        {
            public int ID { get; set; }
            public string Name { get; set; }
            public int runs { get; set; }
            public string wins { get; set; }
            public string prizeMoney { get; set; }

        }


    }
}