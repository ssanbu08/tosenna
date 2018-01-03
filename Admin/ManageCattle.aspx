<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageCattle.aspx.cs" Inherits="SchoolNet.ManageCattle" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table  border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
  <!--   Search Box -->
 <ASP:PlaceHolder id="EmpSearchBox" Runat="server">
    <tr width="100%">
		<td class="x_title"><h2 class="text-primary">Cattle Management</h2></td>
	</tr>	
    
	<asp:PlaceHolder id=searchDataArea Runat="server">

<tr width="100%">
  <td>
  <div class="x_content">
      
  <asp:DataGrid ID="Grid" runat="server"  CssClass="full-width table table-striped responsive-utilities jambo_table" 
      AllowPaging="false" AllowSorting="True" DataKeyField="AnimalID" AutoGenerateColumns="false" CellPadding="4"  GridLines="None" 
     OnEditCommand="Grid_EditCommand">
                        
              <Columns>

                    <asp:TemplateColumn HeaderStyle-CssClass="sorting" HeaderText="Cattle TagID" ItemStyle-Width="10%">
                                <ItemTemplate> 
                                     <asp:LinkButton name="Edit" commandName="Edit"  CausesValidation="false" runat="server" ToolTip="Click to manage cattle information"> <%# Eval("AnimalTagID")%></asp:LinkButton>                                                                 
                                </ItemTemplate>
                    </asp:TemplateColumn>
                    
                    <asp:TemplateColumn HeaderStyle-CssClass="sorting" HeaderText="Cattle Name" ItemStyle-Width="18%">
                                <ItemTemplate> 
                                     <asp:LinkButton name="Edit" commandName="Edit"  CausesValidation="false" runat="server" ToolTip="Click to manage cattle information"> <%# Eval("AnimalName")%></asp:LinkButton>                                                                 
                                </ItemTemplate>
                    </asp:TemplateColumn>
                    
                    
                    <asp:BoundColumn HeaderStyle-CssClass="sorting" HeaderText="Breed" DataField="BreedName"  ItemStyle-Width="10%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderStyle-CssClass="sorting" HeaderText="Status" DataField="StatusTypeName" ItemStyle-Width="8%" ></asp:BoundColumn>
                    <asp:BoundColumn HeaderStyle-CssClass="sorting" HeaderText="Group" DataField="AnimalGroup" ItemStyle-Width="6%" ></asp:BoundColumn>
                    <asp:BoundColumn HeaderStyle-CssClass="sorting" HeaderText="Location" DataField="LocationName" ItemStyle-Width="12%" ></asp:BoundColumn>
                    <asp:BoundColumn HeaderStyle-CssClass="sorting" HeaderText="Location Type" DataField="LocationTypeName" ItemStyle-Width="12%" ></asp:BoundColumn>                    
                    <asp:BoundColumn HeaderStyle-CssClass="sorting" HeaderText="Veterinarian" DataField="AssignedVet" ItemStyle-Width="10%"> </asp:BoundColumn>
                    <asp:BoundColumn HeaderStyle-CssClass="sorting" HeaderText="Trainer" DataField="AssignedTrainer" ItemStyle-Width="10%"> </asp:BoundColumn>
                  
               </Columns>  
                 
                <FooterStyle CssClass="EmpsFooter" />
                <SelectedItemStyle CssClass="EmpsSelectedItem" />
                <PagerStyle CssClass="EmpsPagerItem" HorizontalAlign="Center" Mode="NumericPages" />
                <AlternatingItemStyle CssClass="even pointer" />
                <ItemStyle CssClass="odd pointer" />
                <HeaderStyle CssClass="headings sortings"/>
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
		<td class="x_title">
            <div class="col-lg-12">
                <h2 class="text-primary">Cattle Tag Id : <asp:label id="lblAnimalTagID" runat="server" cssclass="text-primary title-header" /></h2> 
                <asp:button id=Tab1_Back runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-primary btn-sm pull-right" Text="Back"></asp:button>
                <asp:Label id="keyField" runat="server" visible=false />
                <asp:Label id="VetID_Hidden" runat="server" visible=false />
                <asp:Label id="LocType_Hidden" runat="server" visible=false />
                <asp:Label id="LocID_Hidden" runat="server" visible=false />   
            </div>
		</td>
</tr>

    <tr><td>
        <div class="" runat="server" role="tabpanel" data-example-id="togglable-tabs">
            <ul id="CamelTab" class="nav nav-tabs bar_tabs" role="tablist">
                <li role="presentation" runat="server" class="">
                    <asp:LinkButton id="tab1" Text="View Profile" CssClass="active" CausesValidation="false" runat="server"/> 
                </li>
                <li role="presentation" runat="server" class="">
                    <asp:LinkButton id="tab2" Text="Edit Profile" CausesValidation="false" runat="server" /> 
                </li>
                <li role="presentation" runat="server" class="">
                    <asp:LinkButton id="tab3" Text="Lab Tests" CausesValidation="false" runat="server" /> 
                </li>
                <li role="presentation" runat="server" class="">
                    <asp:LinkButton id="tab4" Text="Vaccination History" CausesValidation="false" runat="server" /> 
                </li>
                <li role="presentation" runat="server" class="">
                    <asp:LinkButton id="tab5" Text="Medical Treatment" CausesValidation="false" runat="server" /> 
                </li>
                <li role="presentation" runat="server" class="">
                    <asp:LinkButton id="tab6" Text="Racing History" CausesValidation="false" runat="server" /> 
                </li>
                <li role="presentation" runat="server" class="">
                    <asp:LinkButton id="tab8" Text="Documents" CausesValidation="false" runat="server" /> 
                </li>
            </ul>
        </div>
        </td>
    </tr>
 
