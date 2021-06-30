<%@ Page Title="Colors" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Colors.aspx.cs" Inherits="SecondWebForms.Colors" %>

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
    <h2> <%: Title %> </h2>

    <asp:Literal ID="ltMessage" runat="server" />

    <div style="width: 50%;border: 1px solid black;padding: 0" >
        <div style="display: flex;background-color: deepskyblue" >
            <div style="flex: 1;color: white;font-weight: bold" >Name</div>
            <div style="flex: 2;color: white;font-weight: bold" >Hex</div>
        </div>
        
        <asp:ListView ID="ColorsList" ItemType="SecondWebForms.Models.Color" runat="server" SelectMethod="GetColors" >
            <EmptyDataTemplate>
                Nothing found
            </EmptyDataTemplate>
            <ItemTemplate>
                <a href="?id=<%#: Item.Color_Id %>" style="display: flex;" >
                    <div style="flex: 1" ><%#: Item.Color_Name %></div>
                    <div style="flex: 1" ><%#: Item.Color_Hex %></div>
                    <div style="flex: 1;background-color: #<%#: Item.Color_Hex %>" > </div>
                </a>
            </ItemTemplate>
        </asp:ListView>

    </div>

</asp:Content>
