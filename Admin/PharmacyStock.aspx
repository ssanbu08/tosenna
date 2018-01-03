<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PharmacyStock.aspx.cs" Inherits="SchoolNet.PharmacyStock" %>
<%@ Register TagPrefix="Master" Namespace="PresentationManager.Web.UI.MasterPages" Assembly="PresentationManager.Web.UI.MasterPages" %>
 <master:content id="formData" runat="server" height="100%" width="100%">
 <table  border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
  <!--   Search Box -->
 <ASP:PlaceHolder id="EmpSearchBox" Runat="server">
    <tr width="100%">
		<td class="x_title"><h2 class="text-primary">Pharmacy Drug Stocks</h2></td>
	</tr>	
    
	<asp:PlaceHolder id=searchDataArea Runat="server">
<tr width="100%">
  <td>
  <div class="x_content">
  <asp:DataGrid CssClass="DTGrid table table-striped responsive-utilities jambo_table" ID="PSGrid" DataKeyField="PharmacyItemID" runat="server" Width="100%" AllowPaging="false" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"  GridLines="None" OnEditCommand="Grid_EditCommand">       
              <Columns>
                    <asp:BoundColumn HeaderText="Drug Name" DataField="ItemName" ItemStyle-Width="25%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Drug Type" DataField="DrugTypeName" ItemStyle-Width="10%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Minimum Stock" DataField="MinStockLevel" ItemStyle-Width="10%" ></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Maximum Stock" DataField="MaxStockLevel" ItemStyle-Width="10%" ></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Reorder Level" DataField="ReorderLevel" ItemStyle-Width="9%" ></asp:BoundColumn>                    
                    <asp:BoundColumn HeaderText="Current Stock" DataField="CurrentStock" ItemStyle-Width="9%"> </asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="Stock Status" ItemStyle-Width="14%">
                            <ItemTemplate> 
                                <asp:Label CssClass='<%# FindStockStatusClass(Eval("ItemStatus").ToString()) %>' alt="Edit" autopostback="false" CausesValidation="false" runat="server"> <%# Eval("ItemStatus")%></asp:Label>
                            </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn HeaderText="Availability (%)" DataField="Availability" ItemStyle-Width="8%"> </asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="History" ItemStyle-Width="5%">
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

</asp:PlaceHolder>

<!---  Data Content Area -->						

<!--    Edit Employee Data Area -->
<asp:PlaceHolder id=EditArea Runat="server" visible="false">
 <tr width="100%">
		<td class="x_title">
            <div class="col-lg-12">
                <h2 class="text-primary">Pharmacy Drug Stock History</h2>
                <asp:button id=Tab1_Back runat="server" CausesValidation="false" CssClass="btn btn-lg btn-round btn-primary btn-sm pull-right" Text="Back"></asp:button>
                <asp:Label id="keyField" runat="server" visible=false />
            </div>
        </td>
</tr>
<tr width="100%">
  <td>
  <div class="x_content">
  <asp:DataGrid CssClass="DTGrid table table-striped responsive-utilities jambo_table" ID="SHGrid" DataKeyField="TxnID" runat="server" Width="100%" AllowPaging="false" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"  GridLines="None" OnEditCommand="Grid_EditCommand">       
              <Columns>
                    <asp:BoundColumn HeaderText="Drug Name" DataField="ItemName" ItemStyle-Width="25%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Transaction" DataField="TxnTypeName" ItemStyle-Width="15%"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Previous Stock Value" DataField="OldStock" ItemStyle-Width="10%" ></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Updated Stock Value" DataField="NewStock" ItemStyle-Width="10%" ></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Bill reference" DataField="BillReference" ItemStyle-Width="20%" ></asp:BoundColumn>                    
                    <asp:BoundColumn HeaderText="Accessed on" DataField="AccessDate" ItemStyle-Width="20%"> </asp:BoundColumn>
                    <asp:BoundColumn HeaderText="Accessed By" DataField="AccessBy" ItemStyle-Width="15%"> </asp:BoundColumn>
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
<!--- Common for all tabs --->

<tr class="PartBrown" >
   <td width="100%" align=center><asp:label id="message" runat="server" visible=false /></td>			
</tr> 			


</table>
	<!--   End of Data Area -->
										
</master:content>