<!--  Start:Tab 1--->
<tr><td width="100%">
 <asp:PlaceHolder id=CattleInfoTab Runat="server" visible="false">	
	<table width="100%">
       <tr>
	        <td valign="top" width="5%" align="left">&nbsp;</td>
	     	<td valign="top" width="43%" align="left">
	            <table>
	                <tr><td align="right"><span class="mainheadtxt3">Cattle Name&nbsp;&nbsp;</span></td><td><asp:label id="lblCattleName" runat="server" cssclass="mainheadtxt2" /></td></tr>
                    <tr><td align="right"><span class="mainheadtxt3">Cattle ShortName&nbsp;&nbsp;</span></td><td><asp:Label id="lblShortName" runat="server" cssclass="mainheadtxt2"></asp:Label></td></tr>	
                    <tr><td align="right"><span class="mainheadtxt3">Microchip ID&nbsp;&nbsp;</span></td><td><asp:Label id="lblChipID" runat="server" cssclass="mainheadtxt2" /></td></tr>	
                    <tr><td align="right"><span class="mainheadtxt3">Cattle Status&nbsp;&nbsp;</span></td><td><asp:Label id="lblCattleStatus" runat="server" cssclass="mainheadtxt2" /></td></tr>	       
                    <tr><td align="right"><span class="mainheadtxt3">Cattle Group&nbsp;&nbsp;</span></td><td><asp:Label id="lblCattleGroup" runat="server" cssclass="mainheadtxt2" /></td></tr>	                                                                      
                    <tr><td align="right"><span class="mainheadtxt3">Gender&nbsp;&nbsp;</span></td><td><asp:Label id="lblGenderName" runat="server" cssclass="mainheadtxt2" ></asp:Label></td></tr>	    
                    <tr><td align="right"><span class="mainheadtxt3">Date of Birth&nbsp;&nbsp;</span></td><td><asp:Label id="lblDOB" runat="server" cssclass="mainheadtxt2" /></td></tr>	                                                
                    <tr><td align="right"><span class="mainheadtxt3">Age&nbsp;&nbsp;</span></td><td><asp:Label id="lblAge" runat="server" cssclass="mainheadtxt2" /></td></tr>	
                    <tr><td align="right"><span class="mainheadtxt3">Male Parent&nbsp;&nbsp;</span></td><td><asp:Label id="lblMaleParent" runat="server" cssclass="mainheadtxt2" /></td></tr>	
                    <tr><td align="right"><span class="mainheadtxt3">Female Parent&nbsp;&nbsp;</span></td><td><asp:Label id="lblFemaleParent" runat="server" cssclass="mainheadtxt2" /></td></tr>	
                    <tr><td align="right"><span class="mainheadtxt3">Notes&nbsp;&nbsp;</span></td><td><div class="scroll-div"><asp:Label id="lblNotes" runat="server" cssclass="mainheadtxt2" /></div></td></tr>	                                                                
                </table>	                                                
	        </td>
            <td valign="top" width="5%" align="left">&nbsp;</td>
	        <td valign="top" width="42%" align="left">
	                  <table>
	                     <tr><td align="right"><span class="mainheadtxt3">Farm Location&nbsp;&nbsp;</span></td><td><asp:label id="lblFarmLocation" runat="server" cssclass="mainheadtxt2" /></td></tr>                       
                         <tr><td align="right"><span class="mainheadtxt3">Location Type&nbsp;&nbsp;</span></td><td><asp:Label id="lblLocationType" runat="server" cssclass="mainheadtxt2" /></td></tr>	                         
                         <tr><td align="right"><span class="mainheadtxt3">Veterinarian&nbsp;&nbsp;</span></td><td><asp:Label id="lblVeternerian" runat="server" cssclass="mainheadtxt2" /></td></tr>	
                         <tr><td align="right"><span class="mainheadtxt3">Trainer&nbsp;&nbsp;</span></td><td><asp:Label id="lblTrainer" runat="server" cssclass="mainheadtxt2" /></td></tr>	       
                         <tr><td align="right"><span class="mainheadtxt3">Born Outside&nbsp;&nbsp;</span></td><td><asp:Label id="lblBornOutside" runat="server" cssclass="mainheadtxt2" /></td></tr>	                                                                                          
	                     <tr><td align="right"><span class="mainheadtxt3">Birth Weight&nbsp;&nbsp;</span></td><td><asp:label id="lblBWeight" runat="server" cssclass="mainheadtxt2" /></td></tr>
	                     <tr><td align="right"><span class="mainheadtxt3">Birth Height&nbsp;&nbsp;</span></td><td><asp:label id="lblBHeight" runat="server" cssclass="mainheadtxt2" /></td></tr>
                         <tr><td align="right"><span class="mainheadtxt3">Cattle Color&nbsp;&nbsp;</span></td><td><asp:Label id="lblColor" runat="server" cssclass="mainheadtxt2" /></td></tr>	                                                
                         <tr><td align="right"><span class="mainheadtxt3">Adopted Date&nbsp;&nbsp;</span></td><td><asp:label id="lblAdoptedDate" runat="server" cssclass="mainheadtxt2" /></td></tr>
	                     <tr><td align="right"><span class="mainheadtxt3">Displaced Date&nbsp;&nbsp;</span></td><td><asp:label id="lblDisplacedDate" runat="server" cssclass="mainheadtxt2" /></td></tr>
                         <tr><td align="right"><span class="mainheadtxt3">Last Modified By&nbsp;&nbsp;</span></td><td><asp:label id="lblModifiedBy" runat="server" cssclass="mainheadtxt2" /></td></tr>
	                     <tr><td align="right"><span class="mainheadtxt3">Last Modified On&nbsp;&nbsp;</span></td><td><asp:label id="lblModifiedOn" runat="server" cssclass="mainheadtxt2" /></td></tr>
	                    </table>	                              
	      </td>		
           <td valign="top" width="5%" align="left">&nbsp;</td>		
		</tr>
        
     </table>
	    <hr />	
 </asp:placeholder>
</td>
</tr>
<!--   End of Tab1 -->

