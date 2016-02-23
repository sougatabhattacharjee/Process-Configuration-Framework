<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeFile="InsertNew.aspx.cs" Inherits="WebApplication1.InsertNew" %>

<%@ Register TagPrefix="insertTech" TagName="technology" Src="~/technologyControl.ascx" %>
<%@ Register TagPrefix="insertCont" TagName="context" Src="~/contextControl.ascx" %>
<%@ Register TagPrefix="insertImp" TagName="impact" Src="~/impactControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <div id="menu">
        <nav>
            <ul class="side_menu">
                <li class="li" style="text-align:left;">&nbsp;<a class="item">Selected Technology</a></li>
                <p class="explanation">
                    <asp:Label ID="selectedTech" Font-Size="Small" Font-Bold="true" ForeColor="Black" CssClass="label" runat="server"></asp:Label>
                </p>
                <li class="li" style="text-align:left;">&nbsp;<a class="item">Selected Context</a></li>
                <p class="explanation">
                     <asp:Label ID="selectedContext" Font-Size="Small" Font-Bold="true" ForeColor="Black" CssClass="label" runat="server"></asp:Label>
                    
                </p>
                <li class="li" style="text-align:left;">&nbsp;<a class="item">Selected Impact</a></li>
                <p class="explanation">
                <asp:Label ID="selectedImpact" Font-Size="Small" Font-Bold="true" ForeColor="Black" CssClass="label" runat="server"></asp:Label>
                </p>
            </ul>
        </nav>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:SqlDataSource ID="ALL_Technology" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>"
        SelectCommand="SELECT TechnologyId, Name FROM Technologies"
        ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"></asp:SqlDataSource>

    <asp:SqlDataSource ID="ALL_Context" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>"
        SelectCommand="SELECT ID,Name FROM Contexts"
        ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"></asp:SqlDataSource>

    <asp:SqlDataSource ID="ALL_Impact" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>"
        SelectCommand="SELECT ID, Name FROM Impacts"
        ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"></asp:SqlDataSource>
    <table class="table_form">
        <thead>
            &nbsp;<asp:Label ID="Label1" Font-Size="Large" CssClass="label" runat="server" Text=" Select Technology to Insert New Context or Impact."></asp:Label>
        </thead>
        <tr>
            <td class="col1" style="text-align: left;">
                <asp:Button ID="Button1" runat="server" class="button gray" Height="25px" OnClick="InsertTech_Click" Text="Insert New Technology" Width="130px" />
                <br />
                <br />
                <asp:DropDownList ID="technologyList" DataSourceID="ALL_Technology" DataTextField="Name" DataValueField="TechnologyId" runat="server" Visible="true" OnDataBound="technologyList_DataBound" AutoPostBack="true"  OnSelectedIndexChanged="technologyList_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="technologyListReq" runat="server" ControlToValidate="technologyList" Display="Dynamic" ErrorMessage="Please select a technology!!" ForeColor="Red" ValidationGroup="InsertContext" />

            </td>
            <td class="col1" style="text-align: left;">
                <asp:Button ID="InsertCont" runat="server" class="button gray" OnClick="InsertCont_Click" Height="25px" Text="Insert New Context" Width="130px" ValidationGroup="InsertContext" Visible="false"/>
                <br />
                <br />
                <asp:Button ID="ButtonNext" runat="server" class="button gray" OnClick="ButtonNext_Click" Height="25px" Text="Next" Width="130px" ValidationGroup="InsertContext" Visible="false"/>

            </td>

            <td class="col1" style="text-align: left;">
                <asp:DropDownList ID="contextList" DataSourceID="ALL_Context" DataTextField="Name" DataValueField="ID" runat="server" OnDataBound="contextList_DataBound1" Visible="false" AutoPostBack="true"  OnSelectedIndexChanged="contextList_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="contextListReq" runat="server" ControlToValidate="contextList" Display="Dynamic" ErrorMessage="Please select a Context!!" ForeColor="Red" ValidationGroup="InsertImpact" />
                <br />

                <asp:Button ID="InsertImp" runat="server" class="button gray" OnClick="InsertImp_Click" Height="25px" Text="Insert New Impact" Width="130px" ValidationGroup="InsertImpact" Visible="false" />

            </td>

        </tr>
       
    </table>
    <asp:Panel ID="technologyControlPanel" runat="server" Visible="false">
        <insertTech:technology runat="server" ID="technologyControl"  />
    </asp:Panel>
    <asp:Panel ID="contextControlPanel" runat="server" Visible="false">
        <insertCont:context runat="server" ID="contextControl" />
    </asp:Panel>
    <asp:Panel ID="impactControlPanel" runat="server" Visible="false">
        <insertImp:impact runat="server" ID="impactControl" />
    </asp:Panel>
</asp:Content>
