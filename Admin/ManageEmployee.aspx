<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageEmployee.aspx.cs" Inherits="SchoolNet.ManageEmployee" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table  border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
  <!--   Search Box -->
 <ASP:PlaceHolder id="EmpSearchBox" Runat="server">
    <tr width="100%">
		<td class="x_title"><h2 class="text-primary">Employee Management</h2></td>
	</tr>	
    
	<asp:PlaceHolder id=searchDataArea Runat="server">
<tr width="100%">
  <td>
  <div class="x_content">
  <asp:DataGrid CssClass="full-width table table-striped responsive-utilities jambo_table" ID="EmpGrid" runat="server" Width="100%" AllowPaging="false" AllowSorting="True" DataKeyField="EmpId" AutoGenerateColumns="False" CellPadding="4"  GridLines="None" OnEditCommand="Grid_EditCommand">
                           
              <Columns>

                    <asp:TemplateColumn HeaderText="Employee ID" ItemStyle-Width="12%">
                                <ItemTemplate> 
                                     <asp:LinkButton name="Edit" commandName="Edit"  CausesValidation="false" runat="server" ToolTip="Click to manage employee information"> <%# Eval("Employee_ID")%></asp:LinkButton>                                                                 
                                </ItemTemplate>
                    </asp:TemplateColumn>
                    
                    <asp:TemplateColumn HeaderText="Employee Name" ItemStyle-Width="20%">
                                <ItemTemplate> 
                                     <asp:LinkButton name="Edit" commandName="Edit"  CausesValidation="false" runat="server" ToolTip="Click to manage employee information"> <%# Eval("EmployeeName")%></asp:LinkButton>                                                                 
                                </ItemTemplate>
                    </asp:TemplateColumn>
                    
                    <asp:BoundColumn HeaderText="Age" DataField="Age" ItemStyle-Width="8%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Status" DataField="EmpStatusName" ItemStyle-Width="10%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Job Catagory" DataField="JobCatagoryName" ItemStyle-Width="10%" ></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Employment Catagory" DataField="EmpCategoryName" ItemStyle-Width="12%" ></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Mobile Contact" DataField="MOBILE_PHONE" ItemStyle-Width="11%" ></asp:BoundColumn>                    
                    <asp:BoundColumn HeaderText="Email Address" DataField="WORK_EMAIL" ItemStyle-Width="17%"> </asp:BoundColumn>
                   


               </Columns>  
                <FooterStyle CssClass="EmpsFooter" />
                <SelectedItemStyle CssClass="EmpsSelectedItem" />
                <PagerStyle CssClass="EmpsPagerItem" HorizontalAlign="Center" Mode="NumericPages" />
                <AlternatingItemStyle CssClass="EmpsAltItem" />
                <ItemStyle CssClass="EmpsItem" />
                <HeaderStyle CssClass="EmpsHeader" />
</asp:DataGrid>
</br>
<center><asp:label id ="emptyRow" value="" visible=false runat="server" /></center>
</div>
</td>    
</tr>

</ASP:PlaceHolder>

</asp:PlaceHolder>

<!---  Data Content Area -->						

<!--    Edit Employee Data Area -->
<asp:PlaceHolder id=EditArea Runat="server" visible="false">
 <tr width="100%">
		<td class="x_title"><h2 class="text-primary">Manage Employee Information</h2></td>
</tr>
<tr>
  <td>
    <table width="99%" border="0" class="Partgrayblock">
       <tr>
	      <td valign="top" width="20%"> <asp:image id='profile' width="200" height="200" runat="server" /></td>
	      <td valign="top" width="2%">&nbsp;</td>
	     	      <td valign="top" width="78%" align="left">
	                    <table>
	                        <tr><td align="right"><span class="mainheadtxt3">Employee Name&nbsp;&nbsp;</span></td><td><asp:label id="lblEmployeeName" runat="server" cssclass="mainheadtxt2" /></td></tr>
                            <tr><td align="right"><span class="mainheadtxt3">Employee ID&nbsp;&nbsp;</span></td><td><asp:Label id="lblEmployeeID" runat="server" cssclass="mainheadtxt2"></asp:Label></td></tr>	
                            <tr><td align="right"><span class="mainheadtxt3">Job Catagory&nbsp;&nbsp;</span></td><td><asp:Label id="lblJobCatagory" runat="server" cssclass="mainheadtxt2" /></td></tr>	
                            <tr><td align="right"><span class="mainheadtxt3">Work Phone&nbsp;&nbsp;</span></td><td><asp:Label id="lblWorkPhone" runat="server" cssclass="mainheadtxt2" ></asp:Label></td></tr>	    
                            <tr><td align="right"><span class="mainheadtxt3">Mobile Phone&nbsp;&nbsp;</span></td><td><asp:Label id="lblMobile" runat="server" cssclass="mainheadtxt2" /></td></tr>	                                                
                            <tr><td align="right"><span class="mainheadtxt3">Email Address&nbsp;&nbsp;</span></td><td><asp:Label id="lblEmailAddress" runat="server" cssclass="mainheadtxt2" /></td></tr>
                            <tr><td align="right"><span class="mainheadtxt3">Business Unit&nbsp;&nbsp;</span></td><td><asp:Label id="lblDivision" runat="server" cssclass="mainheadtxt2" /></td></tr>	       
                            <tr><td align="right"><span class="mainheadtxt3">Business Unit Location&nbsp;&nbsp;</span></td><td><asp:Label id="lblDivisionLocation" runat="server" cssclass="mainheadtxt2" /></td></tr>	                                                                      	
                            <tr><td align="right" colspan="2"><asp:Label id="keyField" runat="server" visible=false /></td></tr>	                                                                                                
                         </table>	                                                
	       </td>	
		</tr>
     </table>
    </td>
