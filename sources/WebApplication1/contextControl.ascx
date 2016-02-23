<%@ Control Language="C#" AutoEventWireup="true" CodeFile="contextControl.ascx.cs" Inherits="WebApplication1.contextControl" %>

 <div class="form_area_new">
        <div id="form_together">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" InsertCommand="INSERT INTO Contexts(Paradigm, Interdependency, Industrial_Sector, Project_Size, Project_Kind, IT_Environment, Development_Environment, Development_Process, Name, Project_Type) VALUES (@Paradigm, @Interdependency, @Industrial_Sector, @Project_Size, @Project_Kind, @IT_Environment, @Development_Environment, @Development_Process,@Name, @Project_Type)" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                SelectCommand="SELECT Contexts.* FROM Contexts order by ID desc" OnInserted="SqlDataSource1_Inserted"
                UpdateCommand="UPDATE Contexts SET Paradigm =@Paradigm, Interdependency =@Interdependency, Industrial_Sector =@Industrial_Sector, Project_Size =@Project_Size, Project_Kind =@Project_Kind, IT_Environment =@IT_Environment, Development_Environment =@Development_Environment, Development_Process =@Development_Process, 
                         Name =@Name, Project_Type =@Project_Type where ID=@Id">
                <InsertParameters>
                    <asp:Parameter Name="Paradigm" />
                    <asp:Parameter Name="Interdependency" />
                    <%--<asp:Parameter Name="Industrial_Sector" />--%>
                    <asp:FormParameter Name="Industrial_Sector" />
                    <asp:Parameter Name="Project_Size" />
                    <asp:Parameter Name="Project_Kind" />
                    <asp:Parameter Name="IT_Environment" />
                    <asp:Parameter Name="Development_Environment" />
                    <asp:Parameter Name="Development_Process" />
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Project_Type" />
                </InsertParameters>

                <UpdateParameters>
                    <asp:Parameter Name="Paradigm" />
                    <asp:Parameter Name="Interdependency" />
                    <%--<asp:Parameter Name="Industrial_Sector" />--%>
                    <asp:FormParameter Name="Industrial_Sector" />
                    <asp:Parameter Name="Project_Size" />
                    <asp:Parameter Name="Project_Kind" />
                    <asp:Parameter Name="IT_Environment" />
                    <asp:Parameter Name="Development_Environment" />
                    <asp:Parameter Name="Development_Process" />
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Project_Type" />
                    <asp:Parameter Name="Id" />
                </UpdateParameters>


            </asp:SqlDataSource>

            <asp:SqlDataSource ID="selectMaxContextId" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>"
                SelectCommand="SELECT MAX(ID) as ID FROM Contexts"
                ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"></asp:SqlDataSource>
            <br />

            <asp:SqlDataSource ID="InsertTCI" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>"
                InsertCommand="INSERT INTO TCI(Technology,Context,Impact) VALUES (@Technology,@Context,@Impact)"
                ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT * FROM ISO_IMPACT">

                <InsertParameters>
                    <asp:Parameter Name="Technology" />
                    <asp:Parameter Name="Context" />
                    <asp:Parameter Name="Impact" DefaultValue="-1" />
                </InsertParameters>
            </asp:SqlDataSource>
            <%--<asp:Parameter Name="Industrial_Sector" />--%>



            <asp:SqlDataSource ID="ALLTechnology" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                SelectCommand="SELECT TechnologyId as ID, Name FROM Technologies where TechnologyId not in (select Technology from TCI where context = @cID)">
                <SelectParameters>
                    <asp:Parameter Name="cID" />
                </SelectParameters>


            </asp:SqlDataSource>

            <asp:SqlDataSource ID="RelatedImpact" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                SelectCommand="SELECT ID as ID,Name as [Related Impact] FROM Impacts WHERE (ID IN (SELECT impact FROM TCI WHERE (Context = @cID) and (technology=@tID)))">
                <SelectParameters>
                    <asp:Parameter Name="cID" />
                    <asp:Parameter Name="tID" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="ALLImpact" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                SelectCommand="SELECT ID as ID, Name FROM Impacts where ID not in (select Impact from TCI where context = @cID and technology=@tID and impact <> -1)">
                <SelectParameters>
                    <asp:Parameter Name="cID" />
                    <asp:Parameter Name="tID" />
                </SelectParameters>

            </asp:SqlDataSource>

            <asp:SqlDataSource ID="RelatedTechnology" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" 
                SelectCommand="SELECT TechnologyId as ID,Name as [Related Technology] FROM Technologies WHERE (TechnologyId IN (SELECT Technology FROM TCI WHERE (Context = @cID)))">
                <SelectParameters>
                    <asp:Parameter Name="cID" />
                </SelectParameters>

            </asp:SqlDataSource>
            <%--<asp:Parameter Name="Industrial_Sector" />--%>


            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="ReadOnly" AllowPaging="True" OnModeChanged="FormView_ModeChanged" Width="750px">
                <EditItemTemplate>
                            <div class="form_domain">
                            <table class="table_form">
                                <tr>
                                    <td rowspan="1" class="col0"></td>
                                    <td class="col1" ><asp:Label ID="Label24" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                        <label class="label">Context Name:</label></td>
                                    <td class="col2">
                                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' CausesValidation="True" ValidateRequestMode="Enabled" ToolTip="Context Name" CssClass="textfield" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="NameTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </td>
                                </tr>
                            </table>
                        </div>

                            <div class="form_domain">
                                <table class="table_form">
                                    <tr>
                                        <td rowspan="1" class="col0">
                                            <img alt="domain" src="imgs/domain.gif" width="14" height="59"></img>
                                        </td>
                                        <td class="col1">
                                            <label class="label">Industrial Sector:</label>
                                        </td>

                                        <td class="col2">
                                            <asp:DropDownList ID="Industrial_Sector" runat="server" DataSourceID="SqlDataSourceIndustrialSector" DataTextField="Name" DataValueField="ID" Height="25px" Width="550px">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSourceIndustrialSector" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" InsertCommand="INSERT INTO IndustrialSector(Name, Specification) VALUES (@Name, @Specification)" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT IndustrialSector.* FROM IndustrialSector">
                                                <InsertParameters>
                                                    <asp:Parameter Name="Name" />
                                                    <asp:Parameter Name="Specification" />
                                                </InsertParameters>
                                            </asp:SqlDataSource>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div class="form_domain">
                                <table class="table_form">
                                    <tr>
                                        <td rowspan="3" class="col0">
                                            <img src="imgs/project.gif" alt="project" width="17" height="58"></td>
                                        <td class="col1" ><asp:Label ID="Label4" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                            <label class="label">Size (PM):</label></td>
                                        <td class="col2">
                                            <asp:TextBox ID="Project_SizeTextBox" runat="server" Text='<%# Bind("Project_Size") %>' CssClass="textfield" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="Project_SizeTextBox" ErrorMessage="Required!" 
 runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                        ControlToValidate="Project_SizeTextBox"
                                        ValidationExpression="\d+"
                                        Display="Static"
                                        EnableClientScript="true"
                                        ErrorMessage="Enter Numbers only!!"
                                        runat="server" Font-Bold="False" Font-Overline="False" ForeColor="Red" />
                                            </td>
                                    </tr>

                                    <tr>
                                        <td class="col1" ><asp:Label ID="Label5" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                            <label class="label">Kind of Software:</label></td>
                                        <td class="col2">
                                            <asp:TextBox ID="Project_KindTextBox" runat="server" Text='<%# Bind("Project_Kind") %>' TextMode="MultiLine" CssClass="textfield" /> 
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Project_KindTextBox" ErrorMessage="Required!" 
 runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="col1" >
                                            <label class="label">Type of project:</label></td>
                                        <td class="col2">
                                            <asp:TextBox ID="Project_TypeTextBox" runat="server" Text='<%# Bind("Project_Type") %>' CssClass="textfield" /> 
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div class="form_domain">
                                <table class="table_form">
                                    <tr>
                                        <td rowspan="5" class="col0">
                                            <img src="imgs/environment.gif" alt="environment" width="14" height="100"></td>
                                        <td class="col1">
                                            <label class="label">IT Environment:</label></td>
                                        <td class="col2">
                                            <asp:TextBox ID="IT_EnvironmentTextBox" runat="server" Text='<%# Bind("IT_Environment") %>' TextMode="MultiLine" CssClass="textfield" /> 
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="col1"><asp:Label ID="Label6" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                            <label class="label">Development Environment:</label></td>
                                        <td class="col2">
                                            <asp:TextBox ID="Development_EnvironmentTextBox" runat="server" Text='<%# Bind("Development_Environment") %>' TextMode="MultiLine" CssClass="textfield" /> 
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="Development_EnvironmentTextBox" ErrorMessage="Required!" 
 runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="col1">
                                            <label class="label">Development process:</label></td>
                                        <td class="col2">
                                            <asp:TextBox ID="Development_ProcessTextBox" runat="server" Text='<%# Bind("Development_Process") %>' CssClass="textfield" /> 
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="col1">
                                            <label class="label">Paradigma:</label></td>
                                        <td class="col2">
                                            <asp:TextBox ID="ParadigmTextBox" runat="server" Text='<%# Bind("Paradigm") %>' TextMode="MultiLine" CssClass="textfield" /> 
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="col1" >
                                            <label class="label">Interdependancy:</label></td>
                                        <td class="col2">
                                            <asp:TextBox ID="InterdependencyTextBox" runat="server" Text='<%# Bind("Interdependency") %>' CssClass="textfield" /> 
                                        </td>
                                    </tr>
                           
                            </div>

                         
                       <div class="form_domain">
                               
                                        <table class="table_form">
                                            <tr>
                                                 <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>

                                                <td  rowspan="1" class="col0">
                                                </td>
                                                <td class="col1" >
                                                    <asp:GridView BorderStyle="None" BorderWidth="0px" GridLines="None" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="RelatedTechnology">
                                                        <Columns>
                                                            <asp:BoundField DataField="Related Technology" ControlStyle-CssClass="label" HeaderText="Related Technology:" SortExpression="Related Technology">

                                                                <ControlStyle CssClass="label" />
                                                            </asp:BoundField>

                                                            <asp:TemplateField HeaderText="">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkRemove" runat="server"
                                                                        CommandArgument='<%# Eval("ID")%>'
                                                                        OnClientClick="return confirm('Do you want to delete?')"
                                                                        Text="Delete" OnClick="DeleteTechnology" BorderStyle="None"><img src="imgs/icons/delete.png" alt="Delete" title="Delete" /></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>
                                                        <EmptyDataRowStyle
                                                            ForeColor="Red" />
                                                        <EmptyDataTemplate>
                                                            No Related Technology Found!! 
                                                        </EmptyDataTemplate>
                                                        <HeaderStyle CssClass="label" />
                                                        <RowStyle CssClass="label" />
                                                    </asp:GridView>
                                                    <br />
                                                    <asp:Label ID="lblMessage" runat="Server" ForeColor="Red"></asp:Label>
                                                    <br />
                                                    <asp:Button ID="Button2" runat="server" OnClick="AddRelTech" Text="Add Related Technology" CssClass="button gray" Width="164px" />
                                                    <br />
                                                </td>


                                                <td class="col2" id="tdUpdate" style="text-align: left" runat="server" visible="true">
                                                    <asp:Panel ID="AddTechnologyUpdatePanel" runat="server" Visible="false">
                                                        Select Existing Technology:
                                      <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ALLTechnology" DataTextField="Name" DataValueField="ID">
                                      </asp:DropDownList>
                                                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Add" CssClass="button gray" />
                                                    </asp:Panel>
                                                </td>
                                          </ContentTemplate>
                                </asp:UpdatePanel>
                                            </tr>
                                        </table>
                                  
                          </div>

                   


                            <div class="form_domain">
                                
                                        <table class="table_form">
                                            <tr>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                                <td rowspan="1" class="col0" ></td>
                                                <td class="col1">
                                                    <asp:GridView BorderStyle="None" BorderWidth="0px" GridLines="None" ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="RelatedImpact">
                                                        <Columns>
                                                            <asp:BoundField DataField="Related Impact" HeaderText="Related Impact :" SortExpression="Related Impact" />

                                                            <asp:TemplateField HeaderText="">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkRemove" runat="server"
                                                                        CommandArgument='<%# Eval("ID")%>'
                                                                        OnClientClick="return confirm('Do you want to delete?')"
                                                                        Text="Delete" OnClick="DeleteImpact"><img src="imgs/icons/delete.png" alt="Delete" title="Delete" /></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EmptyDataRowStyle
                                                            ForeColor="Red" />
                                                        <EmptyDataTemplate>
                                                            No Related Impact Found!! 
                                                        </EmptyDataTemplate>
                                                        <HeaderStyle CssClass="label" />
                                                        <RowStyle CssClass="label" />
                                                    </asp:GridView>
                                                    <br />
                                                    <asp:Label ID="Label11" runat="Server" ForeColor="Red"></asp:Label>
                                                    <br />
                                                    <asp:Button ID="Button5" runat="server" OnClick="AddRelImp" Text="Add Related Impact" CssClass="button gray" Width="159px" />
                                                    <br />
                                                </td>

                                                



                                               <td class="col2" id="td1" style="text-align: left" runat="server" visible="true">
                                                    <asp:Panel ID="AddImpactUpdatePanel" runat="server" Visible="false">
                                                        Select Existing Impacts:
                                                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="ALLImpact" DataTextField="Name" DataValueField="ID">
                                                        </asp:DropDownList>
                                                        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Add" CssClass="button gray" />
                                                    </asp:Panel>
                                                </td>
                                         </ContentTemplate>
                                </asp:UpdatePanel>
                                            </tr>
                                        </table>
                                   
                            </div>





                            <div class="form_domain">
                                <table class="table_form">
                                    <tr>
                                        <td rowspan="1" class="col0">
                                        </td>
                                        <td class="col1">
                                        </td>
                                        <td class="col2" >
                                            <label class="label">
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="button gray" Width="100px" OnClick="UpdateButton_Click" /></label>
                                            <label class="label">
                                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="button gray"  Width="100px" /></label></td>
                                    </tr>
                                </table>
                            </div>
                        
                </EditItemTemplate>


                <InsertItemTemplate>
                    <link href="stylesheets/layout.css" rel="stylesheet" type="text/css">

                   
                        <div class="form_domain">
                            <table class="table_form">
                                <tr>
                                    <td rowspan="1" class="col0"></td>
                                    <td class="col1"><asp:Label ID="Label24" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                        <label class="label">Context Name:</label></td>
                                    <td class="col2">
                                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' CausesValidation="True" ValidateRequestMode="Enabled" ToolTip="Context Name" CssClass="textfield" Style="margin-left: 1px" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="NameTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" CssClass="label"
                                            ValidationGroup="insertContext"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="form_domain">
                            <table class="table_form">
                                <tr>
                                    <td rowspan="2" class="col0">
                                        <img alt="domain" src="imgs/domain.gif" width="14" height="59"></img></td>
                                    <td class="col1">
                                        <label class="label">Industrial Sector:</label>
                                    </td>

                                    <td class="col2">
                                       <asp:DropDownList ID="Industrial_Sector" runat="server" DataSourceID="SqlDataSourceIndustrialSector" DataTextField="Name" DataValueField="ID" Height="25px" Width="200px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceIndustrialSector" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" InsertCommand="INSERT INTO IndustrialSector(Name, Specification) VALUES (@Name, @Specification)" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT IndustrialSector.* FROM IndustrialSector">
                                            <InsertParameters>
                                                <asp:Parameter Name="Name" />
                                                <asp:Parameter Name="Specification" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>

                                    </td>
                                </tr>

                                <tr>
                                    <td class="col1">
                                        <label class="label">other Industrial Sector:</label>
                                        <td class="col2">
                                            <asp:TextBox ID="OtherIndustrial_Sector" runat="server" Text='<%# Bind("Industrial_Sector") %>' CssClass="textfield" Enabled="false" />
                                        </td>
                                </tr>
                            </table>
                        </div>

                        <div class="form_domain">
                            <table class="table_form">
                                <tr>
                                    <td rowspan="3" class="col0">
                                        <img src="imgs/project.gif" alt="project" width="17" height="58"></img></td>
                                    <td class="col1"><asp:Label ID="Label1" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                        <label class="label">Size (PM):</label></td>
                                    <td class="col2">
                                        <asp:TextBox ID="Project_SizeTextBox" runat="server" Text='<%# Bind("Project_Size") %>' CssClass="textfield" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="Project_SizeTextBox" ErrorMessage="Required!" 
 runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" ValidationGroup="insertContext"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                        ControlToValidate="Project_SizeTextBox"
                                        ValidationExpression="\d+"
                                        Display="Static"
                                        EnableClientScript="true"
                                        ErrorMessage="Enter Numbers only!!"
                                        runat="server" Font-Bold="False" Font-Overline="False" ForeColor="Red" ValidationGroup="insertContext"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col1">
                                        <asp:Label ID="Label2" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                        <label class="label">Kind of Software:</label></td>
                                    <td class="col2">
                                        <asp:TextBox ID="Project_KindTextBox" runat="server" Text='<%# Bind("Project_Kind") %>' TextMode="MultiLine" CssClass="textfield" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Project_KindTextBox" ErrorMessage="Required!" 
 runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" ValidationGroup="insertContext"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="col1">
                                        <label class="label">Type of project:</label></td>
                                    <td class="col2">
                                        <asp:TextBox ID="Project_TypeTextBox" runat="server" Text='<%# Bind("Project_Type") %>' CssClass="textfield" />
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="form_domain">
                            <table class="table_form">
                                <tr>
                                    <td rowspan="5" class="col0">
                                        <img src="imgs/environment.gif" alt="environment" width="14" height="100"></td>
                                    <td class="col1">
                                        <label class="label">IT Environment:</label></td>
                                    <td class="col2">
                                        <asp:TextBox ID="IT_EnvironmentTextBox" runat="server" Text='<%# Bind("IT_Environment") %>' TextMode="MultiLine" CssClass="textfield" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="col1"><asp:Label ID="Label3" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                        <label class="label">Development Environment:</label></td>
                                    <td class="col2">
                                        <asp:TextBox ID="Development_EnvironmentTextBox" runat="server" Text='<%# Bind("Development_Environment") %>' TextMode="MultiLine" CssClass="textfield" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Development_EnvironmentTextBox" ErrorMessage="Required!" 
 runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" ValidationGroup="insertContext"></asp:RequiredFieldValidator>
                                    </td>
                                     
                                </tr>

                                <tr>
                                    <td class="col1">
                                        <label class="label">Development process:</label></td>
                                    <td class="col2">
                                        <asp:TextBox ID="Development_ProcessTextBox" runat="server" Text='<%# Bind("Development_Process") %>' CssClass="textfield" /></td>
                                </tr>

                                <tr>
                                    <td class="col1">
                                        <label class="label">Paradigma:</label></td>
                                    <td class="col2">
                                        <asp:TextBox ID="ParadigmTextBox" runat="server" Text='<%# Bind("Paradigm") %>' TextMode="MultiLine" CssClass="textfield" /></td>
                                </tr>

                                <tr>
                                    <td class="col1">
                                        <label class="label">Interdependancy:</label></td>
                                    <td class="col2">
                                        <asp:TextBox ID="InterdependencyTextBox" runat="server" Text='<%# Bind("Interdependency") %>' CssClass="textfield" /></td>
                                </tr>

                            </table>
                        </div>

                        <div class="form_domain">
                            <table class="table_form">
                                <tr>
                                    <td rowspan="1" class="col0"></td>
                                    <td class="col1">
                                    </td>
                                    <td class="col2">
                                         <label class="label">
                                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" OnClick="Button1_Click" Text="Save" CssClass="button gray"  Width="100px" ValidationGroup="insertContext"/>
                                        </label>
                                        <label class="label">
                                            <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="button gray"  Width="100px" />
                                        </label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    
                </InsertItemTemplate>

                <ItemTemplate>
                    <link href="stylesheets/layout.css" rel="stylesheet" type="text/css">
                    
                        <div class="form_domain">
                            <table class="table_form">
                                <tr>
                                    <td class="col0"></td>
                                    <td class="col1">
                                        <label class="label">Context Name:</label></td>
                                    <td class="col2">
                                        <asp:Label ID="NameLbl" CssClass="label" runat="server" Text='<%# Bind("Name") %>' Height="25px" />

                                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("ID") %>' />
                                        <asp:HiddenField ID="HiddenIndustrial_Sector" runat="server" Value='<%# Bind("Industrial_Sector") %>' />
                                        <asp:HiddenField ID="ContextID" runat="server" Value='<%# Eval("ID") %>' />
                                        <asp:HiddenField ID="ContextIDHidden" runat="server" Value='<%# Eval("ID") %>' />
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="form_domain">
                            <table class="table_form">

                                <tr>
                                    <td rowspan="2" class="col0">
                                        <img src="imgs/domain.gif" alt="domain" width="14" height="59"></td>
                                    <td class="col1">
                                        <label class="label">Industrial Sector:</label>
                                    </td>
                                    <td class="col2">
                                        <asp:BulletedList ID="BulletedList2" runat="server" BulletStyle="Disc" DataSourceID="ShowIndustrialSectorName" DataTextField="Name" DataValueField="Name" Height="10px" Width="10px">
                                        </asp:BulletedList>

                                        <asp:SqlDataSource ID="ShowIndustrialSectorName" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT        Name
                               FROM            IndustrialSector
                               WHERE        (ID = @ID)">
                                            <SelectParameters>
                                                <asp:ControlParameter Name="ID" ControlID="HiddenIndustrial_Sector" PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="col1">
                                        <label class="label">other:</label>
                                    </td>
                                    <td class="col2">
                                        <asp:Label ID="Industrial_SectorLabel" runat="server" Text='<%# Bind("Industrial_Sector") %>' />
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="form_domain">
                            <table class="table_form">
                                <tr>
                                    <td rowspan="3" class="col0">
                                        <img src="imgs/project.gif" alt="project" width="17" height="58"></td>
                                    <td class="col1">
                                        <label class="label">Size (PM):</label></td>
                                    <td class="col2">
                                        <asp:Label ID="Project_SizeLabel" CssClass="label" runat="server" Text='<%# Bind("Project_Size") %>' />
                                        PM </td>
                                </tr>
                                <tr>
                                    <td class="col1">
                                        <label class="label">Software Type:</label></td>
                                    <td class="col2">
                                        <asp:Label ID="Project_KindLabel" runat="server" Text='<%# Bind("Project_Kind") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col1">
                                        <label class="label">Project Type:</label></td>
                                    <td class="col2">
                                        <asp:Label ID="Project_TypeLabel" runat="server" Text='<%# Bind("Project_Type") %>' />
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="form_domain_contextENVdiv">
                            <table class="table_form">
                                <tr>
                                    <td rowspan="7" class="col0">
                                        <img src="imgs/environment.gif" alt="environment" width="14" height="100"></td>
                                    <td class="col1">
                                        <label class="label">IT Environment:</label></td>
                                    <td class="col2">
                                        <asp:Label ID="IT_EnvironmentLabel" runat="server" Text='<%# Bind("IT_Environment") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col1">
                                        <label class="label">Development Environment:</label></td>
                                    <td class="col2">
                                        <asp:Label ID="Development_EnvironmentLabel" runat="server" Text='<%# Bind("Development_Environment") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col1">
                                        <label class="label">Development process:</label>
                                    </td>
                                    <td class="col2">
                                        <asp:Label ID="Development_ProcessLabel" runat="server" Text='<%# Bind("Development_Process") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col1">
                                        <label class="label">Paradigma:</label>
                                    </td>
                                    <td class="col2">
                                        <asp:Label ID="ParadigmLabel" runat="server" Text='<%# Bind("Paradigm") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col1">
                                        <label class="label">Interdependancy:</label>
                                    </td>
                                    <td class="col2">
                                        <asp:Label ID="InterdependencyLabel" runat="server" Text='<%# Bind("Interdependency") %>' />
                                    </td>
                                </tr>

                                <tr >
                                    <td class="col1" >
                                        <label class="label">Related Technologies:</label>
                                    </td>
                                    <td class="col2">
                                        <asp:BulletedList ID="BulletedList3" runat="server" DataSourceID="ListExistingTechnologies" DataTextField="Name" DataValueField="TechnologyId" Height="15px" Width="150px" CssClass="label">
                                        </asp:BulletedList>
                                        <asp:SqlDataSource ID="ListExistingTechnologies" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT DISTINCT Technologies.TechnologyId as TechnologyId, Technologies.Name as Name
