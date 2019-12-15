<%@ Page Title="Researcher Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResearcherDashboard.aspx.cs" Inherits="ResearcherApplication.ResearcherDashboard" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h4>Here you will see Projects available, apply for them, and view approval progress.</h4>
    <div>
       <%-- <asp:UpdatePanel runat="server" ID="updatePanel1" OnLoad="updatePanel1_Load" UpdateMode="Conditional">
            <ContentTemplate>--%>
            <asp:GridView ID="GridView1" CssClass="table table-hover table-striped" DataKeyNames="ProjectId" runat="server" AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound" >
                <Columns>
                <asp:BoundField DataField="ProjectId" HeaderText="Project Id"/>
                <asp:BoundField DataField="ProjectName" HeaderText="Project Name"/>
                <asp:BoundField DataField="Description" HeaderText="Description"/>
                <asp:BoundField DataField="State" HeaderText="State Code"/>
                <asp:BoundField DataField="StartDate" HeaderText="StartDate" DataFormatString="{0:dd/MM/yyyy}"/>
                <asp:BoundField DataField="EndDate" HeaderText="EndDate" DataFormatString="{0:dd/MM/yyyy}"/>
                <asp:BoundField DataField="Status" HeaderText="Status"/>
                    <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnAction" Text="Action"  runat="server" CssClass="btn btn-info" OnClick="btnAction_Click">
                        </asp:Button>
                    </ItemTemplate>
                </asp:TemplateField>
                 <%--<asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn btn-info" CommandName="action" />--%>
                <asp:TemplateField HeaderText="Information Requested">
                    <ItemTemplate>
                        <asp:TextBox ID="txtInfoRequested"  runat="server">
                        </asp:TextBox>
                        <asp:Label runat="server" Text="-" ID="lblInfoRequested"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
          
                </Columns>

            </asp:GridView>
<%--            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="GridView1" />
            </Triggers>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>
