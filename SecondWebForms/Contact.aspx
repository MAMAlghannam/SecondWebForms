<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SecondWebForms.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <div style="margin-bottom: 10px" >
        <label> Name: </label>
        <asp:TextBox ID="txtName" autocomplete="none" runat="server" />
        <asp:RequiredFieldValidator ID="txtNameReqAlert" ControlToValidate="txtName" ErrorMessage="Required!" runat="server" />

        <br />
        <label> Email: </label>
        <asp:TextBox ID="txtEmail" runat="server" />
        
        <br />
        <label for="MainContent_favList" > Your fav. list: </label>
        <asp:DropDownList ID="favList" runat="server" >
            <asp:ListItem Text="Black" Value="Black" />
            <asp:ListItem Text="Yellow" Value="Yellow" />
            <asp:ListItem Text="Green" Value="Green" />
        </asp:DropDownList>
        
        <br />
        <asp:Button Text="Click me :)" ID="submitBtn" OnClick="SubmitBtn_Click" runat="server" />
    </div>

    <div runat="server" id="divAlert" >
        <asp:Literal ID="alertMessage" runat="server" />
    </div>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
</asp:Content>
