<%@ Page Title="Events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="SecondWebForms.Events" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
    <h2> <%: Title %> </h2>

    <div style="padding: 10px">
        <label>Event Name:</label>
        <asp:TextBox ID="eventName" runat="server" />
        <br />

        <label>Pick Date:</label>
        <asp:Calendar ID="calendarMenu" runat="server" />
        <br />

        <asp:Button ID="addBtn" Text="Add it!" runat="server" OnClick="AddEvent" />
    </div>

    <div>
        <h3>Events list:</h3>
        <asp:Repeater ID="rptEvent" runat="server" >
            <ItemTemplate>
                <h5>
                    <%#  DataBinder.Eval(Container.DataItem, "EventDate") %>
                    <small>
                        <%# DataBinder.Eval(Container.DataItem, "EventName")  %>
                    </small>
                </h5>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
