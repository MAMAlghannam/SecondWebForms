<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="YelpAPI.aspx.cs" Inherits="SecondWebForms.YelpAPI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ForCSS" runat="server">
    <style>
        .scrollable {
            overflow: hidden;
            overflow-y: scroll;
            height: 350px;
            width: 250px;
            border: 1px solid black;
            border-radius: 8px;
        }

        .listContainer {
            display: flex;
            flex-direction: column;
        }

        .selected-item {
            border: 1px solid red;
        }

        ::-webkit-scrollbar {
            width: 10px;
        }
        /* Track */
        ::-webkit-scrollbar-track {
            border-radius: 8px;
            background: #f1f1f1;
        }
        /* Handle */
        ::-webkit-scrollbar-thumb {
            border-radius: 8px;
            background: #888;
        }
        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        .listContainer input {
            padding: 5px
        }

        .listContainer input:hover {
            background-color: lightgreen
        }
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

    <%--<asp:UpdateProgress runat="server" DisplayAfter="1">
        <ProgressTemplate>
            selecting... 
        </ProgressTemplate>
    </asp:UpdateProgress>--%>

    <div class="scrollable">
        <asp:UpdatePanel runat="server" ID="up1" class="listContainer">
            <ContentTemplate>
                 <asp:ObjectDataSource
                    ID="CategoriesDataSource"
                    runat="server"
                    EnableCaching="true"
                    SelectMethod="GetCategories"
                    TypeName="SecondWebForms.YelpAPI"
                />
                <asp:ListView
                    ID="CategoriesList"
                    runat="server"
                    ItemType="SecondWebForms.Models.Category"
                    DataSourceID="CategoriesDataSource"
                    OnSelectedIndexChanged="ItemSelected"
                >
                    <ItemTemplate>
                        <%--<asp:Button
                            ID="SelectButton"
                            runat="server"
                            CommandArgument="<%#: Item.Alias %>"
                            CommandName="Select"
                            Text="<%#: Item.Title %>" 
                        />--%>
                        <asp:LinkButton runat="server" CommandName="Select" >
                             <%#: Item.Title %>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <SelectedItemTemplate>
                        <asp:Label runat="server" ID="SelectedItem" Text="<%#: Item.Title %>" />
                    </SelectedItemTemplate>
                </asp:ListView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <script>

        function setAsActive(e) {
            e.target.classList.add("selected-item")
        }

    </script>

</asp:Content>
