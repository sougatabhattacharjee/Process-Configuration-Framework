<%@ Page Title="Technology Details" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeFile="Technology.aspx.cs" Inherits="WebApplication1.Technology" %>




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
                <li class="li"><a href="" class="item"><span class="item_number">2</span>Context</a></li>
                <p class="explanation">
                    Application Domain<br />
                    Project<br />
                    Environment
                </p>
                <li class="li"><a href="" class="item"><span class="item_number">3</span>Impact on Software</a></li>
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
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="js/MaxLength.min.js"></script>
 <script type="text/javascript">
     $(function () {
         //Normal Configuration
         $("[id*=TextBox1]").MaxLength({ MaxLength: 10 });

         //Specifying the Character Count control explicitly
         $("[id*=TextBox3]").MaxLength(
         {
             MaxLength: 255,
             CharacterCountControl: $('#counter3')
         });
         //Specifying the Character Count control explicitly
         $("[id*=TextBox2]").MaxLength(
         {
             MaxLength: 255,
             CharacterCountControl: $('#counter2')
         });

     });
    </script>
    <div class="form_area item1">
        <asp:Label ID="Label21" runat="server" Visible="false" Text="Label"></asp:Label>
        <div id="form_together">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" InsertCommand="INSERT INTO Technologies(Name, Abbreviation, Objectives, Author, Complements, Alternatives, Literature, Background, Qualification, Training, Experience, Input_Artifact, Output_Artifact, Applied_By_Role, Shoert_Description, SPEM_Model, SE_Phase, Method, Family,
                         ip_a1_v1, ip_a1_v2, ip_a1_v3, ip_a1_v4, ip_a2_v1, ip_a2_v2, 
                         ip_a2_v3, ip_a2_v4, ip_a3_v1, ip_a3_v2, ip_a3_v3, ip_a3_v4, ip_a4_v1, ip_a4_v2, ip_a4_v3, ip_a4_v4, op_a1_v1, op_a1_v2, op_a1_v3, op_a1_v4, op_a2_v1, 
                         op_a2_v2, op_a2_v3, op_a2_v4, op_a3_v1, op_a3_v2, op_a3_v3, op_a3_v4, op_a4_v1, op_a4_v2, op_a4_v3, op_a4_v4, ap_a1_v1, ap_a1_v2, ap_a1_v3, 
                         ap_a1_v4, ap_a2_v1, ap_a2_v2, ap_a2_v3, ap_a2_v4, ap_a3_v1, ap_a3_v2, ap_a3_v3, ap_a3_v4, ap_a4_v1, ap_a4_v2, ap_a4_v3, ap_a4_v4) VALUES 
                        (@Name, @Abbreviation, @Objectives, @Author, @Complements, @Alternatives, @Literature, @Background, @Qualification, @Training, @Experience, @Input_Artifact, @Output_Artifact, @Applied_By_Role, @Shoert_Description, @SPEM_Model, @SE_Phase, @Method, @Family,
                         @ip_a1_v1, @ip_a1_v2, @ip_a1_v3, @ip_a1_v4, @ip_a2_v1, @ip_a2_v2, 
                         @ip_a2_v3, @ip_a2_v4, @ip_a3_v1, @ip_a3_v2, @ip_a3_v3, @ip_a3_v4, @ip_a4_v1, @ip_a4_v2, @ip_a4_v3, @ip_a4_v4, @op_a1_v1, @op_a1_v2, @op_a1_v3, @op_a1_v4, @op_a2_v1, 
                         @op_a2_v2, @op_a2_v3,@op_a2_v4, @op_a3_v1, @op_a3_v2, @op_a3_v3, @op_a3_v4, @op_a4_v1, @op_a4_v2, @op_a4_v3, @op_a4_v4, @ap_a1_v1, @ap_a1_v2, @ap_a1_v3, 
                         @ap_a1_v4, @ap_a2_v1, @ap_a2_v2, @ap_a2_v3,@ap_a2_v4, @ap_a3_v1, @ap_a3_v2, @ap_a3_v3, @ap_a3_v4, @ap_a4_v1, @ap_a4_v2, @ap_a4_v3, @ap_a4_v4)"
                ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT        Technologies.Name as Name, Abbreviation, Objectives,Author, Author.Name as AuthorName, Complements, Alternatives, Literature, Background, Qualification, Training, Experience, Input_Artifact, Output_Artifact, 
                         Applied_By_Role, Shoert_Description, SPEM_Model,SE_Phase, SEphase.Name as SE_PhaseName, TechnologyId, Method, Family,  ip_a1_v1, ip_a1_v2, ip_a1_v3, ip_a1_v4, ip_a2_v1, ip_a2_v2, 
                         ip_a2_v3, ip_a2_v4, ip_a3_v1, ip_a3_v2, ip_a3_v3, ip_a3_v4, ip_a4_v1, ip_a4_v2, ip_a4_v3, ip_a4_v4, op_a1_v1, op_a1_v2, op_a1_v3, op_a1_v4, op_a2_v1, 
                         op_a2_v2, op_a2_v3, op_a2_v4, op_a3_v1, op_a3_v2, op_a3_v3, op_a3_v4, op_a4_v1, op_a4_v2, op_a4_v3, op_a4_v4, ap_a1_v1, ap_a1_v2, ap_a1_v3, 
                         ap_a1_v4, ap_a2_v1, ap_a2_v2, ap_a2_v3, ap_a2_v4, ap_a3_v1, ap_a3_v2, ap_a3_v3, ap_a3_v4, ap_a4_v1, ap_a4_v2, ap_a4_v3, ap_a4_v4 FROM Technologies,SEphase,Author where Technologies.SE_Phase=SEphase.ID and Technologies.Author=Author.ID order by Technologies.TechnologyId desc"
                OnInserting="SqlDataSource1_Inserting"
                OnInserted="SqlDataSource1_Inserted"
                UpdateCommand="UPDATE Technologies SET Name =@Name, Abbreviation =@Abbreviation, Objectives =@Objectives, Author =@Author, Literature =@Literature, Background =@Background, Qualification =@Qualification, Training =@Training, Experience =@Experience, Input_Artifact =@Input_Artifact, 
                         Output_Artifact =@Output_Artifact, Applied_By_Role =@Applied_By_Role, Shoert_Description =@Shoert_Description, SPEM_Model =@SPEM_Model, SE_Phase =@SE_Phase,  Family =@Family, 
                 ip_a1_v1 = @ip_a1_v1, ip_a1_v2=@ip_a1_v2, ip_a1_v3=@ip_a1_v3, ip_a1_v4=@ip_a1_v4, ip_a2_v1=@ip_a2_v1, ip_a2_v2=@ip_a2_v2, 
                         ip_a2_v3=@ip_a2_v3, ip_a2_v4=@ip_a2_v4,ip_a3_v1 =@ip_a3_v1, ip_a3_v2=@ip_a3_v2,ip_a3_v3 =@ip_a3_v3, ip_a3_v4=@ip_a3_v4, ip_a4_v1=@ip_a4_v1, ip_a4_v2=@ip_a4_v2, ip_a4_v3=@ip_a4_v3,ip_a4_v4 =@ip_a4_v4, op_a1_v1=@op_a1_v1,op_a1_v2 =@op_a1_v2,op_a1_v3 =@op_a1_v3, op_a1_v4=@op_a1_v4, op_a2_v1=@op_a2_v1, 
                        op_a2_v2 =@op_a2_v2, op_a2_v3=@op_a2_v3, op_a2_v4=@op_a2_v4, op_a3_v1=@op_a3_v1, op_a3_v2=@op_a3_v2, op_a3_v3=@op_a3_v3, op_a3_v4=@op_a3_v4, op_a4_v1=@op_a4_v1,op_a4_v2 =@op_a4_v2, op_a4_v3=@op_a4_v3,op_a4_v4 =@op_a4_v4, ap_a1_v1=@ap_a1_v1,ap_a1_v2 =@ap_a1_v2, ap_a1_v3=@ap_a1_v3, 
                        ap_a1_v4 =@ap_a1_v4, ap_a2_v1=@ap_a2_v1, ap_a2_v2=@ap_a2_v2, ap_a2_v3=@ap_a2_v3, ap_a2_v4=@ap_a2_v4, ap_a3_v1=@ap_a3_v1, ap_a3_v2=@ap_a3_v2, ap_a3_v3=@ap_a3_v3, ap_a3_v4=@ap_a3_v4,ap_a4_v1 =@ap_a4_v1, ap_a4_v2=@ap_a4_v2,ap_a4_v3 =@ap_a4_v3, ap_a4_v4=@ap_a4_v4 where TechnologyId=@TechnologyId">




                <InsertParameters>
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Abbreviation" />
                    <asp:Parameter Name="Objectives" />
                    <asp:Parameter Name="Author" />
                    <asp:Parameter Name="Complements" />
                    <asp:Parameter Name="Alternatives" />
                    <asp:Parameter Name="Literature" />
                    <asp:Parameter Name="Background" />
                    <asp:Parameter Name="Qualification" />
                    <asp:Parameter Name="Training" />
                    <asp:Parameter Name="Experience" />
                    <asp:Parameter Name="Input_Artifact" />
                    <asp:Parameter Name="Output_Artifact" />
                    <asp:Parameter Name="Applied_By_Role" />
                    <asp:Parameter Name="Shoert_Description" />
                    <asp:Parameter Name="SPEM_Model" />
                    <asp:Parameter Name="SE_Phase" />
                    <asp:Parameter Name="Method" />
                    <asp:Parameter Name="Family" />

                    <asp:Parameter Name="ip_a1_v1" />
                    <asp:Parameter Name="ip_a1_v2" />
                    <asp:Parameter Name="ip_a1_v3" />
                    <asp:Parameter Name="ip_a1_v4" />
                    <asp:Parameter Name="ip_a2_v1" />
                    <asp:Parameter Name="ip_a2_v2" />
                    <asp:Parameter Name="ip_a2_v3" />
                    <asp:Parameter Name="ip_a2_v4" />
                    <asp:Parameter Name="ip_a3_v1" />
                    <asp:Parameter Name="ip_a3_v2" />
                    <asp:Parameter Name="ip_a3_v3" />
                    <asp:Parameter Name="ip_a3_v4" />
                    <asp:Parameter Name="ip_a4_v1" />
                    <asp:Parameter Name="ip_a4_v2" />
                    <asp:Parameter Name="ip_a4_v3" />
                    <asp:Parameter Name="ip_a4_v4" />
                    
                    <asp:Parameter Name="op_a1_v1" />
                    <asp:Parameter Name="op_a1_v2" />
                    <asp:Parameter Name="op_a1_v3" />
                    <asp:Parameter Name="op_a1_v4" />
                    <asp:Parameter Name="op_a2_v1" />
                    <asp:Parameter Name="op_a2_v2" />
                    <asp:Parameter Name="op_a2_v3" />
                    <asp:Parameter Name="op_a2_v4" />
                    <asp:Parameter Name="op_a3_v1" />
                    <asp:Parameter Name="op_a3_v2" />
                    <asp:Parameter Name="op_a3_v3" />
                    <asp:Parameter Name="op_a3_v4" />
                    <asp:Parameter Name="op_a4_v1" />
                    <asp:Parameter Name="op_a4_v2" />
                    <asp:Parameter Name="op_a4_v3" />
                    <asp:Parameter Name="op_a4_v4" />

                    <asp:Parameter Name="ap_a1_v1" />
                    <asp:Parameter Name="ap_a1_v2" />
                    <asp:Parameter Name="ap_a1_v3" />
                    <asp:Parameter Name="ap_a1_v4" />
                    <asp:Parameter Name="ap_a2_v1" />
                    <asp:Parameter Name="ap_a2_v2" />
                    <asp:Parameter Name="ap_a2_v3" />
                    <asp:Parameter Name="ap_a2_v4" />
                    <asp:Parameter Name="ap_a3_v1" />
                    <asp:Parameter Name="ap_a3_v2" />
                    <asp:Parameter Name="ap_a3_v3" />
                    <asp:Parameter Name="ap_a3_v4" />
                    <asp:Parameter Name="ap_a4_v1" />
                    <asp:Parameter Name="ap_a4_v2" />
                    <asp:Parameter Name="ap_a4_v3" />
                    <asp:Parameter Name="ap_a4_v4" />
                
                </InsertParameters>

                <UpdateParameters>
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Abbreviation" />
                    <asp:Parameter Name="Objectives" />
                    <asp:Parameter Name="Author" />
                    <%-- <asp:Parameter Name="Complements" />
                            <asp:Parameter Name="Alternatives" />--%>
                    <asp:Parameter Name="Literature" />
                    <asp:Parameter Name="Background" />
                    <asp:Parameter Name="Qualification" />
                    <asp:Parameter Name="Training" />
                    <asp:Parameter Name="Experience" />
                    <asp:Parameter Name="Input_Artifact" />
                    <asp:Parameter Name="Output_Artifact" />
                    <asp:Parameter Name="Applied_By_Role" />
                    <asp:Parameter Name="Shoert_Description" />
                    <asp:Parameter Name="SPEM_Model" />
                    <asp:Parameter Name="SE_Phase" />
                    <%-- <asp:Parameter Name="Method" />--%>
                    <asp:Parameter Name="Family" />

                    <asp:Parameter Name="ip_a1_v1" />
                    <asp:Parameter Name="ip_a1_v2" />
                    <asp:Parameter Name="ip_a1_v3" />
                    <asp:Parameter Name="ip_a1_v4" />
                    <asp:Parameter Name="ip_a2_v1" />
                    <asp:Parameter Name="ip_a2_v2" />
                    <asp:Parameter Name="ip_a2_v3" />
                    <asp:Parameter Name="ip_a2_v4" />
                    <asp:Parameter Name="ip_a3_v1" />
                    <asp:Parameter Name="ip_a3_v2" />
                    <asp:Parameter Name="ip_a3_v3" />
                    <asp:Parameter Name="ip_a3_v4" />
                    <asp:Parameter Name="ip_a4_v1" />
                    <asp:Parameter Name="ip_a4_v2" />
                    <asp:Parameter Name="ip_a4_v3" />
                    <asp:Parameter Name="ip_a4_v4" />
                    
                    <asp:Parameter Name="op_a1_v1" />
                    <asp:Parameter Name="op_a1_v2" />
                    <asp:Parameter Name="op_a1_v3" />
                    <asp:Parameter Name="op_a1_v4" />
                    <asp:Parameter Name="op_a2_v1" />
                    <asp:Parameter Name="op_a2_v2" />
                    <asp:Parameter Name="op_a2_v3" />
                    <asp:Parameter Name="op_a2_v4" />
                    <asp:Parameter Name="op_a3_v1" />
                    <asp:Parameter Name="op_a3_v2" />
                    <asp:Parameter Name="op_a3_v3" />
                    <asp:Parameter Name="op_a3_v4" />
                    <asp:Parameter Name="op_a4_v1" />
                    <asp:Parameter Name="op_a4_v2" />
                    <asp:Parameter Name="op_a4_v3" />
                    <asp:Parameter Name="op_a4_v4" />

                    <asp:Parameter Name="ap_a1_v1" />
                    <asp:Parameter Name="ap_a1_v2" />
                    <asp:Parameter Name="ap_a1_v3" />
                    <asp:Parameter Name="ap_a1_v4" />
                    <asp:Parameter Name="ap_a2_v1" />
                    <asp:Parameter Name="ap_a2_v2" />
                    <asp:Parameter Name="ap_a2_v3" />
                    <asp:Parameter Name="ap_a2_v4" />
                    <asp:Parameter Name="ap_a3_v1" />
                    <asp:Parameter Name="ap_a3_v2" />
                    <asp:Parameter Name="ap_a3_v3" />
                    <asp:Parameter Name="ap_a3_v4" />
                    <asp:Parameter Name="ap_a4_v1" />
                    <asp:Parameter Name="ap_a4_v2" />
                    <asp:Parameter Name="ap_a4_v3" />
                    <asp:Parameter Name="ap_a4_v4" />

                     <asp:Parameter Name="TechnologyId" />
                    <%--<asp:ControlParameter Name="TechnologyId" ControlId="hiddenTechID" PropertyName="Value"/>--%>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="selectMaxTechnologyId" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>"
                SelectCommand="SELECT MAX(TechnologyId) as ID FROM Technologies"
                ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"></asp:SqlDataSource>

            <asp:SqlDataSource ID="Insert_IMPLEMENTS" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" InsertCommand="INSERT INTO IMPLEMENTS(METHOD_ID,TOOL_ID) VALUES (@METHOD_ID, @TOOL_ID)" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT IMPLEMENTS.* FROM IMPLEMENTS">
                <InsertParameters>
                    <asp:Parameter Name="METHOD_ID" />
                    <asp:Parameter Name="TOOL_ID" />
                </InsertParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="Insert_Alternative_Technologies" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" InsertCommand="INSERT INTO Alternative_Technologies(Technology,Alternatives_Technology) VALUES (@Technology, @Alternatives_Technology)" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT Alternative_Technologies.* FROM Alternative_Technologies">
                <InsertParameters>
                    <asp:Parameter Name="Technology" />
                    <asp:Parameter Name="Alternatives_Technology" />
                </InsertParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="Insert_Compliment_Technologies" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" InsertCommand="INSERT INTO Compliment_Technologies(Technology,Compliment_Technology) VALUES (@Technology, @Compliment_Technology)" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT Compliment_Technologies.* FROM Compliment_Technologies">
                <InsertParameters>
                    <asp:Parameter Name="Technology" />
                    <asp:Parameter Name="Compliment_Technology" />
                </InsertParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="selectMaxTechID" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>"
                SelectCommand="SELECT MAX(TechnologyId) as ID FROM Technologies"
                ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"></asp:SqlDataSource>

            <asp:SqlDataSource ID="Insert_ABSTR_LEV_VIEWP" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" InsertCommand="INSERT INTO ABSTR_LEV_VIEWP(TECHNOLOGY_ID, USED_IN, ABSTRACTION_VIEW_LABEL) VALUES (@TECHNOLOGY_ID, @USED_IN, @ABSTRACTION_VIEW_LABEL)" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT ABSTR_LEV_VIEWP.* FROM ABSTR_LEV_VIEWP">
                <InsertParameters>
                    <asp:Parameter Name="TECHNOLOGY_ID" />
                    <asp:Parameter Name="USED_IN" />
                    <asp:Parameter Name="ABSTRACTION_VIEW_LABEL" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Insert_ABSTR_VIEWP_TECHNOLOGY" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" InsertCommand="INSERT INTO ABSTR_VIEWP_TECHNOLOGY(TECHNOLOGYID, ABS_VIEW_ID) VALUES (@TECHNOLOGYID, @ABS_VIEW_ID)" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT ABSTR_VIEWP_TECHNOLOGY.* FROM ABSTR_VIEWP_TECHNOLOGY">
                <InsertParameters>
                    <asp:Parameter Name="TECHNOLOGYID" />
                    <asp:Parameter Name="ABS_VIEW_ID" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="ALL_AUTHOR" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT Author.* FROM Author order by ID" InsertCommand="INSERT INTO Author(Name, Affiliaction, Email) VALUES (@Name, @Affiliaction, @Email)">
                <InsertParameters>
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Affiliaction" />
                    <asp:Parameter Name="Email" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="All_SEPhase" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT SEphase.* FROM SEphase order by ID"></asp:SqlDataSource>
            <asp:SqlDataSource ID="COMPLIMENTS_TECHN" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" InsertCommand="INSERT INTO Compliment_Technologies(Technology, Compliment_Technology) VALUES (@Technology, @Compliment_Technology)" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT Name, TechnologyId FROM Technologies">
                <InsertParameters>
                    <asp:Parameter Name="Technology" />
                    <asp:Parameter Name="Compliment_Technology" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="selectMaxAuthorID" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>"
                SelectCommand="SELECT MAX(ID) as ID FROM Author"
                ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"></asp:SqlDataSource>
            <asp:SqlDataSource ID="UpdateAuthorTechnologiesTable" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT * FROM Technologies"
                UpdateCommand="Update Technologies set Author=@Author where TechnologyId
                         in(select max(TechnologyId) from Technologies)">
                <UpdateParameters>
                    <asp:Parameter Name="Author" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="MethodTechnology" runat="server"
                ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>"
                ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT Name, TechnologyId FROM Technologies where Method = 'true'"></asp:SqlDataSource>

            <asp:SqlDataSource ID="ToolTechnology" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>"
                ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT Name, TechnologyId FROM Technologies where Method = 'false'"></asp:SqlDataSource>

            <asp:SqlDataSource ID="RelatedContext" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                SelectCommand="SELECT ID,Name as [Related Context] FROM Contexts WHERE (ID IN (SELECT Context FROM TCI WHERE (Technology = @tID)))">
                <SelectParameters>
                    <asp:Parameter Name="tID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="ALLContext" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                SelectCommand="SELECT ID, Name FROM Contexts where ID not in (select context from TCI where technology = @tID)">
                <SelectParameters>
                    <asp:Parameter Name="tID" />
                </SelectParameters>


            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceRelatedContext" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                SelectCommand="SELECT Contexts.Name as Name,IndustrialSector.Name as Industrial_Sector, [Project_Size], [Project_Kind], [Development_Process], Contexts.ID as ID FROM [Contexts],IndustrialSector where contexts.Industrial_Sector=IndustrialSector.ID AND (Contexts.ID IN (SELECT Context FROM TCI WHERE (Technology = @tID)))">
                <SelectParameters>
                    <asp:Parameter Name="tID" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="ContextDetailsByID" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                SelectCommand="SELECT Contexts.* FROM Contexts WHERE (ID = @cID)">
                <SelectParameters>
                    <asp:Parameter Name="cID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="showImpactByID" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                SelectCommand="SELECT ID,[Name], [Total_Cost], [Total_Schedule] FROM [Impacts] where Impacts.ID in (SELECT Impact FROM TCI WHERE Context = @cID and Technology = @tID)">
                <SelectParameters>
                    <asp:Parameter Name="cID" />
                    <asp:Parameter Name="tID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="ImpactDetailsByID" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                SelectCommand="SELECT Impacts.* FROM Impacts WHERE (ID = @iID)">
                <SelectParameters>
                    <asp:Parameter Name="iID" />
                </SelectParameters>
            </asp:SqlDataSource>
           
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSource1" OnItemInserting="FormView1_ItemInserting" OnModeChanged="FormView_ModeChanged" Style="margin-left: 0px; margin-right: 10px;" Width="750px">
                <EditItemTemplate>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td rowspan="3" class="col0">
                                    <img src="imgs/label.png" alt="label" width="15" height="43" /></td>
                                <td class="col1"><asp:Label ID="Label45" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <asp:Label ID="Label1" CssClass="label" runat="server" Text="Name:"></asp:Label></td>
                                <td class="col2">
                                    <asp:TextBox ID="NameTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Name") %>' />
                                    <asp:HiddenField ID="hiddenTechID" runat="server" Value='<%# Bind("TechnologyId") %>' />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="NameTextBox" ErrorMessage="Required!" 
 runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>

                            </tr>
                            <tr>
                                <td class="col1"><asp:Label ID="Label47" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <asp:Label ID="Label2Edit" CssClass="label" runat="server" Text="Abbreviation:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="AbbreviationTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Abbreviation") %>' />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="AbbreviationTextBox" ErrorMessage="Required!" 
 runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label3" CssClass="label" runat="server" Text="Type:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <%-- <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="true" Text="Method" ></asp:ListItem>
                                            <asp:ListItem Value="false" Text="Tool" ></asp:ListItem>
                                        </asp:RadioButtonList>--%>
                                    <asp:Label ID="TypeLabel" CssClass="label" runat="server" Text='<%#  Eval("Method").ToString().Equals("True")?"Method":"Tool"  %>' />
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td rowspan="11" class="col0">
                                    <img src="imgs/description.png" alt="description" width="18" height="90" /></td>
                                <td class="col1"><asp:Label ID="Label28" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <asp:Label ID="Label4" CssClass="label" runat="server" Text="Short Description:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="Shoert_DescriptionTextBox" CssClass="textArea" runat="server" Text='<%# Bind("Shoert_Description") %>' TextMode="MultiLine" />
                                    <br />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="Shoert_DescriptionTextBox" ErrorMessage="Required!" 
 runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label5" CssClass="label" runat="server" Text="Objectives:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="ObjectivesTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Objectives") %>' TextMode="MultiLine" />
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label6" CssClass="label" runat="server" Text="Belongs to family:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="FamilyTexBox" CssClass="textfield" runat="server" Text='<%# Bind("Family") %>' TextMode="MultiLine" />
                                </td>
                            </tr>


                            <tr id="Tr1" runat="server" visible=' <%# Eval("Method").ToString().Equals("True")? Convert.ToBoolean("true"):Convert.ToBoolean("false")  %>'>
                                <td class="col1">

                                    <asp:Label ID="ImplementedByMethodlabelEdit" CssClass="label" runat="server" Text="Implemented by(Method):"></asp:Label>
                                </td>
                                <td class="col2">
                                    <%--<asp:Label ID="MethodLabel" runat="server" Text='<%# Bind("Method") %>'></asp:Label>--%>
                                    <asp:BulletedList ID="BulletedList1" DisplayMode="Text" RenderWhenDataEmpty="true" runat="server" DataSourceID="AllImplementedByMethod" DataTextField="Name" DataValueField="Name">
                                    </asp:BulletedList>

                                    <asp:SqlDataSource ID="AllImplementedByMethod" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                                        SelectCommand="select Technologies.name as Name from Technologies where technologies.TechnologyId in (select tool_id from implements where method_id=@technology_id)">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="technology_id" ControlID="hiddenTechID" PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>

                            <tr id="Tr2" runat="server" visible=' <%# Eval("Method").ToString().Equals("True")? Convert.ToBoolean("false"):Convert.ToBoolean("true") %>'>
                                <td class="col1">
                                    <asp:Label ID="ImplementedByToollabelEdit" CssClass="label" runat="server" Text="Implemented by(Tool):"></asp:Label>
                                </td>
                                <td class="col2" style="vertical-align: top;">
                                    <%--<asp:Label ID="ToolLabel" runat="server" Text='<%# Bind("Method") %>'></asp:Label>--%>
                                    <asp:BulletedList ID="BulletedList2" runat="server" DataSourceID="AllImplementedByTool" DataTextField="Name" DataValueField="Name">
                                    </asp:BulletedList>
                                    <asp:SqlDataSource ID="AllImplementedByTool" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                                        SelectCommand="select Technologies.name as Name from Technologies where technologies.TechnologyId in (select method_id from implements where tool_id=@technology_id) ">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="technology_id" ControlID="hiddenTechID" PropertyName="Value" />
                                        </SelectParameters>

                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label7" CssClass="label" runat="server" Text="Literature:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="LiteratureTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Literature") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label8" CssClass="label" runat="server" Text="Background:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="BackgroundTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Background") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label17" CssClass="label" runat="server" Text="Complements:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <%--<asp:ListBox ID="ListBox1" runat="server" DataSourceID="COMPLIMENTS_TECHN" DataTextField="Name" DataValueField="TechnologyId"></asp:ListBox>--%>
                                    <asp:BulletedList ID="BulletedList3" runat="server" DataSourceID="showComplemets" DataTextField="Name" DataValueField="Name">
                                    </asp:BulletedList>
                                    <asp:SqlDataSource ID="showComplemets" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                                        SelectCommand="select Technologies.name as Name from Technologies where technologies.TechnologyId in (select Compliment_Technology from compliment_Technologies where Technology=@technology_id) ">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="technology_id" ControlID="hiddenTechID" PropertyName="Value" />
                                        </SelectParameters>

                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label19" CssClass="label" runat="server" Text="Alternatives:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <%--<asp:ListBox ID="ListBox2" runat="server" DataSourceID="COMPLIMENTS_TECHN" DataTextField="Name" DataValueField="TechnologyId"></asp:ListBox>--%>
                                    <asp:BulletedList ID="BulletedList4" runat="server" DataSourceID="showAlternative" DataTextField="Name" DataValueField="Name">
                                    </asp:BulletedList>
                                    <asp:SqlDataSource ID="showAlternative" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                                        SelectCommand="select Technologies.name as Name from Technologies where technologies.TechnologyId in (select Alternatives_Technology from Alternative_Technologies where Technology=@technology_id) ">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="technology_id" ControlID="hiddenTechID" PropertyName="Value" />
                                        </SelectParameters>

                                    </asp:SqlDataSource>
                                </td>
                            </tr>

                            <%--Add Author--%>

                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label18" CssClass="label" runat="server" Text="Author:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:DropDownList ID="AuthorList" DataSourceID="ALL_AUTHOR" DataTextField="Name" DataValueField="ID" runat="server" SelectedValue='<%# Bind("Author") %>'>
                                    </asp:DropDownList>
                                </td>
                            </tr>









                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label9" CssClass="label" runat="server" Text="SPEM model:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="SPEM_ModelTextBox" Visible="false" CssClass="textfield" runat="server" Text='<%# Bind("SPEM_Model") %>' />
                                    <asp:FileUpload ID="FileUpload1" runat="server" class="button gray" />
                                </td>
                            </tr>
                        </table>
                    </div>



                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td rowspan="3" class="col0">
                                    <img src="imgs/prerequisits.png" alt="prerequisits" width="18" height="94" /></td>
                                <td class="col1">
                                    <asp:Label ID="Label10" CssClass="label" runat="server" Text="Qualification required:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="QualificationTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Qualification") %>' TextMode="MultiLine" />
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label11" CssClass="label" runat="server" Text="Training required:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="TrainingTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Training") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label12" runat="server" CssClass="label" Text="Experience required:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="ExperienceTextBox" runat="server" CssClass="textfield" Text='<%# Bind("Experience") %>' />
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td rowspan="3" class="col0">
                                    <img src="imgs/apllied_in_by.png" alt="applied in/by" width="19" height="110" />
                                </td>

                                <td class="col1" colspan="2" style="height: 447px">
                                    <table class="table_form" border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse; text-align: center; vertical-align: top">
                                        <tr>
                                            <td colspan="1" class="checkbox" style="width: 649px">&nbsp;</td>
                                            <td colspan="1" style="width: 268px">&nbsp;</td>
                                            <td colspan="4" class="col0">View Level
                                            </td>
                                           

                                        </tr>
                                        <tr>
                                            <td colspan="1" class="checkbox" style="height: 74px; width: 649px"></td>
                                            <td colspan="1" style="height: 74px; width: 268px"></td>
                                            <td style="height: 74px">
                                                <img src="imgs/icons/Requirement.png" alt="Requirement" title="Requirement" /></td>
                                            <td style="height: 74px">
                                                <img src="imgs/icons/Functional.png" alt="Functional" title="Functional" /></td>
                                            <td style="height: 74px">
                                                <img src="imgs/icons/Logical.png" alt="Logical" title="Logical" /></td>
                                            <td style="height: 74px">
                                                <img src="imgs/icons/Technical.png" alt="Technical" title="Technical" /></td>

                                        </tr>


                                        <tr>
                                            <td class="checkbox" style="width: 649px"> <asp:Label ID="Label27" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                                <asp:Label ID="Label29" CssClass="label" runat="server" Text="Input:"></asp:Label>&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="TextBox2" CssClass="textfield" runat="server" Text='<%# Bind("Input_Artifact") %>' TextMode="MultiLine" Width="242px" Height="48px" />
                                                <br />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="TextBox2" ErrorMessage="Required!" 
 runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <div id="counter2" style="color:red;"></div>
                                            </td>
                                            <td style="width:268px;">
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                    <tr ><td style="width: 157px">Supersystem (eg. Aircraft)</td></tr>
                                                    <tr><td style="width: 157px">System</td></tr>
                                                    <tr><td style="width: 157px">Component (eg. Equipment)</td></tr>
                                                    <tr><td style="width: 157px">Unit (eg. SW/HW)</td></tr>
                                                </table>
                                                </td>
                                            <td>
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ip_a1_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a1_v1")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a2_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a2_v1")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a3_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a3_v1")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a4_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a4_v1")) %>'  /></td></tr>
</table>

                                            </td>
                                            <td>
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ip_a1_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a1_v2")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a2_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a2_v2")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a3_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a3_v2")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a4_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a4_v2")) %>'  /></td></tr>
</table>

                                            </td>
                                            <td>
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ip_a1_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a1_v3")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a2_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a2_v3")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a3_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a3_v3")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a4_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a4_v3")) %>'  /></td></tr>
</table>

                                            </td>
                                            <td>
                                                
                                              <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ip_a1_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a1_v4")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a2_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a2_v4")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a3_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a3_v4")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a4_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a4_v4")) %>'  /></td></tr>