</tr>
<tr width="100%">
  <td width="100%">
      <div class="" runat="server" role="tabpanel" data-example-id="togglable-tabs">
            <ul id="CamelTab" class="nav nav-tabs bar_tabs" role="tablist">
                <li role="presentation" runat="server" class="">
                    <asp:LinkButton id="tab1" Text="Personal Information" CssClass="active" CausesValidation="false" runat="server"/> 
                </li>
                <li role="presentation" runat="server" class="">
                    <asp:LinkButton id="tab2" Text="Contact Information" CausesValidation="false" runat="server" /> 
                </li>
                <li role="presentation" runat="server" class="">
                    <asp:LinkButton id="tab3" Text="Dependents Information" CausesValidation="false" runat="server" /> 
                </li>
                <li role="presentation" runat="server" class="">
                    <asp:LinkButton id="tab4" Text="Emergency Contacts" CausesValidation="false" runat="server" /> 
                </li>
            </ul>
        </div>
  </td>
</tr>  
<!--  Start:Tab 1--->
<tr><td width="100%">
 <asp:PlaceHolder id=GeneralInfoTab Runat="server" visible="false">	
		  <table width="99%" border="0" class="Partgrayblock">
             <tr><td class="x_title" colspan="4"><h2 class="text-primary">Personal Information</h2></td></tr>   
		     <tr><td colspan="4">&nbsp;</td></tr>
		     <tr>
			    <td class="mainheadtxt" colspan="2">Employee Name(First, Mid & Last Name)<font color="red">*</font></td>
			    <td class="mainheadtxt">Date of Birth<font color="red">*</font></td>
			    <td class="mainheadtxt">Age</td>
		    </tr>
 	        <tr>
			    <td class="mainheadtxt"  colspan="2"><asp:textbox id=Tab1_FName   cssclass="form-control col-lg-8"   TabIndex=1 Maxlength="50" runat="server"></asp:textbox>
			                            <asp:textbox id=Tab1_MidName cssclass="form-control col-lg-2"   TabIndex=2 Maxlength="15" runat="server" ></asp:textbox>
			                            <asp:textbox id=Tab1_LName   cssclass="form-control col-lg-8"   TabIndex=3 Maxlength="50"  runat="server" ></asp:textbox>
			    </td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_DOB  cssclass="select-date date-picker form-control col-md-9 col-xs-12"   TabIndex=5 Maxlength="15" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_Age  Enabled="false" cssclass="form-control col-lg-2"  TabIndex=6 Maxlength="10" runat="server"></asp:textbox></td>
			    
		    </tr>
		     <tr>
                <td class="validationtxt" colspan="2">
                    <asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_FName  ErrorMessage="Employee First Name is required." />
                    <asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_LName  ErrorMessage="Employee Last Name is required." /></td>
                <td class="validationtxt"><asp:RegularExpressionValidator  runat=server ControlToValidate=Tab1_DOB  ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}" ErrorMessage="Date is required DD/MM/YYYY format." /></td>
                <td></td>
 		    </tr>
		    <tr>
			    <td class="mainheadtxt">Marital Status<font color="red">*</font></td>
			    <td class="mainheadtxt">Gender<font color="red">*</font></td>
			    <td class="mainheadtxt">Citizenship</td>
			    <td class="mainheadtxt">Work Visa No</td>
		    </tr>
 	        <tr>
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_MaritalStatus" TabIndex=7 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_GenderType"  TabIndex=4 AutoPostBack=false runat="server" cssclass="form-control col-lg-6"></asp:dropdownlist></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_Citizenship    TabIndex=9 cssclass="form-control col-lg-11"   Maxlength="30" runat="server" ></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_VisaNumber     TabIndex=10 cssclass="form-control col-lg-11"   Maxlength="30" runat="server"></asp:textbox></td>
		    </tr>	
		     <tr>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_MaritalStatus InitialValue="-1" ErrorMessage="Marital Status is required." /></td>                        
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_GenderType display="dynamic" InitialValue="-1" ErrorMessage="Gender Type is required." /></td>                        
                <td></td>
                <td></td>
 		    </tr>
		    	    
		    <tr>
			    <td class="mainheadtxt">Visa Type</td>
			    <td class="mainheadtxt">Work Visa Issued Date</td>
			    <td class="mainheadtxt">Work Visa Expiry Date</td>
			    <td class="mainheadtxt">Visa Issuing Country</td>
		    </tr>
 	        <tr>
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_VisaType"  TabIndex=11 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_VisaIssueDate    TabIndex=12 cssclass="select-date date-picker form-control col-md-9 col-xs-12" Maxlength="30" runat="server" ></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_VisaExpiryDate   TabIndex=13 cssclass="select-date date-picker form-control col-md-9 col-xs-12"  Maxlength="30" runat="server" ></asp:textbox></td>
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_VisaCountryDDList" TabIndex=14 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>				    
		    </tr>	
		    <tr>
   		          <td>&nbsp;</td>
		          <td class="validationtxt"><asp:RegularExpressionValidator  runat=server ControlToValidate=Tab1_VisaIssueDate  ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}" ErrorMessage="Date is required DD/MM/YYYY format." /></td>  
		          <td class="validationtxt"><asp:RegularExpressionValidator  runat=server ControlToValidate=Tab1_VisaExpiryDate  ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}" ErrorMessage="Date is required DD/MM/YYYY format." /></td>  
		          <td>&nbsp;</td>
           </tr>
		    <tr>			    
			    <td class="mainheadtxt">Passport No</td>
			    <td class="mainheadtxt">Passport Issuing Country</td>
			    <td class="mainheadtxt">Passport Issue Date</td>
			    <td class="mainheadtxt">Passport Expiry Date</td>
			    
		    </tr>
		    <tr>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_PassportNo  TabIndex=15 cssclass="form-control col-lg-11"   Maxlength="30" runat="server"></asp:textbox></td>	
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_PassportCountryDDList" TabIndex=16 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>				    
			    <td class="mainheadtxt"><asp:textbox id=Tab1_PassportIssueDate TabIndex=17 cssclass="select-date date-picker form-control col-md-9 col-xs-12"     Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_PassportExpiryDate TabIndex=18 cssclass="select-date date-picker form-control col-md-9 col-xs-12"   Maxlength="30" runat="server"></asp:textbox></td>	
		    </tr>
		    <tr>
   		          <td>&nbsp;</td>
   		          <td>&nbsp;</td>
		          <td class="validationtxt"><asp:RegularExpressionValidator  runat=server ControlToValidate=Tab1_PassportIssueDate  ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}" ErrorMessage="Date is required DD/MM/YYYY format." /></td>  
		          <td class="validationtxt"><asp:RegularExpressionValidator  runat=server ControlToValidate=Tab1_PassportExpiryDate  ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}" ErrorMessage="Date is required DD/MM/YYYY format." /></td>  		          
           </tr>		    	

		    <tr>			    
			    <td class="mainheadtxt">Labor Card No</td>
			    <td class="mainheadtxt">Labor Card Issuing Country</td>
			    <td class="mainheadtxt">Labor Card Issue Date</td>
			    <td class="mainheadtxt">Labor Card Expiry Date</td>
			    
		    </tr>
		    
		    <tr>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_LaborCardNo  TabIndex=19 cssclass="form-control  col-lg-11"   Maxlength="30" runat="server"></asp:textbox></td>	
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_LaborCardCountryDDList" TabIndex=20 AutoPostBack=false runat="server" cssclass="form-control  col-lg-11"></asp:dropdownlist></td>				    
			    <td class="mainheadtxt"><asp:textbox id=Tab1_LaborCardIssueDate TabIndex=21 cssclass="select-date date-picker form-control col-md-9 col-xs-12"     Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_LaborCardExpiryDate TabIndex=22 cssclass="select-date date-picker form-control col-md-9 col-xs-12"   Maxlength="30" runat="server"></asp:textbox></td>	
		    </tr>	
		    <tr>
   		          <td>&nbsp;</td>
   		          <td>&nbsp;</td>
		          <td class="validationtxt"><asp:RegularExpressionValidator  runat=server ControlToValidate=Tab1_LaborCardIssueDate  ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}" ErrorMessage="Date is required DD/MM/YYYY format." /></td>  
		          <td class="validationtxt"><asp:RegularExpressionValidator  runat=server ControlToValidate=Tab1_LaborCardExpiryDate  ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}" ErrorMessage="Date is required DD/MM/YYYY format." /></td>  
           </tr>	
		    <tr>
			    <td class="mainheadtxt">Business/Travel Number</td>
			    <td class="mainheadtxt">Visa Issued Date</td>
			    <td class="mainheadtxt">Visa Expiry Date</td>
			    <td class="mainheadtxt">Visa Issuing Country</td>
		    </tr>
 	        <tr>
 	            <td class="mainheadtxt"><asp:textbox id=Tab1_BVisaNumber     TabIndex=23 cssclass="form-control col-lg-11"   Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_BVisaIssueDate    TabIndex=24 cssclass="select-date date-picker form-control col-md-9 col-xs-12" Maxlength="30" runat="server" ></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_BVisaExpiryDate   TabIndex=25 cssclass="select-date date-picker form-control col-md-9 col-xs-12"  Maxlength="30" runat="server" ></asp:textbox></td>
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_BVisaCountryDDList" TabIndex=26 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>				    
		    </tr>	
		    <tr>
   		          <td>&nbsp;</td>
		          <td class="validationtxt"><asp:RegularExpressionValidator  runat=server ControlToValidate=Tab1_BVisaIssueDate  ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}" ErrorMessage="Date is required DD/MM/YYYY format." /></td>  
		          <td class="validationtxt"><asp:RegularExpressionValidator  runat=server ControlToValidate=Tab1_BVisaExpiryDate  ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}" ErrorMessage="Date is required DD/MM/YYYY format." /></td>  
		          <td>&nbsp;</td>
           </tr>
           	    			    
           <tr>			    
			    <td class="mainheadtxt">Person  ID(Issued by Ministry of Labour/WPS)</td>
			    <td class="mainheadtxt" colspan="3">&nbsp;</td>    
		    </tr>
             <tr>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_PersonID TabIndex=27 cssclass="form-control col-lg-11"   Maxlength="14" runat="server"></asp:textbox></td>	
			    <td class="mainheadtxt" colspan="3">&nbsp;</td>
		    </tr>
		    <tr>
		          <td class="validationtxt"><asp:RegularExpressionValidator  ControlToValidate="Tab1_PersonID" ValidationExpression="\d+" Display="Dynamic" ErrorMessage="Please enter numbers only"  runat="server"/>
		          <td class="validationtxt" colspan="3">&nbsp;</td>
           </tr>		    			    
	<tr class="PartButtons" align=center>
			<td  colspan="4">
			<center>
			    <asp:button id=Personal_Save runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Save"></asp:button>
			    &nbsp;&nbsp;&nbsp;
			    <asp:button id=Tab1_Back runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-default" Text="Back"></asp:button>
			</center>
			</td>
		</tr>		    
           			        
	    </table>
	    
 </asp:placeholder>
