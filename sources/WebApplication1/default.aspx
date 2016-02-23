<%@ Register TagPrefix="search" TagName="matrix" Src="~/HomePage.ascx" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="WebApplication1._default" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <div id="menu">
            <nav>
                <ul class="side_menu">
                    <li class="li"><a href="" class="item"><span class="item_number">&nbsp;</span></a></li>
                    <p class="explanation">
                       Select a combination of abstraction levels and viewpoints to see the available technologies
                    </p>
                    </ul>
                <ul class="side_menu">
                    <li class="li"><a href="" class="item"><span class="item_number">
                        <label class="label" style="color: whitesmoke">Technology</label></span></a></li>
                    <p class="explanation">
                        <a href='Technology.aspx?mode=Insert'><span>Insert Technology</span></a>
                    </p>
                </ul>
                </nav>
        </div>
</asp:Content>--%>
<%--<asp:Content ID="TitlePcH" ContentPlaceHolderID="CtPlaceHoldeTitle" runat="server">
     <div id="page_tittle" class="auto-style1">title</div>

</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
        <center>
  <search:matrix runat="server" id="matrix"/>
            <br />
            <br />
    </center>
</asp:Content>