</table>
</td>
                                           
                                        </tr>

                                        <tr>
                                            <td class="checkbox" style="height: 76px; width: 649px"> <asp:Label ID="Label26" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                                <asp:Label ID="Label30" runat="server" CssClass="label" Text="Output:"></asp:Label>
                                                <asp:TextBox ID="TextBox3" runat="server" CssClass="textfield" Text='<%# Bind("Output_Artifact") %>' TextMode="MultiLine" Width="243px" Height="48px"/>
                                                <br />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="TextBox3" ErrorMessage="Required!" 
 runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <div id="counter3" style="color:red;"></div>
                                            </td>
                                            <td style="width:268px; height: 76px;">
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                    <tr ><td>Supersystem (eg. Aircraft)</td></tr>
                                                    <tr><td>System</td></tr>
                                                    <tr><td>Component (eg. Equipment)</td></tr>
                                                    <tr><td>Unit (eg. SW/HW)</td></tr>
                                                </table>
                                                </td>
                                            <td style="height: 76px">
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="op_a1_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a1_v1")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a2_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a2_v1")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a3_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a3_v1")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a4_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a4_v1")) %>'  /></td></tr>
</table>

                                            </td>
                                            <td style="height: 76px">
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="op_a1_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a1_v2")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a2_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a2_v2")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a3_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a3_v2")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a4_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a4_v2")) %>'  /></td></tr>
</table>

                                            </td>
                                            <td style="height: 76px">
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="op_a1_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a1_v3")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a2_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a2_v3")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a3_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a3_v3")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a4_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a4_v3")) %>'  /></td></tr>
</table>

                                            </td>
                                            <td style="height: 76px">
                                                
                                              <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="op_a1_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a1_v4")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a2_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a2_v4")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a3_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a3_v4")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a4_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a4_v4")) %>'  /></td></tr>
