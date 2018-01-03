<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddEmployee.aspx.cs" Inherits="SchoolNet.AddEmployee" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table  border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
  <!--    Edit Employee Data Area -->
 <tr><td width="100%">
  <asp:PlaceHolder id=EditArea Runat="server" visible="true">
	  <table width="100%" border="0"><tr><td class="x_title" colspan="5"><h2 class="text-primary">Add New Employee Profile</h2></td></tr>
      </table>
	  <table width="99%" border="0">    
             <tr><td colspan="5">&nbsp;</td></tr>
		     <tr>
			    <td class="mainheadtxt" colspan="2"><label class="control-label">Employee Name<font color="red">*</font></td>
			    <td class="mainheadtxt"><label class="control-label">Date of Birth<font color="red">*</font></td>
			    <td class="mainheadtxt"><label class="control-label">Gender Type<font color="red">*</font></td>
			    <td class="mainheadtxt"><label class="control-label">Marital Status<font color="red">*</font></td>
		    </tr>
 	        <tr>
			    <td class="mainheadtxt" colspan="2">
			                            <asp:dropdownlist id="Tab1_SaluationType"  TabIndex=1 AutoPostBack=false runat="server" cssclass="form-control col-lg-2"></asp:dropdownlist>
			                            <asp:textbox id=Tab1_FName   cssclass="form-control col-lg-9" placeholder="First Name"  TabIndex=2 Maxlength="50" runat="server"></asp:textbox>
			                            <asp:textbox id=Tab1_MidName cssclass="form-control col-lg-2" placeholder="Mid/Initial"  TabIndex=3  Maxlength="15" runat="server" ></asp:textbox>
			                            <asp:textbox id=Tab1_LName   cssclass="form-control col-lg-9"  placeholder="Last Name"  TabIndex=4 Maxlength="50" runat="server" ></asp:textbox>
			    </td> 
			    <td class="mainheadtxt"><asp:textbox id=Tab1_DOB  cssclass="select-date date-picker form-control col-lg-10 col-xs-12"   TabIndex=5 Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_GenderType"  TabIndex=6 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>		    	    
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_MaritalStatus" TabIndex=7 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
		    </tr>
		     <tr>
                <td class="validationtxt">
                    <asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_FName  ErrorMessage="Employee First Name is required." />
                    <asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_LName  ErrorMessage="Employee Last Name is required." /></td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_SaluationType display="dynamic" InitialValue="-1" ErrorMessage="Salutation Type is required." /></td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_DOB  display="dynamic" ErrorMessage="DOB is required." />
                                        <br /><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" display="dynamic"  ErrorMessage="Please enter date in dd/mm/yyyy format" ControlToValidate="Tab1_DOB" ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}"> </asp:RegularExpressionValidator>
                
                </td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_GenderType display="dynamic" InitialValue="-1" ErrorMessage="Gender Type is required." /></td>
                  <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_MaritalStatus display="dynamic" InitialValue="-1" ErrorMessage="Marital Status is Required." /></td>                        
 		    </tr>
		    <tr>
			    <td class="mainheadtxt"><label class="control-label">Hire Date<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Employee ID(Auto Assign)</label></td>
			    <td class="mainheadtxt"><label class="control-label">Office Employee ID<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Employment Category<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Job Catagory<font color="red">*</font></label></td>
		    </tr>
 	        <tr>			    
			    <td class="mainheadtxt"><asp:textbox id=Tab1_HireDate    TabIndex=8 cssclass="select-date date-picker form-control col-lg-10 col-xs-12"   Maxlength="30" runat="server" ></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_EmployeeID  disabled=true TabIndex=9 cssclass="form-control col-lg-11"   Maxlength="30" runat="server" ></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_PSEmployeeID   TabIndex=10 cssclass="form-control col-lg-11"   Maxlength="30" runat="server" ></asp:textbox></td>			    
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_EmpCategory" TabIndex=10 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
  			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_JobCatagory" TabIndex=11 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
		    </tr>	
		     <tr>              
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_HireDate   display="dynamic" ErrorMessage="Hire Date is Required." />
                                 <br /><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" display="dynamic"  ErrorMessage="Please enter date in dd/mm/yyyy format" ControlToValidate="Tab1_HireDate" ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}"> </asp:RegularExpressionValidator>
                 </td>                        
                <td class="validationtxt">&nbsp;</td>                                 
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_PSEmployeeID display="dynamic" ErrorMessage="Peoplesoft Employee ID is Required." /></td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_EmpCategory InitialValue="-1" ErrorMessage="Employement Catagory is Required." /></td>                        
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_JobCatagory display="dynamic" InitialValue="-1" ErrorMessage="Job Category is Required." /></td>                                        
 		    </tr>
 		    
            <tr>
			    <td class="mainheadtxt" colspan="2"><label class="control-label">Home Address<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">City<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">State/Province</label></td>
			    <td class="mainheadtxt"><label class="control-label">Country<font color="red">*</font></label></td>
		    </tr>
		    <tr>
			    <td class="mainheadtxt" colspan="2"><asp:textbox id=Tab1_HAddress1 cssclass="form-control col-lg-9" TabIndex=17 Maxlength="50" runat="server"></asp:textbox>
			                            <asp:textbox id=Tab1_HAddress2 cssclass="form-control col-lg-9" TabIndex=18 Maxlength="50" runat="server" ></asp:textbox>
			                            
			    </td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_HCity  cssclass="form-control col-lg-11" TabIndex=19 Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_HState  cssclass="form-control col-lg-11" TabIndex=20 Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_CountryDDList" TabIndex=21 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			    
		    </tr>
		    <tr>
		        <td class="validationtxt" colspan="2"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_HAddress1  ErrorMessage="Home Address is required." /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_HCity  ErrorMessage="City is required." /></td>                           
                <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt"><asp:RequiredFieldValidator  runat=server ControlToValidate=Tab1_CountryDDList  InitialValue="-1" ErrorMessage="Country is reqired." /></td> 		    
		    </tr>
	        <tr>
			    <td class="mainheadtxt" colspan="2"><label class="control-label">Work Address<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">City<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">State/Province</label></td>
			    <td class="mainheadtxt"><label class="control-label">Country<font color="red">*</font></label></td>
		    </tr>
		    <tr>
			    <td class="mainheadtxt" colspan="2"><asp:textbox id=Tab1_WAddress1 cssclass="form-control col-lg-9" TabIndex=22 Maxlength="50" runat="server"></asp:textbox>
			                            <asp:textbox id=Tab1_WAddress2 cssclass="form-control col-lg-9" TabIndex=23 Maxlength="50"  runat="server" ></asp:textbox>
			                            
			    </td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_WCity cssclass="form-control col-lg-11" TabIndex=24  Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_WState  cssclass="form-control col-lg-11" TabIndex=25 Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_WCountryDDList"  TabIndex=26 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			    
		    </tr>
		     <tr>
		        <td class="validationtxt" colspan="2"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_WAddress1  ErrorMessage="Work Address is required." /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_WCity  ErrorMessage="Work City is required." /></td>                           
                <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt"><asp:RequiredFieldValidator  runat=server ControlToValidate=Tab1_WCountryDDList  InitialValue="-1" ErrorMessage="Country is reqired." /></td> 		    
		    </tr>

		    <tr>
			    <td class="mainheadtxt"><label class="control-label">Home Telephone<font color="red">*</font></td>
			    <td class="mainheadtxt"><label class="control-label">Work Telephone<font color="red">*</font></td>
			    <td class="mainheadtxt"><label class="control-label">Mobile</td>
			    <td class="mainheadtxt" colspan="2"><label class="control-label">Work Email<font color="red">*</font></td>
		    </tr>
		    <tr>		 
			    <td class="mainheadtxt"><asp:textbox id=Tab1_HPhone  cssclass="form-control col-lg-11" TabIndex=27 Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_WPhone  cssclass="form-control col-lg-11" TabIndex=28 Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_Mobile  cssclass="form-control col-lg-11" TabIndex=29 Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt" colspan="2"><asp:textbox id=Tab1_WorkEmail cssclass="form-control col-lg-11" TabIndex=30  Maxlength="50" runat="server"></asp:textbox></td>
		    </tr>
		     <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_HPhone  ErrorMessage="Home Phone is required." /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_WPhone  ErrorMessage="Work Phone is required." /></td>                           
                <td class="validationtxt"></td>
                <td class="validationtxt" colspan="2"><asp:RequiredFieldValidator  runat=server ControlToValidate=Tab1_WorkEmail ErrorMessage="Work Email Address is reqired." />
                                          <asp:RegularExpressionValidator runat="server" ControlToValidate=Tab1_WorkEmail ErrorMessage="Email Address format is invaid." ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" />
                </td> 
		    </tr>
 		    		    
		    <tr>
			    <td class="mainheadtxt" colspan="5"><label class="control-label">Photo profile <small>(Accepts jpg, .png, .gif up to 1MB. Recommended Size:200px X 200px)</small></td>
		    </tr>
 	        <tr>
			    <td class="mainheadtxt" colspan="5"><input id="Tab1_ProfilePhoto" type="file" TabIndex=32 class="textfield" runat="server" size="50"></td>			    
		    </tr>	
		     <tr>
		        <td class="validationtxt" colspan="5">&nbsp;</td>
		     </tr>
 		    	    
		        <tr>
			        <td class="mainheadtxt"><label class="control-label">HR System User Name<br />(<small>Work Email address recommended)</small><font color="red">*</font></label></td>
			        <td class="mainheadtxt"><label class="control-label">Access Level<font color="red">*</font></label></td>
			        <td class="mainheadtxt"><label class="control-label">Temp Password<font color="red">*</font></label></td>
			        <td class="mainheadtxt"><label class="control-label">Confirm Password<font color="red">*</font></label></td>
			        <td class="mainheadtxt"><label class="control-label">Account Status</label></td>
		        </tr>
 	            <tr>
			        <td class="mainheadtxt"><asp:textbox id=Tab1_UserName TabIndex=33 cssclass="form-control col-lg-11" Maxlength="50" runat="server" ></asp:textbox></td>
			        <td class="mainheadtxt"><asp:dropdownlist id=Tab1_AccessLevel    TabIndex=34 AutoPostBack=false runat="server" cssclass="form-control col-lg-11" ></asp:dropdownlist></td>			        
			        <td class="mainheadtxt"><asp:textbox id=Tab1_password   TextMode="Password"  TabIndex=35 cssclass="form-control col-lg-11" Maxlength="15" runat="server" ></asp:textbox></td>
			        <td class="mainheadtxt"><asp:textbox id=Tab1_ConfirmPassword TextMode="Password"  TabIndex=36 cssclass="form-control col-lg-11"  Maxlength="15" runat="server" ></asp:textbox></td>
			        <td class="mainheadtxt"><asp:RadioButton ID="RadioButton1" runat="server" Text="Enabled" value ="1" Checked=true GroupName="AccountStatus" AutoPostBack="false" />  
                                            &nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton2" runat="server" Text="Disabled"  value = "0" GroupName="AccountStatus" AutoPostBack="false" /> 
                                            
			        </td>
		        </tr>	
	            <tr>
	                <td class="validationtxt"><asp:RequiredFieldValidator runat=server Display="Dynamic" ControlToValidate=Tab1_UserName ErrorMessage="User Name is required." /> 
	                                            <asp:RegularExpressionValidator id=RegExp_EmailAddress runat="server" Display="Dynamic" ControlToValidate="Tab1_UserName"  ErrorMessage="Please enter a valid email address." ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator></td>
	                                                                  		    
                    <td class="validationtxt"><asp:RequiredFieldValidator runat=server Display="Dynamic" ControlToValidate=Tab1_AccessLevel InitialValue=-1 ErrorMessage="Access Level is required." />                        
                    <td class="validationtxt"><asp:RegularExpressionValidator  runat=server ControlToValidate=Tab1_password  ValidationExpression="(?=^.{8,15}$)(?=.*\d)(?=.*\W+)(?![.\n])(?=.*[a-zA-Z]).*$" ErrorMessage="Password length should be greater than 8 and less than 15 characters. Password should contain at least one digit [0-9], one alphabet [A-Z] [a-z] and one special character such as [@#&*!]." /> </td>                        
                    <td class="validationtxt"><asp:CompareValidator      runat="server" ErrorMessage="Passwords do not match!"  ControlToValidate="Tab1_ConfirmPassword"  ControlToCompare="Tab1_password"></asp:CompareValidator></td>
                    <td class="validationtxt"></td>
 		        </tr>
 	   		 	   		    
    	    <tr><td colspan="5">&nbsp;</td></tr>
            	
            <tr class="PartButtons" align=center>
			<td  colspan="5">
			<center>
			    <asp:button id=Save_Employee runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Save"></asp:button>
			    &nbsp;&nbsp;&nbsp;
			    <asp:button id=Cancel runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-default" Text="Reset"></asp:button>
			</center>
			</td>
		    </tr>		        
	    </table>
	    
 </asp:placeholder>
</td>
</tr>
<tr class="PartBrown" >
   <td width="100%" align=center>
       <div class="alert alert-success alert-dismissible fade in" visible=false runat="server" id="AlertDiv" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
            </button>
            <strong><asp:label id="message" runat="server" /></strong> 
        </div></td>			
</tr> 			
</table>
										
</master:content>

