<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaceStatistics.aspx.cs" Inherits="SchoolNet.RaceStatistics" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table  border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
  <!--   Search Box -->
 <ASP:PlaceHolder id="EmpSearchBox" Runat="server">
    <tr width="100%">
		<td class="x_title"><h2 class="text-primary">Race Statistics</h2></td>
	</tr>	
        <tr><td>
        <div class="" runat="server" role="tabpanel" data-example-id="togglable-tabs">
            <ul id="CamelTab" class="nav nav-tabs bar_tabs" role="tablist">
                <li role="presentation" runat="server" class="">
                    <asp:LinkButton id="tab1" Text="Statistics By Cattle" CssClass="active" CausesValidation="false" runat="server"/> 
                </li>
                <li role="presentation" runat="server" class="">
                    <asp:LinkButton id="tab2" Text="Statistics By Trainer" CausesValidation="false" runat="server" /> 
                </li>
            </ul>
        </div>
        </td>
    </tr>
 
<asp:PlaceHolder id=StatisticsByCattle Runat="server">
<tr width="100%">
  <td>
  <div class="x_content">
  <asp:DataGrid CssClass="DTGrid table table-striped responsive-utilities jambo_table" ID="SCGrid" DataKeyField="AnimalID" runat="server" Width="100%" AllowPaging="false" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"  GridLines="None" OnEditCommand="Grid_EditCommand">       
              <Columns>
                    <asp:BoundColumn HeaderText="Cattle" DataField="AnimalName" ItemStyle-Width="20%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Runs" DataField="Runs" ItemStyle-Width="9%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="1st" DataField="1st" ItemStyle-Width="7%" ></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="2nd" DataField="2nd" ItemStyle-Width="7%" ></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="3rd" DataField="3rd" ItemStyle-Width="7%" ></asp:BoundColumn>                    
                    <asp:BoundColumn HeaderText="4th" DataField="4th" ItemStyle-Width="6%"> </asp:BoundColumn>
                    <asp:BoundColumn HeaderText="5th" DataField="5th" ItemStyle-Width="6%"> </asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Best Speed (km/h)" DataField="BestSpeed" ItemStyle-Width="10%"> </asp:BoundColumn>
                    
                  <asp:TemplateColumn HeaderText="Average Speed (km/h)" ItemStyle-Width="12%">
                            <ItemTemplate> 
                                <asp:Label CssClass='<%# FindAverageSpeedClass(Double.Parse(Eval("AvgSpeed").ToString())) %>' alt="Edit" autopostback="false" CausesValidation="false" runat="server"> <%# Eval("AvgSpeed")%></asp:Label>
                            </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn HeaderText="Prize Money (AED)" DataField="PrizeMoney" ItemStyle-Width="11%"> </asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="View" ItemStyle-Width="5%">
                                 <ItemTemplate> 
                                     <asp:LinkButton name="Edit" commandName="Edit" Text="View" CssClass="btn btn-xs btn-primary" alt="Edit" ToolTip="Edit" CausesValidation="false" runat="server"></asp:LinkButton>
                            </ItemTemplate>
                    </asp:TemplateColumn>   
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
<asp:PlaceHolder id=StatisticsByTrainer Runat="server" visible="false">
<tr width="100%">
  <td>
  <div class="x_content">
  <asp:DataGrid CssClass="DTGrid table table-striped responsive-utilities jambo_table" ID="STGrid" DataKeyField="TrainerID" runat="server" Width="100%" AllowPaging="false" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"  GridLines="None" OnUpdateCommand="STGrid_UpdateCommand" >       
              <Columns>
                    <asp:BoundColumn HeaderText="Trainer" DataField="TrainerName" ItemStyle-Width="20%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Runs" DataField="Runs" ItemStyle-Width="9%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="1st" DataField="1st" ItemStyle-Width="7%" ></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="2nd" DataField="2nd" ItemStyle-Width="7%" ></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="3rd" DataField="3rd" ItemStyle-Width="7%" ></asp:BoundColumn>                    
                    <asp:BoundColumn HeaderText="4th" DataField="4th" ItemStyle-Width="6%"> </asp:BoundColumn>
                    <asp:BoundColumn HeaderText="5th" DataField="5th" ItemStyle-Width="6%"> </asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Best Speed (km/h)" DataField="BestSpeed" ItemStyle-Width="10%"> </asp:BoundColumn>
                    
                  <asp:TemplateColumn HeaderText="Average Speed (km/h)" ItemStyle-Width="12%">
                            <ItemTemplate> 
                                <asp:Label CssClass='<%# FindAverageSpeedClass(Double.Parse(Eval("AvgSpeed").ToString())) %>' alt="Edit" autopostback="false" CausesValidation="false" runat="server"> <%# Eval("AvgSpeed")%></asp:Label>
                            </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn HeaderText="Prize Money (AED)" DataField="PrizeMoney" ItemStyle-Width="11%"> </asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="View" ItemStyle-Width="5%">
                                 <ItemTemplate> 
                                     <asp:LinkButton name="Update" commandName="Update"   Text="view" CssClass="btn btn-xs btn-primary" alt="Edit" ToolTip="Edit" CausesValidation="false" runat="server"></asp:LinkButton>
                            </ItemTemplate>
                    </asp:TemplateColumn>   
               </Columns>  
                <FooterStyle CssClass="EmpsFooter" />
                <SelectedItemStyle CssClass="EmpsSelectedItem" />
                <PagerStyle CssClass="EmpsPagerItem" HorizontalAlign="Center" Mode="NumericPages" />
                <AlternatingItemStyle CssClass="EmpsAltItem" />
                <ItemStyle CssClass="EmpsItem" />
                <HeaderStyle CssClass="EmpsHeader" />