</table>
</td>
                                        </tr>

                                        <tr>
                                            <td class="checkbox" style="width: 649px">Applies In/By :</td>
                                            <td style="width:268px;">
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                    <tr ><td>Supersystem (eg. Aircraft)</td></tr>
                                                    <tr><td>System</td></tr>
                                                    <tr><td>Component (eg. Equipment)</td></tr>
                                                    <tr><td>Unit (eg. SW/HW)</td></tr>
                                                </table>
                                                </td>
                                            <td>
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ap_a1_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a1_v1")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a2_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a2_v1")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a3_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a3_v1")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a4_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a4_v1")) %>'  /></td></tr>
</table>

                                            </td>
                                            <td>
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ap_a1_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a1_v2")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a2_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a2_v2")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a3_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a3_v2")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a4_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a4_v2")) %>'  /></td></tr>
</table>

                                            </td>
                                            <td>
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ap_a1_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a1_v3")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a2_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a2_v3")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a3_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a3_v3")) %>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a4_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a4_v3")) %>'  /></td></tr>
</table>

                                            </td>
                                            <td>
                                                
                                              <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ap_a1_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a1_v4")) %>'   /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a2_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a2_v4"))%>'  /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a3_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a3_v4")) %>'   /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a4_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a4_v4")) %>'   /></td></tr>
