<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="SchoolNet.Dashboard" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
<%@ Register Assembly="skmControls2" Namespace="skmControls2.GoogleChart" TagPrefix="cc1" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table> 
 <asp:PlaceHolder id=DashBoardArea1 Runat="server" visible="true">
 
 <tr width="100%">
    <td colspan="3">
        <div class="row top_tiles">
            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                    <div class="icon"><i class="fa fa-paw"></i>
                    </div>
                    <div class="count"><asp:label id="lblCattles" runat="server"></asp:label></div>

                    <h3>Cattles</h3>
                    <p>Total Number of Available Cattles.</p>
                </div>
            </div>
            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                    <div class="icon"><i class="fa fa-user"></i>
                    </div>
                    <div class="count"><asp:label id="lblEmployees" runat="server"></asp:label></div>

                    <h3>Employees</h3>
                    <p>Total Number of Active Employees.</p>
                </div>
            </div>
            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                    <div class="icon"><i class="fa fa-user-md"></i>
                    </div>
                    <div class="count"><asp:label id="lblVeterinarians" runat="server"></asp:label></div>

                    <h3>Veterinarians</h3>
                    <p>Total Number of Veterinarians.</p>
                </div>
            </div>
            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                    <div class="icon"><i class="fa fa-medkit"></i>
                    </div>
                    <div class="count"><asp:label id="lblDrugItems" runat="server"></asp:label></div>

                    <h3>Drug Items</h3>
                    <p>Number of Pharmacy Drug Items.</p>
                </div>
            </div>
        </div>

   </td>
 </tr> 

<tr width="100%">
    <td colspan="3">
        <div class="row top_tiles">
            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                    <div class="icon"><i class="fa fa-male"></i>
                    </div>
                    <div class="count"><asp:label id="lblMaleCattles" runat="server"></asp:label></div>

                    <h3>Male Cattles</h3>
                    <p>Total Number of Available Male Cattles.</p>
                </div>
            </div>
            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                    <div class="icon"><i class="fa fa-female"></i>
                    </div>
                    <div class="count"><asp:label id="lblFemaleCattles" runat="server"></asp:label></div>

                    <h3>Female Cattles</h3>
                    <p>Total Number of Female Cattles.</p>
                </div>
            </div>
            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                    <div class="icon"><i class="fa fa-anchor"></i>
                    </div>
                    <div class="count"><asp:label id="lblTrainers" runat="server"></asp:label></div>

                    <h3>Trainers</h3>
                    <p>Total Number of Trainers.</p>
                </div>
            </div>
            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                    <div class="icon"><i class="fa fa-map-marker"></i>
                    </div>
                    <div class="count"><asp:label id="lblLocations" runat="server"></asp:label></div>

                    <h3>Locations</h3>
                    <p>Cattle Locations Count</p>
                </div>
            </div>
        </div>

   </td>
 </tr> 
 

<tr>
    <td colspan="3">
        <div class="row">

                <!-- bar chart -->
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Monthly Drugs Procurement<small>Last 6 months</small></h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div id="graph_bar1" style="width:100%; height:280px;"></div>
                        </div>
                    </div>
                </div>
                <!-- /bar charts -->

                <!-- bar charts  -->
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Daily Drugs Consumption <small>Last 7 Days</small></h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content1">
                            <div id="graph_bar2" style="width:100%; height:280px;"></div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <!-- /bar charts  -->

    </td>
</tr>
 
 
 <tr><td colspan="3">

                    <div class="row">

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Cattle Groups<small>Breakup</small></h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <canvas id="canvas_doughnut1"></canvas>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Cattle Breeds<small>Breakup</small></h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <canvas id="canvas_doughnut3"></canvas>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Employee Job Catagory<small>Breakup</small></h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <canvas id="canvas_doughnut2"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
    </td>
