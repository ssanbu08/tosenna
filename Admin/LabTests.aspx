<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LabTests.aspx.cs" Inherits="SchoolNet.LabTests" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table  border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
   <tr width="100%">
		<td class="x_title"><h2 class="text-primary">Manage Lab Tests</h2></td>
	</tr>	 
  <ASP:PlaceHolder id="ManageCRUD" Runat="server" Visible="true">
    
	<tr>
	  <td> 
	    <table width="100%" border="0" class="Partgrayblock">
   		<tr><td colspan="4">&nbsp;</td></tr>
		<tr>
			<td class="mainheadtxt">Lab Test Name <font color="red">*</font></td>
			<td class="mainheadtxt">Lab Test Code</td>
			<td class="mainheadtxt">Lab Test Type</td>
			<td class="mainheadtxt">Status</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:textbox id=LabTestName  Maxlength="50" runat="server" CssClass="form-control col-lg-11"></asp:textbox></td>
			<td class="mainheadtxt"><asp:textbox id=LabTestCode  Maxlength="50" runat="server" CssClass="form-control col-lg-6"></asp:textbox></td>
   		    <td class="mainheadtxt"><asp:RadioButton id="LabTestType1" Text="Symptomatic"  Checked="True" GroupName="LabTestType" runat="server" />&nbsp;&nbsp;
			                        <asp:RadioButton id="LabTestType2" Text="Asymptomatic" GroupName="LabTestType" runat="server"/>
            </td>
            <td class="mainheadtxt"><asp:RadioButton id="LabTestStatus1" Text="Active"  Checked="True" GroupName="LabTestStatus" runat="server" />&nbsp;&nbsp;
			                        <asp:RadioButton id="LabTestStatus2" Text="InActive" GroupName="LabTestStatus" runat="server"/>
            </td>
		</tr>     
		 <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=LabTestName  ErrorMessage="Lab Test Name is required." /></td>   
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
          <asp:DataGrid ID="LTCGrid" CssClass="full-width table table-striped responsive-utilities jambo_table" AllowPaging ="false" runat="server" Width="100%" DataKeyField="LabTestCodeID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                         OnEditCommand="Grid_EditCommand" Caption='' CaptionAlign="Top">
                      <Columns>
                            <asp:BoundColumn HeaderText="Lab Test Name" DataField="TestDescription" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Lab Test Code" DataField="LabTestCode" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Lab Test Type" DataField="LabTestType" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Status" DataField="Status" ItemStyle-Width="12%"></asp:BoundColumn>
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




