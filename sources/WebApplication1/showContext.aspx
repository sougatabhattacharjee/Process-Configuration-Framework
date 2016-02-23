<%@ Page Title="Existing Contexts" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeFile="showContext.aspx.cs" Inherits="WebApplication1.showContext" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <div id="menu">
            <nav>
                <ul class="side_menu">
                    <li class="li"><a href="Technology.aspx" class="item"><span class="item_number">1</span>Technology</a></li>
                    <p class="explanation">
                        Label<br />
                        Description<br />
                        Prerequisits<br />
                        Applied in/by
                    </p>
                    <li class="li"><a href="#" class="item"><span class="item_number">2</span>Context</a></li>
                    <p class="explanation">
                        Application Domain<br />
                        Project<br />
                        Environment
                    </p>
                    <li class="li"><a href="#" class="item"><span class="item_number">3</span>Impact on Software</a></li>
                    <p class="explanation">
                        Developments Costs<br />
                        Quality of the product<br />
                        Process outcome<br />
                        Software object<br />
                        Development Schedule
                    </p>
                </ul>
            </nav>
        </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div>
        <asp:Label ID="Label1" runat="server" Text="" Font-Bold="true"></asp:Label>
         
            
        <a id="A1" href="#" runat="server" style="text-decoration:none;">
        <asp:Label ID="Label2" runat="server" Text="" Font-Bold="true"></asp:Label>
            </a>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" 
            SelectCommand="SELECT Contexts.Name as Name,IndustrialSector.Name as Industrial_Sector, [Project_Size], [Project_Kind], [Development_Process], Contexts.ID as ID FROM [Contexts],IndustrialSector where contexts.Industrial_Sector=IndustrialSector.ID"></asp:SqlDataSource>
 </div>
        <div class="form_area item2">
         <div id="form_together">
     <div class="form_domain">
         <table class="table_form">
        
        <tr><td class="col0">
        <asp:Label ID="lblMessage" runat="Server" ForeColor="Red"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" Width="780px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Industrial_Sector" HeaderText="IndustrialSector"  />
                <asp:BoundField DataField="Project_Size" HeaderText="ProjectSize"  />
                <asp:BoundField DataField="Project_Kind" HeaderText="ProjectKind"  />
                <asp:BoundField DataField="Development_Process" HeaderText="DevelopmentProcess"  />
                <%--<asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"  />--%>
                <asp:TemplateField HeaderText="Details">
                    <ItemTemplate>
                        <a href="ContextForm.aspx?c=<%# DataBinder.Eval(Container.DataItem, "ID") %>&t=<%=Request.QueryString.Get("t") %>"><img src="imgs/icons/details.png" alt="Details" title="Details"></a>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Related Technologies">
                    <ItemTemplate>
                        <a href="showTechnology.aspx?c=<%# DataBinder.Eval(Container.DataItem, "ID") %>&cName=<%# DataBinder.Eval(Container.DataItem, "Name") %>"><img src="imgs/icons/related_Context.png" alt="Related Technologies" title="Related Technologies"></a>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Related Impacts">
                    <ItemTemplate>
                        <a href="showImpact.aspx?c=<%# DataBinder.Eval(Container.DataItem, "ID") %>&cName=<%# DataBinder.Eval(Container.DataItem, "Name") %>&t=<%=Request.QueryString.Get("t") %>"><img src="imgs/icons/related_Context.png" alt="Related Impacts" title="Related Impacts"></a>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Edit" Visible="false" >
                    <ItemTemplate>
                        <a href="ContextForm.aspx?mode=Edit&c=<%# DataBinder.Eval(Container.DataItem, "ID") %>&tName=<%# DataBinder.Eval(Container.DataItem, "Name") %>&t=<%=Request.QueryString.Get("t") %>"><img src="imgs/icons/edit.png" alt="Edit" title="Edit"></a>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkRemove" runat="server"

            CommandArgument = '<%# Eval("ID")%>'

         OnClientClick = "return confirm('Do you want to delete?')"

        Text = "Delete" OnClick = "DeleteContext"><img src="imgs/icons/delete.png" alt="Delete" title="Delete" /></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <%--<emptydatarowstyle backcolor="LightBlue" forecolor="Red"/>--%>
             

        <emptydatatemplate>

          <asp:image id="NoDataImage"
            imageurl="~/imgs/no_data_omi.gif"
            alternatetext="No Image" 
            runat="server"/>

           <%-- No Data Found. --%> 

        </emptydatatemplate> 
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle HorizontalAlign="Center" />
       <PagerTemplate>
        
  
        <div style="float:left">
        Page: <%# GridView1.PageIndex + 1%>
        </div>
        <div style="float:right">
        Total Rows: <%# GridView1.Rows.Count%>
        </div>
        <div style="float:none;white-space:nowrap">
            <asp:LinkButton ID="FirstButton" CommandName="Page" CommandArgument="First" Text="First" RunAt="server">
                <img src="imgs/first.png" alt="First" height="16" width="16" /></asp:LinkButton>
        <asp:LinkButton id="lnkPrevious"
            Text="<"
            CommandName="Page"
            CommandArgument="Prev"
            Runat="server" Font-Underline="false"><img src="imgs/previous.png" alt="Previous" height="16" width="16" /></asp:LinkButton>
            <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Page" CommandArgument="2" Text="2"></asp:LinkButton>--%>
        <asp:LinkButton
            id="lnkNext"
            Text=">"
            CommandName="Page"
            CommandArgument="Next"
            Runat="server" Font-Underline="false" ><img src="imgs/next.png" alt="Next" height="16" width="16" /></asp:LinkButton>
            <asp:LinkButton ID="LastButton"  CommandName="Page" CommandArgument="Last"  Text="Last" RunAt="server">
                 <img src="imgs/last.png" alt="Last" height="16" width="16" /></asp:LinkButton>
        </div>
           
        </PagerTemplate>
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
            <HeaderStyle CssClass="label" />
            <RowStyle CssClass="label" />
        </asp:GridView>
            </td></tr>
              <tr><td>
                  
                 <%if(!String.IsNullOrEmpty(Request.QueryString.Get("t"))) {%>
                          <asp:Button ID="b1" runat="server" Text="Back to Technology List" CssClass="button gray" />
                <%}else if(!String.IsNullOrEmpty(Request.QueryString.Get("i"))) {%>
                          <asp:Button ID="Button2" runat="server" Text="Back to Impact List" CssClass="button gray"/>
                <%} else { %>
                        
                  <input type="button" value="Back" class="button gray"  onclick="javascript: window.history.back();" />
                 <%} %>
                 </td></tr>

             </table>
             </div>
             </div>
            </div>

</asp:Content>