<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserAccounts.aspx.cs" Inherits="SchoolNet.UserAccounts" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table border="0" cellspacing="0" cellpadding="0" height="100%" width="100%">
 <tr width="100%">
		<td class="x_title"><h2 class="text-primary">User Accounts Management</span></td>
	</tr>	
 <asp:PlaceHolder id="CertificationTab" Runat="server" visible="true">
 <tr><td width="100%"> 
      <table width="100%" border="0" class="Partgrayblock">
            <!-- Add/Edit Leave Type -->
            <tr><td colspan="4">&nbsp;</td></tr>
        <asp:PlaceHolder id="AddAccount" runat="server" visible="true">
		    <tr>
			    <td>Employee ID<font color="red">*</font></td>
		        <td>Access Level<font color="red">*</font></td>
			    <td>HR System User Name<font color="red">*</font><br />(<small>Work Email address recommended)</small></td>
  			    <td>Status</td>
		    </tr>
 	        <tr>
   		        <td><asp:textbox id=Tab1_EmployeeID cssclass="form-control" TabIndex=1 Maxlength="20" runat="server" ></asp:textbox></td>
			    <td><asp:dropdownlist id="Tab1_RoleTypeList"  TabIndex=2 autopostback=true CssClass="form-control" runat="server"></asp:dropdownlist></td>
			    <td><asp:textbox id=Tab1_UserName   TabIndex=5 cssclass="form-control col-lg-11" Maxlength="50" runat="server" ></asp:textbox></td>
			    <td><asp:RadioButton ID="Tab1_RadioButton1" runat="server" Text="Enabled" checked=true value ="1"  GroupName="AccountStatus" AutoPostBack="false" />  
                                        &nbsp;&nbsp;&nbsp;<asp:RadioButton ID="Tab1_RadioButton2" runat="server"  Text="Disabled"  value = "0" GroupName="AccountStatus" AutoPostBack="false" />                    
			    </td>
		    </tr>	
	        <tr>
	            <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_EmployeeID  ErrorMessage="Employee ID is Required." /></td>                        
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_RoleTypeList  InitialValue =-1 ErrorMessage="Role Type is Required." /></td>                        
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_UserName  ErrorMessage="User Name is Required." />
                                           <asp:RegularExpressionValidator id=RegExp_EmailAddress runat="server" ControlToValidate="Tab1_UserName"  ErrorMessage="Please enter a valid email address." ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
                
                </td> 
                <td>&nbsp;</td>
 		    </tr>   
		    <tr>
			    
			    <td>Temp Password<font color="red">*</font></td>
			    <td>Confirm Password<font color="red">*</font></td>
			    <td>&nbsp;</td>
                <td>&nbsp;</td>
		    </tr>
 	        <tr>
			    
			    <td><asp:textbox id=Tab1_password   TextMode="Password"  TabIndex=6 cssclass="form-control" Maxlength="15" runat="server" ></asp:textbox></td>
			    <td><asp:textbox id=Tab1_ConfirmPassword TextMode="Password"  TabIndex=7 cssclass="form-control"  Maxlength="15" runat="server" ></asp:textbox></td>
			    <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>	
	        <tr>
                                       
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_password  ErrorMessage="Password is Required." />
                                           <asp:RegularExpressionValidator  runat=server ControlToValidate=Tab1_password  ValidationExpression="(?=^.{8,15}$)(?=.*\d)(?=.*\W+)(?![.\n])(?=.*[a-zA-Z]).*$" ErrorMessage="Password length should be greater than 8 and less than 15 characters. Password should contain at least one digit [0-9], one alphabet [A-Z] [a-z] and one special character such as [@#&*!]." /> 
                 </td>                        
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_ConfirmPassword  ErrorMessage="Confirm Password is Required." />                        
                                          <asp:CompareValidator      runat="server" ErrorMessage="Passwords do not match!"  ControlToValidate="Tab1_ConfirmPassword"  ControlToCompare="Tab1_password"></asp:CompareValidator></td>
	        
                <td class="validationtxt">&nbsp;</td>                             
                <td class="validationtxt">&nbsp;</td>                             
 		    </tr>    		             
	        <tr class="PartButtons" align=center>
			<td  colspan="4">
			<center>
			    <asp:button id=PortalAcct_Save runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Save"></asp:button>
			    &nbsp;&nbsp;&nbsp;
			    <asp:button id=Reset runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-default" Text="Reset"></asp:button>
			</center>
			</td>
            </tr>
            <tr>
                <td colspan="3" align=center><asp:label id="Hmessage" runat="server" visible=false />&nbsp;
                 <asp:Label id="Tab1_keyField" runat="server" visible=false />
               </td>
            </tr>
            
            </asp:PlaceHolder>            
            <!-- Edit Account -->
            <asp:PlaceHolder id="EditAccount" runat="server" visible="false">  
            
            <tr>
			    <td>Employee ID<font color="red">*</font></td>
		        <td>Access Level<font color="red">*</font></td>
			    <td>Portal User Name</td>
			    <td>Account Status</td>
		    </tr>
 	        <tr>
   		        <td><asp:textbox id=Tab2_EmployeeID ReadOnly=true cssclass="form-control" TabIndex=1 Maxlength="20" runat="server" ></asp:textbox></td>
			    <td><asp:dropdownlist id="Tab2_RoleTypeList"  TabIndex=2 autopostback=true CssClass="form-control" runat="server"></asp:dropdownlist></td>
			    <td><asp:textbox id=Tab2_UserName   ReadOnly=true TabIndex=2 cssclass="form-control  col-lg-11" Maxlength="50" runat="server" ></asp:textbox></td>
			    <td><asp:RadioButton ID="Tab2_RadioButton1" runat="server" Text="Enabled" value ="1" GroupName="AccountStatus" AutoPostBack="false" />  
                                        &nbsp;&nbsp;&nbsp;<asp:RadioButton ID="Tab2_RadioButton2" runat="server" Text="Disabled"  value = "0" GroupName="AccountStatus" AutoPostBack="false" /> 
			    </td>
		    </tr>	
	        <tr>
	            <td class="validationtxt">&nbsp;</td>                        
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_RoleTypeList  InitialValue =-1 ErrorMessage="Role Type is Required." /></td>                        
                <td>&nbsp;</td>
                <td>&nbsp;</td>
 		    </tr>   
	        <tr class="PartButtons" align=center>
			<td  colspan="4">
			<center>
			    <asp:button id=PortalEdit_Save runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Save"></asp:button>
			    &nbsp;&nbsp;&nbsp;
			    <asp:button id=Edit_Reset runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-default" Text="Reset"></asp:button>
			</center>
			</td>
            </tr>
            <tr>
                <td colspan="3" align=center><asp:label id="Editmessage" runat="server" visible=false />&nbsp;
                 <asp:Label id="Tab2_keyField" runat="server" visible=false />
               </td>
            </tr>
            </asp:PlaceHolder>
            
             <tr>
                <td colspan="4" >
                    <asp:DataGrid ID="UsersGrid" CssClass="full-width table table-striped responsive-utilities jambo_table" runat="server" Width="100%"  DataKeyField="EmpId" AutoGenerateColumns="False" CellPadding="4" GridLines="None" OnEditCommand="Grid_EditCommand">
                      <Columns>
                            <asp:BoundColumn HeaderText="Employee ID" DataField="Employee_ID" ItemStyle-Width="8%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Employee Name" DataField="Emp_Name"   ItemStyle-Width="20%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="User Name" DataField="UserName" ItemStyle-Width="21%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Role Name" DataField="RoleName" ItemStyle-Width="10%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Business Unit" DataField="DivisionName" ItemStyle-Width="20%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Location" DataField="LocationName" ItemStyle-Width="18%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Status" DataField="AccountStatus" ItemStyle-Width="8%"></asp:BoundColumn>
                            <asp:BoundColumn Visible=false HeaderText="pwd" DataField="password" ItemStyle-Width="0%"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="" ItemStyle-Width="4%">
                                    <ItemTemplate> 
                                         <asp:ImageButton ImageUrl="~/images/buttons/blue_edit1.png" name="Edit" commandName="Edit" alt="Edit" ToolTip="Edit" CausesValidation="false" runat="server" height="28" width="28" />  
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
                    <br /><center><asp:label id ="emptyRow" value="" visible=false runat="server" /></center>           
           
                </td>
            </tr>
	       </table>   	 
	       
 </td>
</tr>
</asp:placeholder>
<!--  End of Tab 4 -->

</table>
	<!--   End of Data Area -->
										
</master:content>