</td>
</tr>
<!--   End of Tab1 -->

<!---  Start:Tab 2 -->
<tr><td width="100%">
 <asp:PlaceHolder id=ContactInfoTab Runat="server" visible="false">
      
          <table width="99%" border="0" class="Partgrayblock">
            <tr><td class="x_title" colspan="4"><h2 class="text-primary">Contact Information</h2></td></tr>   
            <tr><td colspan="4">&nbsp;</td></tr>
            <tr>
			    <td class="mainheadtxt">Home Address<font color="red">*</font></td>
			    <td class="mainheadtxt">City<font color="red">*</font></td>
			    <td class="mainheadtxt">State/Province</td>
			    <td class="mainheadtxt">Country<font color="red">*</font></td>
		    </tr>
		    <tr>
			    <td class="mainheadtxt"><asp:textbox id=Tab2_HAddress1 cssclass="form-control col-lg-11" TabIndex=1 Maxlength="50" runat="server"></asp:textbox>
			                            <asp:textbox id=Tab2_HAddress2 cssclass="form-control col-lg-11" TabIndex=2 Maxlength="50" runat="server" ></asp:textbox>
			                            
			    </td>
			    <td class="mainheadtxt"><asp:textbox id=Tab2_HCity  cssclass="form-control col-lg-11" TabIndex=3 Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab2_HState  cssclass="form-control col-lg-11" TabIndex=4 Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab2_CountryDDList" TabIndex=5 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			    
		    </tr>
		    <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_HAddress1  ErrorMessage="Home Address is required." /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_HCity  ErrorMessage="City is required." /></td>                           
                <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt"><asp:RequiredFieldValidator  runat=server ControlToValidate=Tab2_CountryDDList  InitialValue="-1" ErrorMessage="Country is reqired." /></td> 		    
		    </tr>
	        <tr>
			    <td class="mainheadtxt">Work Address<font color="red">*</font></td>
			    <td class="mainheadtxt">City<font color="red">*</font></td>
			    <td class="mainheadtxt">State/Province</td>
			    <td class="mainheadtxt">Country<font color="red">*</font></td>
		    </tr>
		    <tr>
			    <td class="mainheadtxt"><asp:textbox id=Tab2_WAddress1 cssclass="form-control col-lg-11" TabIndex=5 Maxlength="50" runat="server"></asp:textbox>
			                            <asp:textbox id=Tab2_WAddress2 cssclass="form-control col-lg-11" TabIndex=6 Maxlength="50" runat="server" ></asp:textbox>
			                            
			    </td>
			    <td class="mainheadtxt"><asp:textbox id=Tab2_WCity cssclass="form-control col-lg-11" TabIndex=7  Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab2_WState  cssclass="form-control col-lg-11" TabIndex=8 Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab2_WCountryDDList"  TabIndex=9 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			    
		    </tr>
		     <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_WAddress1  ErrorMessage="Work Address is required." /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_WCity  ErrorMessage="Work City is required." /></td>                           
                <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt"><asp:RequiredFieldValidator  runat=server ControlToValidate=Tab2_WCountryDDList  InitialValue="-1" ErrorMessage="Country is reqired." /></td> 		    
		    </tr>

		    <tr>
			    <td class="mainheadtxt">Home Telephone<font color="red">*</font></td>
			    <td class="mainheadtxt">Work Telephone<font color="red">*</font></td>
			    <td class="mainheadtxt">Mobile</td>
			    <td class="mainheadtxt">Work Email<font color="red">*</font></td>
		    </tr>
		    <tr>		 
			    <td class="mainheadtxt"><asp:textbox id=Tab2_HPhone  cssclass="form-control col-lg-11" TabIndex=10 Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab2_WPhone  cssclass="form-control col-lg-11" TabIndex=11 Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab2_Mobile  cssclass="form-control col-lg-11" TabIndex=12 Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab2_WorkEmail cssclass="form-control col-lg-11" TabIndex=13  Maxlength="50" runat="server"></asp:textbox></td>
		    </tr>
		     <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_HPhone  ErrorMessage="Home Phone is required." /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_WPhone  ErrorMessage="Work Phone is required." /></td>                           
                <td class="validationtxt"></td>
                <td class="validationtxt"><asp:RequiredFieldValidator  runat=server ControlToValidate=Tab2_WorkEmail ErrorMessage="Work Email Address is reqired." />
                                          <asp:RegularExpressionValidator runat="server" ControlToValidate=Tab2_WorkEmail ErrorMessage="Email Address format is invaid." ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" />
                </td> 		    
		    </tr>
	<tr class="PartButtons" align=center>
			<td  colspan="4">
			<center>
			    <asp:button id=Contact_Save runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Save"></asp:button>
			    &nbsp;&nbsp;&nbsp;
			    <asp:button id=Tab2_Back runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-default" Text="Back"></asp:button>
			</center>
			</td>
		</tr>		
		    
	    </table>
	
 </asp:placeholder>
