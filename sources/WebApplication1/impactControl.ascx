<%@ Control Language="C#" AutoEventWireup="true" CodeFile="impactControl.ascx.cs" Inherits="WebApplication1.impactControl" %>

<asp:Panel ID="mainP" runat="server" Visible="true">
  <div class="form_area_new">


        <div id="form_together">

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" Style="margin-right: 104px" CssClass="stylesheets/layout.css" AllowPaging="false" DefaultMode="ReadOnly" OnModeChanged="FormView_ModeChanged" Width="750px">
                <EditItemTemplate>


                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td rowspan="3" class="col0">&nbsp;</td>
                                <td class="col1" ><asp:Label ID="Label24" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">Impact Name:</label></td>
                                <td class="col2">
                                    <asp:TextBox ID="Impact_Name" runat="server" Text='<%# Bind("NAME") %>' CausesValidation="True" ValidateRequestMode="Enabled" ToolTip="Impact Name" Height="15px" Width="550px" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Impact_Name" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">

                            <tr>
                                <td rowspan="3" class="col0">
                                    <img src="imgs/dev_costs.gif" alt="development costs" width="14" height="42"></td>
                                <td class="col1"><asp:Label ID="Label10" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">Total costs:</label></td>
                                <td class="col2">
                                    <asp:TextBox ID="Total_CostTextBox" runat="server" Text='<%# Bind("Total_Cost") %>' CausesValidation="True" TextMode="Number" ValidateRequestMode="Enabled" ToolTip="Total Cost" Height="15px" Width="550px" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Total_CostTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                        ControlToValidate="Total_CostTextBox"
                                        ValidationExpression="\d+"
                                        Display="Static"
                                        EnableClientScript="true"
                                        ErrorMessage="Enter Numbers only!!"
                                        runat="server" Font-Bold="False" Font-Overline="False" ForeColor="Red" />
                                </td>
                            </tr>
                            <tr>
                                <td class="col1"><asp:Label ID="Label11" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">Training:</label></td>
                                <td class="col2">
                                    <asp:TextBox ID="training" runat="server" Text='<%# Bind("Training_Costs") %>' TextMode="Number" Height="15px" Width="550px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator32" ControlToValidate="training" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator32"
                                        ControlToValidate="training"
                                        ValidationExpression="\d+"
                                        Display="Static"
                                        EnableClientScript="true"
                                        ErrorMessage="Enter Numbers only!!"
                                        runat="server" Font-Bold="False" Font-Overline="False" ForeColor="Red" />

                                </td>
                            </tr>
                            <tr>
                                <td class="col1"><asp:Label ID="Label12" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">Others:</label></td>
                                <td class="col2">
                                    <asp:TextBox ID="Other_CostTextBox" runat="server" Text='<%# Bind("Other_Cost") %>' TextMode="Number" Height="15px" Width="550px" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Other_CostTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                        ControlToValidate="Other_CostTextBox"
                                        ValidationExpression="\d+"
                                        Display="Static"
                                        EnableClientScript="true"
                                        ErrorMessage="Enter Numbers only!!"
                                        runat="server" Font-Bold="False" Font-Overline="False" ForeColor="Red" />

                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0" rowspan="2">
                                    <img src="imgs/qual_product.gif" alt="quality of product" width="17" height="58"></td>
                                <td class="col1"><asp:Label ID="Label13" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">
                                        ISO 25010:
                                    </label>
                                </td>
                                <td class="col2">
                                    <%-- <asp:DropDownList ID="ISO25010TextBox" runat="server" DataSourceID="ISO25010" DataTextField="QA_Characteristic" DataValueField="ID">
                    
                    </asp:DropDownList>--%>
                                    <asp:ListBox ID="ISO25010TextBox" SelectionMode="Multiple" runat="server" DataSourceID="ISO25010" DataTextField="QA_Characteristic" DataValueField="ID" Height="140px" Width="250px"></asp:ListBox>

                                    <asp:Label ID="Label9" runat="server" Text="Press Ctrl to select multiple ISO" Font-Size="Smaller"></asp:Label>
                                    <br/>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="ISO25010TextBox" ErrorMessage="Please select at least one!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                   
                                    <asp:SqlDataSource ID="ISO25010" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT [QA_Characteristic], [ID] FROM [ISO25010]"></asp:SqlDataSource>
                                    <div id="counter"></div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="Other_StandardsTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <%--<asp:RegularExpressionValidator ID="txtConclusionValidator1" ControlToValidate="Other_StandardsTextBox" Text="Exceeding 100 characters" ValidationExpression="^[\s\S]{0,100}$" runat="server" />--%>
                                </td>
                            </tr>
                             <tr>
                                <td class="col1"><asp:Label ID="Label14" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">(or others domain relevant standards):</label></td>
                                <td class="col2">
                                    <asp:TextBox ID="Other_StandardsTextBox" runat="server" Text='<%# Bind("Other_Standards", "{0}") %>'
                                        TextMode="MultiLine" Width="550px" Height="30px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0">
                                    <img src="imgs/process_outcomes.gif" alt="process outcome" width="16" height="60"></td>
                                <td class="col1"><asp:Label ID="Label15" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">
                                        Process outcome:<br>
                                    </label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="Process_OutcomeTextBox" runat="server" Text='<%# Bind("Process_Outcome") %>' TextMode="MultiLine" Height="15px" Width="550px" />
                                    <div id="counter1">
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Process_OutcomeTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0">
                                    <img src="imgs/se_object.gif" alt="se object" width="18" height="78"></td>
                                <td class="col1"><asp:Label ID="Label16" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">
                                        Software object:<br>
                                    </label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="Software_ObjectTextBox" runat="server" Text='<%# Bind("Software_Object") %>' TextMode="MultiLine" Height="15px" Width="550px" />
                                    <div id="counter2">
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="Software_ObjectTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0">
                                    <img src="imgs/dev_schedule.gif" alt="development schedule" width="15" height="74"></td>
                                <td class="col1"><asp:Label ID="Label17" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">
                                        Time to market:
                                    </label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="Total_ScheduleTextBox" runat="server" Text='<%# Bind("Total_Schedule") %>' TextMode="MultiLine" Height="15px" Width="550px" />
                                    <div id="counter3">
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="Total_ScheduleTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0">
                                    <img src="imgs/description.png" alt="description" width="18" height="90"></td>
                                <td class="col1"><asp:Label ID="Label18" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">Description:</label></td>
                                <td class="col2">
                                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" Height="15px" Width="550px" />
                                    <div id="counter4">
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="DescriptionTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0">
                                    <img src="imgs/reference.gif" alt="reference" width="14" height="81"></td>
                                <td class="col1"><asp:Label ID="Label19" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">Origin:</label></td>
                                <td class="col2">
                                    <asp:TextBox ID="ReferenceTextBox" runat="server" Text='<%# Bind("Reference") %>' TextMode="MultiLine" Height="15px" Width="550px" />
                                    <div id="counter5">
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="ReferenceTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>





                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0" rowspan="4" style="width: 4px">&nbsp;</td>
                                <td class="col1" >
                                    <label class="label">
                                        <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" class="button gray" OnClick="UpdateButton1_Click" Height="20px" Width="90px" /></label></td>
                                <td class="col2" >
                                    <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" class="button gray" Height="20px" Width="90px" />

                                </td>
                            </tr>
                        </table>
                    </div>




                </EditItemTemplate>

                <InsertItemTemplate>

                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td rowspan="3" class="col0">&nbsp;</td>
                                <td class="col1" ><asp:Label ID="Label24" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">Impact Name:</label></td>
                                <td class="col2">
                                    <asp:TextBox ID="Impact_Name" runat="server" Text='<%# Bind("NAME") %>' CausesValidation="True" ValidateRequestMode="Enabled" ToolTip="Impact Name" Height="15px" Width="550px" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Impact_Name" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" ValidationGroup="insertImpact"></asp:RequiredFieldValidator>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">

                            <tr>
                                <td rowspan="3" class="col0">
                                    <img src="imgs/dev_costs.gif" alt="development costs" width="14" height="42"></td>
                                <td class="col1" ><asp:Label ID="Label20" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">Total costs:</label></td>
                                <td class="col2">
                                    <asp:TextBox ID="Total_CostTextBox" runat="server" Text='<%# Bind("Total_Cost") %>' CausesValidation="True" TextMode="Number" ValidateRequestMode="Enabled" ToolTip="Total Cost" Height="15px" Width="550px" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Total_CostTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" ValidationGroup="insertImpact"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                        ControlToValidate="Total_CostTextBox"
                                        ValidationExpression="\d+"
                                        Display="Static"
                                        EnableClientScript="true"
                                        ErrorMessage="Enter Numbers only!!"
                                        runat="server" Font-Bold="False" Font-Overline="False" ForeColor="Red" ValidationGroup="insertImpact"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1" ><asp:Label ID="Label21" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">Training:</label></td>
                                <td class="col2">
                                    <asp:TextBox ID="training" runat="server" Text='<%# Bind("Training_Costs") %>' TextMode="Number" Height="15px" Width="550px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator32" ControlToValidate="training" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" ValidationGroup="insertImpact"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator32"
                                        ControlToValidate="training"
                                        ValidationExpression="\d+"
                                        Display="Static"
                                        EnableClientScript="true"
                                        ErrorMessage="Enter Numbers only!!"
                                        runat="server" Font-Bold="False" Font-Overline="False" ForeColor="Red" ValidationGroup="insertImpact"/>

                                </td>
                            </tr>
                            <tr>
                                <td class="col1" ><asp:Label ID="Label22" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">Others:</label></td>
                                <td class="col2">
                                    <asp:TextBox ID="Other_CostTextBox" runat="server" Text='<%# Bind("Other_Cost") %>' TextMode="Number" Height="15px" Width="550px" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Other_CostTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" ValidationGroup="insertImpact"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                        ControlToValidate="Other_CostTextBox"
                                        ValidationExpression="\d+"
                                        Display="Static"
                                        EnableClientScript="true"
                                        ErrorMessage="Enter Numbers only!!"
                                        runat="server" Font-Bold="False" Font-Overline="False" ForeColor="Red" ValidationGroup="insertImpact"/>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0" rowspan="2">
                                    <img src="imgs/qual_product.gif" alt="quality of product" width="17" height="58"></td>
                                <td class="col1" ><asp:Label ID="Label23" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">
                                        ISO 25010:                                        
                                    </label>
                                </td>
                                <td class="col2">
                                    <%-- <asp:DropDownList ID="ISO25010TextBox" runat="server" DataSourceID="ISO25010" DataTextField="QA_Characteristic" DataValueField="ID">
                    
                    </asp:DropDownList>--%>


                                    <asp:ListBox ID="ISO25010TextBox" SelectionMode="Multiple" runat="server" DataSourceID="ISO25010" DataTextField="QA_Characteristic" DataValueField="ID" Height="140px" Width="250px"></asp:ListBox>

                                    <asp:Label ID="Label9" runat="server" Text="Press Ctrl to select multiple ISO" Font-Size="Smaller"></asp:Label>
                                    
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="ISO25010TextBox" ErrorMessage="Please select atleast one!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" ValidationGroup="insertImpact"></asp:RequiredFieldValidator>
                                         <asp:SqlDataSource ID="ISO25010" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT [QA_Characteristic], [ID] FROM [ISO25010]"></asp:SqlDataSource>

        </td>
                            </tr>
                            <tr>
                                  <td class="col1" ><asp:Label ID="Label25" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                      <label class="label"> Others domain relevant standards</label>
                                      </td>
                                 <td class="col2">                            
                                    <asp:TextBox ID="Other_StandardsTextBox" runat="server" Text='<%# Bind("Other_Standards", "{0}") %>'
                                        TextMode="MultiLine" Width="550px" Height="15px"></asp:TextBox>
                                      <div id="counter">
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="Other_StandardsTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" ValidationGroup="insertImpact"></asp:RequiredFieldValidator>
                           
                                     </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0" >
                                    <img src="imgs/process_outcomes.gif" alt="process outcome" width="16" height="60"></td>
                                <td class="col1" ><asp:Label ID="Label26" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">
                                        Process outcome:<br>
                                    </label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="Process_OutcomeTextBox" runat="server" Text='<%# Bind("Process_Outcome") %>' TextMode="MultiLine" Height="15" Width="550px" />
                                    <div id="counter1">
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Process_OutcomeTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" ValidationGroup="insertImpact"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0" >
                                    <img src="imgs/se_object.gif" alt="se object" width="18" height="78"></td>
                                <td class="col1" ><asp:Label ID="Label27" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">
                                        Software object:<br>
                                    </label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="Software_ObjectTextBox" runat="server" Text='<%# Bind("Software_Object") %>' TextMode="MultiLine" Height="15px" Width="550px" />
                                    <div id="counter2">
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="Software_ObjectTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" ValidationGroup="insertImpact"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0" >
                                    <img src="imgs/dev_schedule.gif" alt="development schedule" width="15" height="74"></td>
                                <td class="col1" ><asp:Label ID="Label28" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">
                                        Time to market:
                                    </label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="Total_ScheduleTextBox" runat="server" Text='<%# Bind("Total_Schedule") %>' TextMode="MultiLine" Height="15px" Width="550px" />
                                    <div id="counter3">
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="Total_ScheduleTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" ValidationGroup="insertImpact"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0" >
                                    <img src="imgs/description.png" alt="description" width="18" height="90"></td>
                                <td class="col1" ><asp:Label ID="Label29" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">Description:</label></td>
                                <td class="col2">
                                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" Height="15px" Width="550px" />
                                    <div id="counter4">
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="DescriptionTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" ValidationGroup="insertImpact"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0" >
                                    <img src="imgs/reference.gif" alt="reference" width="14" height="81"></td>
                                <td class="col1" ><asp:Label ID="Label30" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <label class="label">Origin:</label></td>
                                <td class="col2">
                                    <asp:TextBox ID="ReferenceTextBox" runat="server" Text='<%# Bind("Reference") %>' TextMode="MultiLine" Height="15px" Width="550px" />
                                    <div id="counter5">
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="ReferenceTextBox" ErrorMessage="Required!" runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" ValidationGroup="insertImpact"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>



                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0" rowspan="4" style="width: 2px">&nbsp;</td>
                                <td class="col1" >
                                    <label class="label">
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="Save Impact" class="button gray" OnClick="Button1_Click" ValidationGroup="insertImpact"/></label></td>
                                <td class="col2" >
                                    <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" OnClick="InsertCancelButton_Click" Text="Cancel" class="button gray" />



                                </td>
                            </tr>
                        </table>
                    </div>







                </InsertItemTemplate>

                <ItemTemplate>

