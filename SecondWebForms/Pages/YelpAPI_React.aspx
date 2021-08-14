<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="YelpAPI_React.aspx.cs" Inherits="SecondWebForms.Pages.YelpAPI_React" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ForCSS" runat="server">
    <style>
        ::-webkit-scrollbar {
            width: 10px;
            position: absolute;
        }
        /* Track */
        ::-webkit-scrollbar-track {
            border-radius: 4px;
            background: #f1f1f1;
            position: absolute;
        }
        /* Handle */
        ::-webkit-scrollbar-thumb {
            border-radius: 4px;
            background: rgba(136, 136, 136, 0.57);
        }
        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        .scrollable {
            overflow: hidden;
            overflow-y: auto;
            /*height: 350px;
            width: 250px;*/
            border: 3px solid lightgrey;
            border-radius: 4px;
        }

        .listContainer {
            display: flex;
            flex-direction: column;
        }

        .selected-item {
            border: 1px solid red;
        }

        .listContainer ul {
            list-style-type: none;
            color: rgb(12, 67, 114);
            margin: 0;
            padding: 0;
        }

        .listContainer li {
            margin: 0;
            padding: 0;
            border: 3px solid rgba(214, 212, 212, 0);
            transition: 0.2s;
        }

        .listContainer li button{
            width: 100%
        }

        .listContainer li:hover {
            background-color: rgb(218, 218, 218);
            text-decoration-style: solid;
        }

        .listContainer li.selected {
            background-color: rgb(30, 109, 177);
            border-top-right-radius: 13px;
            border-bottom-right-radius: 13px;
            /*border: 3px solid rgb(214, 212, 212);*/
            border: none
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

    <div id="Yelp-API-Explorer-Container" style="padding: 15px" ></div>

    <%--<script src="../Scripts/React/react_runner/react.production.min.js"></script>--%>
    <%--<script src="../Scripts/react/react_runner/react-dom.production.min.js"></script>--%>
    <script src="../Scripts/React/react_runner/react.development.js"></script>
    <script src="../Scripts/React/react_runner/react-dom.development.js"></script>

    <%--<script src="../Scripts/React/YelpAPIExplorer.js"></script>--%>
    <%: Scripts.Render("~/Scripts/React_JSX/YelpAPIExplorer.jsx") %>

    <%--<asp:Literal  runat="server" ID="Literal_YelpAPIExplorerContainer" >

    </asp:Literal>--%>


</asp:Content>