</tr> 
     <tr>
    <td colspan="3">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Drugs in Low Stock</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="col-xs-12 bg-white progress_summary">
                        <% foreach (var leastStockDrug in leastStockDrugs)
                        { %> <!-- loop through the list -->
                            <div class="row">
                                <div class="progress_title">
                                    <span class="left"><%= leastStockDrug.item %></span>
                                    <span class="right"><%= leastStockDrug.itemType %></span>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="col-xs-2">
                                    <span><%= leastStockDrug.mainvalue %></span>
                                </div>
                                <div class="col-xs-8">
                                    <div class="progress  progress_sm">
                                        <div class="progress-bar bg-green" role="progressbar" data-transitiongoal='<%= leastStockDrug.valuedemo %>'></div>
                                    </div>
                                </div>
                                <div class="col-xs-2 more_info">
                                    <span><%= leastStockDrug.valuePercent %>%</span>
                                </div>
                            </div>
                            <% } %>
                            
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Cattle Treatments<small>Treatment Type Breakup</small></h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content2">
                        <div id="pie_TreatmentType" style="width:100%; height:300px;"></div>
                    </div>
                </div>
            </div>

        </div>
    </td>
</tr>

<tr>
    <td>
        
                    <div class="row">
					
                        <div class="col-md-3">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Top 3 Trainers</h2>
                                    <div class="clearfix"></div>
                                </div>
                                
								<ul class="list-unstyled top_profiles scroll-view">
                                     <% foreach (var trainer in topTrainers)
                                       { %> <!-- loop through the list -->
                                                <li class="media event">
                                                    <a class="pull-left border-blue profile_thumb">
                                                        <i class="fa fa-user blue"></i>
                                                    </a>
                                                    <div class="media-body">
                                                        <a class="title" href="javascript:void(0);"><%= trainer.Name %></a>
                                                        <p><strong><%= trainer.prizeMoney %></strong></p>
                                                        <p><%= trainer.wins %></p>
                                                        <p> <small>Total Runs - <%= trainer.runs %></small></p>
                                                    </div>
                                                </li>
                                    <% } %>
                                            </ul>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Upcoming Races<small>Next 5 events</small></h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <% foreach (var race in nextRaces)
                                       { %> <!-- loop through the list -->
                                      <article class="media event">
                                        <a class="pull-left date">
                                            <p class="month"><%= race.monthVal %></p>
                                            <p class="day"><%= race.dayVal %></p>
                                        </a>
                                        <div class="media-body">
                                            <a class="title" href="javascript:void(0);"><%= race.title %></a>
                                            <p><%= race.description %></p>
                                        </div>
                                    </article>
                                    <% } %>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Top 3 Racers</h2>
                                    <div class="clearfix"></div>
                                </div>
                                
								<ul class="list-unstyled top_profiles scroll-view">
                                     <% foreach (var racer in topRacers)
                                       { %> <!-- loop through the list -->
                                                <li class="media event">
                                                    <a class="pull-left border-red profile_thumb">
                                                        <i class="fa fa-paw red"></i>
                                                    </a>
                                                    <div class="media-body">
                                                        <a class="title" href="javascript:void(0);"><%= racer.Name %></a>
                                                        <p><strong><%= racer.prizeMoney %></strong></p>
                                                        <p><%= racer.wins %></p>
                                                        <p> <small>Total Runs - <%= racer.runs %></small></p>
                                                    </div>
                                                </li>
                                    <% } %>
                                            </ul>
                            </div>
                        </div>

                    </div>

    </td> 