</td>
</tr>
<!--   End of Tab2 -->

<!--   Start of Tab3 -->
<tr><td width="100%">
 <asp:PlaceHolder id="DependentTab" Runat="server" visible="false"> 
        <table width="99%" border="0" class="Partgrayblock">        
            <tr><td class="x_title" colspan="4"><h2 class="text-primary">Dependent Information</h2></td></tr>   
            <tr><td colspan="4">&nbsp;</td></tr>
		    <tr>
			    <td class="mainheadtxt">Name<font color="red">*</font></td>
			    <td class="mainheadtxt">Relationship<font color="red">*</font></td>
			    <td class="mainheadtxt">Date Of Birth<font color="red">*</font></td>
			    <td class="mainheadtxt">Gender<font color="red">*</font></td>
		    </tr>
		    <tr>
			    <td class="mainheadtxt"><asp:textbox id=Tab3_Name  cssclass="form-control col-lg-11" TabIndex=1 Maxlength="50" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:dropdownlist id=Tab3_RelationshipDDList  TabIndex=2 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab3_DOB  cssclass="select-date date-picker form-control col-md-7 col-xs-12" TabIndex=3 Maxlength="10" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:dropdownlist id=Tab3_GenderType  TabIndex=4  AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			    
		    </tr>
		    <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab3_Name  Display="Dynamic" ErrorMessage="Dependent Name is required." /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab3_RelationshipDDList Display="Dynamic" InitialValue="-1" ErrorMessage="Relationship is required." /></td>                           
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab3_DOB  Display="Dynamic" ErrorMessage="Date of Birth is required." />
                		              <br /><asp:RegularExpressionValidator  runat=server ControlToValidate=Tab3_DOB  Display="Dynamic" ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}" ErrorMessage="Date is required DD/MM/YYYY format." />
                </td>
                <td class="validationtxt"><asp:RequiredFieldValidator  runat=server ControlToValidate=Tab3_GenderType Display="Dynamic" InitialValue="-1" ErrorMessage="Gender Type is reqired." /></td> 		    
		    </tr>
		     	    
		    <tr>			    
			    <td class="mainheadtxt">Passport No</td>
			    <td class="mainheadtxt">Passport Issuing Country</td>
			    <td class="mainheadtxt">Passport Issue Date</td>
			    <td class="mainheadtxt">Passport Expiry Date</td>
			    
		    </tr>
		    <tr>
			    <td class="mainheadtxt"><asp:textbox id=Tab3_PassportNo  cssclass="form-control col-lg-9" TabIndex=5   Maxlength="30" runat="server"></asp:textbox></td>	
			    <td class="mainheadtxt"><asp:dropdownlist id=Tab3_PassportCountryDDList TabIndex=6 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab3_PassportIssueDate    cssclass="select-date date-picker form-control col-md-7 col-xs-12" TabIndex=7  Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab3_PassportExpiryDate   cssclass="select-date date-picker form-control col-md-7 col-xs-12" TabIndex=8  Maxlength="30" runat="server"></asp:textbox></td>	
		    </tr>
		   <tr>
   		          <td>&nbsp;</td>
   		          <td>&nbsp;</td>
		          <td class="validationtxt"><asp:RegularExpressionValidator  runat=server Display="Dynamic" ControlToValidate=Tab3_PassportIssueDate  ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}" ErrorMessage="Date is required DD/MM/YYYY format." /></td>  
		          <td class="validationtxt"><asp:RegularExpressionValidator  runat=server Display="Dynamic" ControlToValidate=Tab3_PassportExpiryDate  ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}" ErrorMessage="Date is required DD/MM/YYYY format." /></td>  		          
           </tr>		    	

		    <tr>
			    <td class="mainheadtxt">Visa No</td>
			    <td class="mainheadtxt">Visa Type</td>
			    <td class="mainheadtxt">Visa Issue Date</td>
			    <td class="mainheadtxt">Visa Expiry Date</td>			    
		    </tr>
		    <tr>
			    <td class="mainheadtxt"><asp:textbox id=Tab3_VisaNumber     cssclass="form-control col-lg-9" TabIndex=9 Maxlength="30" runat="server"></asp:textbox></td>	
			    <td class="mainheadtxt"><asp:dropdownlist id=Tab3_VisaType  TabIndex=10 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab3_VisaIssueDate  cssclass="select-date date-picker form-control col-md-7 col-xs-12" TabIndex=11 Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab3_VisaExpiryDate cssclass="select-date date-picker form-control col-md-7 col-xs-12" TabIndex=12 Maxlength="30" runat="server"></asp:textbox></td>		    
		    </tr>
		   <tr>   <td>&nbsp;</td>
   		          <td>&nbsp;</td>
		          <td class="validationtxt"><asp:RegularExpressionValidator  runat=server Display="Dynamic" ControlToValidate=Tab3_VisaIssueDate  ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}" ErrorMessage="Date is required DD/MM/YYYY format." /></td>  
		          <td class="validationtxt"><asp:RegularExpressionValidator  runat=server Display="Dynamic" ControlToValidate=Tab3_VisaExpiryDate  ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}" ErrorMessage="Date is required DD/MM/YYYY format." /></td>  		          
           </tr>		    	
		    <tr>
			    <td class="mainheadtxt">Visa Issue Country</td>
			    <td class="mainheadtxt">&nbsp;</td>
			    <td class="mainheadtxt">&nbsp;</td>
			    <td class="mainheadtxt">&nbsp;</td>			    
		    </tr>
		    <tr>  
			    <td class="mainheadtxt"><asp:dropdownlist id=Tab3_VisaIssueCountryID  TabIndex=13 AutoPostBack=false runat="server" cssclass="form-control  col-lg-11"></asp:dropdownlist></td>
			    <td class="mainheadtxt">&nbsp;</td>
			    <td class="mainheadtxt">&nbsp;</td>
			    <td class="mainheadtxt">&nbsp;</td>			    
            </tr>
          	<tr class="PartButtons" align=center>
			<td  colspan="4">
			<center>
			    <asp:button id=DP_Save runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Save"></asp:button>
			    &nbsp;&nbsp;&nbsp;
                <asp:button id=DP_Cancel runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-danger" Text="Reset"></asp:button>
                &nbsp;&nbsp;&nbsp;
			    <asp:button id=Tab3_Back runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-default" Text="Back"></asp:button>
			</center>
			</td>
		    </tr>			    

             <tr>
                <td colspan="4" align=center><asp:label id="DPmessage" runat="server" visible=false /></td>
            </tr>

            <tr><td colspan="4"><hr /></td></tr>
            
            <!-- Datagrid for dependents -->
            <tr>
                <td colspan="4">
                        <asp:DataGrid ID="DPGrid" CssClass="table table-striped" runat="server" Width="100%" PageSize="5" AllowPaging="True" DataKeyField="dependentID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanged="DPGrid_PageIndexChanged"   OnDeleteCommand="DPGrid_DeleteCommand" OnEditCommand="DPGrid_EditCommand">
                                       
                          <Columns>
                                <asp:BoundColumn HeaderText="Name" DataField="FullName" ItemStyle-Width="15%"></asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Relationship" DataField="RelationshipName" ItemStyle-Width="15%"></asp:BoundColumn>
                                <asp:BoundColumn HeaderText="DOB" DataField="DOB" ItemStyle-Width="12%"></asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Gender" DataField="GenderName" ItemStyle-Width="10%" ></asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Passport No" DataField="PassportNumber" ItemStyle-Width="15%"> </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="PP Issue Country" DataField="CountryName" ItemStyle-Width="12%"></asp:BoundColumn>
                                <asp:BoundColumn HeaderText="PP Issue Date" DataField="PP_IssueDate" ItemStyle-Width="12%"></asp:BoundColumn>
                                <asp:BoundColumn HeaderText="PP Exp Date" DataField="PP_ExpiryDate" ItemStyle-Width="12%"></asp:BoundColumn>
                                <asp:BoundColumn Visible=false HeaderText="Visa_Number" DataField="Visa_Number" ItemStyle-Width="0%"></asp:BoundColumn>
                                <asp:BoundColumn Visible=false HeaderText="Visa_TypeID" DataField="Visa_TypeID" ItemStyle-Width="0%"></asp:BoundColumn>
                                <asp:BoundColumn Visible=false HeaderText="Visa_IssueDate" DataField="Visa_IssueDate" ItemStyle-Width="0%"></asp:BoundColumn>
                                <asp:BoundColumn Visible=false HeaderText="Visa_ExpiryDate" DataField="Visa_ExpiryDate" ItemStyle-Width="0%"></asp:BoundColumn>
                                <asp:BoundColumn Visible=false HeaderText="Visa_IssueCountryID" DataField="Visa_IssueCountryID" ItemStyle-Width="0%"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="" ItemStyle-Width="8%">
                                    <ItemTemplate> 
                                         <asp:LinkButton name="Edit" commandName="Edit" Text="Edit" CausesValidation="false" runat="server" /> 
                                    </ItemTemplate>
                               </asp:TemplateColumn>                    
                               <asp:TemplateColumn HeaderText="" ItemStyle-Width="8%">
                                   <ItemTemplate> 
                                      <asp:LinkButton name="Delete" commandName="Delete" Text="Delete" CausesValidation="false" runat="server" OnClientClick="return confirm('Are you sure you want to delete the record?');" /> 
                                   </ItemTemplate>
                                </asp:TemplateColumn>                                
                           </Columns>     
                            <FooterStyle CssClass="DashGridFooter" />
                            <SelectedItemStyle CssClass="DashGridSelectedItem" />
                            <PagerStyle CssClass="GridPagerItem" HorizontalAlign="Center" Mode="NumericPages" />
                            <AlternatingItemStyle CssClass="odd pointer" />
                            <ItemStyle CssClass="even pointer" />
                            <HeaderStyle CssClass="headings" />
                        </asp:DataGrid>
                        <br/><center><asp:label id ="emptyRow2" value="" visible=false runat="server" /></center>          
                </td>
               </tr>           			    
        </table>
	
  </asp:placeholder>
