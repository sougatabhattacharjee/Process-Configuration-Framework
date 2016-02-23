<%@ Page Title="Insert Page" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeFile="Insert.aspx.cs" Inherits="WebApplication1.Insert" %>
<%@ Register TagPrefix="insertTech" TagName="technology" Src="~/technologyControl.ascx" %>
<%@ Register TagPrefix="insertCont" TagName="context" Src="~/contextControl.ascx" %>
<%@ Register TagPrefix="insertImp" TagName="impact" Src="~/impactControl.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <div id="menu">
        <nav>
            <ul class="side_menu">
                <li class="li"><a href="Technology.aspx" class="item">Selected Technology</a></li>
                <p class="explanation">
                    Label
                </p>
                <li class="li"><a href="" class="item">Selected Context</a></li>
                <p class="explanation">
                    Application Domain
                    
                </p>
                <li class="li"><a href="" class="item">Selected Impact</a></li>
                <p class="explanation">
                    Developments Costs
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
        <tr>
            <td class="col1" >

                <asp:Button ID="InsertTech" runat="server" class="button gray" Height="25px" OnClick="InsertTech_Click" Text="Insert Technology" Width="100px" />
                
            </td>
            <td class="col2" style="width:400px;">
                <asp:Button ID="InsertCont" runat="server" class="button gray" OnClick="InsertCont_Click"  Height="25px" Text="Insert Context" Width="90px" />
                <asp:Button ID="InsertImp" runat="server" class="button gray"  OnClick="InsertImp_Click" Height="25px" Text="Insert Impact" Width="90px" />
        </td>
            
        </tr>
        <tr>
            <td class="col1">
                <asp:Label ID="ListofTech" runat="server" CssClass="label" Text="Technology :" Visible="false"></asp:Label>
            </td>
            <td class="col2">
                <asp:DropDownList ID="technologyList" DataSourceID="ALL_Technology" DataTextField="Name" DataValueField="TechnologyId" runat="server" Visible="false">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="col1" >
                <asp:Label ID="ListofContext" runat="server" CssClass="label" Text="Context :" Visible="false"></asp:Label>
            </td>
            <td class="col2">
                <asp:DropDownList ID="contextList" DataSourceID="ALL_Context" DataTextField="Name" DataValueField="ID" runat="server" Visible="false">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="col1">
                <asp:Label ID="ListofImpact" runat="server" CssClass="label" Text="Impact :" Visible="false"></asp:Label>
            </td>
            <td class="col2">
                <asp:DropDownList ID="impactList" DataSourceID="ALL_Impact" DataTextField="Name" DataValueField="ID" runat="server" Visible="false">
                </asp:DropDownList>
            </td>

        </tr>
        
    </table>
    <asp:Panel id ="technologyControlPanel" runat="server" Visible="false">
     <insertTech:technology runat="server" id="technologyControl"/>
        </asp:Panel>
     <asp:Panel id ="contextControlPanel" runat="server" Visible="false">
     <insertCont:context runat="server" id="contextControl"/>
        </asp:Panel>
     <asp:Panel id ="impactControlPanel" runat="server" Visible="false">
     <insertImp:impact runat="server" id="impactControl"/>
        </asp:Panel>
</asp:Content>