FROM            Technologies INNER JOIN
                         TCI ON Technologies.TechnologyId = TCI.Technology
WHERE        (TCI.Context =@contextID)">
                                            <SelectParameters>
                                                <asp:ControlParameter Name="contextID" ControlID="ContextIDHidden" PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="col1">
                                        <label class="label">Related Impacts:</label>
                                    </td>
                                    <td class="col2">
                                        <asp:BulletedList ID="BulletedList1" runat="server" DataSourceID="AddRelatedImpacts" DataTextField="Name" DataValueField="ImpactID" Height="15px" Width="150px" CssClass="label">
                                        </asp:BulletedList>
                                        <asp:SqlDataSource ID="AddRelatedImpacts" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT DISTINCT Impacts.ID as ImpactID, Impacts.Name as Name
FROM            Impacts INNER JOIN
                         TCI ON Impacts.ID = TCI.Impact
WHERE        (TCI.Context =@contextID)">
                                            <SelectParameters>
                                                <asp:ControlParameter Name="contextID" ControlID="ContextIDHidden" PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="ListExistingImpacts" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT NAME,[ID] FROM [Impacts]"></asp:SqlDataSource>
                                    </td>
                                </tr>

                            </table>
                        </div>

                    <div class="form_domain">
                            <table class="table_form">
                                <tr>
                                    <td rowspan="1" class="col0"></td>
                                    <td class="col1">
                                    </td>
                                    <td class="col2">
                                         <label class="label">
                                              <asp:Button ID="NewButton" runat="server" CausesValidation="False" OnClick="EditButton_Click" Text="Edit Context" CssClass="button gray" Width="150px" />
                                        </label>
                                         <%if(!String.IsNullOrEmpty(Request.QueryString.Get("t"))) {%>
                                         <label class="label">
                                            <asp:Button ID="insertImpact" runat="server" CausesValidation="True" OnClick="insertImpact_Click" Text="Insert Related Impact" CssClass="button gray"  Width="150px" />
                                        </label>
                                         <%} %>
                                    </td>
                                </tr>
                            </table>
                        </div>

                
                </ItemTemplate>

                <PagerTemplate>

                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0" style="text-align: center">
                                    <div style="float: left">
                                        <label class="label">
                                            Page: <%# FormView1.PageIndex + 1%></label>
                                    </div>
                                    <div style="float: right">
                                        <label class="label">
                                            Total Page: <%# FormView1.PageCount%></label>
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
                                </td>
                            </tr>
                        </table>
                    </div>
                    <headerstyle cssclass="label" />
                    <rowstyle cssclass="label" />

                </PagerTemplate>

            </asp:FormView>
        </div>
    </div>