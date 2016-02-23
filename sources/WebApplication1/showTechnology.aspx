<%@ Page Title="Existing Technologies" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="showTechnology.aspx.cs" Inherits="WebApplication1.showTechnology" %>

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
        <% String c = Request.QueryString.Get("c");
           if (!string.IsNullOrEmpty(Request.QueryString.Get("cName")))
           { %>
        <a id="A1" href="" runat="server" style="text-decoration: none;">
            <asp:Label ID="Label2" runat="server" Text="" Font-Bold="true"></asp:Label>
        </a>
        <%} %>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
            SelectCommand="SELECT        Technologies.Name,Technologies.Abbreviation as Abbreviation, Technologies.Family, Technologies.TechnologyId, SEphase.Name SE_Phase , Author.Name as Author FROM            Technologies INNER JOIN
                         Author ON Technologies.Author = Author.ID INNER JOIN
                         SEphase ON Technologies.SE_Phase = SEphase.ID"></asp:SqlDataSource>

    </div>
    <div class="form_area item1">
        <div id="form_together">
            <div class="form_domain">
                <table class="table_form">
                    <tr>
                        <td class="col0">
                            <asp:Label ID="lblMessage" runat="Server" ForeColor="Red"></asp:Label>
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="TechnologyId" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="780px" Style="margin-right: 0px; " AllowSorting="true">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Abbreviation" HeaderText="Name" SortExpression="Abbreviation" ItemStyle-Width="50px" />
                                    <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" ItemStyle-Width="50px" />
                                    <asp:BoundField DataField="Family" HeaderText="Family" SortExpression="Family" ItemStyle-Width="50px" />
                                    <%--<asp:BoundField DataField="TechnologyId" HeaderText="TechnologyId" InsertVisible="False" ReadOnly="True" SortExpression="TechnologyId" />--%>
                                    <asp:BoundField DataField="SE_Phase" HeaderText="SEPhase" SortExpression="SE_Phase" ItemStyle-Width="50px" />
                                    <%--<asp:BoundField DataField="TECHNOLOGYID" HeaderText="TECHNOLOGYID" InsertVisible="False" ReadOnly="True"  />--%>
                                    <asp:TemplateField ItemStyle-Width="50px">
                                        <HeaderTemplate>
                                             <div style="width: 50px">Details</div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div style="width: 50px">
                                                <a href="Technology.aspx?t=<%# DataBinder.Eval(Container.DataItem, "TECHNOLOGYID") %>&tName=<%# DataBinder.Eval(Container.DataItem, "Name") %>">
                                                    <img src="imgs/icons/details.png" alt="Details" title="Details"></a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="50px">
                                         <HeaderTemplate>
                                             <div style="width: 50px">Related <br /> Context</div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                             <div style="width: 50px">
                                            <a href="showContext.aspx?t=<%# DataBinder.Eval(Container.DataItem, "TECHNOLOGYID") %>&tName=<%# DataBinder.Eval(Container.DataItem, "Name") %>">
                                                <img src="imgs/icons/related_Context.png" alt="Related Contexts" title="Related Contexts"></a>
                                       </div>
                                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit" ItemStyle-Width="20px">
                                        <ItemTemplate>
                                             <div style="width: 20px">
                                            <a href="Technology.aspx?mode=Edit&t=<%# DataBinder.Eval(Container.DataItem, "TECHNOLOGYID") %>&tName=<%# DataBinder.Eval(Container.DataItem, "Name") %>">
                                                <img src="imgs/icons/edit.png" alt="Edit" title="Edit"></a>
                                                 </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete" ItemStyle-Width="25px">
                                        <ItemTemplate>
                                            <div style="width: 25px">
                                            <asp:LinkButton ID="lnkRemove" runat="server"
                                                CommandArgument='<%# Eval("TECHNOLOGYID")%>'
                                                OnClientClick="return confirm('Do you want to delete?')"
                                                Text="Delete" OnClick="DeleteTechnology"><img src="imgs/icons/delete.png" alt="Delete" title="Delete" /></asp:LinkButton>
                                       </div>
                                                 </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <%--    <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>--%>

                                <EmptyDataTemplate>

                                    <asp:Image ID="NoDataImage"
                                        ImageUrl="~/imgs/no_data_omi.gif"
                                        AlternateText="No Image"
                                        runat="server" />

                                    <%--No Data Found.--%>
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <PagerStyle HorizontalAlign="Center" Font-Names="Trebuchet MS, Arial, Helvetica, sans-serif"
                                    Font-Size="12px" />
                                <PagerTemplate>
                                                    <div style="float: left">
                                                        Page: <%# GridView1.PageIndex + 1%>
                                                    </div>
                                                    <div style="float: right">
                                                        Total Rows: <%# GridView1.Rows.Count%>
                                                    </div>
                                                    <div style="float: none; white-space: nowrap">
                                                        <asp:LinkButton ID="FirstButton" CommandName="Page" CommandArgument="First" Text="First" runat="server">
                <img src="imgs/first.png" alt="First" height="16" width="16" /></asp:LinkButton>
                                                        <asp:LinkButton ID="lnkPrevious"
                                                            Text="<"
                                                            CommandName="Page"
                                                            CommandArgument="Prev"
                                                            runat="server" Font-Underline="false"><img src="imgs/previous.png" alt="Previous" height="16" width="16" /></asp:LinkButton>
                                                        <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Page" CommandArgument="2" Text="2"></asp:LinkButton>--%>
                                                        <asp:LinkButton
                                                            ID="lnkNext"
                                                            Text=">"
                                                            CommandName="Page"
                                                            CommandArgument="Next"
                                                            runat="server" Font-Underline="false"><img src="imgs/next.png" alt="Next" height="16" width="16" /></asp:LinkButton>
                                                        <asp:LinkButton ID="LastButton" CommandName="Page" CommandArgument="Last" Text="Last" runat="server">
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
                        </td>
                    </tr>
                    <tr>
                        <td>

                            <%if (!String.IsNullOrEmpty(Request.QueryString.Get("c")))
                              {%>
                            <asp:Button ID="b1" runat="server" Text="Back to Contexts List" class="button gray" OnClick="b1_Click" />
                            <%}
                              else
                              { %>
                            <asp:Button ID="Button1" runat="server" Text="Back" class="button gray" OnClick="b1_Click" />
                            <%} %>
                            
                            <% if(!String.IsNullOrEmpty(Request.QueryString.Get("search"))) { %>
                            <asp:Button ID="Button3" runat="server" Text="RTP/Matrix" class="button gray" Width="89px" OnClick="showRTP"></asp:Button>
                            <%} %>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

</asp:Content>


