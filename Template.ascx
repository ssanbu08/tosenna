<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
<%@ Control Language="c#" AutoEventWireup="true" Inherits="SchoolNet.Template" CodeFile="Template.ascx.cs" %>
<!DOCTYPE html> 
<HTML>
  <HEAD runat="server"> 
		<title>
			<master:contentplaceholder id="pageTitle" runat=server>FarmPro!</master:contentplaceholder>
		</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
  		<meta content="Microsoft FrontPage 5.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta name="description"  content="HRMS" />
      
        <link rel="stylesheet" href="~/CSS/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" media="all" href="~/fonts/css/font-awesome.min.css" />
	    <link rel="stylesheet" href="~/CSS/animate.min.css" type="text/css">
        <link rel="stylesheet" href="~/CSS/custom.css"  type="text/css"/>
        <link type="text/css" href="~/CSS/maps/jquery-jvectormap-2.0.1.css" rel="stylesheet" />
        <link type="text/css" href="~/CSS/icheck/flat/green.css" rel="stylesheet" />
        <link type="text/css" href="~/CSS/floatexamples.css" rel="stylesheet" />
	    <link rel="stylesheet" href="~/CSS/FarmPro.css"  type="text/css"/>
        <link type="text/css" href="~/CSS/jquery-ui.css" rel="stylesheet" />
        
	
      <link href="css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">

      <style type="text/css">.ui-datepicker { font-size: 11px; margin-left:10px}</style>
        
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/jquery.min.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/jquery-ui.min.js") %>' type="text/javascript"></script>  
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/nprogress.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/bootstrap.min.js")%>' type="text/javascript"></script>
  
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/gauge/gauge.min.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/gauge/gauge_demo.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/chartjs/chart.min.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/moris/raphael-min.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/moris/morris.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/progressbar/bootstrap-progressbar.min.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/nicescroll/jquery.nicescroll.min.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/icheck/icheck.min.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/moment.min.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/datepicker/daterangepicker.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/custom.js")%>' type="text/javascript"></script>
        
            <!-- flot js -->
    <!--[if lte IE 8]><script type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->

        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/flot/jquery.flot.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/flot/jquery.flot.pie.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/flot/jquery.flot.orderBars.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/flot/jquery.flot.time.min.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/flot/date.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/flot/jquery.flot.spline.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/flot/jquery.flot.stack.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/flot/curvedLines.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/flot/jquery.flot.resize.js")%>' type="text/javascript"></script>
        


        <!-- worldmap -->
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/maps/jquery-jvectormap-2.0.1.min.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/maps/gdp-data.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/maps/jquery-jvectormap-world-mill-en.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/maps/jquery-jvectormap-us-aea-en.js")%>' type="text/javascript"></script>

            <!-- skycons -->
            <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/skycons/skycons.js")%>' type="text/javascript"></script>

        <!-- Datatables -->
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/datatables/js/jquery.dataTables.js")%>' type="text/javascript"></script>
        <script language="javascript" src='<%= this.ResolveClientUrl("~/_scripts/datatables/tools/js/dataTables.tableTools.js")%>' type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('input.tableflat').iCheck({
                    checkboxClass: 'icheckbox_flat-green',
                    radioClass: 'iradio_flat-green'
                });
            });

            var asInitVals = new Array();
            $(document).ready(function () {
                AddTHEAD('Grid');
               // $('#Grid').css('width','100%');
              var oTable = $('#Grid').dataTable({
                    "oLanguage": {
                        "sSearch": "Search all columns:"
                    },
                    "aoColumnDefs": [
                        {
                            'bSortable': false,
                            'aTargets': [8]
                        } //disables sorting for column one
                    ],
                    'iDisplayLength': 10,
                    "sPaginationType": "full_numbers"
                 //   "dom": 'T<"clear">lfrtip'
              });

                $("tfoot input").keyup(function () {
                    /* Filter on the column based on the index of this element's parent <th> */
                    oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
                });
                $("tfoot input").each(function (i) {
                    asInitVals[i] = this.value;
                });
                $("tfoot input").focus(function () {
                    if (this.className == "search_init") {
                        this.className = "";
                        this.value = "";
                    }
                });
                $("tfoot input").blur(function (i) {
                    if (this.value == "") {
                        this.className = "search_init";
                        this.value = asInitVals[$("tfoot input").index(this)];
                    }
                });

                AddTHEAD('UsersGrid');
                var oTable = $('#UsersGrid').dataTable({
                    "oLanguage": {
                        "sSearch": "Search all columns:"
                    },
                    "aoColumnDefs": [
                        {
                            'bSortable': false,
                            'aTargets': [7]
                        } //disables sorting for column one
                    ],
                    'iDisplayLength': 10,
                    "sPaginationType": "full_numbers"
                    //   "dom": 'T<"clear">lfrtip'
                });

                AddTHEAD('EmpGrid');
                var eTable = $('#EmpGrid').dataTable({
                    "oLanguage": {
                        "sSearch": "Search all columns:"
                    },
                    "aoColumnDefs": [
                        {
                            'bSortable': false,
                            'aTargets': [6]
                        } //disables sorting for column one
                    ],
                    'iDisplayLength': 10,
                    "sPaginationType": "full_numbers"
                    //   "dom": 'T<"clear">lfrtip'
                });
                AddTHEAD('LTCGrid');
                var eTable = $('#LTCGrid').dataTable({
                    "oLanguage": {
                        "sSearch": "Search all columns:"
                    },
                    "aoColumnDefs": [
                        {
                            'bSortable': false,
                            'aTargets': []
                        } //disables sorting for column one
                    ],
                    'iDisplayLength': 10,
                    "sPaginationType": "full_numbers"
                    //   "dom": 'T<"clear">lfrtip'
                });

                AddTHEAD('CVGrid');
                var eTable = $('#CVGrid').dataTable({
                    "oLanguage": {
                        "sSearch": "Search all columns:"
                    },
                    "aoColumnDefs": [
                        {
                            'bSortable': false,
                            'aTargets': [4]
                        } //disables sorting for column one
                    ],
                    'iDisplayLength': 10,
                    "sPaginationType": "full_numbers"
                    //   "dom": 'T<"clear">lfrtip'
                });


                AddTHEAD('VaccineGrid');
                var eTable = $('#VaccineGrid').dataTable({
                    "oLanguage": {
                        "sSearch": "Search all columns:"
                    },
                    "aoColumnDefs": [
                        {
                            'bSortable': false,
                            'aTargets': [7]
                        } //disables sorting for column one
                    ],
                    'iDisplayLength': 10,
                    "sPaginationType": "full_numbers"
                    //   "dom": 'T<"clear">lfrtip'
                });
                AddTHEAD('PSGrid');
                AddTHEAD('SHGrid'); 
                AddTHEAD('CTMTGrid');
                AddTHEAD('CDUGrid');
                AddTHEAD('DOCGrid');
                AddTHEAD('REGrid');
                AddTHEAD('RSGrid');
                AddTHEAD('RRGrid');
                AddTHEAD('SCGrid');
                AddTHEAD('STGrid');
                AddTHEAD('RHCGrid');
                AddTHEAD('RHTGrid');
                var eTable = $('.DTGrid').dataTable({
                    "oLanguage": {
                        "sSearch": "Search all columns:"
                    },
                    "aoColumnDefs": [
                        {
                            'bSortable': false,
                            'aTargets': []
                        } //disables sorting for column one
                    ],
                    'iDisplayLength': 50,
                    "sPaginationType": "full_numbers"
                    //   "dom": 'T<"clear">lfrtip'
                });
            });

            function AddTHEAD(tableName) {
                var table = document.getElementById(tableName);
                if (table != null) {
                    var head = document.createElement("THEAD");
                    head.style.display = "table-header-group";
                    head.appendChild(table.rows[0]);
                    table.insertBefore(head, table.childNodes[0]);
                //    table.style.setProperty("width","");
                }
            }
        </script>



    
    <script>
        NProgress.done();
    </script>
    
		   
  <SCRIPT type="text/javascript">
      $(document).ready(function () {
          $('.select-date').daterangepicker({
              singleDatePicker: true,
              showDropdowns: true,
              //autoUpdateInput: false,
              format : 'DD/MM/YYYY',
              //calender_style: "picker_4"
          }, function (start, end, label) {
              console.log(start.toISOString(), end.toISOString(), label);
          });
          $(".old-select-date").datepicker({ dateFormat: "dd/mm/yy" });
          $(".old-select-date").datepicker();
    

    $('input[name="daterange"]').daterangepicker({
        timePicker: true,
        timePickerIncrement: 30,
        locale: {
            format: 'MM/DD/YYYY h:mm A'
        }
    });


          $('.select-datetimerange').daterangepicker({
            timePicker: true,
            timePickerIncrement: 15,
            calender_style: "picker_4",
            
            format: 'DD/MM/YYYY h:mm A'
          }, function (start, end, label) {
              console.log(start.toISOString(), end.toISOString(), label);
            /*  $('#RaceStartTime').val(start.format('DD/MM/YYYY h:mm A'));
              alert($('#RaceStartTime').val()); */
          });
            
          $('.select-datetime').daterangepicker({
              autoApply: true,
              singleDatePicker: true,
              timePicker: true,
              timePickerIncrement: 1,
              calender_style: "picker_4",
              format: 'DD/MM/YYYY HH:mm'
          }, function (start, end, label) {
              console.log(start.toISOString(), end.toISOString(), label);
          });

      });
