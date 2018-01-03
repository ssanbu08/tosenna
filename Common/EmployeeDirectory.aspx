<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeDirectory.aspx.cs" Inherits="SchoolNet.EmployeeDirectory" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table  border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
  <!--   Search Box -->
 <ASP:PlaceHolder id="EmpSearchBox" Runat="server">
    <tr width="100%">
		<td class="colheader"><span class="maintitledesign">Employee Directory</span></td>
	</tr>	
    <!---  Data Content Area -->						
<asp:PlaceHolder id=searchDataArea Runat="server">
<tr width="100%">
  <td>
  <div class="ManageEmpGrid">
  <asp:DataGrid ID="Grid" runat="server" Width="100%" PageSize="10" AllowPaging="True" AllowSorting="True" DataKeyField="EmpId" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanged="Grid_PageIndexChanged" OnSorting="Grid_SortCommand" OnEditCommand="Grid_EditCommand" >
                        
              <Columns>
                 <asp:TemplateColumn HeaderText="Emp ID" SortExpression="Employee_ID" ItemStyle-Width="12%">
                                <ItemTemplate> 
                                     <asp:LinkButton name="Edit" commandName="Edit"  CausesValidation="false" runat="server" ToolTip="Click to view employee information"> <%# Eval("Employee_ID")%></asp:LinkButton>                                                                 
                                </ItemTemplate>
                    </asp:TemplateColumn>
                    
                    <asp:TemplateColumn HeaderText="Employee Name" SortExpression="Name" ItemStyle-Width="15%">
                                <ItemTemplate> 
                                     <asp:LinkButton name="Edit" commandName="Edit"  CausesValidation="false" runat="server" ToolTip="Click to view employee information"> <%# Eval("Name")%></asp:LinkButton>                                                                 
                                </ItemTemplate>
                    </asp:TemplateColumn>              
                    <asp:BoundColumn HeaderText="Job Title" DataField="Designation" SortExpression="Designation" ItemStyle-Width="15%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Emp Status" DataField="EmpStatusName" visible=false  SortExpression="EmpStatusName" ItemStyle-Width="0%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Division" DataField="DivisionName" SortExpression="DivisionName" ItemStyle-Width="13%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Location" DataField="DivisionLocation"  SortExpression="DivisionLocation" ItemStyle-Width="15%"></asp:BoundColumn>                                        
                    <asp:BoundColumn HeaderText="Department" DataField="DeptName" SortExpression="DeptName"  ItemStyle-Width="15%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Supervisor Name" DataField="LineManager" SortExpression="LineManager" ItemStyle-Width="15%"></asp:BoundColumn>
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

	<tr>
		<td>
		    <table width="100%" border="0" class="Partgrayblock">
        <tr class="PartWhite" align=center>
            <td valign="left" class="mainheadtxt">&nbsp;&nbsp;
                <a id="adv_search" href="#" runat="server"><IMG src="~/images/buttons/blue_adv_search.jpg" runat="server" alt="Advanced Search" title="Advanced Search" height="27" width="28" style="float:left;">
                <span style="text-decoration:underline;color:#FFF;float:left;margin:0;padding:5px 0 0 0;">Advanced Search</span></a>
            </td>
			<td  align="right" colspan="2" class="mainsearchtxt">
            Employee ID&nbsp;<asp:textbox id=empID cssclass="textfield" Maxlength="30" runat="server"></asp:textbox>
			</td>
			<td class="mainheadtxt" align=left>
                <IMG src="~/images/buttons/separator.png" runat="server" alt= "" height="30" width="2" style="vertical-align:bottom;"/>&nbsp;                
                <asp:ImageButton id=Search runat="server" CausesValidation="True" ImageUrl="~/images/buttons/blue_search.png" ToolTip="Search" alt="Search" height="30" width="30" style="vertical-align:middle;"></asp:ImageButton>&nbsp
                <IMG src="~/images/buttons/separator.png" runat="server" alt= "" height="30" width="2" style="vertical-align:bottom;"/>&nbsp;                
			    <asp:ImageButton id=Reset runat="server" CausesValidation="True" ImageUrl="~/images/buttons/blue_reset.png" ToolTip="Reset" alt="Reset" height="30" width="30" style="vertical-align:middle;"></asp:ImageButton>&nbsp;
                <IMG src="~/images/buttons/separator.png" runat="server" alt= "" height="30" width="2" style="vertical-align:bottom;"/>&nbsp;                
                <asp:ImageButton id=Export runat="server" CausesValidation="True" ImageUrl="~/images/buttons/blue_export2.png" ToolTip="Export" alt="Export" height="30" width="30" style="vertical-align:middle;" visible=false></asp:ImageButton>&nbsp;  
                <IMG src="~/images/buttons/separator.png" runat="server" alt= "" height="30" width="2" style="vertical-align:bottom;"/>&nbsp;                
            </td>
        </tr>		
		    <tr>
			    <td class="mainheadtxt">Employee Name</td>
			    <td class="mainheadtxt">Supervisor Name</td>
			    <td class="mainheadtxt">Employement Status</td>
                <td class="mainheadtxt">&nbsp;</td>
		    </tr>
		    <tr>
			    <td class="mainheadtxt"><asp:textbox id=empName  Maxlength="50" width="180px" runat="server" CssClass="textfield"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=mgrName  Maxlength="50" width="180px" runat="server" CssClass="textfield"></asp:textbox></td>
  			    <td class="mainheadtxt"><asp:dropdownlist id="empStatusDDList" AutoPostBack=false runat="server" Width="180px" CssClass="textfield"></asp:dropdownlist></td>			    
                <td class="mainheadtxt">&nbsp;</td>
		    </tr>

		    <tr>			   
			    <td class="mainheadtxt">Designation</td>
			    <td class="mainheadtxt">Division</td>
			    <td class="mainheadtxt">Location/Country</td>
			    <td class="mainheadtxt">&nbsp;</td>
		    </tr>
		    <tr>
			    <td class="mainheadtxt"><asp:dropdownlist id="jobTitleDDList" AutoPostBack=false runat="server" Width="180px" CssClass="textfield"></asp:dropdownlist></td>
			    <td class="mainheadtxt"><asp:dropdownlist id="businessUnitDDList" AutoPostBack=true onselectedindexchanged="businessUnitDDList_SelectedIndexChanged" runat="server" Width="180px" CssClass="textfield"></asp:dropdownlist></td>
			    <td class="mainheadtxt"><asp:dropdownlist id="DivisionLocationList" AutoPostBack=false runat="server" Width="180px" CssClass="textfield"></asp:dropdownlist></td>			    
			    <td class="mainheadtxt">&nbsp;</td>
		    </tr>
            <tr><td colspan="4">&nbsp;</td></tr>
	    </table>
	   </td>						
	</tr>