<!--  Impact name box -->
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0">&nbsp;</td>
                                <td class="col1">
                                    <label class="label">Impact Name:</label>
                                </td>
                                <td class="col2" >
                                    <asp:Label ID="Impact_Name" runat="server" Text='<%# Bind("NAME") %>' CssClass="label" />
                                    <asp:HiddenField ID="ImpactIDHidden" runat="server" Value='<%# Eval("ID") %>' />
                                </td>
                            </tr>
                        </table>
                    </div>

<!--  development costs box -->
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td rowspan="3" class="col0">
                                    <img src="imgs/dev_costs.gif" alt="development costs" width="14" height="42"></td>
                                <td class="col1">
                                    <label class="label">Total costs:</label></td>
                                <td class="col2">
                                    <asp:Label class="label" ID="Total_Cost" runat="server" Text='<%# Bind("Total_Cost") %>'></asp:Label>
                                    <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Total_Cost") %>' CausesValidation="True" TextMode="Number" ValidateRequestMode="Enabled" ToolTip="Total Cost" BorderStyle="None" />--%>  
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <label class="label">Training:</label></td>
                                <td class="col2">
                                    <asp:Label class="label" ID="Label6" runat="server" Text='<%# Bind("Training_Costs") %>'></asp:Label>

                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <label class="label">Others:</label></td>
                                <td class="col2">
                                    <asp:Label class="label" ID="Label1" runat="server" Text='<%# Bind("Other_Cost") %>'></asp:Label>
                                    <%--<asp:TextBox ID="Other_CostTextBox" runat="server" Text='<%# Bind("Other_Cost") %>' TextMode="Number" />--%></td>
                            </tr>
                        </table>
                    </div>