</tr>
<tr>
    <td>
        
                    <div class="row">
					
                        <div class="col-md-4">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Recent Treatments<small>Latest 5 Presriptions</small></h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <% foreach (var recentTreatment in recentTreatments)
                                       { %> <!-- loop through the list -->
                                      <article class="media event">
                                        <a class="pull-left date">
                                            <p class="month"><%= recentTreatment.monthVal %></p>
                                            <p class="day"><%= recentTreatment.dayVal %></p>
                                        </a>
                                        <div class="media-body">
                                            <a class="title" href="javascript:void(0);"><%= recentTreatment.title %></a>
                                            <p><%= recentTreatment.description %></p>
                                        </div>
                                    </article>
                                    <% } %>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Recent Lab Tests<small>Last 5 Lab Tests</small></h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <% foreach (var recentLabTest in recentLabTests)
                                       { %> <!-- loop through the list -->
                                      <article class="media event">
                                        <a class="pull-left date">
                                            <p class="month"><%= recentLabTest.monthVal %></p>
                                            <p class="day"><%= recentLabTest.dayVal %></p>
                                        </a>
                                        <div class="media-body">
                                            <a class="title" href="javascript:void(0);"><%= recentLabTest.title %></a>
                                            <p><%= recentLabTest.description %></p>
                                        </div>
                                    </article>
                                    <% } %>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Treatment Follow-ups<small>next 5 alerts</small></h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <% foreach (var upcomingTreatment in upcomingTreatments)
                                       { %> <!-- loop through the list -->
                                      <article class="media event">
                                        <a class="pull-left date">
                                            <p class="month"><%= upcomingTreatment.monthVal %></p>
                                            <p class="day"><%= upcomingTreatment.dayVal %></p>
                                        </a>
                                        <div class="media-body">
                                            <a class="title" href="javascript:void(0);"><%= upcomingTreatment.title %></a>
                                            <p><%= upcomingTreatment.description %></p>
                                        </div>
                                    </article>
                                    <% } %>
                                </div>
                            </div>
                        </div>


                    </div>

    </td> 
</tr>
 <tr><td colspan="3">&nbsp;</td></tr> 

