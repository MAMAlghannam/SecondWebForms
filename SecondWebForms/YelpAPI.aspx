<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="YelpAPI.aspx.cs" Inherits="SecondWebForms.YelpAPI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ForCSS" runat="server">
    <style>
        .scrollable {
            overflow: hidden;
            overflow-y: auto;
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

        .listContainer ul {
            list-style-type: "⏵";
            color: rgb(12, 67, 114)
        }

        .listContainer li {
            border: 3px solid rgba(214, 212, 212, 0);
            border-radius: 4px;
        }

        .listContainer li:hover {
            background-color: rgb(218, 218, 218);
            text-decoration-style: solid;
        }

        .listContainer li.selected {
            background-color: rgba(214, 212, 212, 0.3);
            border: 3px solid rgb(214, 212, 212);
            border-radius: 4px;
        }

        .listContainer input {
            width: 100%;
            padding: 3px;
            text-align: left;
            border: none;
            background: none;
            padding-left: 5px;
            margin: 3px;
        }

        .business-info-container {
            display: flex;
            border-bottom: 1px solid rgba(0, 0, 0, 0.10);
            transition: 0.3s;
            padding: 2px;
        }

        .business-info-container:hover {
            background-color: rgba(0, 0, 0, 0.05)
        }

        .business-info {
            flex: 1;
            display: flex;
            flex-direction: column;
            /*justify-content: center;*/
            padding: 0px 0px 0px 15px;
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

    <div style="display: flex; max-height: 500px">
        <div class="scrollable" style="width: 30%">
            <asp:UpdatePanel runat="server" ID="up1" class="listContainer">
                <ContentTemplate>
                    <asp:ObjectDataSource
                        ID="CategoriesDataSource"
                        runat="server"
                        EnableCaching="true"
                        SelectMethod="GetCategories"
                        TypeName="SecondWebForms.YelpAPI" />
                    <ul>
                        <asp:ListView
                            ID="CategoriesList"
                            runat="server"
                            ItemType="SecondWebForms.Models.Yelp.Category"
                            DataKeyNames="Alias"
                            DataSourceID="CategoriesDataSource"
                            OnSelectedIndexChanged="ItemSelected">
                            <ItemTemplate>
                                <li>
                                    <asp:Button
                                        ID="SelectButton"
                                        runat="server"
                                        CommandArgument="<%#: Item.Alias %>"
                                        CommandName="Select"
                                        Text="<%#: Item.Title %>" 
                                    />
                                </li>
                            </ItemTemplate>
                            <SelectedItemTemplate>
                                <li class="selected">
                                    <asp:Button
                                        ID="SelectButton"
                                        runat="server"
                                        CommandArgument="<%#: Item.Alias %>"
                                        CommandName="Select"
                                        Text="<%#: Item.Title %>"
                                        Enabled="false" 
                                    />
                                </li>
                            </SelectedItemTemplate>
                        </asp:ListView>
                    </ul>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

            <asp:UpdatePanel runat="server" ID="up_businessInfo" style="display: flex; margin: 1px; position: relative; flex: 1;">
                <ContentTemplate>
                    <div class="scrollable" style="padding: 8px; flex: 1">
                        <asp:ListView
                            runat="server"
                            ID="SelectedBusinessInfo"
                            ItemType="SecondWebForms.Models.Yelp.BusinessInfo"
                        >
                            <ItemTemplate>
                                <div class="business-info-container">
                                    <div style="width: 200px; height: 200px;" >
                                        <img src="<%#: Item.Image_Url %>" alt="this image for <%#: Item.Name %>" style="width: 200px; height: 200px; object-fit: contain" />
                                    </div>
                                    <div class="business-info">
                                        <h4 style="font-weight: bold"><%#: Item.Name %></h4>
                                        <small><%#: Item.Price %></small>
                                        <span style="color: goldenrod">★★★★★  <%#: Item.Rating %>
                                            <b style="color: grey">| </b>
                                            <small style="color: grey"><%#: Item.Review_Count %></small>
                                        </span>
                                        <h6><i><%#: Item.Location.DisplayAddress() %></i></h6>
                                        <a href="<%#: Item.Url %>" target="_blank" style="align-self: flex-start">Visit ></a>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <EmptyItemTemplate>
                                <h3>Nothing found ! </h3>
                            </EmptyItemTemplate>
                        </asp:ListView>

                        <asp:UpdateProgress runat="server" DisplayAfter="1">
                            <ProgressTemplate>
                                <div style="display: flex; justify-content: center; align-items: center; height: 100%; width: 100%; position: absolute; top: 0; right: 0; background: rgba(0, 0, 0, 0.5)">
                                    <h1 style="color: white">Fetching...</h1>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>

                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
    </div>
</asp:Content>
