<%@ Page Title="Researcher Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ResearcherApplication.Register" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3></h3>
    <table style="width:100%;">
        <tr>
            <td>
    <table>
        <tr><td>Email</td><td><asp:TextBox ID="txtEmail" runat="server" TextMode="Email" /></td></tr>
        <tr><td>Phone Number</td><td><asp:TextBox ID="txtPhoneNumber" runat="server" TextMode="Phone"  /></td></tr>
        <tr><td>First Name</td><td><asp:TextBox ID="txtFirstName" runat="server" /></td></tr>
        <tr><td>Last Name</td><td><asp:TextBox ID="txtLastName" runat="server" /></td></tr>
        <tr><td>Password</td><td><asp:TextBox ID="txtPassword1" runat="server" TextMode="Password" /></td></tr>
        <tr><td>Confirm Password</td><td><asp:TextBox ID="txtPassword2" runat="server" TextMode="Password" /></td></tr>
       
    </table>
    <br />
    <div style="font-weight:bold;">Address</div>
    <table>
        <tr><td>City</td><td><asp:TextBox ID="txtCity" runat="server" /></td></tr>
        <tr><td>State Code</td><td><asp:TextBox ID="txtState" runat="server" /></td></tr>
    </table>
                <br />
    <div style="font-weight:bold;">Affiliation</div>
    <table>
        <tr><td>Previous Employer</td><td><asp:TextBox ID="txtOrg" runat="server" /></td></tr>
    </table>
<br /><div>
    
       <div style="font-weight:bold;">Availability</div>
        <asp:CheckBoxList ID="cbxMonths" runat="server" CssClass="CheckBoxLabel" >
            <asp:ListItem Text="January" Value="1" />
            <asp:ListItem Text="February" Value="2" />
            <asp:ListItem Text="March" Value="3" />
            <asp:ListItem Text="April" Value="4" />
            <asp:ListItem Text="May" Value="5" />
            <asp:ListItem Text="June" Value="6" />
            <asp:ListItem Text="July" Value="7" />
            <asp:ListItem Text="August" Value="8" />
            <asp:ListItem Text="September" Value="9" />
             <asp:ListItem Text="October" Value="10" />
             <asp:ListItem Text="November" Value="11" />
            <asp:ListItem Text="December" Value="12" />
        </asp:CheckBoxList>
       
    </div>
    </td>
            <td>
    <div>
       <div style="font-weight:bold;">Expertise</div>
        <asp:CheckBoxList ID="cbxCheckBoxList" runat="server" CssClass="CheckBoxLabel" >
            
        </asp:CheckBoxList>
       
    </div></td> </tr>
        <tr><td colspan="2"><br /><asp:Button Id="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click"/>&nbsp;&nbsp;<asp:Label ID="txtError" runat="server" CssClass="alert alert-danger" Visible="false"/></td></tr>
    </table>

</asp:Content>