<!---  Start:Tab 2 -->
<tr><td width="100%">
 <asp:PlaceHolder id=EditCattleTab Runat="server" visible="false">
      	  <table width="100%" border="0">    
             <tr><td colspan="5">&nbsp;</td></tr>
		     <tr>
			    <td class="mainheadtxt" colspan="2"><label class="control-label">Cattle Name<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Birth Date(DD/MM/YYYY)<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Gender Type<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Breed Type<font color="red">*</font></label></td>
		    </tr>
 	        <tr>
			    <td class="mainheadtxt" colspan="2">
			        <asp:textbox id=Tab2_CattleName   cssclass="col-lg-9 form-control"   TabIndex=1 Maxlength="50" runat="server"></asp:textbox>
			    </td> 
			    <td class="mainheadtxt">
                    <asp:textbox id="Tab2_DOB"  cssclass="old-select-date date-picker form-control col-md-7 col-xs-12" TabIndex=2 Maxlength="30" runat="server" AutoPostBack=true OnTextChanged="DOB_TextChanged"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab2_GenderType"  TabIndex=3 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>		    	    
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab2_BreedType" TabIndex=4 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
		    </tr>
		     <tr>
                <td class="validationtxt">
                    <asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_CattleName  ErrorMessage="Cattle Name is required." /></td>
                <td class="validationtxt">
                    </td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_DOB  display="dynamic" ErrorMessage="DOB is required." />
                                        <br /><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" display="dynamic"  ErrorMessage="Please enter date in dd/mm/yyyy format" ControlToValidate="Tab2_DOB" ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}"> </asp:RegularExpressionValidator>
                
                </td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_GenderType display="dynamic" InitialValue="-1" ErrorMessage="Please select Gender Type." /></td>
                  <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_BreedType display="dynamic" InitialValue="-1" ErrorMessage="Please select Breed Type." /></td>                        
 		    </tr>
		    <tr>
			    <td class="mainheadtxt"><label class="control-label">Short Name</label></td>
			    <td class="mainheadtxt"><label class="control-label">Animal TagID(Auto Assign)</label></td>
			    <td class="mainheadtxt"><label class="control-label">Microchip ID<font color="red">*</font></label></td>
                <td class="mainheadtxt"><label class="control-label">Location Type<font color="red">*</font></label></td>
		    	<td class="mainheadtxt"><label class="control-label">Animal Location<font color="red">*</font></label></td>
		    </tr>
 	        <tr>			    
			    <td class="mainheadtxt">
                    <asp:textbox id=Tab2_CattleShortName   cssclass="col-lg-7 form-control"   TabIndex=5 Maxlength="50" runat="server"></asp:textbox>
			    </td> 
			    <td class="mainheadtxt"><asp:textbox id=Tab2_AnimalTagId  disabled=true TabIndex=6 cssclass="form-control col-lg-11"   Maxlength="30" runat="server" ></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab2_MicrochipID   TabIndex=7 cssclass="form-control col-lg-11"   Maxlength="30" runat="server" ></asp:textbox></td>			    
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab2_LocType" TabIndex=8 onselectedindexchanged="Tab2_LocType_SelectedIndexChanged" AutoPostBack=true runat="server" cssclass="form-control"></asp:dropdownlist></td>
                <td class="mainheadtxt"><asp:dropdownlist id="Tab2_Location" TabIndex=9 AutoPostBack=false runat="server" cssclass="form-control"></asp:dropdownlist></td>
		    </tr>	
		     <tr>              
                <td class="validationtxt">&nbsp;</td>                        
                <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_MicrochipID display="dynamic" ErrorMessage="Microchip ID is Required." /></td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_LocType InitialValue="-1" ErrorMessage="Business Unit is Required." /></td>    
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_Location InitialValue="-1" ErrorMessage="Animal Location is Required." /></td>  
 		    </tr>
 		    
		    <tr>
                <td class="mainheadtxt"><label class="control-label">Assigned Trainer<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Assigned Veterinarian<font color="red">*</font></label></td>
                <td class="mainheadtxt"><label class="control-label">Born Outside<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Birth Weight<small>(In KGs)</small><font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Birth Height<small>(In CMs)</small><font color="red">*</font></label></td>			    
		    </tr>
 	        <tr>
                <td class="mainheadtxt"><asp:dropdownlist id="Tab2_Trainer" TabIndex=10 AutoPostBack=false runat="server"  cssclass="form-control col-lg-11"></asp:dropdownlist></td>
  			    <td class="mainheadtxt"><asp:dropdownlist id="Tab2_Veterinary" TabIndex=11 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			    <td class="mainheadtxt">
                     <asp:RadioButton ID="Tab2_BornOutside1" runat="server" Text="Yes" Checked= 'true' value ="1" GroupName="Tab2_BornOutside" AutoPostBack="false" CssClass="flat"/>  
                    &nbsp;&nbsp;&nbsp;<asp:RadioButton ID="Tab2_BornOutside2" runat="server" Text="No"  value = "0" GroupName="Tab2_BornOutside" AutoPostBack="false" CssClass="flat"/>
                </td>
                <td class="mainheadtxt"><asp:textbox id="Tab2_BirthWeight"   TabIndex=12 cssclass="form-control col-lg-4"   Maxlength="30" runat="server" ></asp:textbox></td>
                <td class="mainheadtxt"><asp:textbox id="Tab2_BirthHeight"   TabIndex=13 cssclass="form-control col-lg-4"   Maxlength="30" runat="server" ></asp:textbox></td>
                
		    </tr>	
            <tr>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_Trainer InitialValue="-1" ErrorMessage="Please select the trainer" /></td>                        
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_Veterinary display="dynamic" InitialValue="-1" ErrorMessage="Please select the Veterinary Doctor" /></td>                                                                                  
                <td class="validationtxt">&nbsp;</td>  
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_BirthWeight InitialValue="-1"  ErrorMessage="Weight is Required." /></td>                                                              
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_BirthHeight InitialValue="-1"  ErrorMessage="Height is Required." /></td>                                        
 		    </tr>
            <tr>
                <td class="mainheadtxt"><label class="control-label">Cattle Status<font color="red">*</font></label></td>
			    <td class="mainheadtxt" colspan="2"><label class="control-label">Male Parent</label></td>
                <td class="mainheadtxt" colspan="2"><label class="control-label">Female Parent</label></td>	    
		    </tr>
 	        <tr>
                <td class="mainheadtxt"><asp:dropdownlist id="Tab2_CattleStatus" TabIndex=10 AutoPostBack=false runat="server"  cssclass="form-control col-lg-11"></asp:dropdownlist></td>
  			    <td class="mainheadtxt" colspan="2"><asp:dropdownlist id="Tab2_MaleParent" TabIndex=10 AutoPostBack=false runat="server"  cssclass="form-control col-lg-11" ></asp:dropdownlist></td>
			    <td class="mainheadtxt" colspan="2"><asp:dropdownlist id="Tab2_FemaleParent" TabIndex=11 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
                
		    </tr>	
		     <tr>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab2_CattleStatus InitialValue="-1" ErrorMessage="Please select the Cattle Status" /></td>                        
                <td class="validationtxt" colspan="2">&nbsp;</td>                                                                                  
                <td class="validationtxt" colspan="2">&nbsp;</td>  
                                     
 		    </tr>
            <tr>
                <td class="mainheadtxt"><label class="control-label">Cattle Color<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Adopted Date</label></td>
                <td class="mainheadtxt"><label class="control-label">Displaced Date</label></td>
			    <td class="mainheadtxt" colspan="2"><label class="control-label">Notes</label></td>
                
		    </tr>
		    <tr>
                <td class="mainheadtxt"><asp:textbox id="Tab2_CattleColor"   TabIndex=14 cssclass="form-control"   Maxlength="30" runat="server" ></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab2_AnimalAdopted  cssclass="select-date date-picker form-control col-md-7 col-xs-12" TabIndex=15 Maxlength="30" runat="server"></asp:textbox></td>
                <td class="mainheadtxt"><asp:textbox id=Tab2_AnimalDisplaced  cssclass="select-date date-picker form-control col-md-7 col-xs-12" TabIndex=16 Maxlength="30" runat="server"></asp:textbox></td>
                <td class="mainheadtxt" colspan="2"><asp:textbox id=Tab2_Notes  TextMode="multiline" Columns="250" Rows="1" cssclass="large-textarea form-control" TabIndex=17 runat="server"></asp:textbox></td>
		    </tr>
		     	   		    
    	    <tr><td colspan="5">&nbsp;</td></tr>
            	

            <tr align=center>
			<td  colspan="5">
			<center>
			    <asp:button id=Save_Cattle runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Save"></asp:button>
			    &nbsp;&nbsp;&nbsp;
			    <asp:button id=Reset_Cattle runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-danger" Text="Reset"></asp:button>
                
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
 <asp:PlaceHolder id="CattleLabTestTab" Runat="server" visible="false"> 
    <table width="100%" border="0">
   		<tr><td colspan="4">&nbsp;</td></tr>
		<tr>
			<td class="mainheadtxt">Lab Test<font color="red">*</font></td>
			<td class="mainheadtxt">Veterinarian</td>
			<td class="mainheadtxt">LabTest Date</td>
			<td class="mainheadtxt">Remarks</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:dropdownlist id="Tab3_LabTestCode"  TabIndex=3 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			<td class="mainheadtxt"><asp:dropdownlist id="Tab3_Veternerian"  TabIndex=3 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
   		    <td class="mainheadtxt"><asp:textbox id="Tab3_LabTestDate"  cssclass="select-date date-picker form-control col-md-7 col-xs-12"   TabIndex=3 Maxlength="30" runat="server"></asp:textbox></td>
            <td class="mainheadtxt"><asp:textbox id=Tab3_Notes  TextMode="multiline" Columns="250" Rows="1" cssclass="large-textarea form-control" TabIndex=4 runat="server"></asp:textbox></td>
		</tr>     
		 <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab3_LabTestCode  ErrorMessage="Please select Lab Test." /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab3_Veternerian display="dynamic" InitialValue="-1" ErrorMessage="Please select veterinarian" /></td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab3_LabTestDate  display="dynamic" ErrorMessage="Lab Test Date is required." />
                                        <br /><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" display="dynamic"  ErrorMessage="Please enter date in dd/mm/yyyy format" ControlToValidate="Tab3_LabTestDate" ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}"> </asp:RegularExpressionValidator>

                </td>
                <td class="validationtxt">&nbsp;</td>
		 </tr>
         
        <tr class="PartButtons" align=center>
			<td  colspan="4">
			<center>
			    <asp:button id=Tab3_Save runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Save"></asp:button>
			    &nbsp;&nbsp;&nbsp;
			    <asp:button id=Tab3_Reset runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-default" Text="Reset"></asp:button>
			</center>
			</td>
        </tr>
		    	
		<tr>
                <td colspan="4" align=center>
                    <asp:Label id="Tab3_KeyField" runat="server" visible=false />
                    <div class="alert alert-success alert-dismissible fade in" visible=false runat="server" id="Tab3_AlertDiv" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                        </button>
                        <strong><asp:label id="Tab3_message" runat="server" /></strong> 
                    </div>
                    
                </td>
          </tr>	


          <tr><td colspan="4"><hr/></td></tr>			
    	  <tr>
    <td  colspan="4" width=100%>
          <asp:DataGrid ID="LTCGrid" CssClass="full-width table table-striped responsive-utilities jambo_table" AllowPaging ="false" runat="server" Width="100%" DataKeyField="ID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                         OnEditCommand="LTCGrid_EditCommand" OnDeleteCommand="LTCGrid_DeleteCommand" Caption='' CaptionAlign="Top">
                      <Columns>
                            <asp:BoundColumn HeaderText="Lab Test Name" DataField="TestDescription" ItemStyle-Width="22%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Lab Test Date" DataField="LabTestDate" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Remarks" DataField="LabNotes" ItemStyle-Width="30%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Veterinarian" DataField="Veterianrian" ItemStyle-Width="20%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="LabTestCodeID" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="VetID" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="" ItemStyle-Width="13%">
                                 <ItemTemplate> 
                                     <asp:LinkButton name="Edit" commandName="Edit" Text="Edit" CssClass="btn btn-xs btn-warning" alt="Edit" ToolTip="Edit" CausesValidation="false" runat="server"></asp:LinkButton>
                                     <asp:LinkButton name="Delete" commandName="Delete" Text="Delete" CssClass="btn btn-xs btn-danger" CausesValidation="false" runat="server" OnClientClick="return confirm('Are you sure you want to delete this?');" /> 
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
  </asp:placeholder>
