<%@ Page Title="Colors" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Colors.aspx.cs" Inherits="SecondWebForms.Colors" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ContentPlaceHolderID="ForCSS" runat="server" >
    <style>
        a{
            padding: 5px
        }
        a:hover{
            background-color: lightgrey
        }

    </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
    <%--<asp:ScriptManager ID="asm" runat="server" />--%>
   <asp:Panel ID="pnlCalendar" runat="server">
        <asp:UpdatePanel ID="up1" runat="server">
            <ContentTemplate>
                <div>
                    Departure date: <asp:TextBox ID="tbDeparture" runat="server" ReadOnly="true" />
                    Return date: <asp:TextBox ID="tbReturn" runat="server" ReadOnly="true" />
                </div>
                <div runat="server" ID="calendars" style="display: flex;background-color: deepskyblue;padding: 5px;"> 
                    <div runat="server" ID="calendarContainer"> 
                        Departure: <br />
                        <asp:Calendar ID="c1" runat="server" OnSelectionChanged="c1_SelectionChangedDeparture" BackColor="white" Width="300px" />
                    </div>
                    <div runat="server" ID="calendarContainer2" style="margin-left: 15px"> 
                        Return: <br />
                        <asp:Calendar ID="c2" runat="server" OnSelectionChanged="c1_SelectionChangedReturn" BackColor="white" Width="300px" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

    <%--<ajaxToolkit:ModalPopupExtender ID="mpe" runat="server" TargetControlId="tbDeparture"  PopupControlID="pnlCalendar"  />--%>
    
    <h2> <%: Title %> </h2>

    <asp:Literal ID="ltMessage" runat="server" />

    

    <div style="width: 50%;border: 1px solid black;padding: 0" >
        <div style="display: flex;background-color: deepskyblue" >
            <div style="flex: 1;color: white;font-weight: bold" >Name</div>
            <div style="flex: 2;color: white;font-weight: bold" >Hex</div>
        </div>
        
        <asp:UpdatePanel ID="up2" runat="server">
        <ContentTemplate>
        <asp:ListView ID="ColorsList" ItemType="SecondWebForms.Models.Color" runat="server" SelectMethod="GetColors" >
            <EmptyDataTemplate>
                Nothing found
            </EmptyDataTemplate>
            <ItemTemplate>
                <asp:LinkButton runat="server" OnClick="Unnamed_Click" CommandArgument="<%#: Item.Color_Id %>" style="display: flex;" >
                    <div style="flex: 1" ><%#: Item.Color_Name %></div>
                    <div style="flex: 1" ><%#: Item.Color_Hex %></div>
                    <div style="flex: 1;background-color: #<%#: Item.Color_Hex %>" > </div>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:ListView>
        </ContentTemplate>
      </asp:UpdatePanel>

    </div>

</asp:Content>