<!--  quality of product box -->
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0" rowspan="2">
                                    <img src="imgs/qual_product.gif" alt="quality of product" width="17" height="58">
                                </td>
                                <td class="col1">
                                    <label class="label">ISO 25010:</label>

                                </td>
                                <td class="col2" >

                                    <%--<asp:Label class="label" ID="Label9" runat="server" Text='<%# Bind("ISO25010") %>'></asp:Label>--%>

                                    <%-- <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ShowISO25010" DataTextField="QA_Characteristic" DataValueField="QA_Characteristic">
                            </asp:DropDownList>--%>

                                    <asp:BulletedList ID="BulletedList2"  runat="server" DataSourceID="ShowISO25010" DataTextField="QA_Characteristic" DataValueField="QA_Characteristic">
                                    </asp:BulletedList>

                                    <asp:SqlDataSource ID="ShowISO25010" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                                        SelectCommand="SELECT        QA_Characteristic 
FROM            ISO25010
WHERE        (ID IN
                             (SELECT        ISO_ID
                               FROM            ISO_IMPACT
                               WHERE        (IMPACT_ID = @impactID)))">
                                        <SelectParameters>

                                            <%--<asp:Parameter Name="impactID" Type="Int32" />--%>

                                            <asp:ControlParameter Name="impactID" ControlID="ImpactIDHidden" PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <label class="label">(or others domain relevant standards):</label></td>
                                <td class="col2">
                                    <asp:Label class="label" ID="Label7" runat="server" Text='<%# Bind("Other_Standards") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0">
                                    <img src="imgs/process_outcomes.gif" alt="process outcome" width="16" height="60">
                                </td>
                                <td class="col1">
                                    <label class="label">
                                        Process outcomes:
                                    </label>
                                </td>
                                <td class="col2">
                                    <asp:Label class="label" ID="Label5" runat="server" Text='<%# Bind("Process_Outcome") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0">
                                    <img src="imgs/se_object.gif" alt="se object" width="18" height="78"></td>
                                <td class="col1" >
                                    <label class="label">
                                        Software object:
                                    </label>
                                </td>
                                <td class="col2">
                                    <asp:Label class="label" ID="Label4" runat="server" Text='<%# Bind("Software_Object") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0">
                                    <img src="imgs/dev_schedule.gif" alt="development schedule" width="15" height="74">
                                </td>
                                <td class="col1">
                                    <label class="label">
                                        Time to market:
                                    </label>
                                </td>
                                <td class="col2">
                                    <asp:Label class="label" ID="Label3" runat="server" Text='<%# Bind("Total_Schedule") %>'></asp:Label>
                                    <%--<asp:TextBox ID="Total_ScheduleTextBox" runat="server" Text='<%# Bind("Total_Schedule") %>' TextMode="MultiLine" />--%>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0">
                                    <img src="imgs/description.png" alt="description" width="18" height="90">
                                </td>
                                <td class="col1">
                                    <label class="label">Description:</label>
                                </td>
                                <td class="col2">
                                    <asp:Label class="label" ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0">
                                    <img src="imgs/reference.gif" alt="reference" width="14" height="81"></td>
                                <td class="col1">
                                    <label class="label">Origin:</label></td>
                                <td class="col2">
                                    <asp:Label class="label" ID="Label8" runat="server" Text='<%# Bind("Reference") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0">
                                    <img alt="reference" height="81" src="imgs/reference.gif" width="14"></img></td>
                                <td class="col1" >
                                    <label class="label">Related Contexts:</label></td>
                                <td class="col2">
                                    <asp:BulletedList ID="BulletedList1" runat="server" DataSourceID="ListExistingContext" DataTextField="Name" DataValueField="ID" Style="list-style-type: none;">
                                    </asp:BulletedList>
                                    <asp:SqlDataSource ID="ListExistingContext" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                                        SelectCommand="SELECT        Contexts.ID, Contexts.Name
