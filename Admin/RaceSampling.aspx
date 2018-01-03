<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaceSampling.aspx.cs" Inherits="SchoolNet.RaceSampling" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table  border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
   <tr width="100%">
		<td class="x_title"><h2 class="text-primary">Manage Race Sampling Records</h2></td>
	</tr>	 
  <ASP:PlaceHolder id="ManageCRUD" Runat="server" Visible="true">
    
	<tr>
	  <td> 
	    <table width="100%" border="0" class="Partgrayblock">
   		<tr><td colspan="4">&nbsp;</td></tr>
		<tr>
			<td class="mainheadtxt">Animal Name<font color="red">*</font></td>
			<td class="mainheadtxt">Trainer Name<font color="red">*</font></td>
			<td class="mainheadtxt">Assosiated Race<font color="red">*</font></td>
			<td class="mainheadtxt">Sampling Location<font color="red">*</font></td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:dropdownlist id="AnimalID" TabIndex=1 onselectedindexchanged="GetTrainerIDByCattleID" AutoPostBack=true runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			<td class="mainheadtxt"><asp:dropdownlist id="TrainerID" TabIndex=2 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
   		    <td class="mainheadtxt"><asp:dropdownlist id="RaceID" TabIndex=3 AutoPostBack=true onselectedindexchanged="GetLocationIDByRaceID" runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
            <td class="mainheadtxt"><asp:dropdownlist id="LocationID" TabIndex=4 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
		</tr>     
		 <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=AnimalID display="dynamic" InitialValue="-1" ErrorMessage="Please select Animal" /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=TrainerID display="dynamic" InitialValue="-1" ErrorMessage="Please select Trainer" /></td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=RaceID display="dynamic" InitialValue="-1" ErrorMessage="Please select Race" />&nbsp;</td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=LocationID display="dynamic" InitialValue="-1" ErrorMessage="Please select Sampling Location"/></td>
		 </tr>
        <tr>
			<td class="mainheadtxt">Trial Number<font color="red">*</font></td>
			<td class="mainheadtxt">Sampling Start Time<font color="red">*</font></td>
			<td class="mainheadtxt">Race Duration<small>(HH:MM:SS)</small><font color="red">*</font></td>
			<td class="mainheadtxt">Sampling Result<font color="red">*</font></td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:textbox id=TrialNumber type="number" min=1 TabIndex=5 Maxlength="3" runat="server" CssClass="form-control col-lg-6"></asp:textbox></td>
			<td class="mainheadtxt"><asp:textbox id=SamplingStartTime runat="server" TabIndex=6 CssClass="select-datetime form-control col-lg-11"></asp:textbox></td>
   		    <td class="mainheadtxt"><asp:textbox id=Duration runat="server" PlaceHolder="00:00:00"  TabIndex=7 CssClass="form-control col-lg-6"></asp:textbox></td>
            <td class="mainheadtxt"><asp:dropdownlist id="PlaceTypeID" TabIndex=8 AutoPostBack=false runat="server" cssclass="form-control col-lg-7"></asp:dropdownlist></td>
		</tr>     
		 <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=TrialNumber  ErrorMessage="Please Select Trial Number" /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=SamplingStartTime  ErrorMessage="Please select Start Time" /></td>
                <td class="validationtxt">
                    <asp:RequiredFieldValidator runat=server ControlToValidate=Duration ErrorMessage="Duration is required" />
                    <asp:RegularExpressionValidator runat="server" ControlToValidate=Duration ErrorMessage="Duration format is invaid" ValidationExpression="^([0-2][0-9]):([0-5][0-9]):([0-5][0-9])$" Display="Dynamic" />
                </td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=PlaceTypeID display="dynamic" InitialValue="-1" ErrorMessage="Please select Sampling Result" /></td>
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
          <asp:DataGrid ID="RSGrid" CssClass="DTGrid table table-striped responsive-utilities jambo_table" runat="server" DataKeyField="SampleID" AutoGenerateColumns="False" GridLines="None"
                    OnEditCommand="RSGrid_EditCommand" OnDeleteCommand="RSGrid_DeleteCommand" Caption='' CaptionAlign="Top" AllowPaging ="false" >
                      <Columns>
                            <asp:BoundColumn HeaderText="Animal Name" DataField="AnimalName" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Trial" DataField="TrialID" ItemStyle-Width="5%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Duration" DataField="Duration" ItemStyle-Width="7%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Speed (km/h)" DataField="Speed" ItemStyle-Width="7%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Result" DataField="RacePlaceTypeName" ItemStyle-Width="9%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Trainer Name" DataField="TrainerName" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Assosiated Race" DataField="RaceName" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Distance (m)" DataField="Distance" ItemStyle-Width="8%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="StartTime" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="AnimalID" ItemStyle-Width="25%"></asp:BoundColumn>  
                            <asp:BoundColumn Visible="false" DataField="TrainerID" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="RaceID" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="LocationID" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn Visible="false" DataField="PlaceTypeID" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="" ItemStyle-Width="11%">
                                <ItemTemplate> 
                                    <asp:LinkButton name="Edit" commandName="Edit" Text="Edit" CssClass="btn btn-xs btn-warning" alt="Edit" ToolTip="Edit" CausesValidation="false" runat="server"></asp:LinkButton>
                                    <asp:LinkButton name="Delete" commandName="Delete"  OnClientClick="return confirm('Are you sure you want to delete the record?');"  Text="Delete" CssClass="btn btn-xs btn-danger" alt="Delete" ToolTip="Delete" CausesValidation="false" runat="server"></asp:LinkButton>
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
     <!--
<script>
$(document).ready(function() { 
    $('#Duration').blur(function () {
      var value = $(this).val();
      if (isValidTime(value))
         $(this).css('background','green');
      else
         $(this).css('background','red');
      }) 

    function isValidTime(text) {
       var regexp = new RegExp(/^([0-2][0-9]):([0-5][0-9]):([0-5][0-9])$/)
       return regexp.test(text);
    }
})
</script>-->
</master:content>