</td>
</tr>
<!--  End of Tab3 -->

<!--  Start: Tab4 -->
<tr><td width="100%">
 <asp:PlaceHolder id="VaccinationTab" Runat="server" visible="false">
    <table width="100%" border="0">
   		<tr><td colspan="4">&nbsp;</td></tr>
		<tr>
			<td class="mainheadtxt">Vaccine<font color="red">*</font></td>
			<td class="mainheadtxt">Vaccination Date<font color="red">*</font></td>
			<td class="mainheadtxt">Next Vaccination</td>
			<td class="mainheadtxt">Remarks</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:dropdownlist id="Tab4_VaccineID"  TabIndex=3 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			<td class="mainheadtxt"><asp:textbox id="Tab4_VaccinationDate"  cssclass="select-date date-picker form-control col-md-7 col-xs-12"   TabIndex=3 Maxlength="30" runat="server"></asp:textbox></td>
   		    <td class="mainheadtxt"><asp:textbox id="Tab4_NextVaccination"  cssclass="select-date date-picker form-control col-md-7 col-xs-12"   TabIndex=3 Maxlength="30" runat="server"></asp:textbox></td>
            <td class="mainheadtxt"><asp:textbox id="Tab4_Remarks"  TextMode="multiline" Columns="250" Rows="1" cssclass="large-textarea form-control" TabIndex=4 runat="server"></asp:textbox></td>
		</tr>     
		 <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab4_VaccineID display="dynamic" InitialValue="-1" ErrorMessage="Please select Vaccine" /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab4_VaccinationDate  display="dynamic" ErrorMessage="Vaccination Date is required." />
                                        <br /><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" display="dynamic"  ErrorMessage="Please enter date in dd/mm/yyyy format" ControlToValidate="Tab4_VaccinationDate" ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}"> </asp:RegularExpressionValidator></td>
                <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt">&nbsp;</td>
		 </tr>
         
        <tr class="PartButtons" align=center>
			<td  colspan="4">
			<center>
			    <asp:button id=Tab4_Save runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Save"></asp:button>
			    &nbsp;&nbsp;&nbsp;
			    <asp:button id=Tab4_Reset runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-default" Text="Reset"></asp:button>
			</center>
			</td>
            </tr>
		    	
		 <tr>
                <td colspan="4" align=center>
                    <asp:Label id="Tab4_KeyField" runat="server" visible=false />
                    <div class="alert alert-success alert-dismissible fade in" visible=false runat="server" id="Tab4_AlertDiv" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                            </button>
                            <strong><asp:label id="Tab4_message" runat="server" /></strong> 
                    </div>
                </td>
          </tr>	


          <tr><td colspan="4"><hr/></td></tr>			
    	  <tr>
    <td  colspan="4" width=100%>
          <asp:DataGrid ID="CVGrid" CssClass="full-width table table-striped responsive-utilities jambo_table" AllowPaging ="false" runat="server" Width="100%" DataKeyField="ID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                         OnEditCommand="CVGrid_EditCommand"  OnDeleteCommand="CVGrid_DeleteCommand" Caption='' CaptionAlign="Top">
                      <Columns>
                            <asp:BoundColumn HeaderText="Vaccine Name" DataField="VaccineName" ItemStyle-Width="22%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="VaccinationDate" DataField="VaccinationDate" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Next Vaccine Due" DataField="NextVaccineDueDate" ItemStyle-Width="35%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Remarks" DataField="Notes" ItemStyle-Width="20%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="VaccineID" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="" ItemStyle-Width="8%">
                                 <ItemTemplate> 
                                     <asp:LinkButton name="Edit" commandName="Edit" Text="Edit" CssClass="btn btn-xs btn-warning" alt="Edit" ToolTip="Edit" CausesValidation="false" runat="server"></asp:LinkButton>
                                     <asp:LinkButton name="Delete" commandName="Delete" Text="Delete" CssClass="btn btn-xs btn-danger" CausesValidation="false" runat="server" OnClientClick="return confirm('Are you sure you want to delete this?');" /> 
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
 </asp:placeholder>
