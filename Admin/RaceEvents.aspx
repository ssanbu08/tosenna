<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaceEvents.aspx.cs" Inherits="SchoolNet.RaceEvents" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table  border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
   <tr width="100%">
		<td class="x_title"><h2 class="text-primary">Manage Race Events</h2></td>
	</tr>	 
  <ASP:PlaceHolder id="ManageCRUD" Runat="server" Visible="true">
    
	<tr>
	  <td> 
	    <table width="100%" border="0" class="Partgrayblock">
   		<tr><td colspan="4">&nbsp;</td></tr>
		<tr>
			<td class="mainheadtxt">Race Name <font color="red">*</font></td>
			<td class="mainheadtxt">Race Course <font color="red">*</font></td>
			<td class="mainheadtxt">Race Organiser<font color="red">*</font></td>
			<td class="mainheadtxt">Race Description</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:textbox id=RaceName  Maxlength="60" runat="server" CssClass="form-control col-lg-11"></asp:textbox></td>
			<td class="mainheadtxt"><asp:dropdownlist id="RaceLocation" TabIndex=11 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
   		    <td class="mainheadtxt"><asp:textbox id=RaceOrganiser  Maxlength="60" runat="server" CssClass="form-control col-lg-11"></asp:textbox></td>
            <td class="mainheadtxt"><asp:textbox id="RaceDescription"  TextMode="multiline" Columns="150" Rows="1" cssclass="form-control" TabIndex=16 runat="server"></asp:textbox></td>
		</tr>     
		 <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=RaceName  ErrorMessage="Race Name is required." /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=RaceLocation display="dynamic" InitialValue="-1" ErrorMessage="Please select Race Location." /></td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=RaceOrganiser  ErrorMessage="Race Organiser is required." /></td>
                <td class="validationtxt">&nbsp;</td>
		 </tr>
         
        <tr>
			<td class="mainheadtxt" colspan="2">Race Schedule<font color="red">*</font></td>
			<td class="mainheadtxt">Distance<font color="red">*</font></td>
			<td class="mainheadtxt">&nbsp;</td>			
		</tr>
		<tr>
			<td class="mainheadtxt" colspan="2"><asp:textbox id=RaceSchedule runat="server" CssClass="select-datetimerange form-control col-lg-11"></asp:textbox></td>
   		    <td class="mainheadtxt"><asp:textbox id=RaceDistance type="number" Maxlength="20" min=0 runat="server" CssClass="form-control col-lg-6"></asp:textbox></td>
            <td class="mainheadtxt"><asp:textbox id=RaceStartTime  Maxlength="8" runat="server" visible="false" CssClass="form-control col-lg-5"></asp:textbox><asp:textbox id=RaceEndTime visible="false" Maxlength="8" runat="server" CssClass="form-control col-lg-5"></asp:textbox></td>
		</tr>     
		 <tr>
		        <td class="validationtxt" colspan="2"><asp:RequiredFieldValidator runat=server ControlToValidate=RaceSchedule  ErrorMessage="Please enter race start date time" /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=RaceDistance  ErrorMessage="Please enter race distance" /></td>
                <td class="validationtxt">&nbsp;</td>
		 </tr>
 
        <tr>
			<td class="mainheadtxt">First Prize<font color="red">*</font></td>
			<td class="mainheadtxt">Second Prize<font color="red">*</font></td>
			<td class="mainheadtxt">Thrid Prize<font color="red">*</font></td>
			<td class="mainheadtxt">Fourth Prize</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:textbox id=FirstPrize type="number" Maxlength="20" min=0 runat="server" CssClass="form-control col-lg-6"></asp:textbox></td>
			<td class="mainheadtxt"><asp:textbox id=SecondPrize type="number" Maxlength="20" min=0 runat="server" CssClass="form-control col-lg-5"></asp:textbox></td>
   		    <td class="mainheadtxt"><asp:textbox id=ThirdPrize type="number" Maxlength="20" min=0 runat="server" CssClass="form-control col-lg-6"></asp:textbox></td>
            <td class="mainheadtxt"><asp:textbox id=FourthPrize type="number" Maxlength="20" min=0 runat="server" CssClass="form-control col-lg-6"></asp:textbox></td>
		</tr>     
		 <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=FirstPrize  ErrorMessage="First Prize Amount is required" /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=SecondPrize  ErrorMessage="Second Prize Amount is required" /></td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=ThirdPrize  ErrorMessage="Third Prize Amount is required" /></td>
                <td class="validationtxt">&nbsp;</td>
		 </tr>
                  <tr>
			<td class="mainheadtxt">Fivth Prize</td>
			<td class="mainheadtxt">Sixth Prize</td>
			<td class="mainheadtxt">Seventh Prize</td>
			<td class="mainheadtxt">&nbsp;</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:textbox id=FivthPrize type="number" Maxlength="20" min=0 runat="server" CssClass="form-control col-lg-6"></asp:textbox></td>
			<td class="mainheadtxt"><asp:textbox id=SixthPrize type="number" Maxlength="20" min=0 runat="server" CssClass="form-control col-lg-5"></asp:textbox></td>
   		    <td class="mainheadtxt"><asp:textbox id=SeventhPrize type="number" Maxlength="20" min=0 runat="server" CssClass="form-control col-lg-6"></asp:textbox></td>
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
          <asp:DataGrid ID="REGrid" CssClass="DTGrid table table-striped responsive-utilities jambo_table" runat="server" DataKeyField="RaceID" AutoGenerateColumns="False" GridLines="None"
                         OnEditCommand="REGrid_EditCommand" OnDeleteCommand="REGrid_DeleteCommand"  Caption='' CaptionAlign="Top" AllowPaging ="false" >
                      <Columns>
                            <asp:BoundColumn HeaderText="Race Name" DataField="RaceName" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Race Organiser" DataField="RaceOrganiser" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Location Name" DataField="LocationName" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Race Schedule" DataField="RaceSchedule" ItemStyle-Width="20%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Distance" DataField="Distance" ItemStyle-Width="8%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="First Prize" DataField="FirstPrize" ItemStyle-Width="6%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Second Prize" DataField="SecondPrize" ItemStyle-Width="6%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Thrid Prize" DataField="ThirdPrize" ItemStyle-Width="6%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="RaceDescription" ItemStyle-Width="25%"></asp:BoundColumn>  
                            <asp:BoundColumn Visible="false" DataField="LocationID" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="FourthPrize" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="FivthPrize" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="SixthPrize" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="SeventhPrize" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="" ItemStyle-Width="12%">
                                <ItemTemplate> 
                                    <asp:LinkButton name="Edit" commandName="Edit" Text="Edit" CssClass="btn btn-xs btn-warning" alt="Edit" ToolTip="Edit" CausesValidation="false" runat="server"></asp:LinkButton>
                                    <asp:LinkButton name="Delete" commandName="Delete" OnClientClick="return confirm('Are you sure you want to delete the record?');" Text="Delete" CssClass="btn btn-xs btn-danger" alt="Delete" ToolTip="Delete" CausesValidation="false" runat="server"></asp:LinkButton>
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
<script>
    $(document).ready(function () {
    /*    $('#Save').click(function () {
            alert("Hi");
        }); */
    });

</script>
</master:content>