FROM            Contexts INNER JOIN
                         TCI ON Contexts.ID = TCI.Context
WHERE        (TCI.Impact = @impactID)">
                                        <SelectParameters>

                                            <asp:ControlParameter Name="impactID" ControlID="ImpactIDHidden" PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </td>
                              
                            </tr>
                        </table>
                    </div>

                  <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0" rowspan="4" style="width: 2px">&nbsp;</td>
                                <td class="col1" >
                            &nbsp;</td>
                                <td class="col2" >
                                    <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" OnClick="InsertCancelButton_Click" Text="Close" class="button gray" />



                                </td>
                            </tr>
                        </table>
                    </div>

                </ItemTemplate>



                <%--<PagerTemplate>

                    <div class="form_domain_transparent">
                        <table class="table_form">
                            <tr>
                                <td class="col0" >
                                    <div style="float: left">
                                        Page: <%# FormView1.PageIndex + 1%>
                                    </div>
                                    <div style="float: right">
                                        Total Page: <%# FormView1.PageCount%>
                                    </div>
                                    <div style="float: none; white-space: nowrap">
                                        <asp:LinkButton ID="FirstButton" CommandName="Page" CommandArgument="First" Text="First" runat="server">
                <img src="imgs/first.png" alt="First" height="16" width="16" /></asp:LinkButton>
                                        <asp:LinkButton ID="lnkPrevious"
                                            Text="<"
                                            CommandName="Page"
                                            CommandArgument="Prev"
                                            runat="server" Font-Underline="false"><img src="imgs/previous.png" alt="Previous" height="16" width="16" /></asp:LinkButton>
                                      
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
                </PagerTemplate>--%>


            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>"
                InsertCommand="INSERT INTO Impacts(Total_Cost, Other_Cost, Other_Standards, Process_Outcome, Software_Object, Total_Schedule, Description, Reference,Training_Costs,NAME) VALUES (@Total_Cost, @Other_Cost, @Other_Standards, @Process_Outcome, @Software_Object, @Total_Schedule, @Description, @Reference,@Training_Costs,@NAME)"
                ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName%>"
                SelectCommand="SELECT Impacts.* FROM Impacts order by ID desc "
                OnSelecting="SqlDataSource1_Selecting"
                OnInserted="SqlDataSource1_Inserted"
                UpdateCommand="UPDATE       Impacts