</asp:DataGrid>
</br>
<center><asp:label id ="Label2" value="" visible=false runat="server" /></center>
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
                <h2 class="text-primary">Race History</h2>
                <asp:button id=Tab1_Back runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-primary btn-sm pull-right" Text="Back"></asp:button>
                <asp:Label id="keyField" runat="server" visible=false />
            </div>
        </td>
</tr>
    <asp:PlaceHolder id=RaceHistoryByCattleID Runat="server">
<tr width="100%">
  <td>
  <div class="x_content">
  <asp:DataGrid CssClass="DTGrid table table-striped responsive-utilities jambo_table" ID="RHCGrid" DataKeyField="ID" runat="server" Width="100%" AllowPaging="false" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"  GridLines="None" OnEditCommand="Grid_EditCommand">       
              <Columns>
                    <asp:BoundColumn HeaderText="Animal Name" visible="false" DataField="AnimalName" ItemStyle-Width="20%"></asp:BoundColumn>  
                    <asp:BoundColumn HeaderText="Event Date" DataField="RaceStartTime" ItemStyle-Width="20%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Assosiated Race" DataField="RaceName" ItemStyle-Width="20%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Duration" DataField="Duration" ItemStyle-Width="10%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Distance(m)" DataField="Distance" ItemStyle-Width="10%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Speed(km/h)" DataField="Speed" ItemStyle-Width="10%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Result" DataField="RacePlaceTypeName" ItemStyle-Width="10%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Trainer Name" DataField="TrainerName" ItemStyle-Width="20%"></asp:BoundColumn>
               </Columns>  
                <FooterStyle CssClass="EmpsFooter" />
                <SelectedItemStyle CssClass="EmpsSelectedItem" />
                <PagerStyle CssClass="EmpsPagerItem" HorizontalAlign="Center" Mode="NumericPages" />
                <AlternatingItemStyle CssClass="EmpsAltItem" />
                <ItemStyle CssClass="EmpsItem" />
                <HeaderStyle CssClass="EmpsHeader" />
</asp:DataGrid>
</br>
<center><asp:label id ="Label1" value="" visible=false runat="server" /></center>
</div>
</td>    
</tr>
</asp:PlaceHolder>
<asp:PlaceHolder id=RaceHistoryByTrainerID Runat="server">
<tr width="100%">
  <td>
  <div class="x_content">
  <asp:DataGrid CssClass="DTGrid table table-striped responsive-utilities jambo_table" ID="RHTGrid" DataKeyField="RaceID" runat="server" Width="100%" AllowPaging="false" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"  GridLines="None">       
              <Columns>
                  <asp:BoundColumn HeaderText="Event Date" DataField="RaceStartTime" ItemStyle-Width="20%"></asp:BoundColumn>
                  <asp:BoundColumn HeaderText="Race" DataField="RaceName" ItemStyle-Width="20%"></asp:BoundColumn>
                  <asp:BoundColumn HeaderText="Cattles" DataField="Cattles" ItemStyle-Width="10%"></asp:BoundColumn>
                  <asp:BoundColumn HeaderText="1st Prize" DataField="1st" ItemStyle-Width="10%"></asp:BoundColumn>
                  <asp:BoundColumn HeaderText="2nd Prize" DataField="2nd" ItemStyle-Width="10%"></asp:BoundColumn>
                  <asp:BoundColumn HeaderText="2nd Prize" DataField="3rd" ItemStyle-Width="10%"></asp:BoundColumn>
                  <asp:BoundColumn HeaderText="2nd Prize" DataField="4th" ItemStyle-Width="20%"></asp:BoundColumn>
                  <asp:BoundColumn HeaderText="2nd Prize" DataField="5th" ItemStyle-Width="20%"></asp:BoundColumn>
                  <asp:BoundColumn HeaderText="Fouls" DataField="Foul" ItemStyle-Width="20%"></asp:BoundColumn>
                  <asp:BoundColumn HeaderText="Best Speed" DataField="BestSpeed" ItemStyle-Width="20%"></asp:BoundColumn>
                  <asp:BoundColumn HeaderText="Average Speed" DataField="AvgSpeed" ItemStyle-Width="20%"></asp:BoundColumn>
               </Columns>  
                <FooterStyle CssClass="EmpsFooter" />
                <SelectedItemStyle CssClass="EmpsSelectedItem" />
                <PagerStyle CssClass="EmpsPagerItem" HorizontalAlign="Center" Mode="NumericPages" />
                <AlternatingItemStyle CssClass="EmpsAltItem" />
                <ItemStyle CssClass="EmpsItem" />
                <HeaderStyle CssClass="EmpsHeader" />
</asp:DataGrid>
</br>
<center><asp:label id ="Label3" value="" visible=false runat="server" /></center>
</div>
</td>    
</tr>
</asp:PlaceHolder>
</asp:PlaceHolder>
<!--- Common for all tabs --->

<tr class="PartBrown" >
   <td width="100%" align=center><asp:label id="message" runat="server" visible=false /></td>			
</tr> 			


</table>
	<!--   End of Data Area -->
										
</master:content>

