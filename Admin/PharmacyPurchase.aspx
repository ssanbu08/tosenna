<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PharmacyPurchase.aspx.cs" Inherits="SchoolNet.PharmacyPurchase" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table  border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
   <tr width="100%">
		<td class="x_title"><h2 class="text-primary">Manage Drugs Purchasing</h2></td>
	</tr>	 
  <ASP:PlaceHolder id="ManageCRUD" Runat="server" Visible="true">
    
	<tr>
	  <td> 
	    <table width="100%" border="0" class="Partgrayblock">
   		<tr><td colspan="4">&nbsp;</td></tr>
		<tr>
			<td class="mainheadtxt">Drug<font color="red">*</font></td>
			<td class="mainheadtxt">Bill Reference</td>
			<td class="mainheadtxt">Purchase Date<font color="red">*</font></td>
			<td class="mainheadtxt">Expiry Date</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:dropdownlist id="DrugId" TabIndex=1 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist>
                                    <asp:Label id=LabelDrugName Visible="false" runat="server" CssClass="control-label col-lg-11"></asp:Label></td>
			<td class="mainheadtxt"><asp:textbox id=BillReference  TabIndex=2  Maxlength="50" runat="server" CssClass="form-control col-lg-11"></asp:textbox></td>
   		    <td class="mainheadtxt"><asp:textbox id="PurchaseDate"  cssclass="select-date date-picker form-control col-md-7 col-xs-12"   TabIndex=3 Maxlength="30" runat="server"></asp:textbox></td>
            <td class="mainheadtxt"><asp:textbox id="ExpiryDate"  cssclass="select-date date-picker form-control col-md-7 col-xs-12"   TabIndex=4 Maxlength="30" runat="server"></asp:textbox>
            </td>
		</tr>     
		 <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=DrugId display="dynamic" InitialValue="-1" ErrorMessage="Please select Drug." /></td>   
		        <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=PurchaseDate  display="dynamic" ErrorMessage="Purchase Date is required." />
                                    <br /><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" display="dynamic"  ErrorMessage="Please enter date in dd/mm/yyyy format" ControlToValidate="PurchaseDate" ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}"> </asp:RegularExpressionValidator>

                </td>
                <td class="validationtxt">&nbsp;</td>
		 </tr>
         	<tr>
			<td class="mainheadtxt">Quantity<font color="red">*</font></td>
			<td class="mainheadtxt">Unit price <small>(AED)</small><font color="red">*</font></td>
			<td class="mainheadtxt" colspan="2">Comments</td>	
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:textbox id=Quantity  Maxlength="50" TabIndex=5 runat="server" CssClass="form-control col-lg-3"></asp:textbox></td>
			<td class="mainheadtxt"><asp:textbox id=UnitPrice  Maxlength="50" TabIndex=6 runat="server" CssClass="form-control col-lg-6"></asp:textbox></td>
   		    <td class="mainheadtxt" colspan="2"><asp:textbox id="Comments"  TextMode="multiline" Columns="150" Rows="1" cssclass="large-textarea form-control" TabIndex=7 runat="server"></asp:textbox></td>
		</tr>     
		 <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Quantity  ErrorMessage="Quantity is required." /></td>   
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=UnitPrice  ErrorMessage="Unit Price is required." /></td>
                <td class="validationtxt" colspan="2">&nbsp;</td>
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
          <asp:DataGrid ID="LTCGrid" CssClass="full-width table table-striped responsive-utilities jambo_table" AllowPaging ="false" runat="server" Width="100%" DataKeyField="ID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                         OnEditCommand="Grid_EditCommand" Caption='' CaptionAlign="Top">
                      <Columns>
                            <asp:BoundColumn HeaderText="Drug Name" DataField="ItemName" ItemStyle-Width="30%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="BillReference" DataField="BillReference" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Quantity" DataField="Qty" ItemStyle-Width="10%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Unit Price(AED)" DataField="UnitPrice" ItemStyle-Width="10%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Purchase Date" DataField="PurchaseDate" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Expiry Date" DataField="ExpiryDate" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="PharmacyItemID" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="Notes" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="" ItemStyle-Width="5%">
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