</td>
</tr>

<!--  End of Tab 4 -->

<!--  Start: Tab 5 -->
<tr><td width="100%">
 <asp:PlaceHolder id="CattleTreatmentsTab" Runat="server" visible="false">

    <table width="100%" border="0">
   		<tr><td colspan="4">
               <asp:PlaceHolder id="ManageTreatments" Runat="server" visible="true">
               <table width="100%" border="0">
   		    
		<tr>
			<td class="mainheadtxt">Prescription ID (Auto Assign)</td>
			<td class="mainheadtxt">Treatment Type<font color="red">*</font></td>
			<td class="mainheadtxt">Treatment Date<font color="red">*</font></td>
			<td class="mainheadtxt">Disease</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:textbox id=PrescriptionID  disabled=true cssclass="form-control col-lg-11" TabIndex=1  Maxlength="30" runat="server" ></asp:textbox></td>
			<td class="mainheadtxt"><asp:dropdownlist id="TreatmentType"  TabIndex=2 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
   		    <td class="mainheadtxt"><asp:textbox id="TreatmentDate"  cssclass="select-date date-picker form-control col-md-7 col-xs-12"   TabIndex=2 Maxlength="30" runat="server"></asp:textbox></td>
            <td class="mainheadtxt"><asp:dropdownlist id="DiseaseID"  TabIndex=4 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
		</tr>     
		 <tr>
		        <td class="validationtxt">&nbsp;</td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=TreatmentType display="dynamic" InitialValue="-1" ErrorMessage="Please select Treatment Type" /></td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=TreatmentDate  display="dynamic" ErrorMessage="Treatment Date is required." />
                                        <br /><asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" display="dynamic"  ErrorMessage="Please enter date in dd/mm/yyyy format" ControlToValidate="Tab3_LabTestDate" ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}"> </asp:RegularExpressionValidator>

                </td>
                <td class="validationtxt">&nbsp;</td>
		 </tr>
         <tr>
			<td class="mainheadtxt" colspan="2">Case Description<font color="red">*</font></td>
			<td class="mainheadtxt" colspan="2">Clinical Findings<font color="red">*</font></td>			
		</tr>
		<tr>
            <td class="mainheadtxt" colspan="2"><asp:textbox id=CaseDescription  TextMode="multiline" Columns="250" Rows="2" cssclass="large-textarea form-control" TabIndex=4 runat="server"></asp:textbox></td>
            <td class="mainheadtxt" colspan="2"><asp:textbox id=Findings  TextMode="multiline" Columns="250" Rows="2" cssclass="large-textarea form-control" TabIndex=4 runat="server"></asp:textbox></td>
		</tr>     
		 <tr>
		        <td class="validationtxt" colspan="2"><asp:RequiredFieldValidator runat=server ControlToValidate=CaseDescription  ErrorMessage="Case Description is required" /></td>   
		        <td class="validationtxt" colspan="2"><asp:RequiredFieldValidator runat=server ControlToValidate=Findings  ErrorMessage="Clinical Findings is required" /></td>
		 </tr>
         <tr>
			<td class="mainheadtxt" colspan="2">Treatment and Outcome<font color="red">*</font></td>
			<td class="mainheadtxt" colspan="2">Clinical Relevance</td>			
		</tr>
		<tr>
            <td class="mainheadtxt" colspan="2"><asp:textbox id=Treatment  TextMode="multiline" Columns="250" Rows="2" cssclass="large-textarea form-control" TabIndex=4 runat="server"></asp:textbox></td>
            <td class="mainheadtxt" colspan="2"><asp:textbox id=ClinicalRelevance  TextMode="multiline" Columns="250" Rows="2" cssclass="large-textarea form-control" TabIndex=4 runat="server"></asp:textbox></td>
		</tr>     
		 <tr>
		      <td class="validationtxt" colspan="2"><asp:RequiredFieldValidator runat=server ControlToValidate=Treatment  ErrorMessage="Treatment and Outcome is required" /></td>   
		      <td class="validationtxt" colspan="2">&nbsp;</td>
		 </tr>
        <tr>
			<td class="mainheadtxt">Veternarian<font color="red">*</font></td>
			<td class="mainheadtxt">Location Type<font color="red">*</font></td>
			<td class="mainheadtxt">Treatment Location<font color="red">*</font></td>
			<td class="mainheadtxt">&nbsp;</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:dropdownlist id="TreatmentVeternarian" TabIndex=11 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			<td class="mainheadtxt"><asp:dropdownlist id="TreatmentLocationType" TabIndex=8 onselectedindexchanged="Tab5_LocType_SelectedIndexChanged" AutoPostBack=true runat="server" cssclass="form-control"></asp:dropdownlist></td>
            <td class="mainheadtxt"><asp:dropdownlist id="TreatmentLocationID" TabIndex=9 AutoPostBack=false runat="server" cssclass="form-control  col-lg-11"></asp:dropdownlist></td>
            <td class="mainheadtxt">&nbsp;</td>
		</tr>     
		 <tr>
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=TreatmentVeternarian display="dynamic" InitialValue="-1" ErrorMessage="Please select Veternarian" /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=TreatmentLocationType display="dynamic" InitialValue="-1" ErrorMessage="Please select Location Type" /></td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=TreatmentLocationID display="dynamic" InitialValue="-1" ErrorMessage="Please select Location" /></td>
                <td class="validationtxt">&nbsp;</td>
		 </tr>
         <tr>
			<td class="mainheadtxt">Follow-Up Date</td>
			<td class="mainheadtxt">Follow-Up Alert</td>
			<td class="mainheadtxt">&nbsp;</td>
			<td class="mainheadtxt">&nbsp;</td>			
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:textbox id="FollowupDate"  cssclass="select-date date-picker form-control col-md-7 col-xs-12"   TabIndex=3 Maxlength="30" runat="server"></asp:textbox></td>
			<td class="mainheadtxt">
                <asp:RadioButton ID="FollowupAlert1" runat="server" Text="Yes" value ="1" GroupName="FollowupAlert" AutoPostBack="false" CssClass="flat" />  &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="FollowupAlert2" runat="server" Text="No"  value = "0" GroupName="FollowupAlert" AutoPostBack="false" CssClass="flat" Checked= 'true' />
            </td>    
   		    <td class="mainheadtxt">&nbsp;</td>
            <td class="mainheadtxt">&nbsp;</td>
		</tr>     
		 <tr>
                <td colspan="4" class="validationtxt">&nbsp;</td>
		 </tr>
        <tr class="PartButtons" align=center>
			<td  colspan="4">
			<center>
			    <asp:button id=Tab5_Save runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Save"></asp:button>
			    &nbsp;&nbsp;&nbsp;
			    <asp:button id=Tab5_Reset runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-default" Text="Reset"></asp:button>
			</center>
			</td>
        </tr>
		</table>
        </asp:PlaceHolder>
        <asp:PlaceHolder id="ManageDrugsUsage" Runat="server" visible="false">
            <table width="100%" border="0">
   		<tr><td colspan="4">&nbsp;</td></tr>
		<tr>
			<td class="mainheadtxt">Drug Name<font color="red">*</font></td>
			<td class="mainheadtxt">Quantity<font color="red">*</font></td>
			<td class="mainheadtxt" colspan="2">Short Notes</td>		
		</tr>
		<tr>
			<td class="mainheadtxt"><asp:dropdownlist id="Tab5S_DrugID"  TabIndex=1 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			<td class="mainheadtxt"><asp:textbox id=Tab5S_Quantity  Maxlength="10" TabIndex=2 type="number" min="1" runat="server" CssClass="form-control col-lg-5"></asp:textbox></td>
   		    <td class="mainheadtxt" colspan="2"><asp:textbox id=Tab5S_Notes  TextMode="multiline" Columns="50" Rows="1" cssclass="form-control col-lg-11" TabIndex=3 runat="server"></asp:textbox></td>
            
		</tr>     
		 <tr>
		    <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab5S_DrugID display="dynamic" InitialValue="-1" ErrorMessage="Please select Drug Type" /></td>   
		    <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab5S_Quantity  ErrorMessage="Please enter Quantity" /></td>
            <td class="validationtxt" colspan="2">&nbsp;</td>
		 </tr>
         
        <tr class="PartButtons" align=center>
			<td  colspan="4">
			<center>
			    <asp:button id=Tab5S_Save runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Save"></asp:button>
			    &nbsp;&nbsp;&nbsp;
			    <asp:button id=Tab5S_Reset runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-default" Text="Reset"></asp:button>
			</center>
			</td>
        </tr>
		    	
		<tr>
                <td colspan="4" align=center>
                    <asp:Label id="Tab5S_KeyField" runat="server" visible=false />
                    <div class="alert alert-success alert-dismissible fade in" visible=false runat="server" id="Tab5S_AlertDiv" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                            </button>
                            <strong><asp:label id="Tab5S_message" runat="server" /></strong> 
                    </div>
                </td>
          </tr>	


          <tr><td colspan="4"><hr/></td></tr>			
    	  <tr>
    <td  colspan="4" width=100%>
          <asp:DataGrid ID="CDUGrid" CssClass="DTGrid table table-striped responsive-utilities jambo_table" DataKeyField="UsageID" AllowPaging ="false" runat="server" Width="100%"  AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                     OnEditCommand="CDUGrid_EditCommand" OnDeleteCommand="CDUGrid_DeleteCommand"     Caption='' CaptionAlign="Top">
                      <Columns>
                            <asp:BoundColumn HeaderText="Prescription ID" DataField="PrescriptionID" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Drug Name" DataField="ItemName" ItemStyle-Width="25%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Quantity" DataField="Quantity" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Short Notes" DataField="ShortNotes" ItemStyle-Width="30%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="CattleTreatmentID" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="PharmacyItemID" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="" ItemStyle-Width="15%">
                                 <ItemTemplate> 
                                     <asp:LinkButton name="Edit" commandName="Edit" Text="Edit" CssClass="btn btn-xs btn-warning" alt="Edit" ToolTip="Edit" CausesValidation="false" runat="server"></asp:LinkButton>
                                     <asp:LinkButton name="Delete" commandName="Delete" Text="Delete" CssClass="btn btn-xs btn-danger" alt="Delete" ToolTip="Delete" CausesValidation="false" runat="server"></asp:LinkButton>
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
        </asp:PlaceHolder>
                   </td></tr>
		<tr>
            <td colspan="4" align=center>
                <asp:Label id="Tab5_KeyField" runat="server" visible=false />
                <div class="alert alert-success alert-dismissible fade in" visible=false runat="server" id="Tab5_AlertDiv" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                        </button>
                        <strong><asp:label id="Tab5_message" runat="server" /></strong> 
                </div>
            </td>
          </tr>	


          <tr><td colspan="4"><hr/></td></tr>			
    	  <tr>
    <td  colspan="4" width=100%>
          <asp:DataGrid ID="CTMTGrid" CssClass="DTGrid table table-striped responsive-utilities jambo_table"  DataKeyField="ID" AllowPaging ="false" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                         OnEditCommand="CTMTGrid_EditCommand" OnUpdateCommand="CTMTGrid_UpdateCommand"  OnDeleteCommand="CTMTGrid_DeleteCommand" Caption='' CaptionAlign="Top">
                      <Columns>
                            <asp:BoundColumn HeaderText="PrescriptionID" DataField="PrescriptionID" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Treatment Date" DataField="TreatmentDate" ItemStyle-Width="10%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Treatment Type" DataField="TreatmentTypeName" ItemStyle-Width="10%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Disease" DataField="DiseaseName" ItemStyle-Width="15%"></asp:BoundColumn>
                            <asp:BoundColumn HeaderText="Case Description" DataField="CaseDescription" ItemStyle-Width="38%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="Findings" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="Treatment" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="ClinicalRelevance" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="FollowUpDate" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="FollowUpAlert" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="TreatmentTypeID" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="DiseaseID" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="AssignedVetID" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="LocationTypeID" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:BoundColumn Visible = "false" DataField="LocationID" ItemStyle-Width="12%"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="" ItemStyle-Width="8%">
                                 <ItemTemplate> 
                                     <asp:LinkButton name="Edit" commandName="Edit" Text="Edit" CssClass="btn btn-xs btn-warning" alt="Edit" ToolTip="Edit" CausesValidation="false" runat="server"></asp:LinkButton>
                                     <asp:LinkButton name="Update" commandName="Update"  Text="Drugs" CssClass="btn btn-xs btn-primary" alt="Drugs" ToolTip="Manage Drugs" CausesValidation="false" runat="server"></asp:LinkButton>
                                     <asp:LinkButton name="Delete" commandName="Delete" Text="Delete" CssClass="btn btn-xs btn-danger" CausesValidation="false" runat="server" OnClientClick="return confirm('Are you sure you want to delete this?');" /> 
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

 </asp:placeholder>
