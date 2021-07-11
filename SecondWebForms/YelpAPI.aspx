<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="YelpAPI.aspx.cs" Inherits="SecondWebForms.YelpAPI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ForCSS" runat="server">
    <style>
        .listContainer {
            margin: 50px;
            height: 350px;
            width: 250px;
            border: 1px solid black;
            overflow: hidden;
            overflow-y: scroll;
            border-radius: 8px;
            display: flex;
            flex-direction: column
        }
        ::-webkit-scrollbar {
              width: 10px;
        }
        /* Track */
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }
        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #888;
        }
        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
            background: #555;
        }
        .listContainer input { padding: 5px }
        .listContainer input:hover { background-color: lightgreen }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <%--<asp:DropDownList
        runat="server" 
        ID="CategoriesList"
        SelectMethod="GetCategories"
        ItemType="SecondWebForms.Models.Category"
        DataValueField="Alias"
        DataTextField="Title"
    />--%>

    <asp:Literal runat="server" ID="selectedItems" />

    <asp:UpdatePanel runat="server" ID="up1" >
    <ContentTemplate>
        <asp:UpdateProgress runat="server" DisplayAfter="1"> 
            <ProgressTemplate>
                selecting... 
            </ProgressTemplate>
        </asp:UpdateProgress>
    <div class="listContainer">
        <asp:ListView  
            ID="CategoriesList"
            runat="server"
            SelectMethod="GetCategories"
            ItemType="SecondWebForms.Models.Category"
        >
            <ItemTemplate>
                <asp:Button runat="server" ID="SelectButton" CommandName="Select" Text="<%#: Item.Title %>" />
            </ItemTemplate>
            <SelectedItemTemplate>
                <asp:Button runat="server" ID="SelectButton" CssClass="active" style="background-color: lightcoral" CommandName="Select" Text="<%#: Item.Title %>" />
            </SelectedItemTemplate>
        </asp:ListView>
    </div>
        </ContentTemplate>
        </asp:UpdatePanel>

    <script>
        const list = document.querySelector(".listContainer")

    </script>

</asp:Content>