</td>
</tr>
<!--  End of Tab3 -->

<!--  Start: Tab4 -->
<tr><td width="100%">
 <asp:PlaceHolder id="EmergencyContactTab" Runat="server" visible="false">
      <table width="99%" border="0" class="Partgrayblock">
            <!-- Add/Edit Emergency Contact details. -->
            <tr><td class="x_title" colspan="4"><h2 class="text-primary">Emergency Contacts</h2></td></tr>           
		    <tr><td colspan="4">&nbsp;</td></tr>
		    <tr>
			    <td class="mainheadtxt">Name<font color="red">*</font></td>
			    <td class="mainheadtxt">Relationship<font color="red">*</font></td>
			    <td class="mainheadtxt">Contact Priority<font color="red">*</font></td>
			    <td class="mainheadtxt"></td>
		    </tr>
		    <tr>
			    <td class="mainheadtxt"><asp:textbox id=Tab4_Name cssclass="form-control col-lg-11" TabIndex=1 Maxlength="50" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:dropdownlist id=Tab4_RelationshipDDList cssclass="form-control col-lg-11" TabIndex=2 AutoPostBack=false runat="server"></asp:dropdownlist></td>
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab4_ContactPrioirtyDDList" cssclass="form-control col-lg-11" TabIndex=3 AutoPostBack=false runat="server"></asp:dropdownlist></td>			    
			    <td class="mainheadtxt"></td>
			</tr>
            <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab4_Name  ErrorMessage="Contact Name is required." /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab4_RelationshipDDList InitialValue="-1" ErrorMessage="Relationship is required." /></td>                           
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab4_ContactPrioirtyDDList InitialValue="-1"  ErrorMessage="Contact Priority is required." /></td>
                <td class="validationtxt">&nbsp;</td> 		    
		    </tr>
		    <tr>
			    <td class="mainheadtxt">Home Phone<font color="red">*</font></td>
			    <td class="mainheadtxt">Mobile Phone<font color="red">*</font></td>
			    <td class="mainheadtxt">Work Phone</td>
			    <td class="mainheadtxt">Email Address</td>
		    </tr>
		    <tr>
			    <td class="mainheadtxt"><asp:textbox id=Tab4_HomePhone  cssclass="form-control col-lg-11" TabIndex=4   Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab4_MobilePhone cssclass="form-control col-lg-11" TabIndex=5  Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab4_WorkPhone   cssclass="form-control col-lg-11" TabIndex=6  Maxlength="30" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab4_EmailAddress cssclass="form-control col-lg-11" TabIndex=7 Maxlength="50" runat="server"></asp:textbox></td>			    
		    </tr>
            <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab4_HomePhone    ErrorMessage="Home Phone is required." /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab4_MobilePhone  ErrorMessage="Mobile Phone is required." /></td>                           
                <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt"><asp:RegularExpressionValidator runat="server" ControlToValidate=Tab4_EmailAddress ErrorMessage="Email Address format is invaid." ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" /></td> 		    
		    </tr>
	
          	<tr class="PartButtons" align=center>
			<td  colspan="4">
			<center>
			    <asp:button id=EC_Save runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Save"></asp:button>
			    &nbsp;&nbsp;&nbsp;
                <asp:button id=EC_Cancel runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-danger" Text="Reset"></asp:button>
                &nbsp;&nbsp;&nbsp;
			    <asp:button id=Tab4_Back runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-default" Text="Back"></asp:button>
			</center>
			</td>
		    </tr>	
             <tr>
                <td colspan="4" align=center><asp:label id="ECmessage" runat="server" visible=false /></td>
            </tr>
            <tr><td colspan="4"><hr /></td></tr>
            
            <!-- Emergency Contact Grid -->
             <tr>
                <td colspan="4">
                    <asp:DataGrid ID="ECGrid" CssClass="table table-striped" runat="server" Width="100%" PageSize="5" AllowPaging="True" DataKeyField="EContactID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanged="ECGrid_PageIndexChanged"  OnDeleteCommand="ECGrid_DeleteCommand" OnEditCommand="ECGrid_EditCommand">
                                   
                      <Columns>
                            <asp:BoundColumn HeaderText="Contact Name" DataField="Contact_Name" ItemStyle-Width="18%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Relationship" DataField="RelationshipName" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Contact Priority" DataField="Contact_PriorityName" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Home Phone" DataField="Home_Phone" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Mobile" DataField="Mobile" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Work Phone" DataField="WorkPhone" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Email" DataField="Email_Addr" ItemStyle-Width="16%"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="" ItemStyle-Width="8%">
                                    <ItemTemplate> 
                                         <asp:LinkButton name="Edit" commandName="Edit" Text="Edit" CausesValidation="false" runat="server" /> 
                                    </ItemTemplate>
                            </asp:TemplateColumn>                    
                            <asp:TemplateColumn HeaderText="" ItemStyle-Width="8%">
                                   <ItemTemplate> 
                                      <asp:LinkButton name="Delete" commandName="Delete" Text="Delete" CausesValidation="false" runat="server" OnClientClick="return confirm('Are you sure you want to delete the record?');" /> 
                                   </ItemTemplate>
                            </asp:TemplateColumn>                                
                       </Columns>     
                        <FooterStyle CssClass="DashGridFooter" />
                        <SelectedItemStyle CssClass="DashGridSelectedItem" />
                        <PagerStyle CssClass="GridPagerItem" HorizontalAlign="Center" Mode="NumericPages" />
                        <AlternatingItemStyle CssClass="odd pointer" />
                        <ItemStyle CssClass="even pointer" />
                        <HeaderStyle CssClass="headings" />
                    </asp:DataGrid>
                    </br>
                    <center><asp:label id ="emptyRow1" value="" visible=false runat="server" /></center>           
           
                </td>
            </tr>
	       </table>   	 
	       
 </asp:placeholder>
