<%@ Page Title="Colors" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Colors.aspx.cs" Inherits="SecondWebForms.Colors" %>

<asp:Content ContentPlaceHolderID="ForCSS" runat="server" >
    <style>
        table{
            width: 50%
        }
        th{
            text-align: center;
        }
        td{
            padding: 5px;
        }
        table, th, td {
            border: 1px solid grey;
            border-collapse: collapse;
        }
        tr td:nth-child(3){
            width: 30%;
        }
    </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
    <h2> <%: Title %> </h2>

    <asp:Literal ID="ltMessage" runat="server" />

    <table>
        <tr>
            <th>Name</th>
            <th colspan="2" >Hex</th>
            <%--<th>&nbsp;</th>--%>
        </tr>
        <tr>
            <td>Red</td>
            <td>rgb(255, 0, 0)</td>
            <td style="background-color: red" >&nbsp;</td>
        </tr>
        <tr>
            <td>Red</td>
            <td>rgb(255, 0, 0)</td>
            <td style="background-color: red" >&nbsp;</td>
        </tr>
        <tr>
            <td>Red</td>
            <td>rgb(255, 0, 0)</td>
            <td style="background-color: red" >&nbsp;</td>
        </tr>
    </table>

    <asp:ListView ID="ColorsList" ItemType="SecondWebForms.Models.Color" runat="server" SelectMethod="GetColors" >
        <EmptyDataTemplate>
            Nothing found
        </EmptyDataTemplate>
        <ItemTemplate>
           <b> <%#: Item.ToString()%> </b>
        </ItemTemplate>
        <ItemSeparatorTemplate> <div style="border: 1px solid lightgrey" ></div> </ItemSeparatorTemplate>
    </asp:ListView>

</asp:Content>