</table>
</td>

                                        </tr>

                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label54" runat="server" CssClass="label" Text="SE phase:"></asp:Label></td>
                                <td class="col2">

                                    <asp:DropDownList ID="AllSEPhaseList" runat="server" DataSourceID="All_SEPhase" DataTextField="Name" DataValueField="ID" Height="22px" Width="200px" SelectedValue='<%# Bind("SE_Phase") %>'></asp:DropDownList>

                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label24" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                    <asp:Label ID="Label56" runat="server" CssClass="label" Text="Role:"></asp:Label></td>
                                <td class="col2">
                                    <asp:TextBox ID="Applied_By_RoleTextBox" runat="server" CssClass="textfield" Text='<%# Bind("Applied_By_Role") %>' Width="500px" />
                                    <br />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="Applied_By_RoleTextBox" ErrorMessage="Required!" 
 runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="form_domain">

                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <table class="table_form">
                                    <tr>
                                        <td class="col0" rowspan="2">
                                            <%--<asp:Label ID="Label20" runat="Server" Text="Related Context :"></asp:Label>--%>

                                        </td>
                                        <td class="col1">
                                            <asp:GridView BorderStyle="None" BorderWidth="0px" GridLines="None" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="RelatedContext">
                                                <Columns>
                                                    <asp:BoundField DataField="Related Context" ControlStyle-CssClass="label" HeaderText="Related Context :" SortExpression="Related Context" />

                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkRemove" runat="server"
                                                                CommandArgument='<%# Eval("ID")%>'
                                                                OnClientClick="return confirm('Do you want to delete?')"
                                                                Text="Delete" OnClick="DeleteContext"><img src="imgs/icons/delete.png" alt="Delete" title="Delete" /></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                                <EmptyDataRowStyle
                                                    ForeColor="Red" />
                                                <EmptyDataTemplate>
                                                    No Related Context Found!!  

                                                </EmptyDataTemplate>
                                                <HeaderStyle CssClass="label" />
                                                <RowStyle CssClass="label" />
                                            </asp:GridView>
                                            <br />
                                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add Related Context" class="button gray" />
                                            <asp:Label ID="lblMessage" runat="Server" ForeColor="Red" Enabled="false"></asp:Label>



                                            <br />
                                            <br />
                                        </td>
                                        <td class="col2" id="tdUpdate" style="text-align: left" runat="server" visible="true">
                                            <asp:Panel ID="AddContextUpdatePanel" runat="server" Visible="false">
                                                Select Existing Context:
                                      <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ALLContext" DataTextField="Name" DataValueField="ID">
                                      </asp:DropDownList>
                                                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Add" class="button gray" />


                                            </asp:Panel>
                                        </td>
                                        <td class="col3">&nbsp;</td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>

                    <%--<script language="javascript" type="text/javascript">
     var tdUpdate = null;
     function ControlVisible() {
         
         var lbl = document.getElementById("<%= t.ClientID %>");

           lbl.visible = true;
           //txt.visible = true;
       }
        </script>--%>


                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0">&nbsp;</td>
                                <td class="col1">&nbsp;</td>
                                <td class="col2" style="text-align: center">
                                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" class="button gray" OnClick="UpdateButton_Click" />
                                    &nbsp;<asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" class="button gray" />

                                </td>
                                <td class="col3">&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </EditItemTemplate>




                <InsertItemTemplate>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td rowspan="3" class="col0">
                                    <img src="imgs/label.png" alt="label" width="15" height="43" /></td>
                                <td class="col1">
                                   <asp:Label ID="Label15" CssClass="label" ForeColor="Red" runat="server" Text="*"></asp:Label> <asp:Label ID="Label1" CssClass="label" runat="server" Text="Name"></asp:Label></td>
                                <td class="col2">
                                    <asp:TextBox ID="NameTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Name") %>' />  
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="NameTextBox" ErrorMessage="Required!" 
                                       runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" validationgroup="insertOnly"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label16" CssClass="label" ForeColor="Red" runat="server" Text="*"/><asp:Label ID="Label2" CssClass="label" runat="server" Text="Abbreviation"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="AbbreviationTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Abbreviation") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="AbbreviationTextBox" ErrorMessage="Required!" 
                                        runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" validationgroup="insertOnly"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label3" CssClass="label" runat="server" Text="Type:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="true" Text="Method" Selected="True"></asp:ListItem>
                                        <asp:ListItem Value="false" Text="Tool"></asp:ListItem>

                                    </asp:RadioButtonList>
                            </tr>
                        </table>
                    </div>
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td rowspan="11" class="col0">
                                    <img src="imgs/description.png" alt="description" width="18" height="90" /></td>
                                <td class="col1"><asp:Label ID="Label25" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                   <asp:Label ID="Label4" CssClass="textArea" runat="server" Text="Short Description:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="Shoert_DescriptionTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Shoert_Description") %>' TextMode="MultiLine" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="Shoert_DescriptionTextBox" ErrorMessage="Required!" 
                                        runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" validationgroup="insertOnly"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                   <asp:Label ID="Label22" CssClass="label" ForeColor="Red" runat="server" Text="*"/> <asp:Label ID="Label5" CssClass="label" runat="server" Text="Objectives:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="ObjectivesTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Objectives") %>' TextMode="MultiLine" />

                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label6" CssClass="label" runat="server" Text="Belongs to family:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="FamilyTexBox" CssClass="textfield" runat="server" Text='<%# Bind("Family") %>' TextMode="MultiLine" />
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="MethodLabel" class="label" runat="server" Text="Label">
                                               <a class="label"> If  method, implements:</a>:
                  </p>
                                    </asp:Label>
                                    <td class="col2">
                                        <asp:ListBox ID="MethodTechnology11" runat="server" DataSourceID="MethodTechnology" DataTextField="NAME" DataValueField="TechnologyId" Height="46px" SelectionMode="Multiple" Width="550px"></asp:ListBox>
                                        <%-- <asp:Parameter Name="Method" />--%></td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="ToolLabel" class="label" runat="server" Text="Label" Visible="false">
                                               <a class="label"> If  tool, implements:</a>:
                  </p>
                                    </asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:ListBox ID="ToolTechnology11" runat="server" SelectionMode="Multiple" DataSourceID="ToolTechnology" DataTextField="NAME" DataValueField="TechnologyId" Visible="false" Height="46px" Width="550px"></asp:ListBox>
                                    <%--<asp:TextBox ID="TextAreaTool" class="textfield" runat="server" TextMode="MultiLine" Visible="false"></asp:TextBox>--%>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label7" CssClass="label" runat="server" Text="Literature:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="LiteratureTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Literature") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label8" CssClass="label" runat="server" Text="Background:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="BackgroundTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Background") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label17" CssClass="label" runat="server" Text="Complements:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:ListBox ID="Complements" SelectionMode="Multiple" runat="server" DataSourceID="COMPLIMENTS_TECHN" DataTextField="Name" DataValueField="TechnologyId" Height="50px" Width="550px"></asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label19" CssClass="label" runat="server" Text="Alternatives:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:ListBox ID="Alternatives" runat="server" SelectionMode="Multiple" DataSourceID="COMPLIMENTS_TECHN" DataTextField="Name" DataValueField="TechnologyId" Height="50px" Width="550px"></asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label18" CssClass="label" runat="server" Text="Author:"></asp:Label>
                                </td>
                                <td class="col2" style="vertical-align: top;">&nbsp;
                                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                 <ContentTemplate>

                                                     <asp:DropDownList ID="AuthorList" DataSourceID="ALL_AUTHOR" DataTextField="Name" DataValueField="ID" runat="server"></asp:DropDownList>
                                                     <%--<asp:ListBox ID="ListBox3" runat="server" DataSourceID="ALL_AUTHOR" DataTextField="Name" DataValueField="ID"></asp:ListBox>--%>
                                                     <asp:Button ID="ButtonAuthor" runat="server" OnClick="ButtonAuthorClick" Text="Add author" class="button gray" />
                                                     <br />
                                                     <br />
                                                     <asp:Panel ID="Panel1" runat="server" Visible="False" BorderColor="SlateGray">
                                                         Author Name :&nbsp;
                                                         <asp:TextBox ID="auhtorName" CssClass="textfield" runat="server" ToolTip="Add new Author" Width="200px" Height="15px" />
                                                         <br />
                                                         Email :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="authorEmail" runat="server" CssClass="textfield" ToolTip="Add new Author" Width="200px" Height="15px" />
                                                         <br />
                                                         Affiliation :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="authorAffiliation" runat="server" CssClass="textfield" ToolTip="Add new Author" Width="200px" Height="15px" />
                                                         <asp:Button ID="ButtonAuthorSave" runat="server" OnClick="ButtonAuthorSaveClick" Text="Add" class="button gray" />
                                                         <asp:Label ID="Label13" runat="server" Text="Cannot Insert more than 1 Author" Visible="false"> </asp:Label>
                                                         <br />
                                                     </asp:Panel>
                                                 </ContentTemplate>
                                             </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label9" CssClass="label" runat="server" Text="SPEM model:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="SPEM_ModelTextBox" Visible="false" CssClass="textfield" runat="server" Text='<%# Bind("SPEM_Model") %>' />
                                    <asp:FileUpload ID="FileUpload1" runat="server" class="button gray" />
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td rowspan="5" class="col0" style="width: 22px; vertical-align: middle;">
                                    <img src="imgs/prerequisits.png" alt="prerequisits" width="18" height="94" /></td>
                                <td class="col1">
                                    <asp:Label ID="Label10" CssClass="label" runat="server" Text="Qualification required:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="QualificationTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Qualification") %>' TextMode="MultiLine" />
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label11" CssClass="label" runat="server" Text="Training required:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="TrainingTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Training") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label12" CssClass="label" runat="server" Text="Experience required:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:TextBox ID="ExperienceTextBox" CssClass="textfield" runat="server" Text='<%# Bind("Experience") %>' />
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="form_domain">

                        <table class="table_form">
                            <tr>
                                <td rowspan="3" class="col0">
                                    <img src="imgs/apllied_in_by.png" alt="applied in/by" width="19" height="110" />
                                </td>
                                <td class="col1" colspan="2" style="height: 447px">
                                    <table class="table_form" border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse; text-align: center; vertical-align: top">
                                        <tr>
                                            <td colspan="1" class="checkbox" style="width: 649px">&nbsp;</td>
                                            <td colspan="1" style="width: 268px">&nbsp;</td>
                                            <td colspan="4" class="col0">View Level
                                            </td>
                                           

                                        </tr>
                                        <tr>
                                           <td colspan="1" class="checkbox" style="height: 74px; width: 649px"></td>
                                            <td colspan="1" style="height: 74px; width: 268px"></td>
                                            <td style="height: 74px">
                                                <img src="imgs/icons/Requirement.png" alt="Requirement" title="Requirement" /></td>
                                            <td style="height: 74px">
                                                <img src="imgs/icons/Functional.png" alt="Functional" title="Functional" /></td>
                                            <td style="height: 74px">
                                                <img src="imgs/icons/Logical.png" alt="Logical" title="Logical" /></td>
                                            <td style="height: 74px">
                                                <img src="imgs/icons/Technical.png" alt="Technical" title="Technical" /></td>
                                        </tr>


                                        <tr>
                                            <td class="checkbox" style="width: 649px"><asp:Label ID="Label20" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                                 <asp:Label ID="Label29" CssClass="label" runat="server" Text="Input:"></asp:Label>&nbsp;
                                            <asp:TextBox ID="TextBox2" CssClass="textfield" runat="server" Text='<%# Bind("Input_Artifact") %>' TextMode="MultiLine" Width="250px" Height="50px" />
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox2" ErrorMessage="Required!" 
                                        runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" validationgroup="insertOnly"></asp:RequiredFieldValidator>
                                                <div id="counter2" style="color:red;"></div>
                                            </t>
                                            <td style="width:268px;">
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                    <tr ><td style="width: 157px">Supersystem (eg. Aircraft)</td></tr>
                                                    <tr><td style="width: 157px">System</td></tr>
                                                    <tr><td style="width: 157px">Component (eg. Equipment)</td></tr>
                                                    <tr><td style="width: 157px">Unit (eg. SW/HW)</td></tr>
                                                </table>
                                                </td>
                                            <td >
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ip_a1_v1" runat="server" Checked='<%# Bind("ip_a1_v1") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a2_v1" runat="server" Checked='<%# Bind("ip_a2_v1") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a3_v1" runat="server" Checked='<%# Bind("ip_a3_v1") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a4_v1" runat="server" Checked='<%# Bind("ip_a4_v1") %>' /></td></tr>
</table>

                                            </td>
                                            <td >
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ip_a1_v2" runat="server" Checked='<%# Bind("ip_a1_v2") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a2_v2" runat="server" Checked='<%# Bind("ip_a2_v2") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a3_v2" runat="server" Checked='<%# Bind("ip_a3_v2") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a4_v2" runat="server" Checked='<%# Bind("ip_a4_v2") %>' /></td></tr>
</table>

                                            </td>
                                            <td >
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ip_a1_v3" runat="server" Checked='<%# Bind("ip_a1_v3") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a2_v3" runat="server" Checked='<%# Bind("ip_a2_v3") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a3_v3" runat="server" Checked='<%# Bind("ip_a3_v3") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a4_v3" runat="server" Checked='<%# Bind("ip_a4_v3") %>' /></td></tr>
</table>

                                            </td>
                                            <td >
                                                
                                              <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ip_a1_v4" runat="server" Checked='<%# Bind("ip_a1_v4") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a2_v4" runat="server" Checked='<%# Bind("ip_a2_v4") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a3_v4" runat="server" Checked='<%# Bind("ip_a3_v4") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a4_v4" runat="server" Checked='<%# Bind("ip_a4_v4") %>' /></td></tr>