SET                Total_Cost =@Total_Cost, Other_Cost =@Other_Cost, Other_Standards =@Other_Standards, Total_Schedule =@Total_Schedule, Process_Outcome =@Process_Outcome, Software_Object =@Software_Object, Description =@Description, Reference =@Reference, Name =@Name, Training_Costs =@Training_Costs where ID=@ID"
                OnUpdated="SqlDataSource1_Updated">
                <InsertParameters>
                    <asp:Parameter Name="Total_Cost" />
                    <asp:Parameter Name="Other_Cost" />
                    <%-- <asp:Parameter Name="ISO25010" />--%>
                    <asp:Parameter Name="Other_Standards" />
                    <asp:Parameter Name="Process_Outcome" />
                    <asp:Parameter Name="Software_Object" />
                    <asp:Parameter Name="Total_Schedule" />
                    <asp:Parameter Name="Description" />
                    <asp:Parameter Name="Reference" />
                    <asp:Parameter Name="Training_Costs" />
                    <asp:Parameter Name="NAME" />


                    <%--<asp:Parameter Name="ID" Type="Int32" Direction="Output" DefaultValue="0" />--%>
                </InsertParameters>

                <UpdateParameters>
                    <asp:Parameter Name="Total_Cost" />
                    <asp:Parameter Name="Other_Cost" />
                    <%-- <asp:Parameter Name="ISO25010" />--%>
                    <asp:Parameter Name="Other_Standards" />
                    <asp:Parameter Name="Process_Outcome" />
                    <asp:Parameter Name="Software_Object" />
                    <asp:Parameter Name="Total_Schedule" />
                    <asp:Parameter Name="Description" />
                    <asp:Parameter Name="Reference" />
                    <asp:Parameter Name="Training_Costs" />
                    <asp:Parameter Name="NAME" />
                    <asp:Parameter Name="ID" />

                </UpdateParameters>

                <SelectParameters>
                    <asp:Parameter Name="ID" Type="Int32" DefaultValue="0" />
                </SelectParameters>

            </asp:SqlDataSource>

            <asp:SqlDataSource ID="selectMaxImpactId" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>"
                SelectCommand="SELECT MAX(ID) as ID FROM IMPACTS"
                ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"></asp:SqlDataSource>
          


            <%--InsertCommand="INSERT INTO ISO_IMPACT(ISO_ID,IMPACT_ID) SELECT ISO25010, ID FROM Impacts WHERE (ID IN (SELECT MAX(ID) AS Expr1 FROM Impacts AS Impacts_1))"--%>
            <asp:SqlDataSource ID="InsertDataISO_IMPACT" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>"
                InsertCommand="INSERT INTO ISO_IMPACT(ISO_ID,IMPACT_ID) VALUES(@ISO_ID,@IMPACT_ID) "
                ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT * FROM ISO_IMPACT"
                OnInserted="InsertDataISO_IMPACT_Inserted">

                <InsertParameters>
                    <asp:Parameter Name="ISO_ID" />
                    <asp:Parameter Name="IMPACT_ID" />

                </InsertParameters>

            </asp:SqlDataSource>
            <br />




            <asp:SqlDataSource ID="InsertTCI" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>"
                InsertCommand="INSERT INTO TCI(Technology,Context,Impact) VALUES (@Technology,@Context,@Impact)"
                ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT * FROM ISO_IMPACT">

                <InsertParameters>
                    <asp:Parameter Name="Technology" />
                    <asp:Parameter Name="Context" />
                    <asp:Parameter Name="Impact" />
                </InsertParameters>
            </asp:SqlDataSource>


            <br />

            <asp:HiddenField ID="hdnimpactID" runat="server" Value='57' />
        </div>
    </div>
    </asp:Panel>