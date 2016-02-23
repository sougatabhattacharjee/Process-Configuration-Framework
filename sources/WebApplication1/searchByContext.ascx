<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="searchByContext.ascx.cs" Inherits="WebApplication1.searchByContext" %>

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
                                        <td class="col1" >
                                            <label class="label">Size (PM):</label></td>
                                        <td class="col2">
                                            from <asp:TextBox ID="Project_SizeTextBox" runat="server" Text='<%# Bind("Project_Size") %>' CssClass="textfieldMedium" />
                                            &nbsp;to <asp:TextBox ID="Project_SizeTextBoxTo" runat="server" Text='<%# Bind("Project_Size") %>' CssClass="textfieldMedium" />
                                            </td>
                                    </tr>

                                    <tr>
                                        <td class="col1" >
                                            <label class="label">Software Type:</label></td>
                                        <td class="col2">
                                            <asp:TextBox ID="Project_KindTextBox" runat="server" Text='<%# Bind("Project_Kind") %>' TextMode="MultiLine" CssClass="textfield" /> 
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="col1" >
                                            <label class="label">Project Type:</label></td>
                                        <td class="col2">
                                            <asp:TextBox ID="Project_TypeTextBox" runat="server" Text='<%# Bind("Project_Type") %>' CssClass="textfieldMedium" /> 
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
                                        <td class="col1">
                                            <label class="label">Development Environment:</label></td>
                                        <td class="col2">
                                            <asp:TextBox ID="Development_EnvironmentTextBox" runat="server" Text='<%# Bind("Development_Environment") %>' TextMode="MultiLine" CssClass="textfield" /> 
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