</table>
</td>
                                           
                                        </tr>

                                        <tr>
                                            <td class="checkbox" style="height: 76px; width: 649px"><asp:Label ID="Label23" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                                <asp:Label ID="Label30" runat="server" CssClass="label" Text="Output:"></asp:Label>
                                                <asp:TextBox ID="TextBox3" runat="server" CssClass="textfield" Text='<%# Bind("Output_Artifact") %>' TextMode="MultiLine" Width="250px" Height="50px" />
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox3" ErrorMessage="Required!" 
                                        runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" validationgroup="insertOnly"></asp:RequiredFieldValidator>
                              
						<div id="counter3" style="color:red;"></div>
                                            </td>
                                            <td style="width:268px; height: 76px;">
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                    <tr ><td style="width: 157px">Supersystem (eg. Aircraft)</td></tr>
                                                    <tr><td style="width: 157px">System</td></tr>
                                                    <tr><td style="width: 157px">Component (eg. Equipment)</td></tr>
                                                    <tr><td style="width: 157px">Unit (eg. SW/HW)</td></tr>
                                                </table>
                                                </td>
                                            <td style="height: 76px">
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="op_a1_v1" runat="server" Checked='<%# Bind("op_a1_v1") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a2_v1" runat="server" Checked='<%# Bind("op_a2_v1") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a3_v1" runat="server" Checked='<%# Bind("op_a3_v1") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a4_v1" runat="server" Checked='<%# Bind("op_a4_v1") %>' /></td></tr>
</table>

                                            </td>
                                            <td style="height: 76px">
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="op_a1_v2" runat="server" Checked='<%# Bind("op_a1_v2") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a2_v2" runat="server" Checked='<%# Bind("op_a2_v2") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a3_v2" runat="server" Checked='<%# Bind("op_a3_v2") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a4_v2" runat="server" Checked='<%# Bind("op_a4_v2") %>' /></td></tr>
</table>

                                            </td>
                                            <td style="height: 76px">
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="op_a1_v3" runat="server" Checked='<%# Bind("op_a1_v3") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a2_v3" runat="server" Checked='<%# Bind("op_a2_v3") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a3_v3" runat="server" Checked='<%# Bind("op_a3_v3") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a4_v3" runat="server" Checked='<%# Bind("op_a4_v3") %>' /></td></tr>
</table>

                                            </td>
                                            <td style="height: 76px">
                                                
                                              <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="op_a1_v4" runat="server" Checked='<%# Bind("op_a1_v4") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a2_v4" runat="server" Checked='<%# Bind("op_a2_v4") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a3_v4" runat="server" Checked='<%# Bind("op_a3_v4") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a4_v4" runat="server" Checked='<%# Bind("op_a4_v4") %>' /></td></tr>
