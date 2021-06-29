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
        <asp:ListView ID="ColorsList" ItemType="SecondWebForms.Models.Color" runat="server" SelectMethod="GetColors" >
            <EmptyDataTemplate>
                Nothing found
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr>
                    <td> <%#: Item.Color_Name %> </td>
                    <td> <%#: Item.Color_Hex %> </td>
                    <td style="background-color: #<%#: Item.Color_Hex %>" >  </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>

    </table>

</asp:Content>
