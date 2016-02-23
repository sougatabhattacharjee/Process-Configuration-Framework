<%@ Register TagPrefix="search" TagName="matrix" Src="~/BasicSearch.ascx" %>
<%@ Register TagPrefix="search" TagName="context" Src="~/searchByContext.ascx" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="WebApplication1.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <div id="menu"> 
     <nav>
            <ul class="side_menu">
                <li class="li"><a href="showTechnology.aspx" class="item">All Technologies </a></li>
                <p class="explanation">
                    List the existing technologies
                </p>
                </ul>
         <ul class="side_menu">
                <li class="li"><asp:LinkButton ID="abstrLev" runat="server" Text="Label" OnClick="abstrLev_Click" CssClass="item">Astraction Lev/Viewpoints </asp:LinkButton></a></li>
                <p class="explanation">
                    Search all technologies that match a set of abstraction levels and viewpoints
                </p>
                <li class="li"><asp:LinkButton ID="Label1" runat="server" Text="Label" OnClick="Label1_Click"  CssClass="item">Context Based </asp:LinkButton></li>
                <p class="explanation">
                    Insert your context requirements
                </p>
            </ul>
        </nav>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="matrixPanel" runat="server" Visible="false" style="text-align: center; margin: auto;">
                <center>
                 <search:matrix runat="server" id="matrix"/>
                    </center>
            </asp:Panel>
             <asp:Panel ID="contextPanel" runat="server"  Visible="false">
                <search:context runat="server" id="context" />
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