</table>
</td>
                                        </tr>

                                        <tr>
                                            <td class="checkbox" style="width: 649px">Applies In/By :</td>
                                            <td style="width:268px;">
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                    <tr ><td style="width: 157px">Supersystem (eg. Aircraft)</td></tr>
                                                    <tr><td style="width: 157px">System</td></tr>
                                                    <tr><td style="width: 157px">Component (eg. Equipment)</td></tr>
                                                    <tr><td style="width: 157px">Unit (eg. SW/HW)</td></tr>
                                                </table>
                                                </td>
                                            <td>
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ap_a1_v1" runat="server" Checked='<%# Bind("ap_a1_v1") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a2_v1" runat="server" Checked='<%# Bind("ap_a2_v1") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a3_v1" runat="server" Checked='<%# Bind("ap_a3_v1") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a4_v1" runat="server" Checked='<%# Bind("ap_a4_v1") %>' /></td></tr>
</table>

                                            </td>
                                            <td >
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ap_a1_v2" runat="server" Checked='<%# Bind("ap_a1_v2") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a2_v2" runat="server" Checked='<%# Bind("ap_a2_v2") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a3_v2" runat="server" Checked='<%# Bind("ap_a3_v2") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a4_v2" runat="server" Checked='<%# Bind("ap_a4_v2") %>' /></td></tr>
</table>

                                            </td>
                                            <td>
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ap_a1_v3" runat="server" Checked='<%# Bind("ap_a1_v3") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a2_v3" runat="server" Checked='<%# Bind("ap_a2_v3") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a3_v3" runat="server" Checked='<%# Bind("ap_a3_v3") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a4_v3" runat="server" Checked='<%# Bind("ap_a4_v3") %>' /></td></tr>
</table>

                                            </td>
                                            <td >
                                                
                                              <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ap_a1_v4" runat="server" Checked='<%# Bind("ap_a1_v4") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a2_v4" runat="server" Checked='<%# Bind("ap_a2_v4") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a3_v4" runat="server" Checked='<%# Bind("ap_a3_v4") %>' /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a4_v4" runat="server" Checked='<%# Bind("ap_a4_v4") %>' /></td></tr>
