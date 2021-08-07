'use strict';

var _slicedToArray = function () { function sliceIterator(arr, i) { var _arr = []; var _n = true; var _d = false; var _e = undefined; try { for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i["return"]) _i["return"](); } finally { if (_d) throw _e; } } return _arr; } return function (arr, i) { if (Array.isArray(arr)) { return arr; } else if (Symbol.iterator in Object(arr)) { return sliceIterator(arr, i); } else { throw new TypeError("Invalid attempt to destructure non-iterable instance"); } }; }();

var _React = React,
    useState = _React.useState,
    useEffect = _React.useEffect;


function YelpAPIExplorer() {
    var _useState = useState(true),
        _useState2 = _slicedToArray(_useState, 2),
        isLoading = _useState2[0],
        setIsLoading = _useState2[1];

    var _useState3 = useState([]),
        _useState4 = _slicedToArray(_useState3, 2),
        categories = _useState4[0],
        setCategories = _useState4[1];

    var _useState5 = useState(null),
        _useState6 = _slicedToArray(_useState5, 2),
        selectedCategory = _useState6[0],
        setSelectedCategory = _useState6[1];

    var _useState7 = useState(false),
        _useState8 = _slicedToArray(_useState7, 2),
        loadingBusiness = _useState8[0],
        setIsLoadingBusiness = _useState8[1];

    var _useState9 = useState([]),
        _useState10 = _slicedToArray(_useState9, 2),
        businessList = _useState10[0],
        setBusinessList = _useState10[1];

    useEffect(function () {

        console.log("loading categories");
        fetch("https://localhost:44339" + "/api/TestREST/Categories").then(function (rep) {
            return rep.json();
        }).then(function (repJson) {
            setCategories(repJson);
            setIsLoading(false);
        }).catch(function (err) {
            return alert(err);
        });
    }, []);

    useEffect(function () {

        if (selectedCategory != null) {
            setIsLoadingBusiness(true);
            fetch("https://localhost:44339" + ("/api/TestREST/GetBusinessByCategory/" + selectedCategory)).then(function (rep) {
                return rep.json();
            }).then(function (repJson) {
                console.log(repJson);
                setBusinessList(repJson);
                setIsLoadingBusiness(false);
            }).catch(function (err) {
                return alert(err);
            });
        }
    }, [selectedCategory]);

    return React.createElement(
        "div",
        { style: { display: "flex", height: "500px", position: 'relative' } },
        React.createElement(
            "div",
            { /* categoies list */className: "listContainer scrollable", style: { flex: 1, border: '1px solid red', padding: 10 } },
            categories.length == 0 ? React.createElement(
                "span",
                null,
                " nothing to show ! "
            ) : React.createElement(
                "ul",
                null,
                categories.map(function (item, index) {
                    return React.createElement(
                        "li",
                        { className: selectedCategory == item.Alias ? "selected" : "", key: item.Alias },
                        item.Alias,
                        React.createElement(
                            "button",
                            { type: "button", style: { textAlign: 'left' }, onClick: function onClick() {
                                    return setSelectedCategory(item.Alias);
                                } },
                            item.Title
                        )
                    );
                })
            )
        ),
        React.createElement(
            "div",
            { /* businesses list */
                style: { position: 'relative', flex: 3, border: '1px solid green', padding: 10 },
                className: "scrollable"
            },
            businessList.length == 0 ? React.createElement(
                "span",
                null,
                "Nothing is selected !"
            ) : businessList.map(function (item, index) {
                return React.createElement(
                    "div",
                    { className: "business-info-container", key: item.Id },
                    React.createElement(
                        "div",
                        { style: { width: 200, height: 200 } },
                        React.createElement("img", { src: item.Image_Url, alt: "this image for " + item.Name, style: { width: 200, height: 200, objectFit: 'contain' } })
                    ),
                    React.createElement(
                        "div",
                        { className: "business-info" },
                        React.createElement(
                            "h4",
                            { style: { fontWeight: "bold" } },
                            item.Name
                        ),
                        React.createElement(
                            "small",
                            null,
                            item.Price
                        ),
                        React.createElement(
                            "span",
                            { style: { color: "goldenrod" } },
                            "\u2605\u2605\u2605\u2605\u2605  ",
                            item.Rating,
                            React.createElement(
                                "b",
                                { style: { color: "grey" } },
                                " | "
                            ),
                            React.createElement(
                                "small",
                                { style: { color: "grey" } },
                                item.Review_Count
                            )
                        ),
                        React.createElement(
                            "h6",
                            null,
                            React.createElement(
                                "i",
                                null,
                                item.Location.DisplayAddress
                            )
                        ),
                        React.createElement(
                            "a",
                            { href: item.Url, target: "_blank", style: { alignSelf: 'flex-start' } },
                            "Visit >"
                        )
                    )
                );
            }),
            loadingBusiness && React.createElement(
                "div",
                { style: { position: 'absolute', top: 0, bottom: 0, height: '100%', width: '100%', backgroundColor: 'rgba(0,0,0,0.5)' } },
                React.createElement(
                    "h2",
                    null,
                    "Getting selected ..."
                )
            )
        ),
        isLoading && React.createElement(
            "div",
            { style: { position: 'absolute', top: 0, bottom: 0, width: '100%', backgroundColor: 'rgba(0,0,0,0.5)' } },
            React.createElement(
                "h2",
                null,
                "Getting things ready..."
            )
        )
    );
}

function Text() {

    return "Hello this is text";
}

var domContainer = document.querySelector('#Yelp-API-Explorer-Container');
ReactDOM.render(React.createElement(YelpAPIExplorer, null), domContainer);