</td>
</tr>
<!--   End of Tab 5 -->

<!--   Start : Tab 6 -->
<tr><td width="100%">
 <asp:PlaceHolder id="RaceHistory" Runat="server" visible="false">
    <table width="100%"><tr>
  <td>
  <div class="x_content">
  <asp:DataGrid CssClass="DTGrid table table-striped responsive-utilities jambo_table" ID="SHGrid" DataKeyField="ID" runat="server" Width="100%" AllowPaging="false" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"  GridLines="None" OnEditCommand="Grid_EditCommand">       
              <Columns>
                    <asp:BoundColumn HeaderText="Animal Name" visible="false" DataField="AnimalName" ItemStyle-Width="20%"></asp:BoundColumn>  
                    <asp:BoundColumn HeaderText="Event Date" DataField="RaceStartTime" ItemStyle-Width="8%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Assosiated Race" DataField="RaceName" ItemStyle-Width="20%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Duration" DataField="Duration" ItemStyle-Width="8%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Distance(m)" DataField="Distance" ItemStyle-Width="8%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Speed(km/h)" DataField="Speed" ItemStyle-Width="8%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Result" DataField="RacePlaceTypeName" ItemStyle-Width="8%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Trainer Name" DataField="TrainerName" ItemStyle-Width="20%"></asp:BoundColumn>
                  <asp:BoundColumn HeaderText="Location Name" DataField="LocationName" ItemStyle-Width="20%"></asp:BoundColumn>
               </Columns>  
                <FooterStyle CssClass="EmpsFooter" />
                <SelectedItemStyle CssClass="EmpsSelectedItem" />
                <PagerStyle CssClass="EmpsPagerItem" HorizontalAlign="Center" Mode="NumericPages" />
                <AlternatingItemStyle CssClass="EmpsAltItem" />
                <ItemStyle CssClass="EmpsItem" />
                <HeaderStyle CssClass="EmpsHeader" />
