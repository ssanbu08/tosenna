<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="SchoolNet.Login"%>
<!DOCTYPE html> 
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>FarmPro! </title>

    <!-- Bootstrap core CSS -->

    <link href="css/bootstrap.min.css" rel="stylesheet" runat="server" />

    <link href="fonts/css/font-awesome.min.css" rel="stylesheet" runat="server" />
    <link href="css/animate.min.css" rel="stylesheet" runat=server />

    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet" runat="server" />
    <link href="css/FarmPro.css" rel="stylesheet" runat="server" />
    <link href="css/icheck/flat/green.css" rel="stylesheet" runat="server" />


    <script src="_scripts/jquery.min.js"></script>

    <!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

</head>

<body style="background: url(/Images/slider3.jpg);">
    
    <div class="content-area">
        <!--<a class="hiddenanchor" id="toregister"></a>
        <a class="hiddenanchor" id="tologin"></a>-->

        <div id="wrapper">

            
            <asp:PlaceHolder ID="Login_Pane"  runat="server">
                <div id="login" class="animate form">
                <section class="login_content">
                    <form id=form1 runat=server>
                        <h1>Login Here</h1>
                        <div>
                            <asp:textbox id=EmailAddress cssclass="form-control" TabIndex=1 placeholder="Username" Maxlength="50" runat="server" ></asp:textbox>
                        </div>
                        <div class="ValidationArea">
			                <asp:requiredfieldvalidator id=Req_EmailAddress runat="server" Display="Dynamic" ControlToValidate="EmailAddress"  ErrorMessage="Please enter your email address" CssClass="validationtxt2"></asp:requiredfieldvalidator>
                            <asp:RegularExpressionValidator id=RegExp_EmailAddress runat="server" Display="Dynamic" ControlToValidate="EmailAddress"  ErrorMessage="Please enter a valid email address." CssClass="validationtxt2" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
                        </div>
                        <div>
                            <asp:textbox id=Login_Password TextMode="password" placeholder="Password" cssclass="form-control" TabIndex=2 Maxlength="15" runat="server"></asp:textbox>
                        </div>
                        <div class="ValidationArea">
                            <asp:requiredfieldvalidator ID="Requiredfieldvalidator1"  runat="server" Display="Dynamic" TabIndex=2  ControlToValidate="Login_Password" CssClass="validationtxt2" ErrorMessage="Please enter your password"></asp:requiredfieldvalidator>
                        </div> 
                        <div>
                            <asp:button id=LoginMe runat="server" CausesValidation="True" CssClass="btn btn-primary submit" Text="Login"></asp:button>
                            <a Id="A3" class="btn btn-default btn-round btn-xs pull-right" href="Login.aspx?id=2">Lost your password?</a>
                            <asp:checkbox id="login_RememberMe" cssclass="textfield" style="border: 0;" visible=false Text="Remember Me next time" runat="server" />
                        </div>
                        <div class="ValidationArea"><asp:label id=errorMessage1 Runat="server" Visible="false"></asp:label></div>
                        <div class="clearfix"></div>
                        <div class="separator">

                            <p class="change_link">
                                <a href="javascript:void(0);" class="btn btn-default btn-round btn-xs">New to site? Create Account </a>
                            </p>
                            <div class="clearfix"></div>
                            <br />
                            <div class="tab-footer">
                                <h1><i class="fa fa-paw" style="font-size: 26px;"></i> FarmPro!</h1>

                                <p>FarmPro Solutions Rel Version 1.1 Copyright &copy; 2016 Shift2Net Solutions Inc. All Rights Reserved. |</p>
                            </div>
                        </div>
                    </form>
                    <!-- form -->
                </section>
                <!-- content -->
            </div>
            </asp:PlaceHolder>
             
            <asp:PlaceHolder ID="Tab3_Pane"  runat="server">
                <div id="lostpassword" class="animate form">
                <section class="login_content">
                    <form id=form2 data-parsley-validate runat=server>
                        <h1>Reset Here</h1>
                        <div>
                            <asp:textbox id=Tab3_Emailaddress cssclass="form-control" TabIndex=1 Maxlength="50" placeholder="Username" runat="server" ></asp:textbox>
                        </div>
                        <div class="ValidationArea">
			                <asp:requiredfieldvalidator ID="Requiredfieldvalidator2" runat="server" Display="Dynamic" ControlToValidate="Tab3_Emailaddress"  CssClass="validationtxt2" ErrorMessage="Please enter your email address"></asp:requiredfieldvalidator>
                            <asp:RegularExpressionValidator id=RegularExpressionValidator4 runat="server" Display="Dynamic" ControlToValidate="Tab3_Emailaddress"  CssClass="validationtxt2" ErrorMessage="Please enter a valid email address." ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
                        </div>
                        <div>
                            <asp:button id="Tab3_Submit" runat="server" CausesValidation="True" CssClass="btn btn-primary submit" Text="Submit"></asp:button>
                            <asp:HyperLink ID="HyperLink1" CssClass="btn btn-default btn-xs btn-round pull-right" runat="server" Text="Click here to Login" NavigateUrl="login.aspx" /></li>
                        </div>
                        <div class="ValidationArea"><asp:label id=errorMessage2 Runat="server" Visible="false"></asp:label></div>
                        <div class="clearfix"></div>
                        <div class="separator">
                            <div class="clearfix"></div>
                            <br />
                            <div class="tab-footer">
                                <h1><i class="fa fa-paw" style="font-size: 26px;"></i> FarmPro!</h1>

                                <p>FarmPro Solutions Rel Version 1.1 Copyright &copy; 2016 Shift2Net Solutions Inc. All Rights Reserved. |</p>
                            </div>
                        </div>
                    </form>
                    <!-- form -->
                </section>
                <!-- content -->
            </div>
            </asp:PlaceHolder>

         <!-- Change Password -->
     <asp:PlaceHolder id=ChangePassword Runat="server" visible="false">
         <form id="form5" runat="server">
        <div class="Wrapper">
        <div class="LoginHeading">
            <span class="loginto">Change Login Password?</span>
        </div>
        <div class="MainContent">
            <p class="LoginNote">(<span>CARE: </span>Your Current password has expired! Please note the password setup rules.)</p>
            <ul class="ForgotArea" style="float: left; line-height: 15px; margin: 5px 0 0 5px;">
                <li style="text-align:left;color: #949696;">New Password can't be same as current password.</li>
                <li style="text-align:left;color: #949696;">Password length should be greater than 8 and less than 15 characters.</li>
                <li style="text-align:left;color: #949696;">Password should contain at least one digit [0-9], one alphabet [A-Z] [a-z] and one special character such as [@#&*!]</li>
            </ul>
            <div class="LoginArea">
                <label>Current Password*</label>
                <asp:textbox id="Tab1_password"   TextMode="Password"  TabIndex=1 cssclass="textfield" Maxlength="15" runat="server"></asp:textbox>
                <div class="ValidationArea">
			        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat=server Display="Dynamic" ControlToValidate=Tab1_password  ErrorMessage="Current Password is Required." />

                </div>
                <label>New Password*</label>
                <asp:textbox id="Tab1_NewPassword"   TextMode="Password"  TabIndex=2 cssclass="textfield" Maxlength="15" runat="server" ></asp:textbox>
                <div class="ValidationArea">
			        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat=server Display="Dynamic" ControlToValidate=Tab1_NewPassword  ErrorMessage="New Password is Required." />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3"  runat=server Display="Dynamic" ControlToValidate=Tab1_NewPassword  ValidationExpression="(?=^.{8,15}$)(?=.*\d)(?=.*\W+)(?![.\n])(?=.*[a-zA-Z]).*$" ErrorMessage="Please set the password as per rules" />
                </div>
                <label>Confirm Password*</label>
                <asp:textbox id="Tab1_ConfirmNewPassword"   TextMode="Password"  TabIndex=3 cssclass="textfield" Maxlength="15" runat="server" ></asp:textbox>
                <div class="ValidationArea">
			        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat=server Display="Dynamic" ControlToValidate=Tab1_ConfirmNewPassword  ErrorMessage="Confirm Password is Required." />
                    <asp:CompareValidator ID="CompareValidator2" runat="server" Display="Dynamic" ErrorMessage="New and Confirm New Passwords do not match!"  ControlToValidate="Tab1_ConfirmNewPassword"  ControlToCompare="Tab1_NewPassword"></asp:CompareValidator>
                </div>

                <asp:button id=Change_Password runat="server" CausesValidation="True" CssClass="Button1" Text="Save"></asp:button>&nbsp;&nbsp;&nbsp;
	            <asp:button id=Button1 runat="server" CausesValidation="false" CssClass="Button1" Text="Cancel"></asp:button>
                <div class="ValidationArea">
                    <asp:Label id="Tab1_keyField" runat="server" visible=false />
                </div>
            </div>   
            <ul class="ForgotArea" style="float: left; line-height: 30px; margin: 30px 0 0 25px;list-style:none;">
                <li><asp:HyperLink runat="server" Text="Click here to Login" NavigateUrl="login.aspx" /></li>
            </ul>

        </div>
            <div class="ValidationArea"><asp:label id=errorMessage3 Runat="server" Visible="false"></asp:label></div>
    </div>	
  </form>
   </asp:placeholder>

   <!--- Account Sign Up -->
	 <asp:PlaceHolder ID="Account_Signup" runat="server" Visible=false>	
		<tr>		
		    <td><table cellpadding="0" border="0" width="540px" >
			    <tr><td align="center" colspan="2" class="colheader"> New Employee Sign up</td></tr>
			    <tr><td colspan="2">&nbsp;</td></tr>
			    <tr>
				    <td align="left" class="mainheadtxt" width="28%"><Label for="Employee_Id">Employee ID&nbsp;&nbsp;</label></td>
				    <td align="left" class="mainheadtxt"><asp:textbox id=Signup_EmployeeID cssclass="textfield" TabIndex=1 Maxlength="20" Width="200px" runat="server" ></asp:textbox></td>
                </tr>
                <tr> <td>&nbsp;</td> 
                    <td class="validationtxt" align="left"><asp:requiredfieldvalidator runat="server" ControlToValidate="Signup_EmployeeID" ErrorMessage="Please Enter Your Employee ID"></asp:requiredfieldvalidator></td>
                
                </tr>       
	                                     
            
			    <tr>
				    <td align="left" class="mainheadtxt" width="22%"><Label for="login_UserName">Email Address&nbsp;&nbsp;</label></td>
				    <td align="left" class="mainheadtxt"><asp:textbox id=Signup_UserName cssclass="textfield" TabIndex=2 Maxlength="50" Width="200px" runat="server" ></asp:textbox></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="validationtxt" align="left"><asp:requiredfieldvalidator runat="server" ControlToValidate="Signup_UserName" Display="Dynamic" ErrorMessage="Please Enter Your Email Address"></asp:requiredfieldvalidator>
	                                       <br />   <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  runat="server" ControlToValidate="Signup_UserName"  Display="Dynamic" ErrorMessage="Please Enter Valid Email Address." ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
                    </td>
     	        </tr>
     	         
     	        <tr>
     	            <td align="left" class="mainheadtxt"><label for="login_Password">Password&nbsp;&nbsp;</label></td>
				    <td align="left" class="mainheadtxt"><asp:textbox id=Signup_Password TextMode="password" cssclass="textfield" TabIndex=3 Maxlength="15" Width="200px" runat="server"></asp:textbox></td>
                 </tr>
                 <tr>
                    <td>&nbsp;</td>
                    <td class="validationtxt" align="left"><asp:requiredfieldvalidator ID="Requiredfieldvalidator5"  runat="server"  ControlToValidate="Signup_Password"  Display="Dynamic" ErrorMessage="Please Enter Your Password"></asp:requiredfieldvalidator>
                                                  <br />   <asp:RegularExpressionValidator ID="RegularExpressionValidator2"  runat=server Display="Dynamic" ControlToValidate=Signup_Password  ValidationExpression="(?=^.{8,15}$)(?=.*\d)(?=.*\W+)(?![.\n])(?=.*[a-zA-Z]).*$" ErrorMessage="Password length should be greater than 8 and less than 15 characters. Password should contain at least one digit [0-9], one alphabet [A-Z] [a-z] and one special character such as [@#&*!]." />
                    </td>
                </tr> 
                
     	        <tr>
     	            <td align="left" class="mainheadtxt"><label for="login_Password">Confirm Password&nbsp;&nbsp;</label></td>
				    <td align="left" class="mainheadtxt"><asp:textbox id=Signup_ConfirmPassword TextMode="password" cssclass="textfield" TabIndex=4 Maxlength="15"  Width="200px" runat="server"></asp:textbox></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="validationtxt" align="left"><asp:requiredfieldvalidator ID="Requiredfieldvalidator7" runat="server"  ControlToValidate="Signup_ConfirmPassword" Display="Dynamic" ErrorMessage="Please Enter Confirm Password"></asp:requiredfieldvalidator>
                                          <br />    <asp:CompareValidator id="CompareValidator1" runat="server" ErrorMessage="Passwords do not match!"  Display="Dynamic" ControlToValidate="Signup_ConfirmPassword" ControlToCompare="Signup_Password"></asp:CompareValidator>
                    </td>
              </tr>              
			  
			  <tr><td colspan="2"><center><asp:button id="SignMeUp" runat="server"  BorderStyle="Ridge" CausesValidation="True" CssClass="button" BorderWidth="1px" Text="Submit"></asp:button>
			                    &nbsp;&nbsp;&nbsp;<asp:button id=Cancel runat="server" BorderStyle="Ridge" CausesValidation="false" CssClass="button" BorderWidth="1px" Text="Cancel"></asp:button>
			                 </center></td>
		      </tr>
		      <tr><td colspan="2">&nbsp;</td></tr>
	       </table>
	    </td>
	    </tr>
	</asp:PlaceHolder>
    
            
            
        </div>
        
    </div>

</body>

</html>