</script>
  <Script language="javascript">
                
		        function bookmark()
		        {
			        window.external.AddFavorite("http://www.google.com/","google.Com")
        		
		        }
		        function Redirect()
		        {
			        window.document.location.href="http://www.google.com"
        		
		        }
        	  
      function Openpopup(popurl) 
      {
       winpops = window.open(popurl,"","width=800, height=600, left=45, top=15, scrollbars=yes, menubar=no,resizable=no,directories=no,location=no")
      }
  	  
        function basicPopup() 
        {
            popupWindow = window.open("PaySlipPreview.aspx", 'popUpWindow', 'height=300,width=600,left=100,top=30,resizable=No,scrollbars=No,toolbar=no,menubar=no,location=no,directories=no, status=No');
        }

  </SCRIPT>
    
 </HEAD>


<BODY class="nav-md">
        
  <div class="container body">

   <FORM id="form" method="post" runat="server" enctype="multipart/form-data"> 
   	
            <div class="main_container">

            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">

                    <div class="navbar nav_title" style="border: 0;">
                        <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>FarmPro!</span></a>
                    </div>
                    <div class="clearfix"></div>

                    
                    <br />

                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <asp:PlaceHolder ID="AdminMenu" runat="server" Visible=false>
                        <div class="menu_section">
                            <h3>Main Menus</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-home"></i>Home<span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a id="A73" href="~/admin/Dashboard.aspx" runat="server">Dashboard</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-list-alt"></i>Cattle Management<span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a id="A75" href="~/admin/ManageCattle.aspx" runat="server">Manage Cattles</a>
                                        </li>
                                        <li><a id="A76" href="~/admin/AddCattle.aspx" runat="server">Add New Cattle</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-stethoscope"></i>Medical Tests <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a id="A114" href="~/admin/LabTests.aspx" runat="server">Lab Tests</a>
                                        </li>
                                        <li><a id="A113" href="~/admin/Vaccine.aspx" runat="server">Vaccination</a>
                                        </li>
                                   <!--     <li><a id="A115" href="~/admin/EmpCategory.aspx" runat="server"> Prophylactic Treatment</a>
                                        </li>
                                        <li><a id="A112" href="~/admin/Division.aspx" runat="server">Treatment Records</a>
                                        </li>
                                        <li><a id="A116" href="~/admin/EmployeeStatus.aspx" runat="server">Lameness</a>
                                        </li>
                                        <li><a id="A117" href="~/admin/Education.aspx" runat="server">Routine Sampling</a>
                                        </li>   -->
                                    </ul>
                                </li>

                                <li><a><i class="fa fa-users"></i>Employee Management<span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="~/admin/ManageEmployee.aspx" runat="server">Manage Employees</a></li>	 
	                                    <li><a href="~/admin/AddEmployee.aspx" runat="server">Add Employee</a></li>
                                        <li><a href="~/admin/UserAccounts.aspx" runat="server">Manage User Accounts</a></li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-medkit"></i>Pharmacy Stocks <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a id="A6" href="~/admin/PharmacyMaster.aspx" runat="server">Pharmacy Drugs</a>
                                        </li>
                                        <li><a id="A2" href="~/admin/PharmacyPurchase.aspx" runat="server">Drugs Purchasing</a>
                                        </li>
                                        <li><a id="A3" href="~/admin/PharmacyStock.aspx" runat="server">Drug Stocks</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-road"></i>Race Tracker<span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a id="A98"  href="~/Admin/RaceEvents.aspx" runat="server">Race Events</a>
                                        </li>
                                        <li><a id="A5"  href="~/Admin/RaceSampling.aspx" runat="server">Race Sampling</a>
                                        </li>
                                        <li><a id="A1"  href="~/Admin/RaceResults.aspx" runat="server" visible=true>Race Results</a>
                                        </li>
                                        <li><a id="A4"  href="~/Admin/RaceStatistics.aspx" runat="server" visible=true>Race Statistics</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="menu_section">
                            <h3>Other Menus</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-bug"></i> Additional Options <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a id="A8" href="~/admin/ManageEmpResources.aspx" runat="server">Employee Resources</a>
                                        </li>
                                        <li><a id="A10" href="~/Common/Reports.aspx" runat="server">Reports Collection</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder ID="EmployeeMenu" runat="server" Visible=false>
                        <div class="menu_section">
                            <h3>General</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="index.html">Dashboard</a>
                                        </li>
                                        <li><a href="index2.html">Dashboard2</a>
                                        </li>
                                        <li><a href="index3.html">Dashboard3</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="form.html">General Form</a>
                                        </li>
                                        <li><a href="form_advanced.html">Advanced Components</a>
                                        </li>
                                        <li><a href="form_validation.html">Form Validation</a>
                                        </li>
                                        <li><a href="form_wizards.html">Form Wizard</a>
                                        </li>
                                        <li><a href="form_upload.html">Form Upload</a>
                                        </li>
                                        <li><a href="form_buttons.html">Form Buttons</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-desktop"></i> UI Elements <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="general_elements.html">General Elements</a>
                                        </li>
                                        <li><a href="media_gallery.html">Media Gallery</a>
                                        </li>
                                        <li><a href="typography.html">Typography</a>
                                        </li>
                                        <li><a href="icons.html">Icons</a>
                                        </li>
                                        <li><a href="glyphicons.html">Glyphicons</a>
                                        </li>
                                        <li><a href="widgets.html">Widgets</a>
                                        </li>
                                        <li><a href="invoice.html">Invoice</a>
                                        </li>
                                        <li><a href="inbox.html">Inbox</a>
                                        </li>
                                        <li><a href="calender.html">Calender</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="tables.html">Tables</a>
                                        </li>
                                        <li><a href="tables_dynamic.html">Table Dynamic</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="chartjs.html">Chart JS</a>
                                        </li>
                                        <li><a href="chartjs2.html">Chart JS2</a>
                                        </li>
                                        <li><a href="morisjs.html">Moris JS</a>
                                        </li>
                                        <li><a href="echarts.html">ECharts </a>
                                        </li>
                                        <li><a href="other_charts.html">Other Charts </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="menu_section">
                            <h3>Live On</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="e_commerce.html">E-commerce</a>
                                        </li>
                                        <li><a href="projects.html">Projects</a>
                                        </li>
                                        <li><a href="project_detail.html">Project Detail</a>
                                        </li>
                                        <li><a href="contacts.html">Contacts</a>
                                        </li>
                                        <li><a href="profile.html">Profile</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="page_404.html">404 Error</a>
                                        </li>
                                        <li><a href="page_500.html">500 Error</a>
                                        </li>
                                        <li><a href="plain_page.html">Plain Page</a>
                                        </li>
                                        <li><a href="login.html">Login Page</a>
                                        </li>
                                        <li><a href="pricing_tables.html">Pricing Tables</a>
                                        </li>

                                    </ul>
                                </li>
                                <li><a><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a>
                                </li>
                            </ul>
                        </div>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder ID="SupervisorMenu" runat="server" Visible=false>
                        <div class="menu_section">
                            <h3>General</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="index.html">Dashboard</a>
                                        </li>
                                        <li><a href="index2.html">Dashboard2</a>
                                        </li>
                                        <li><a href="index3.html">Dashboard3</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="form.html">General Form</a>
                                        </li>
                                        <li><a href="form_advanced.html">Advanced Components</a>
                                        </li>
                                        <li><a href="form_validation.html">Form Validation</a>
                                        </li>
                                        <li><a href="form_wizards.html">Form Wizard</a>
                                        </li>
                                        <li><a href="form_upload.html">Form Upload</a>
                                        </li>
                                        <li><a href="form_buttons.html">Form Buttons</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-desktop"></i> UI Elements <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="general_elements.html">General Elements</a>
                                        </li>
                                        <li><a href="media_gallery.html">Media Gallery</a>
                                        </li>
                                        <li><a href="typography.html">Typography</a>
                                        </li>
                                        <li><a href="icons.html">Icons</a>
                                        </li>
                                        <li><a href="glyphicons.html">Glyphicons</a>
                                        </li>
                                        <li><a href="widgets.html">Widgets</a>
                                        </li>
                                        <li><a href="invoice.html">Invoice</a>
                                        </li>
                                        <li><a href="inbox.html">Inbox</a>
                                        </li>
                                        <li><a href="calender.html">Calender</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="tables.html">Tables</a>
                                        </li>
                                        <li><a href="tables_dynamic.html">Table Dynamic</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="chartjs.html">Chart JS</a>
                                        </li>
                                        <li><a href="chartjs2.html">Chart JS2</a>
                                        </li>
                                        <li><a href="morisjs.html">Moris JS</a>
                                        </li>
                                        <li><a href="echarts.html">ECharts </a>
                                        </li>
                                        <li><a href="other_charts.html">Other Charts </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="menu_section">
                            <h3>Live On</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="e_commerce.html">E-commerce</a>
                                        </li>
                                        <li><a href="projects.html">Projects</a>
                                        </li>
                                        <li><a href="project_detail.html">Project Detail</a>
                                        </li>
                                        <li><a href="contacts.html">Contacts</a>
                                        </li>
                                        <li><a href="profile.html">Profile</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="page_404.html">404 Error</a>
                                        </li>
                                        <li><a href="page_500.html">500 Error</a>
                                        </li>
                                        <li><a href="plain_page.html">Plain Page</a>
                                        </li>
                                        <li><a href="login.html">Login Page</a>
                                        </li>
                                        <li><a href="pricing_tables.html">Pricing Tables</a>
                                        </li>

                                    </ul>
                                </li>
                                <li><a><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a>
                                </li>
                            </ul>
                        </div>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder ID="PayrollMenu" runat="server" Visible=false>
                        <div class="menu_section">
                            <h3>General</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="index.html">Dashboard</a>
                                        </li>
                                        <li><a href="index2.html">Dashboard2</a>
                                        </li>
                                        <li><a href="index3.html">Dashboard3</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="form.html">General Form</a>
                                        </li>
                                        <li><a href="form_advanced.html">Advanced Components</a>
                                        </li>
                                        <li><a href="form_validation.html">Form Validation</a>
                                        </li>
                                        <li><a href="form_wizards.html">Form Wizard</a>
                                        </li>
                                        <li><a href="form_upload.html">Form Upload</a>
                                        </li>
                                        <li><a href="form_buttons.html">Form Buttons</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-desktop"></i> UI Elements <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="general_elements.html">General Elements</a>
                                        </li>
                                        <li><a href="media_gallery.html">Media Gallery</a>
                                        </li>
                                        <li><a href="typography.html">Typography</a>
                                        </li>
                                        <li><a href="icons.html">Icons</a>
                                        </li>
                                        <li><a href="glyphicons.html">Glyphicons</a>
                                        </li>
                                        <li><a href="widgets.html">Widgets</a>
                                        </li>
                                        <li><a href="invoice.html">Invoice</a>
                                        </li>
                                        <li><a href="inbox.html">Inbox</a>
                                        </li>
                                        <li><a href="calender.html">Calender</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="tables.html">Tables</a>
                                        </li>
                                        <li><a href="tables_dynamic.html">Table Dynamic</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="chartjs.html">Chart JS</a>
                                        </li>
                                        <li><a href="chartjs2.html">Chart JS2</a>
                                        </li>
                                        <li><a href="morisjs.html">Moris JS</a>
                                        </li>
                                        <li><a href="echarts.html">ECharts </a>
                                        </li>
                                        <li><a href="other_charts.html">Other Charts </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="menu_section">
                            <h3>Live On</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="e_commerce.html">E-commerce</a>
                                        </li>
                                        <li><a href="projects.html">Projects</a>
                                        </li>
                                        <li><a href="project_detail.html">Project Detail</a>
                                        </li>
                                        <li><a href="contacts.html">Contacts</a>
                                        </li>
                                        <li><a href="profile.html">Profile</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="page_404.html">404 Error</a>
                                        </li>
                                        <li><a href="page_500.html">500 Error</a>
                                        </li>
                                        <li><a href="plain_page.html">Plain Page</a>
                                        </li>
                                        <li><a href="login.html">Login Page</a>
                                        </li>
                                        <li><a href="pricing_tables.html">Pricing Tables</a>
                                        </li>

                                    </ul>
                                </li>
                                <li><a><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a>
                                </li>
                            </ul>
                        </div>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder ID="EntryClerkMenu" runat="server" Visible=false>
                        <div class="menu_section">
                            <h3>General</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="index.html">Dashboard</a>
                                        </li>
                                        <li><a href="index2.html">Dashboard2</a>
                                        </li>
                                        <li><a href="index3.html">Dashboard3</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="form.html">General Form</a>
                                        </li>
                                        <li><a href="form_advanced.html">Advanced Components</a>
                                        </li>
                                        <li><a href="form_validation.html">Form Validation</a>
                                        </li>
                                        <li><a href="form_wizards.html">Form Wizard</a>
                                        </li>
                                        <li><a href="form_upload.html">Form Upload</a>
                                        </li>
                                        <li><a href="form_buttons.html">Form Buttons</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-desktop"></i> UI Elements <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="general_elements.html">General Elements</a>
                                        </li>
                                        <li><a href="media_gallery.html">Media Gallery</a>
                                        </li>
                                        <li><a href="typography.html">Typography</a>
                                        </li>
                                        <li><a href="icons.html">Icons</a>
                                        </li>
                                        <li><a href="glyphicons.html">Glyphicons</a>
                                        </li>
                                        <li><a href="widgets.html">Widgets</a>
                                        </li>
                                        <li><a href="invoice.html">Invoice</a>
                                        </li>
                                        <li><a href="inbox.html">Inbox</a>
                                        </li>
                                        <li><a href="calender.html">Calender</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="tables.html">Tables</a>
                                        </li>
                                        <li><a href="tables_dynamic.html">Table Dynamic</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="chartjs.html">Chart JS</a>
                                        </li>
                                        <li><a href="chartjs2.html">Chart JS2</a>
                                        </li>
                                        <li><a href="morisjs.html">Moris JS</a>
                                        </li>
                                        <li><a href="echarts.html">ECharts </a>
                                        </li>
                                        <li><a href="other_charts.html">Other Charts </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="menu_section">
                            <h3>Live On</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="e_commerce.html">E-commerce</a>
                                        </li>
                                        <li><a href="projects.html">Projects</a>
                                        </li>
                                        <li><a href="project_detail.html">Project Detail</a>
                                        </li>
                                        <li><a href="contacts.html">Contacts</a>
                                        </li>
                                        <li><a href="profile.html">Profile</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="page_404.html">404 Error</a>
                                        </li>
                                        <li><a href="page_500.html">500 Error</a>
                                        </li>
                                        <li><a href="plain_page.html">Plain Page</a>
                                        </li>
                                        <li><a href="login.html">Login Page</a>
                                        </li>
                                        <li><a href="pricing_tables.html">Pricing Tables</a>
                                        </li>

                                    </ul>
                                </li>
                                <li><a><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a>
                                </li>
                            </ul>
                        </div>
                    </asp:PlaceHolder>
                    </div>
                    <!-- /sidebar menu -->

                    
                </div>
            </div>

            <!-- top navigation -->
            <div class="top_nav">

                <div class="nav_menu">
                    <nav class="" role="navigation">
                        <div class="nav toggle">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>

                        <ul class="nav navbar-nav navbar-right">
                            <li class="">
                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <img src="~/Images/d_Photo.jpg" runat = server alt=""><asp:Label ID="UserName"  Visible=true Runat=server />
                                    <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                    <li>
                                        <a id="A69" href="~/Common/EmployeeProfile.aspx" runat="server">
                                            <i class="fa fa-user pull-right"></i>My Profile
                                        </a>
                                    </li>
                                    <li>
                                        <a id="A70" href="~/Common/ChangePassword.aspx" runat="server">
                                            <i class="fa fa-lock pull-right"></i>Change Password
                                        </a>
                                    </li>
                                    <li>
                                        <a id="A71" href="~/Logout.aspx" runat="server">
                                            <i class="fa fa-power-off pull-right"></i>Log Out
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            
                        </ul>
                    </nav>
                </div>

            </div>
            <!-- /top navigation -->


            <!-- page content -->
            <div class="right_col" role="main">
                <master:contentplaceholder id="formData"  runat="server" />
            </div>

            <!-- /page content -->
        </div>
        <!-- footer content -->
                <footer>
                    <div class="">
                        <p class="pull-right">FarmPro Solutions Rel Version 1.1 Copyright © 2016 Shift2Net Solutions Inc. All Rights Reserved. |
                            <span class="lead"> <i class="fa fa-paw"></i> FarmPro!</span>
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </footer>
                <!-- /footer content -->
    </div>


    </FORM>
    </div> 
	</BODY>
<script type="text/javascript" language="JavaScript">
    function myJS(myVar) {
        window.alert(myVar);
    }     
</script>
    
</HTML>