</asp:DataGrid>
        </div>
    </td>    
</tr>
<tr>
    <td>
        <div class="alert alert-success alert-dismissible fade in" visible=false runat="server" id="Tab6_AlertDiv" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                </button>
                <strong><asp:label id="Tab6_message" runat="server" /></strong> 
        </div>
    </td>
</tr>    	
</table> 
 </asp:placeholder>
</td>
</tr>
<!-- Start: Tab 8 -->
<tr><td width="100%">
 <asp:PlaceHolder id="DocumentsTab" Runat="server" visible="false">
    <table width="100%" border="0" class="Partgrayblock">
            <tr><td colspan="4">&nbsp;</td></tr>
             <tr>
			    <td class="mainheadtxt" colspan="2">Select the document to upload<small>(Maximum File Size:4MB)</small><font color="red">*</font></td>
			    <td class="mainheadtxt">Document Name<font color="red">*</font></td>
			    <td class="mainheadtxt">Document Type<font color="red">*</font></td>
			    
		    </tr>
		    <tr>
			    <td class="mainheadtxt" colspan="2"><input id="Tab8_FileName" type="file" class="form-control col-lg-7" TabIndex=1 runat="server" size="50"></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab8_DocumentName  cssclass="form-control col-lg-11" TabIndex=2 Maxlength="100" width="200px" runat="server"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:dropdownlist id=Tab8_DocumentType cssclass="form-control col-lg-11" TabIndex=3 AutoPostBack=false runat="server" Width="220px"></asp:dropdownlist></td>
			  	    
		    </tr>	
           <tr>
		        <td class="validationtxt" colspan="2"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab8_FileName ErrorMessage="Select the file to upload." /></td>   
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab8_DocumentName  ErrorMessage="Document Name is required." /></td>                           
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab8_DocumentType InitialValue=-1 ErrorMessage="Document Type is required." /></td>               
            
		    </tr>		    
		    <tr>
		        <td class="mainheadtxt" colspan="4">Comments
                    <asp:textbox id=Tab8_Comments  TextMode="multiline" Columns="250" Rows="1" Maxlength="100" cssclass="large-textarea form-control" TabIndex=4 runat="server"></asp:textbox>
                </td>
		     </tr>
	 	    <tr><td colspan="4">&nbsp;</td></tr>
                      	<tr class="PartButtons" align=center>
			<td  colspan="4">
			<center>
			    <asp:button id=Tab8_Save runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Upload"></asp:button>
			    &nbsp;&nbsp;&nbsp;
			    <asp:button id=Tab8_Reset runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-default" Text="Reset"></asp:button>
			</center>
			</td>
		    </tr>	
            <tr>
                <td colspan="4" align=center>
                    <div class="alert alert-success alert-dismissible fade in" visible=false runat="server" id="Tab8_AlertDiv" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                            </button>
                            <strong><asp:label id="Tab8_message" runat="server" /></strong> 
                    </div>
                </td>
            </tr>    			
           <tr><td colspan="4"><hr /></td></tr>

            <tr>
                <td colspan="4">
                    <asp:DataGrid ID="DOCGrid" CssClass="DTGrid table table-striped responsive-utilities jambo_table" runat="server" Width="100%" AllowPaging="false" DataKeyField="DocumentID" AutoGenerateColumns="False" CellPadding="4" GridLines="None"  OnDeleteCommand="DOCGrid_DeleteCommand" >
                                   
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
                                      <asp:LinkButton name="Delete" commandName="Delete" Text="Delete" CssClass="btn btn-xs btn-danger" CausesValidation="false" runat="server" OnClientClick="return confirm('Are you sure you want to delete the document?');" /> 
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
<!---  End of Tab 8 -->
<!--   Start : Tab 7 -->
<tr><td width="100%">
 <asp:PlaceHolder id="CompensationTab" Runat="server" visible="false">
  
 </asp:placeholder>
</td>
</tr>
<!--    End of Tab 7-->

</asp:PlaceHolder>
<!--- Common for all tabs --->

<tr class="PartBrown" >
   <td width="100%" align=center>
       <div class="alert alert-success alert-dismissible fade in" visible=false runat="server" id="AlertDiv" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
            </button>
            <strong><asp:label id="message" runat="server" /></strong> 
        </div></td>			
</tr> 			


</table>
	<!--   End of Data Area -->
<script>
    $(document).ready(function () {
  //      alert("Hi");
    });
</script>										
</master:content>

