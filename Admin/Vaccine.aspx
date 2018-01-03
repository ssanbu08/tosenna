<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Vaccine.aspx.cs" Inherits="SchoolNet.Vaccine" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table  border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
   <tr width="100%">
		<td class="x_title"><h2 class="text-primary">Manage Vaccines</h2></td>
	</tr>	 
  <ASP:PlaceHolder id="ManageCRUD" Runat="server" Visible="true">
    
	<tr>
	  <td> 
	    <table width="100%" border="0" class="Partgrayblock">
   		<tr><td colspan="4">&nbsp;</td></tr>
		<tr>
			<td class="mainheadtxt">Vaccine Name <font color="red">*</font></td>
			<td class="mainheadtxt">Vaccination Method <font color="red">*</font></td>
			<td class="mainheadtxt">Disease Name</td>
			<td class="mainheadtxt">Description</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:textbox id=VaccineName  Maxlength="60" runat="server" CssClass="form-control col-lg-11"></asp:textbox></td>
			<td class="mainheadtxt"><asp:dropdownlist id="VaccineMethod" TabIndex=11 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
   		    <td class="mainheadtxt"><asp:dropdownlist id="Disease" TabIndex=11 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
            <td class="mainheadtxt"><asp:textbox id="Description"  TextMode="multiline" Columns="150" Rows="1" cssclass="form-control" TabIndex=16 runat="server"></asp:textbox></td>
		</tr>     
		 <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=VaccineName  ErrorMessage="Vaccine Name is required." /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=VaccineMethod display="dynamic" InitialValue="-1" ErrorMessage="Please select vaccination method." /></td>
                <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt">&nbsp;</td>
		 </tr>
         
        <tr>
			<td class="mainheadtxt">First Vaccination <small>(Max. days)</small><font color="red">*</font></td>
			<td class="mainheadtxt">Booster Dose <small>(Max. days)</small></td>
			<td class="mainheadtxt">Revaccination Type</td>
			<td class="mainheadtxt">Trade Name</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:textbox id=FirstVaccination  Maxlength="8" runat="server" CssClass="form-control col-lg-4"></asp:textbox></td>
			<td class="mainheadtxt"><asp:textbox id=BoosterDose  Maxlength="8" runat="server" CssClass="form-control col-lg-4"></asp:textbox></td>
   		    <td class="mainheadtxt"><asp:dropdownlist id="RevaccinationType" TabIndex=11 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist>
            </td>
            <td class="mainheadtxt"><asp:textbox id=TradeName  Maxlength="70" runat="server" CssClass="form-control col-lg-11"></asp:textbox></td>
		</tr>     
		 <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=FirstVaccination  ErrorMessage="Please enter maximum days" /></td>   
		        <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt">&nbsp;</td>
		 </tr>
 
        <tr>
			<td class="mainheadtxt">Dose Quantity</td>
			<td class="mainheadtxt">Dose Metrics</td>
			<td class="mainheadtxt">Status</td>
			<td class="mainheadtxt">&nbsp;</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:textbox id=DoseQuantity  Maxlength="50" runat="server" CssClass="form-control col-lg-4"></asp:textbox></td>
			<td class="mainheadtxt"><asp:dropdownlist id="DoseMetric" TabIndex=11 AutoPostBack=false runat="server" cssclass="form-control col-lg-7"></asp:dropdownlist></td>
   		    <td class="mainheadtxt"><asp:RadioButton id="VaccineStatus1" Text="Active"  Checked="True" GroupName="VaccineStatus" runat="server" />&nbsp;&nbsp;
			                        <asp:RadioButton id="VaccineStatus2" Text="Inactive" GroupName="VaccineStatus" runat="server"/>
            </td>
            <td class="mainheadtxt">&nbsp;</td>
		</tr>     
		 <tr>
		        <td class="validationtxt">&nbsp;</td>   
		        <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt">&nbsp;</td>
		 </tr>
          
        <tr class="PartButtons" align=center>
			<td  colspan="4">
			<center>
			    <asp:button id=Save runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Save"></asp:button>
			    &nbsp;&nbsp;&nbsp;
			    <asp:button id=Reset runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-default" Text="Reset"></asp:button>
			</center>
			</td>
            </tr>
		    	
		 <tr>
                <td colspan="4" align=center>
                    <asp:Label id="Tab1_KeyField" runat="server" visible=false />
                        <div class="alert alert-success alert-dismissible fade in" visible=false runat="server" id="AlertDiv" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                            </button>
                            <strong><asp:label id="message" runat="server" /></strong> 
                        </div>
                </td>
          </tr>	
          <tr><td colspan="4"><hr/></td></tr>			
    	  <tr>
    <td  colspan="4" width=100%>
          <asp:DataGrid ID="VaccineGrid" CssClass="full-width table table-striped responsive-utilities jambo_table" AllowPaging ="false" runat="server" Width="100%" DataKeyField="VaccineID" AutoGenerateColumns="False" GridLines="None"
                         OnEditCommand="VaccineGrid_EditCommand" Caption='' CaptionAlign="Top">
                      <Columns>
                            <asp:BoundColumn HeaderText="Vaccine Name" DataField="VaccineName" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Disease Name" DataField="DiseaseName" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Vaccine Method Name" DataField="VaccineMethodName" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="First Vaccination" DataField="FirstVaccination" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Booster Dose" DataField="BoosterDose" ItemStyle-Width="8%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Revaccination" DataField="TimePeriodName" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Dose Quantity" DataField="DoseQuantity" ItemStyle-Width="6%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="Dose" ItemStyle-Width="25%"></asp:BoundColumn>  
                            <asp:BoundColumn Visible="false" DataField="DiseaseID" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="VaccineMethod" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="Remarks" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="TradeName" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="UOMTypeID" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="Status" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="RevaccinationType" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="" ItemStyle-Width="8%">
                                <ItemTemplate> 
                                     
                                         <asp:ImageButton ImageUrl="~/images/buttons/blue_edit1.png" name="Edit" commandName="Edit" alt="Edit" ToolTip="Edit" CausesValidation="false" runat="server" height="28" width="28" />
                                </ItemTemplate>
                            </asp:TemplateColumn>                           

                      </Columns>
                        <FooterStyle CssClass="DashGridFooter" />
                        <SelectedItemStyle CssClass="DashGridSelectedItem" />
                        <PagerStyle CssClass="GridPagerItem" HorizontalAlign="Center" Mode="NumericPages" />
                        <AlternatingItemStyle CssClass="odd pointer" />
                        <ItemStyle CssClass="even pointer" />
                        <HeaderStyle CssClass="headings sortings" />
        </asp:DataGrid>
   </td>     
</tr>
	    </table>
	   </td>						
  </tr>
  
</ASP:PlaceHolder>
</TABLE>
</master:content>