</ASP:PlaceHolder>

    <script>
        $(document).ready(function () {
            LoadChartAnimalGroup();
            LoadChartBreedType();
            LoadChartEmpJobCatagory();
            LoadChartMonthlyDrugPurchase();
            LoadChartDailyDrugsConsumed();
            LoadChartCattleTreatmentTypes();
        });
        function LoadChartAnimalGroup() {
            var colorsAdmin = ['#455C73', '#9B59B6', '#BDC3C7', '#26B99A', '#3498DB', '#008d4d'];
            var highlightsAdmin = ['#34495E', '#B370CF', '#CFD4D8', '#36CAAB', '#49A9EA', '#159f7f'];
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/GetChartAnimalGroup",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async : false,
                success: function (response) {
                    var aData = response.d;
                    var arr = [];
                    $.each(aData, function (inx, val) {
                        var obj = {};
                        var cc = '#' + Math.floor(Math.random() * 16777215).toString(16);
                        obj.color = (inx >= colorsAdmin.length)?cc:colorsAdmin[inx];
                        obj.value = val.value;
                        obj.label = val.label;
                        obj.highlight = (inx >= highlightsAdmin.length) ? cc : highlightsAdmin[inx];;
                        arr.push(obj);
                    });
                    window.myDoughnut = new Chart(document.getElementById("canvas_doughnut1").getContext("2d")).Doughnut(arr, {
                        responsive: true,
                        tooltipFillColor: "rgba(51, 51, 51, 0.55)"
                    }); 
                },
            });
        }
        function LoadChartBreedType() {
            var colorsAdmin = ['#3498DB', '#008d4d','#455C73', '#9B59B6', '#BDC3C7', '#26B99A'];
            var highlightsAdmin = ['#49A9EA', '#159f7f', '#34495E', '#B370CF', '#CFD4D8', '#36CAAB'];
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/GetChartBreedType",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    var aData = response.d;
                    var arr = [];
                    $.each(aData, function (inx, val) {
                        var obj = {};
                        var cc = '#' + Math.floor(Math.random() * 16777215).toString(16);
                        obj.color = (inx >= colorsAdmin.length) ? cc : colorsAdmin[inx];
                        obj.value = val.value;
                        obj.label = val.label;
                        obj.highlight = (inx >= highlightsAdmin.length) ? cc : highlightsAdmin[inx];
                        arr.push(obj);
                    });
                    window.myDoughnut = new Chart(document.getElementById("canvas_doughnut3").getContext("2d")).PolarArea(arr, {
                        responsive: true,
                        tooltipFillColor: "rgba(51, 51, 51, 0.55)"
                    });
                },
            });
        }
        function LoadChartEmpJobCatagory() {
            var colorsAdmin = ['#BDC3C7', '#26B99A', '#455C73', '#9B59B6', '#3498DB', '#008d4d'];
            var highlightsAdmin = ['#CFD4D8', '#36CAAB', '#34495E', '#B370CF', '#49A9EA', '#159f7f'];
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/GetChartEmpJobCatagory",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    var aData = response.d;
                    var arr = [];
                    $.each(aData, function (inx, val) {
                        var obj = {};
                        var cc = '#' + Math.floor(Math.random() * 16777215).toString(16);
                        obj.color = (inx >= colorsAdmin.length) ? cc : colorsAdmin[inx];;
                        obj.value = val.value;
                        obj.label = val.label;
                        obj.highlight = (inx >= highlightsAdmin.length) ? cc : highlightsAdmin[inx];;
                        arr.push(obj);
                    });
                    window.myDoughnut = new Chart(document.getElementById("canvas_doughnut2").getContext("2d")).Pie(arr, {
                        responsive: true,
                        tooltipFillColor: "rgba(51, 51, 51, 0.55)"
                    });
                },
            });
        }
        function LoadChartMonthlyDrugPurchase() {
            var colorsAdmin = ['#9B59B6', '#26B99A', '#34495E', '#ACADAC', '#3498DB'];
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/GetMonthlyDrugPurchase",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    var aData = response.d;
                    var arr = [];
                    $.each(aData, function (inx, val) {
                        var obj = {};
                        obj.value = val.value;
                        obj.label = val.label;
                        arr.push(obj);
                    });
                    Morris.Bar({
                        element: 'graph_bar1',
                        data: arr,
                        xkey: 'label',
                        ykeys: ['value'],
                        labels: ['Purchase(AED)'],
                        barRatio: 0.4,
                        barColors: colorsAdmin,
                        xLabelAngle: 35,
                        hideHover: 'auto'
                    });
                },
            });
            
        }

        function LoadChartDailyDrugsConsumed() {
            var colorsAdmin = ['#34495E', '#26B99A', '#ACADAC', '#3498DB'];
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/GetChartDailyDrugsConsumed",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    alert(response.d);
                    var aData = response.d;
                    var arr = [];
                    $.each(aData, function (inx, val) {
                        var obj = {};
                        obj.value = val.value;
                        obj.label = val.label;
                        arr.push(obj);
                    });
                    Morris.Bar({
                        element: 'graph_bar2',
                        data: arr,
                        xkey: 'label',
                        ykeys: ['value'],
                        labels: ['Quantity'],
                        barRatio: 0.4,
                        barColors: colorsAdmin,
                        xLabelAngle: 35,
                        hideHover: 'auto'
                    });
                },
            });

        }
        function LoadChartCattleTreatmentTypes() {
            var colorsAdmin = ['#26B99A', '#34495E', '#f0ad4e','#ACADAC', '#d9534f', '#3498DB', '#008d4d', '#9B59B6', ];
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/GetChartCattleTreatmentTypes",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    var aData = response.d;
                    var arr = [];
                    $.each(aData, function (inx, val) {
                        var obj = {};
                        obj.value = val.value;
                        obj.label = val.label;
                        arr.push(obj);
                    });
                    Morris.Donut({
                        element: 'pie_TreatmentType',
                        data: arr,
                        colors: colorsAdmin
                    });
                },
            });
        }
    </script>

</table>
 </master:content>