</table>
</td>

                                        </tr>

                                    </table>
                                </td>
                               
                            </tr>

                            <tr>

                                <td class="col1">
                                    <table class="table_form">
                                        <tr>
                                            <td class="col1">
                                                <asp:Label ID="Label54" runat="server" CssClass="label" Text="SE phase:"></asp:Label>
                                            </td>

                                            <td class="col2">
                                                <asp:DropDownList ID="ListBox4" runat="server" DataSourceID="All_SEPhase" DataTextField="Name" DataValueField="ID" Height="22px" Width="200px">
                                                </asp:DropDownList>
                                            </td>

                                        </tr>

                                        <tr>
                                            <td class="col1"><asp:Label ID="Label24" CssClass="label" ForeColor="Red" runat="server" Text="*"/>
                                                <asp:Label ID="Label56" runat="server" CssClass="label" Text="Role:"></asp:Label>
                                            </td>

                                            <td class="col2">
                                                <asp:TextBox ID="Applied_By_RoleTextBox" runat="server" CssClass="textfield" Text='<%# Bind("Applied_By_Role") %>' />
                                                <br />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="Applied_By_RoleTextBox" ErrorMessage="Required!" 
                                        runat="server" Font-Italic="true" Display="Dynamic" ForeColor="Red" validationgroup="insertOnly"></asp:RequiredFieldValidator>
                                            </td>

                                        </tr>


                                    </table>

                                </td>
                                <td class="col2">&nbsp;
                                </td>
                            </tr>






                        </table>



                        
                    </div>


                   

                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td class="col0">&nbsp;</td>
                                <td class="col1">

                                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" class="button gray" CommandName="Insert" Height="25px" OnClick="InsertButton_Click" Text="Insert" Width="90px" validationgroup="insertOnly" />

                                </td>
                                <td class="col2">
                                    <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" class="button gray" Height="25px" Width="90px" />

                                </td>
                                <td class="col3">&nbsp;</td>
                            </tr>
                        </table>
                    </div>

                </InsertItemTemplate>

                <ItemTemplate>
                   
                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td rowspan="3" class="col0">
                                    <img src="imgs/label.png" alt="label" width="15" height="43" /></td>
                                <td class="col1">
                                    <asp:Label ID="Label1" CssClass="label" runat="server" Text="Name :"></asp:Label></td>
                                <td class="col2">
                                    <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                                    <asp:Label ID="Label31" runat="server" Text='<%# Eval("TechnologyId") %>' Visible="false"></asp:Label>
                                    <asp:HiddenField ID="HiddenTechnologyId" runat="server" Value='<%# Eval("TechnologyId") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label14" CssClass="label" runat="server" Text="Abbreviation :"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:Label ID="Label32" runat="server" Text='<%#  Bind("Abbreviation")  %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label2" CssClass="label" runat="server" Text="Type :"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:Label ID="TypeLabel" CssClass="label" runat="server" Text='<%#  Eval("Method").ToString().Equals("True")?"Method":"Tool"  %>' />
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td rowspan="11" class="col0" style="vertical-align: middle;">
                                    <img src="imgs/description.png" alt="description" width="18" height="90" />
                                </td>
                            </tr>

                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label6" CssClass="label" runat="server" Text="Short Description :"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:Label ID="Shoert_Description" runat="server" Text='<%# Bind("Shoert_Description") %>'></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label35" CssClass="label" runat="server" Text="Objectives :"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:Label ID="Objectives" runat="server" Text='<%# Bind("Objectives") %>'></asp:Label>
                                </td>
                            </tr>



                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label33" CssClass="label" runat="server" Text="Belongs to family:"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:Label ID="belongstofamily" runat="server" Text='<%# Bind("Family") %>'></asp:Label>
                                </td>
                            </tr>


                            <tr id="Tr3" runat="server" visible=' <%# Eval("Method").ToString().Equals("True")? Convert.ToBoolean("true"):Convert.ToBoolean("false")  %>'>
                                <td class="col1">

                                    <asp:Label ID="ImplementedByMethodlabel" CssClass="label" runat="server" Text="Implemented by(Method):"></asp:Label>
                                </td>
                                <td class="col2">
                                    <%--<asp:Label ID="MethodLabel" runat="server" Text='<%# Bind("Method") %>'></asp:Label>--%>
                                    <asp:BulletedList ID="BulletedList1" DisplayMode="Text" RenderWhenDataEmpty="true" runat="server" DataSourceID="AllImplementedByMethod" DataTextField="Name" DataValueField="Name">
                                    </asp:BulletedList>

                                    <asp:SqlDataSource ID="AllImplementedByMethod" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                                        SelectCommand="select Technologies.name as Name from Technologies where technologies.TechnologyId in (select tool_id from implements where method_id=@technology_id)">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="technology_id" ControlID="HiddenTechnologyId" PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>

                            <tr id="Tr4" runat="server" visible=' <%# Eval("Method").ToString().Equals("True")? Convert.ToBoolean("false"):Convert.ToBoolean("true") %>'>
                                <td class="col1">
                                    <asp:Label ID="ImplementedByToollabel" CssClass="label" runat="server" Text="Implemented by(Tool):"></asp:Label>
                                </td>
                                <td class="col2" style="vertical-align: top;">
                                    <%--<asp:Label ID="ToolLabel" runat="server" Text='<%# Bind("Method") %>'></asp:Label>--%>
                                    <asp:BulletedList ID="BulletedList2" runat="server" DataSourceID="AllImplementedByTool" DataTextField="Name" DataValueField="Name">
                                    </asp:BulletedList>
                                    <asp:SqlDataSource ID="AllImplementedByTool" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                                        SelectCommand="select Technologies.name as Name from Technologies where technologies.TechnologyId in (select method_id from implements where tool_id=@technology_id) ">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="technology_id" ControlID="HiddenTechnologyId" PropertyName="Value" />
                                        </SelectParameters>

                                    </asp:SqlDataSource>
                                </td>
                            </tr>

                            <tr>
                                <td class="col1">

                                    <asp:Label ID="Label34" CssClass="label" runat="server" Text="Literature :"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:Label ID="Literature" runat="server" Text='<%# Bind("Literature") %>'></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td class="col1">

                                    <asp:Label ID="Label37" CssClass="label" runat="server" Text="Background :"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:Label ID="Label38" runat="server" Text='<%# Bind("Background") %>'></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label44" CssClass="label" runat="server" Text="Complements :"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:BulletedList ID="BulletedList3" runat="server" DataSourceID="showComplemets" DataTextField="Name" DataValueField="Name">
                                    </asp:BulletedList>
                                    <asp:SqlDataSource ID="showComplemets" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                                        SelectCommand="select Technologies.name as Name from Technologies where technologies.TechnologyId in (select Compliment_Technology from compliment_Technologies where Technology=@technology_id) ">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="technology_id" ControlID="HiddenTechnologyId" PropertyName="Value" />
                                        </SelectParameters>

                                    </asp:SqlDataSource>
                                </td>
                            </tr>

                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label46" CssClass="label" runat="server" Text="Alternatives :"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:BulletedList ID="BulletedList4" runat="server" DataSourceID="showAlternative" DataTextField="Name" DataValueField="Name">
                                    </asp:BulletedList>
                                    <asp:SqlDataSource ID="showAlternative" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>"
                                        SelectCommand="select Technologies.name as Name from Technologies where technologies.TechnologyId in (select Alternatives_Technology from Alternative_Technologies where Technology=@technology_id) ">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="technology_id" ControlID="HiddenTechnologyId" PropertyName="Value" />
                                        </SelectParameters>

                                    </asp:SqlDataSource>
                                </td>
                            </tr>

                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label48" CssClass="label" runat="server" Text="Author :"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:Label ID="Label49" runat="server" Text='<%# Bind("AuthorName") %>'></asp:Label>
                                </td>
                            </tr>


                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label9" CssClass="label" runat="server" Text="SPEM model:"></asp:Label>
                                    <asp:HiddenField ID="SPEM_Model" runat="server" Value='<%# Eval("SPEM_Model") %>' />
                                </td>
                                <% if (DataBinder.Eval(FormView1.DataItem, "SPEM_Model") != DBNull.Value)
                                   { %>
                                <td class="col2">
                                    <asp:HyperLink ID="SPEM_ModelTextBoxLabel" runat="server" NavigateUrl='<%# Request.ServerVariables["PORT"] + "UploadFile\\" + Eval("SPEM_Model") %>' Target="_blank">
                                        <asp:Image ID="img" runat="server" ImageUrl="~/imgs/icons/download.png" AlternateText="Download" ToolTip="Download" />
                                    </asp:HyperLink>

                                    <%-- <asp:HyperLink ID="SPEM_ModelTextBoxLabel" runat="server" >
                                        
                                    </asp:HyperLink>

                                     <asp:LinkButton ID="lnkRemove" runat="server" OnClick="Button111_Click">
                                         <asp:Image ID="img" runat="server" ImageUrl="~/imgs/icons/download.png" AlternateText="Download" ToolTip="Download"  /></asp:LinkButton>--%>

                                </td>
                                <% }
                                   else
                                   { %>
                                <td class="col2">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/imgs/icons/no_download.png" AlternateText="No Download File Available!!" ToolTip="No Download File Available!!" />
                                </td>

                                <% } %>
                            </tr>
                        </table>
                    </div>


                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td rowspan="10" class="col0" style="vertical-align: middle;">
                                    <img src="imgs/prerequisits.png" alt="description" width="18" height="90" />
                                </td>
                            </tr>

                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label36" CssClass="label" runat="server" Text="Qualification required :"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:Label ID="Label39" runat="server" Text='<%# Bind("Qualification") %>'></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label40" CssClass="label" runat="server" Text="Training required :"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:Label ID="Label41" runat="server" Text='<%# Bind("Training") %>'></asp:Label>
                                </td>
                            </tr>



                            <tr>
                                <td class="col1">
                                    <asp:Label ID="Label42" CssClass="label" runat="server" Text="Experience required :"></asp:Label>
                                </td>
                                <td class="col2">
                                    <asp:Label ID="Label43" runat="server" Text='<%# Bind("Experience") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>

















                    <div class="form_domain">
                        <table class="table_form">

                            <tr>

                                <td rowspan="3" class="col0">
                                    <img src="imgs/apllied_in_by.png" alt="applied in/by" width="19" height="110" />
                                </td>
                               <td class="col1" colspan="2" style="height: 447px">
                                    <table class="table_form" border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse; text-align: center; vertical-align: top">
                                        <tr>
                                            <td colspan="1" class="checkbox" style="width: 792px">&nbsp;</td>
                                            <td colspan="1" style="width: 268px">&nbsp;</td>
                                            <td colspan="4" class="col0">View Level
                                            </td>
                                           

                                        </tr>
                                        <tr>
                                           <td colspan="1" class="checkbox" style="height: 74px; width: 792px"></td>
                                            <td colspan="1" style="height: 74px; width: 268px"></td>
                                            <td style="height: 74px">
                                                <img src="imgs/icons/Requirement.png" alt="Requirement" title="Requirement" /></td>
                                            <td style="height: 74px">
                                                <img src="imgs/icons/Functional.png" alt="Functional" title="Functional" /></td>
                                            <td style="height: 74px">
                                                <img src="imgs/icons/Logical.png" alt="Logical" title="Logical" /></td>
                                            <td style="height: 74px">
                                                <img src="imgs/icons/Technical.png" alt="Technical" title="Technical" /></td>

                                        </tr>


                                        <tr>
                                            <td class="checkbox" style="width: 792px"><asp:Label ID="Label50" CssClass="label" runat="server" Text="Input:"></asp:Label>
                                                <asp:Label ID="Label51" CssClass="textfield" runat="server" Text='<%# Bind("Input_Artifact") %>' />
                                            </td>
                                           <td style="width:268px;">
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                     <tr ><td style="width: 157px">Supersystem (eg. Aircraft)</td></tr>
                                                    <tr><td style="width: 157px">System</td></tr>
                                                    <tr><td style="width: 157px">Component (eg. Equipment)</td></tr>
                                                    <tr><td style="width: 157px">Unit (eg. SW/HW)</td></tr>
                                                </table>
                                                </td>
                                            <td>
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ip_a1_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a1_v1")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a2_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a2_v1")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a3_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a3_v1")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a4_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a4_v1")) %>' Enabled="false"/></td></tr>
</table>

                                            </td>
                                            <td>
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ip_a1_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a1_v2")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a2_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a2_v2")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a3_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a3_v2")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a4_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a4_v2")) %>' Enabled="false"/></td></tr>
</table>

                                            </td>
                                            <td>
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ip_a1_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a1_v3")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a2_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a2_v3")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a3_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a3_v3")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a4_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a4_v3")) %>' Enabled="false"/></td></tr>
</table>

                                            </td>
                                            <td>
                                                
                                              <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ip_a1_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a1_v4")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a2_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a2_v4")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a3_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a3_v4")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ip_a4_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ip_a4_v4")) %>' Enabled="false"/></td></tr>
</table>
</td>
                                           
                                        </tr>

                                        <tr>
                                            <td class="checkbox" style="height: 76px; width: 792px"> <asp:Label ID="Label52" runat="server" CssClass="label" Text="Output:"></asp:Label>
                                                <asp:Label ID="Label53" runat="server" CssClass="textfield" Text='<%# Bind("Output_Artifact") %>' />
                                            </td>
                                            <td style="width:268px; height: 76px;">
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                     <tr ><td style="width: 157px">Supersystem (eg. Aircraft)</td></tr>
                                                    <tr><td style="width: 157px">System</td></tr>
                                                    <tr><td style="width: 157px">Component (eg. Equipment)</td></tr>
                                                    <tr><td style="width: 157px">Unit (eg. SW/HW)</td></tr>
                                                </table>
                                                </td>
                                            <td style="height: 76px">
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="op_a1_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a1_v1")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a2_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a2_v1")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a3_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a3_v1")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a4_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a4_v1")) %>' Enabled="false"/></td></tr>
</table>

                                            </td>
                                            <td style="height: 76px">
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="op_a1_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a1_v2")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a2_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a2_v2")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a3_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a3_v2")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a4_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a4_v2")) %>' Enabled="false"/></td></tr>
</table>

                                            </td>
                                           <td style="height: 76px">
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="op_a1_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a1_v3")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a2_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a2_v3")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a3_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a3_v3")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a4_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a4_v3")) %>' Enabled="false"/></td></tr>
</table>

                                            </td>
                                           <td style="height: 76px">
                                                
                                              <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="op_a1_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a1_v4")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a2_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a2_v4")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a3_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a3_v4")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="op_a4_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("op_a4_v4")) %>' Enabled="false"/></td></tr>
</table>
</td>
                                        </tr>

                                        <tr>
                                            <td class="checkbox" style="width: 792px">Applies In/By :</td>
                                            <td style="width:268px;">
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                    <tr ><td style="width: 157px">Supersystem (eg. Aircraft)</td></tr>
                                                    <tr><td style="width: 157px">System</td></tr>
                                                    <tr><td style="width: 157px">Component (eg. Equipment)</td></tr>
                                                    <tr><td style="width: 157px">Unit (eg. SW/HW)</td></tr>
                                                </table>
                                                </td>
                                            <td>
                                                <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ap_a1_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a1_v1")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a2_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a2_v1")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a3_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a3_v1")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a4_v1" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a4_v1")) %>' Enabled="false"/></td></tr>