</asp:PlaceHolder>


<!--    Edit Employee Data Area -->
<asp:PlaceHolder id=EditArea Runat="server" visible="false">
 
 <tr width="100%"><td class="colheader"><span class="maintitledesign">Employee Profile Info</span></td></tr>
 <tr>
  <td>
    <table width="100%" border="0" class="Partgrayblock">
       <tr>
	      <td valign="top" width="20%"> <asp:image id='profile' width="200" height="200" runat="server" /></td>
	      <td valign="top" width="2%">&nbsp;</td>
	     	      <td valign="top" width="38%" align="left">
	                    <table>
	                        <tr><td align="right"><span class="mainheadtxt3">Employee Name&nbsp;&nbsp;</span></td><td><asp:label id="lblEmployeeName" runat="server" cssclass="mainheadtxt2" /></td></tr>
                            <tr><td align="right"><span class="mainheadtxt3">Current Designation&nbsp;&nbsp;</span></td><td><asp:Label id="lblJobTitle" runat="server" cssclass="mainheadtxt2"></asp:Label></td></tr>	
                            <tr><td align="right"><span class="mainheadtxt3">Work Location&nbsp;&nbsp;</span></td><td><asp:Label id="lblJobLocation" runat="server" cssclass="mainheadtxt2" /></td></tr>	
                            <tr><td align="right"><span class="mainheadtxt3">Business Unit&nbsp;&nbsp;</span></td><td><asp:Label id="lblDivision" runat="server" cssclass="mainheadtxt2" /></td></tr>	       
                            <tr><td align="right"><span class="mainheadtxt3">Business Unit Location&nbsp;&nbsp;</span></td><td><asp:Label id="lblDivisionLocation" runat="server" cssclass="mainheadtxt2" /></td></tr>	                                                                      
                            <tr><td align="right"><span class="mainheadtxt3">Work Phone&nbsp;&nbsp;</span></td><td><asp:Label id="lblWorkPhone" runat="server" cssclass="mainheadtxt2" ></asp:Label></td></tr>	    
                            <tr><td align="right"><span class="mainheadtxt3">Mobile Phone&nbsp;&nbsp;</span></td><td><asp:Label id="lblMobile" runat="server" cssclass="mainheadtxt2" /></td></tr>	                                                
                            <tr><td align="right"><span class="mainheadtxt3">Email Address&nbsp;&nbsp;</span></td><td><asp:Label id="lblEmailAddress" runat="server" cssclass="mainheadtxt2" /></td></tr>	
                            <tr><td align="right" colspan="2">&nbsp;</td></tr>	                                                                                                
                         </table>	                                                
	       </td>
	       <td valign="top" width="40%" align="left">
	                  <table>
	                     <tr><td align="right"><span class="mainheadtxt3">Supervisor Name&nbsp;&nbsp;</span></td><td><asp:label id="lblSuperVisorName" runat="server" cssclass="mainheadtxt2" /></td></tr>                       
                         <tr><td align="right"><span class="mainheadtxt3">Designation&nbsp;&nbsp;</span></td><td><asp:Label id="lblSuperVisor_JobTitle" runat="server" cssclass="mainheadtxt2"></asp:Label></td></tr>	
                         <tr><td align="right"><span class="mainheadtxt3">Work Location&nbsp;&nbsp;</span></td><td><asp:Label id="lblSuperVisor_JobLocation" runat="server" cssclass="mainheadtxt2" /></td></tr>	
                         <tr><td align="right"><span class="mainheadtxt3">Business Unit&nbsp;&nbsp;</span></td><td><asp:Label id="lblSuperVisor_Division" runat="server" cssclass="mainheadtxt2" /></td></tr>	       
                         <tr><td align="right"><span class="mainheadtxt3">Business Unit Location&nbsp;&nbsp;</span></td><td><asp:Label id="lblSuperVisor_DivisionLocation" runat="server" cssclass="mainheadtxt2" /></td></tr>	                                                                                          
	                     <tr><td align="right"><span class="mainheadtxt3">Work Phone&nbsp;&nbsp;</span></td><td><asp:label id="lblSuperVisor_Phone" runat="server" cssclass="mainheadtxt2" /></td></tr>
	                     <tr><td align="right"><span class="mainheadtxt3">Email Address&nbsp;&nbsp;</span></td><td><asp:label id="lblSuperVisor_EmailAddress" runat="server" cssclass="mainheadtxt2" /></td></tr>
   	                    </table>	                              	     
	      </td>				
		</tr>
     </table>
    </td>
</tr>
<tr width="100%"><td>&nbsp;</td></tr>
          	<tr class="PartButtons" align=center>
			<td  colspan="4">
			<center>
			    <asp:button id=Back runat="server" CausesValidation="false" CssClass="Button BackButton" Text="Back"></asp:button>
			</center>
			</td>
		    </tr>
		    <tr><td colspan="4"><asp:Label id="keyField" runat="server" visible=false /></td></tr>

</asp:PlaceHolder>

</table>
	<!--   End of Data Area -->
										
</master:content>