</td>
</tr>

<!-- Start: Tab 7 -->
<tr><td width="100%">
 <asp:PlaceHolder id="EmployeeDocumentsTab" Runat="server" visible="false">
  
        <table width="99%" border="0" class="Partgrayblock">
        <tr><td colspan="4"><span class="maintitledesign">Employee E-Docket</span></td></tr>
            <tr><td colspan="4">&nbsp;</td></tr>
             <tr>
			    <td class="mainheadtxt" colspan="2">Select the document to upload<small>(Maximum File Size:4MB)</small><font color="red">*</font></td>
			    <td class="mainheadtxt">Document Name<font color="red">*</font></td>
			    <td class="mainheadtxt">Document Type<font color="red">*</font></td>
			    
		    </tr>
		    <tr>
			    <td class="mainheadtxt" colspan="2"><input id="Tab8_FileName" type="file" class="textfield" TabIndex=1 runat="server" size="50"></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab8_DocumentName  cssclass="form-control" TabIndex=2 Maxlength="100" width="200px" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:dropdownlist id=Tab8_DocumentType cssclass="form-control" TabIndex=3 AutoPostBack=false runat="server" Width="220px"></asp:dropdownlist></td>
			  	    
		    </tr>	
           <tr>
		        <td class="validationtxt" colspan="2"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab8_FileName ErrorMessage="Select the file to upload." /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab8_DocumentName  ErrorMessage="Document Name is required." /></td>                           
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab8_DocumentType InitialValue=-1 ErrorMessage="Document Type is required." /></td>               
            
		    </tr>		    
		    <tr>
		        <td class="mainheadtxt" colspan="4">Comments<asp:textbox id=Tab8_Comments  cssclass="form-control" TabIndex=4 size="100" Maxlength="100" runat="server"></asp:textbox></td>
		     </tr>
	 	    <tr><td colspan="4">&nbsp;</td></tr>
                      	<tr class="PartButtons" align=center>
			<td  colspan="4">
			<center>
			    <asp:button id=Doc_Upload runat="server" CausesValidation="True" CssClass="Button UploadButton" Text="Upload"></asp:button>
			    &nbsp;&nbsp;&nbsp;
			    <asp:button id=Tab6_Back runat="server" CausesValidation="false" CssClass="Button BackButton" Text="Back"></asp:button>
			</center>
			</td>
		    </tr>	
            <tr>
                <td colspan="4" align=center><asp:label id="docmessage" runat="server" visible=false /></td>
            </tr>    			
           <tr><td colspan="4"><hr /></td></tr>

            <tr>
                <td colspan="4">
                    <asp:DataGrid ID="DOCGrid" CssClass="Tabular2" runat="server" Width="100%" PageSize="5" AllowPaging="True" DataKeyField="DocumentID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanged="DOCGrid_PageIndexChanged"                                  OnCancelCommand="DOCGrid_CancelCommand" OnDeleteCommand="DOCGrid_DeleteCommand" OnEditCommand="DOCGrid_EditCommand" OnUpdateCommand="DOCGrid_UpdateCommand">
                                   
                      <Columns>
                            <asp:TemplateColumn HeaderText="Document Name" ItemStyle-Width="35%">
                                
                                <ItemTemplate>
                                    <a id="A1" href='<%# "~/documents/" + Eval("DocumentName")%>' runat="server" target="_blank"><%# Eval("DocumentName")%></a> 
                                </ItemTemplate> 
                            </asp:TemplateColumn>
                
                            <asp:BoundColumn HeaderText="Document Type" DataField="DocumentTypeName" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Comments" DataField="Doc_Comments" ItemStyle-Width="35%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Last Updated" DataField="Date_Updated" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="" ItemStyle-Width="8%">
                                   <ItemTemplate> 
                                      <asp:LinkButton name="Delete" commandName="Delete" Text="Delete" CausesValidation="false" runat="server" OnClientClick="return confirm('Are you sure you want to delete the document?');" /> 
                                   </ItemTemplate>
                            </asp:TemplateColumn>                                                   
                       </Columns>     
                        <FooterStyle CssClass="DashGridFooter" />
                        <SelectedItemStyle CssClass="DashGridSelectedItem" />
                        <PagerStyle CssClass="GridPagerItem" HorizontalAlign="Center" Mode="NumericPages" />
                        <AlternatingItemStyle CssClass="DashGridAltItem" />
                        <ItemStyle CssClass="DashGridItem" />
                        <HeaderStyle CssClass="DashGridHeader" />
                    </asp:DataGrid>
                    <br/>
                    <center><asp:label id ="emptyRow3" value="" visible=false runat="server" /></center>           
           
                </td>
            </tr>           				    	    
	     </table>
	   
 </asp:placeholder>
</td>
</tr>
<!--  End of Tab 7 -->


</asp:PlaceHolder>
<!--- Common for all tabs --->

<tr class="PartBrown" >
   <td width="100%" align=center><asp:label id="message" runat="server" visible=false /></td>			
</tr> 			


</table>
	<!--   End of Data Area -->
										
</master:content>