</table>

                                            </td>
                                            <td>
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ap_a1_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a1_v2")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a2_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a2_v2")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a3_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a3_v2")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a4_v2" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a4_v2")) %>' Enabled="false"/></td></tr>
</table>

                                            </td>
                                            <td>
                                                
                                               <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ap_a1_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a1_v3")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a2_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a2_v3")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a3_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a3_v3")) %>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a4_v3" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a4_v3")) %>' Enabled="false"/></td></tr>
</table>

                                            </td>
                                            <td>
                                                
                                              <table border="1" style="border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">
                                                <tr><td><asp:CheckBox ID="ap_a1_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a1_v4")) %>'  Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a2_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a2_v4"))%>' Enabled="false"/></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a3_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a3_v4")) %>' Enabled="false" /></td></tr>
                                                    <tr><td><asp:CheckBox ID="ap_a4_v4" runat="server" Checked='<%# Convert.ToBoolean(Eval("ap_a4_v4")) %>' Enabled="false" /></td></tr>
</table>
</td>

                                        </tr>

                                    </table>


                                </td>





                            </tr>
                            <tr style="border:solid;">
                                
                                <td style="width: 449px" >
                                    <p>
                                        <asp:Label ID="Label54" runat="server" CssClass="label" Text="SE phase:"></asp:Label>
                                        <asp:Label ID="Label55" runat="server" Text='<%# Bind("SE_PhaseName") %>'></asp:Label>
                                  </p>
                                </td>
                               <td style="text-align:left;" >
                                    <asp:Label ID="Label56" runat="server" CssClass="label" Text="Role:"></asp:Label>
                                    <asp:Label ID="Label57" runat="server" CssClass="textfield" Text='<%# Bind("Applied_By_Role") %>' />
                                </td>
                            </tr>







                        </table>


                    </div>
                   
                    
                    <div class="form_domain">
                        <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                            <ContentTemplate>
                                <table class="table_form">
                                    <tr>
                                        <td rowspan="60" class="col0" style="vertical-align: middle;">
                                            <img src="imgs/Related_Context.jpg" alt="description" width="18" height="90" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="col1">

                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataKeyNames="ID" DataSourceID="SqlDataSourceRelatedContext" CellPadding="4" ForeColor="#333333" GridLines="None" Width="753px" OnRowDataBound="SqlDataSourceRelatedContext_RowDataBound" >
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="Name" HeaderText="Name" />
                                                    <asp:BoundField DataField="Industrial_Sector" HeaderText="IndustrialSector" />
                                                    <asp:BoundField DataField="Project_Size" HeaderText="ProjectSize" />
                                                    <asp:BoundField DataField="Project_Kind" HeaderText="ProjectKind" />
                                                    <asp:BoundField DataField="Development_Process" HeaderText="DevelopmentProcess" />

                                                    <asp:TemplateField HeaderText="Details">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="DetailsContextByID" runat="server"
                                                                CommandArgument='<%# Eval("ID")%>' CommandName="Select"
                                                                Text="Details" OnClick="Details_Click"><img src="imgs/icons/details.png" alt="Details" title="Details" /></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                               
                                                <EmptyDataTemplate>


                                                    <tr style="text-align: center; color: red; background-color: lightblue;">
                                                        <th scope="col">No Related Context Found!!
                                                        </th>
                                                    </tr>


                                                </EmptyDataTemplate>
                                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="Black" />
                                                <PagerStyle HorizontalAlign="Center" />

                                                <PagerTemplate>



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

                                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />

                                                <HeaderStyle CssClass="label" />
                                                <RowStyle CssClass="label" />
                                            </asp:GridView>



                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="col1">

                                            <asp:FormView BorderWidth="1" ID="FormView2" runat="server" DataKeyNames="ID" DataSourceID="ContextDetailsByID" Width="750px" Visible="false">



                                                <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="Large" VerticalAlign="Middle" HorizontalAlign="Center" />

                                                <HeaderTemplate>
                                                    <label class="label">Context  <asp:Label ID="NameLbl11" CssClass="label" runat="server" Text='<%# Bind("Name") %>' /> Details</label>
                                                </HeaderTemplate>

                                                <ItemTemplate>
                                                    <div class="form_area_ContextByID item1_ContextByID">
                                                        <%--<div id="form_together_ContextByID">--%>
                                                        <div class="form_domain_ContextByID">
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

                                                        <div class="form_domain_ContextByID">
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

                                                                <%-- <tr>
                                    <td class="col1">
                                        <label class="label">other:</label>
                                    </td>
                                    <td class="col2">
                                        <asp:Label ID="Industrial_SectorLabel" runat="server" Text='<%# Bind("Industrial_Sector") %>' />
                                    </td>
                                </tr>--%>
                                                            </table>
                                                        </div>

                                                        <div class="form_domain_ContextByID">
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

                                                        <div class="form_domain_ContextByID">
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

                                                            </table>
                                                        </div>


                                                        <div class="form_domain_ContextByID">
                                                            <table class="table_form">
                                                                <tr>
                                                                    <td rowspan="70" class="col0">
                                                                        <img src="imgs/Related_Impact.jpg" alt="environment" width="14" height="100"></td>
                                                                    <td class="col1">

                                                                        <br />
                                                                        
                                                                         <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataKeyNames="ID" DataSourceID="showImpactByID" CellPadding="4" ForeColor="#333333" GridLines="None" Width="650px" OnRowDataBound="SqlDataSourceRelatedContext_RowDataBound" >   
                                                                            <AlternatingRowStyle BackColor="White" />
                                                                            <Columns>
                                                                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                                                                <asp:BoundField DataField="Total_Cost" HeaderText="Total_Cost" SortExpression="Total_Cost" />
                                                                                <asp:BoundField DataField="Total_Schedule" HeaderText="Total_Schedule" SortExpression="Total_Schedule" />
                                                                                <asp:TemplateField HeaderText="Details">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="DetailsImpactsByID" runat="server"
                                                                                            CommandArgument='<%# Eval("ID")%>' CommandName="Select"
                                                                                            Text="Details" OnClick="DetailsImpactsByID_Click"><img src="imgs/icons/details.png" alt="Details" title="Details" /></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <EmptyDataTemplate>


                                                                                <tr style="text-align: center; color: red; background-color: lightblue;">
                                                                                    <th scope="col">No Related Impact Found!!
                                                                                    </th>
                                                                                </tr>


                                                                            </EmptyDataTemplate>
                                                                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                                            <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="Black" />
                                                                            <PagerStyle HorizontalAlign="Center" />

                                                                            <PagerTemplate>



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

                                                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />

                                                                            <HeaderStyle CssClass="label" />
                                                                            <RowStyle CssClass="label" />
                                                                        </asp:GridView>

                                                                    </td>

                                                                </tr>

 </table>

                                                    </div>
                                                    <%--</div>--%>
                                                </ItemTemplate>

                                            </asp:FormView>
                                            
                                           </td>
                                    </tr>
                                  <tr><td><asp:LinkButton runat="server" ID="HideFormview2" OnClick="Unnamed_Click" Text="Close" Visible="false"></asp:LinkButton></td></tr>  

                                                                
                                    <tr>
                                        <td class="col1">
                                             
                                            <asp:FormView ID="FormView3" BorderWidth="1" runat="server" DataKeyNames="ID" DataSourceID="ImpactDetailsByID" Width="750px" Visible="false">
                                                

                                                <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="Large" VerticalAlign="Middle" HorizontalAlign="Center" />

                                                <HeaderTemplate>
                                                    <label class="label">Impact <asp:Label ID="Impact_Name11" runat="server" Text='<%# Bind("NAME") %>' CssClass="label" /> Details</label>
                                                </HeaderTemplate>

                                                <ItemTemplate>
                                                    <div class="form_area_ImpactByID item1_ImpactByID">
                                                    <!--  Impact name box -->
                    <div class="form_domain_ImpactByID">
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
                    <div class="form_domain_ImpactByID">
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
                    <div class="form_domain_ImpactByID">
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
                    <div class="form_domain_ImpactByID">
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
                    <div class="form_domain_ImpactByID">
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
                    <div class="form_domain_ImpactByID">
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
                    <div class="form_domain_ImpactByID">
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
                    <div class="form_domain_ImpactByID">
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
</div>

                                                    </ItemTemplate>




                                            </asp:FormView>
                                        
                                        
                                        
                                        
                                        
                                        
                                        </td>
                                        </tr>
                                    <tr><td><asp:LinkButton runat="server" ID="HideFormview3" OnClick="HideFormview3_Click" Text="Close" Visible="false"></asp:LinkButton></td></tr>  




                                                            </table>
                                                       


                                
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        
                    </div>













                    <div class="form_domain">
                        <table class="table_form">
                            <tr>
                                <td rowspan="1" class="col0"></td>
                                <td class="col1"></td>
                                <td class="col2">

                                    <asp:Button ID="Button1" runat="server" Text=" Insert Related Context" OnClick="Button1_Click" CssClass="button gray" Width="150px" />
                                    <asp:Button ID="NewButton" runat="server" CausesValidation="False" OnClick="EditButton_Click" Text="Edit Technology" CssClass="button gray" Width="150px" />


                                </td>
                                <td class="col3">&nbsp;</td>
                            </tr>
                        </table>
                    </div>


                    <asp:HiddenField ID="HiddenField1" runat="server" Value="test hiddenvalue" />
                        
                </ItemTemplate>

                <PagerTemplate>

                    <div>
                        <table class="table_form">
                            <tr>
                                <td class="col0" style="text-align: center">
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
                                        <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Page" CommandArgument="2" Text="2"></asp:LinkButton>--%>
                                        <asp:LinkButton
                                            ID="lnkNext"
                                            Text=">"
                                            CommandName="Page"
                                            CommandArgument="Next"
                                            runat="server" Font-Underline="false"><img src="imgs/next.png" alt="Next" height="16" width="16" /></asp:LinkButton>
                                        <asp:LinkButton ID="LastButton" CommandName="Page" CommandArgument="Last" Text="Last" runat="server">
                 <img src="imgs/last.png" alt="Last" height="16px" width="16px" /></asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </PagerTemplate>


            </asp:FormView>
        </div>


    </div>
</asp:Content>

