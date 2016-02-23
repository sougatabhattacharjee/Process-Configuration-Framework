<%@ Page Title="Existing Impacts" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeFile="showImpact.aspx.cs" Inherits="WebApplication1.showImpact" %>

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

    <div class="form_area item3">
        <div id="form_together">
            <div class="form_domain">
                <asp:Label ID="Label1" runat="server" Text="" Font-Bold="true"></asp:Label>
                <% String c = Request.QueryString.Get("c");
                   if (!string.IsNullOrEmpty(Request.QueryString.Get("cName")))
                   { %>
                <a id="A1" href="#" runat="server" style="text-decoration: none;">
                    <asp:Label ID="Label2" runat="server" Text="" Font-Bold="true"></asp:Label>
                </a>
                <%} %>
                <table class="table_form">
                    <tr>
                        <td class="col0">
                            <asp:Label ID="lblMessage" runat="Server" ForeColor="Red"></asp:Label>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                                SelectCommand="SELECT ID,[Name], [Total_Cost], [Total_Schedule] FROM [Impacts]"></asp:SqlDataSource>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="780px" AllowSorting="true">

                                <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField DataField="Total_Cost" HeaderText="TotalCost" SortExpression="Total_Cost" />
                                    <asp:BoundField DataField="Total_Schedule" HeaderText="TotalSchedule" SortExpression="Total_Schedule" />
                                    <%--<asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"  />--%>

                                    <asp:TemplateField HeaderText="Details">

                                        <ItemTemplate>
                                            <a href="ImpactOnSoftware.aspx?i=<%# DataBinder.Eval(Container.DataItem, "ID") %>">
                                                <img src="imgs/icons/details.png" alt="Details" title="Details"></img></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Related Context">
                                        <ItemTemplate>
                                            <a href="showContext.aspx?i=<%# DataBinder.Eval(Container.DataItem, "ID") %>&iName=<%# DataBinder.Eval(Container.DataItem, "Name") %>">
                                                <img src="imgs/icons/related_Context.png" alt="Related Contexts" title="Related Contexts"></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit" Visible="false">
                                        <ItemTemplate>
                                            <a href="ImpactOnSoftware.aspx?mode=Edit&i=<%# DataBinder.Eval(Container.DataItem, "ID") %>&tName=<%# DataBinder.Eval(Container.DataItem, "Name") %>">
                                                <img src="imgs/icons/edit.png" alt="Edit" title="Edit"></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkRemove" runat="server"
                                                CommandArgument='<%# Eval("ID")%>'
                                                OnClientClick="return confirm('Do you want to delete?')"
                                                Text="Delete" OnClick="DeleteImpact"><img src="imgs/icons/delete.png" alt="Delete" title="Delete" /></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <%-- <emptydatarowstyle backcolor="LightBlue"
          forecolor="Red"/>--%>

                                <EmptyDataTemplate>

                                    <asp:Image ID="NoDataImage"
                                        ImageUrl="~/imgs/no_data_omi.gif"
                                        AlternateText="No Image"
                                        runat="server" />

                                    <%--  No Data Found. --%>
                                </EmptyDataTemplate>

                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <PagerStyle HorizontalAlign="Center" />

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

                            <input type="button" value="Back" class="button gray" onclick="javascript: window.history.back();" />
                        </td>
                    </tr>


                </table>
            </div>
        </div>
    </div>

</asp:Content>
