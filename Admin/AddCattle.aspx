<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCattle.aspx.cs" Inherits="SchoolNet.AddCattle" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table  border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
  <!--    Edit Employee Data Area -->
 <tr><td width="100%">
  <asp:PlaceHolder id=EditArea Runat="server" visible="true">
	  <table width="100%" border="0"><tr><td class="x_title" colspan="5"><h2 class="text-primary">Add New Cattle Profile</h2></td></tr>
      </table>
	  <table width="100%" border="0" class="Partgrayblock">    
             <tr><td colspan="5">&nbsp;</td></tr>
		     <tr>
			    <td class="mainheadtxt" colspan="2"><label class="control-label">Cattle Name<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Birth Date(DD/MM/YYYY)<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Gender Type<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Breed Type<font color="red">*</font></label></td>
		    </tr>
 	        <tr>
			    <td class="mainheadtxt" colspan="2">
			                            <asp:textbox id=Tab1_CattleName   cssclass="col-lg-9 form-control"   TabIndex=1 Maxlength="50" runat="server"></asp:textbox>
			    </td> 
			    <td class="mainheadtxt">
                <asp:textbox id="Tab1_DOB"  cssclass="old-select-date date-picker form-control col-md-7 col-xs-12" TabIndex=2 Maxlength="30" runat="server" AutoPostBack=true OnTextChanged="DOB_TextChanged"></asp:textbox></td>
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_GenderType"  TabIndex=3 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>		    	    
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_BreedType" TabIndex=4 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
		    </tr>
		     <tr>
                <td class="validationtxt">
                    <asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_CattleName  ErrorMessage="Cattle Name is required." /></td>
                <td class="validationtxt">
                    </td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_DOB  display="dynamic" ErrorMessage="DOB is required." />
                                        <br /><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" display="dynamic"  ErrorMessage="Please enter date in dd/mm/yyyy format" ControlToValidate="Tab1_DOB" ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}"> </asp:RegularExpressionValidator>
                
                </td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_GenderType display="dynamic" InitialValue="-1" ErrorMessage="Please select Gender Type." /></td>
                  <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_BreedType display="dynamic" InitialValue="-1" ErrorMessage="Please select Breed Type." /></td>                        
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
                    <asp:textbox id=Tab1_CattleShortName   cssclass="col-lg-7 form-control"   TabIndex=5 Maxlength="50" runat="server"></asp:textbox>
			    </td> 
			    <td class="mainheadtxt"><asp:textbox id=Tab1_AnimalTagId  disabled=true TabIndex=6 cssclass="form-control col-lg-11"   Maxlength="30" runat="server" ></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_MicrochipID   TabIndex=7 cssclass="form-control col-lg-11"   Maxlength="30" runat="server" ></asp:textbox></td>			    
			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_LocType" TabIndex=8 onselectedindexchanged="Tab1_LocType_SelectedIndexChanged" AutoPostBack=true runat="server" cssclass="form-control"></asp:dropdownlist></td>
                <td class="mainheadtxt"><asp:dropdownlist id="Tab1_Location" TabIndex=9 AutoPostBack=false runat="server" cssclass="form-control"></asp:dropdownlist></td>
		    </tr>	
		     <tr>              
                <td class="validationtxt">&nbsp;</td>                        
                <td class="validationtxt">&nbsp;</td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_MicrochipID display="dynamic" ErrorMessage="Microchip ID is Required." /></td>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_LocType InitialValue="-1" ErrorMessage="Business Unit is Required." /></td>    
		        <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_Location InitialValue="-1" ErrorMessage="Animal Location is Required." /></td>  
 		    </tr>
 		    
		    <tr>
                <td class="mainheadtxt"><label class="control-label">Assigned Trainer<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Assigned Veterinarian<font color="red">*</font></label></td>
                <td class="mainheadtxt"><label class="control-label">Born Outside<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Birth Weight<small>(In KGs)</small><font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Birth Height<small>(In CMs)</small><font color="red">*</font></label></td>			    
		    </tr>
 	        <tr>
                <td class="mainheadtxt"><asp:dropdownlist id="Tab1_Trainer" TabIndex=10 AutoPostBack=false runat="server"  cssclass="form-control col-lg-11"></asp:dropdownlist></td>
  			    <td class="mainheadtxt"><asp:dropdownlist id="Tab1_Veterinary" TabIndex=11 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			    <td class="mainheadtxt">
                     <asp:RadioButton ID="Tab1_BornOutside1" runat="server" Text="Yes" Checked= 'true' value ="1" GroupName="Tab1_BornOutside" AutoPostBack="false" CssClass="flat"/>  
                    &nbsp;&nbsp;&nbsp;<asp:RadioButton ID="Tab1_BornOutside2" runat="server" Text="No"  value = "0" GroupName="Tab1_BornOutside" AutoPostBack="false" CssClass="flat"/>
                </td>
                <td class="mainheadtxt"><asp:textbox id="Tab1_BirthWeight"   TabIndex=12 cssclass="form-control col-lg-4"   Maxlength="30" runat="server" ></asp:textbox></td>
                <td class="mainheadtxt"><asp:textbox id="Tab1_BirthHeight"   TabIndex=13 cssclass="form-control col-lg-4"   Maxlength="30" runat="server" ></asp:textbox></td>
                
		    </tr>	
		     <tr>
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_Trainer InitialValue="-1" ErrorMessage="Please select the trainer" /></td>                        
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_Veterinary display="dynamic" InitialValue="-1" ErrorMessage="Please select the Veterinary Doctor" /></td>                                                                                  
                <td class="validationtxt">&nbsp;</td>  
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_BirthHeight InitialValue="-1"  ErrorMessage="Supervisior is Required." /></td>                                                              
                <td class="validationtxt"><asp:RequiredFieldValidator runat=server ControlToValidate=Tab1_CattleColor InitialValue="-1"  ErrorMessage="Designation is Required." /></td>                                        
 		    </tr>
            <tr>
                <td class="mainheadtxt" colspan="2"><label class="control-label">Male Parent</label></td>
			    <td class="mainheadtxt" colspan="2"><label class="control-label">Female Parent</label></td>
			    <td class="mainheadtxt">&nbsp;</td>			    
		    </tr>
 	        <tr>
                <td class="mainheadtxt" colspan="2"><asp:dropdownlist id="Tab1_MaleParent" TabIndex=10 AutoPostBack=false runat="server"  cssclass="form-control col-lg-11" ></asp:dropdownlist></td>
  			    <td class="mainheadtxt" colspan="2"><asp:dropdownlist id="Tab1_FemaleParent" TabIndex=11 AutoPostBack=false runat="server" cssclass="form-control col-lg-11"></asp:dropdownlist></td>
			    <td class="mainheadtxt">&nbsp;</td>
            </tr>	
		     <tr>
                <td class="validationtxt" colspan="2">&nbsp;</td>  
                <td class="validationtxt" colspan="2">&nbsp;</td>  
                <td class="validationtxt">&nbsp;</td>  
 		    </tr>
            <tr>
                <td class="mainheadtxt"><label class="control-label">Cattle Color<font color="red">*</font></label></td>
			    <td class="mainheadtxt"><label class="control-label">Adopted Date</label></td>
			    <td class="mainheadtxt" colspan="2"><label class="control-label">Notes</label></td>
                <td class="mainheadtxt"><label class="control-label">&nbsp;</label></td>
		    </tr>
		    <tr>
                <td class="mainheadtxt"><asp:textbox id="Tab1_CattleColor"   TabIndex=14 cssclass="form-control"   Maxlength="30" runat="server" ></asp:textbox></td>
			    <td class="mainheadtxt"><asp:textbox id=Tab1_AnimalAdopted  cssclass="select-date date-picker form-control col-md-7 col-xs-12" TabIndex=15 Maxlength="30" runat="server"></asp:textbox></td>
                <td class="mainheadtxt" colspan="2"><asp:textbox id=Tab1_Notes  TextMode="multiline" Columns="250" Rows="1" cssclass="large-textarea form-control" TabIndex=16 runat="server"></asp:textbox></td>
                <td class="mainheadtxt">&nbsp;</td>
		    </tr>
		     	   		    
    	    <tr><td colspan="5">&nbsp;</td></tr>
            	
            <tr class="PartButtons" align=center>
			<td  colspan="5">
			<center>
			    <asp:button id=Save_Cattle runat="server" CausesValidation="True" CssClass="btn btn-lg btn-round btn-success" Text="Save"></asp:button>
			    &nbsp;&nbsp;&nbsp;
			    <asp:button id=Cancel runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-default" Text="Reset"></asp:button>
			</center>
			</td>
		    </tr>		        
	    </table>
	    
 </asp:placeholder>
</td>
</tr>
<tr class="PartBrown" >
   <td width="100%" align=center>
       <asp:Label id="Tab1_KeyField" runat="server" visible=false />
       <div class="alert alert-success alert-dismissible fade in" visible=false runat="server" id="AlertDiv" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
            </button>
            <strong><asp:label id="message" runat="server" /></strong> 
        </div>
       </td>			
</tr> 			
</table>	
</master:content>
