<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="YelpAPI.aspx.cs" Inherits="SecondWebForms.YelpAPI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ForCSS" runat="server">
    <style>
        .scrollable {
            overflow: hidden;
            overflow-y: scroll;
            /*height: 350px;
            width: 250px;*/
            border: 3px solid lightgrey;
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
            padding: 5px;
            text-align: left;
            border: none;
            background-color: white;
            padding-left: 5px;
            margin: 3px
        }

        .listContainer input:hover {
            background-color: rgb(218 218 218);
            text-decoration-style: solid;
        }

        .listContainer input.selected {
            background-color: rgb(214 212 212);
            border-radius: 4px;
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
    <div style="display: flex;max-height: 500px" >
        <div class="scrollable" style="width: 30%">
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
                            <asp:Button
                                ID="SelectButton"
                                runat="server"
                                CommandArgument="<%#: Item.Alias %>"
                                CommandName="Select"
                                Text="<%#: Item.Title %>"
                                class="catBtn"
                            />
                        </ItemTemplate>
                        <SelectedItemTemplate>
                            <asp:Button
                                ID="SelectButton"
                                runat="server"
                                CommandArgument="<%#: Item.Alias %>"
                                CommandName="Select"
                                Text="<%#: Item.Title %>"
                                class="selected"
                            />
                        </SelectedItemTemplate>
                    </asp:ListView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div style="flex: 1;border: 1px solid yellow" >

        </div>
    </div>
    <script>

        function setAsActive(e) {
            e.target.classList.add("selected-item")
        }

    </script>

</asp:Content>
