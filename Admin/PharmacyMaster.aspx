<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PharmacyMaster.aspx.cs" Inherits="SchoolNet.PharmacyMaster" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table  border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
   <tr width="100%">
		<td class="x_title"><h2 class="text-primary">Manage Pharmacy Items</h2></td>
	</tr>	 
  <ASP:PlaceHolder id="ManageCRUD" Runat="server" Visible="true">
    
	<tr>
	  <td> 
	    <table width="100%" border="0" class="Partgrayblock">
   		<tr><td colspan="4">&nbsp;</td></tr>
		<tr>
			<td class="mainheadtxt">Drug Name <font color="red">*</font></td>
			<td class="mainheadtxt">Drug Code</td>
			<td class="mainheadtxt">Drug Description</td>
			<td class="mainheadtxt">Drug Type <font color="red">*</font></td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:textbox id=DrugName  Maxlength="50" runat="server" CssClass="form-control col-lg-11"></asp:textbox></td>
			<td class="mainheadtxt"><asp:textbox id=DrugCode  Maxlength="50" runat="server" CssClass="form-control col-lg-6"></asp:textbox></td>
   		    <td class="mainheadtxt"><asp:textbox id=DrugDescription  Maxlength="50" runat="server" CssClass="form-control col-lg-11"></asp:textbox></td>
            <td class="mainheadtxt"><asp:dropdownlist id="DrugType" TabIndex=11 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
		</tr>     
		 <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=DrugName  ErrorMessage="Drug Name is required." /></td>   
		        <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=DrugType display="dynamic" InitialValue="-1" ErrorMessage="Please select Drug Type." /></td>
		 </tr>
        <tr>
			<td class="mainheadtxt">Minimum Stock Level</td>
			<td class="mainheadtxt">Maximum Stock Level</td>
			<td class="mainheadtxt">Reorder Level</td>
			<td class="mainheadtxt">&nbsp;</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:textbox id=MinStockLevel  Maxlength="10" type="number" runat="server" CssClass="form-control col-lg-4"></asp:textbox></td>
			<td class="mainheadtxt"><asp:textbox id=MaxStockLevel  Maxlength="10" type="number" runat="server" CssClass="form-control col-lg-4"></asp:textbox></td>
   		    <td class="mainheadtxt"><asp:textbox id=ReorderLevel  Maxlength="10" type="number" runat="server" CssClass="form-control col-lg-4"></asp:textbox></td>
            <td class="mainheadtxt">&nbsp;</td>			
		</tr>     
		 <tr>
		        <td class="validationtxt">&nbsp;</td>   
		        <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt">&nbsp;</td>
		 </tr>
         
        <tr>
			<td class="mainheadtxt">Drug Weight</td>
			<td class="mainheadtxt">Unit Type</td>
			<td class="mainheadtxt">IsActive</td>
			<td class="mainheadtxt">&nbsp;</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:textbox id=Unitweight  Maxlength="50" runat="server" CssClass="form-control col-lg-4"></asp:textbox></td>
			<td class="mainheadtxt"><asp:dropdownlist id="UOMTypeID" TabIndex=11 AutoPostBack=false runat="server" cssclass="form-control col-lg-7"></asp:dropdownlist></asp:textbox></td>
   		    <td class="mainheadtxt"><asp:RadioButton id="DrugStatus1" Text="Active"  Checked="True" GroupName="DrugStatus" runat="server" />&nbsp;&nbsp;
			                        <asp:RadioButton id="DrugStatus2" Text="Inactive" GroupName="DrugStatus" runat="server"/>
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
          <asp:DataGrid ID="LTCGrid" CssClass="full-width table table-striped responsive-utilities jambo_table" AllowPaging ="false" runat="server" Width="100%" DataKeyField="PharmacyItemID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                         OnEditCommand="Grid_EditCommand" Caption='' CaptionAlign="Top">
                      <Columns>
                            <asp:BoundColumn HeaderText="Drug Name" DataField="ItemName" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Drug Code" DataField="ItemCode" ItemStyle-Width="10%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Drug Description" DataField="ItemDescription" ItemStyle-Width="35%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Drug Type" DataField="DrugTypeName" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Drug Weight" DataField="DoseQuantity" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Status" DataField="Status" ItemStyle-Width="10%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="ItemType" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="UnitWeight" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="UOMTypeID" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Minimum Stock" DataField="MinStockLevel" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Maximum Stock" DataField="MaxStockLevel" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Reorder Level" DataField="ReorderLevel" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="" ItemStyle-Width="8%">
                                <ItemTemplate> 
                                    <asp:LinkButton name="Edit" commandName="Edit" Text="Edit" CssClass="btn btn-xs btn-warning" alt="Edit" ToolTip="Edit" CausesValidation="false" runat="server"></asp:LinkButton>
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




