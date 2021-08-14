'use strict'

/* To get this run in asp.net 4.x install these libraries:
 *  - JavaScriptEngineSwitcher.V8
 *  - Microsoft.ClearScript.V8.Native.win-x86
 * */

const { useState, useEffect, useRef } = React;

function YelpAPIExplorer() {

    const [isLoading, setIsLoading] = useState(true)
    const [categories, setCategories] = useState([])
    const [selectedCategory, setSelectedCategory] = useState(null)
    const [loadingBusiness, setIsLoadingBusiness] = useState(false)
    const [businessList, setBusinessList] = useState([])

    const businessContainer = useRef();

    useEffect(() => {

        console.log("loading categories");
        fetch("../api/TestREST/Categories", { credentials: 'include' })
        .then(rep => rep.json())
        .then(repJson => {
            setCategories(repJson);
            setIsLoading(false)
        })
        .catch(err => alert(err))

    }, [])

    useEffect(() => {

        if (selectedCategory != null) {
            setIsLoadingBusiness(true);
            fetch(`../api/TestREST/GetBusinessByCategory/${selectedCategory}`)
            .then(rep => {
                if (!rep.ok) {
                    if (rep.status == 401)
                        location.reload()
                    else
                        throw new Error(rep)
                }
                else
                    rep.json()
                    .then(repJson => {
                        //console.log(repJson)
                        setBusinessList(repJson);
                        businessContainer.current.scrollTop = 0;
                        setIsLoadingBusiness(false)
                    })
                    .catch(err => alert(err))

            })
            .catch(err => alert(JSON.stringify(err)))
        }

    }, [selectedCategory])

    return (
        <div style={{ display: "flex", height: "500px", position: 'relative' }} >
            <div className="listContainer" style={{ position: 'relative', flex: 1, borderRadius: 4, border: '2px solid rgba(30, 109, 177, 0.6)' }} >
                <div /* categoies list */ className="scrollable" dir="rtl" style={{ border: 'none', paddingTop: 50 }} >
                    <div dir="ltr" style={{ opacity: 0.95, position: "absolute", top: 0, right: 0, width: '100%', backgroundColor: 'white', padding: 5 }} >
                        <input type="text" placeholder="search..." style={{ outline: 'none', width: '100%', padding: 7, borderRadius: 25, border: '1px solid darkgrey' }} />
                    </div>
                    {
                        categories.length == 0 ?
                            null
                            :
                            <ul>
                                {categories.map((item, index) =>
                                    <li key={item.Alias} style={{ padding: '5px', borderBottom: '1px solid lightgrey' }} className={selectedCategory == item.Alias ? "selected" : ""} >
                                        <button
                                            type="button"
                                            style={{ color: selectedCategory == item.Alias ? 'white' : undefined, border: 'none', background: 'none', textAlign: 'left' }}
                                            onClick={() => setSelectedCategory(item.Alias)}
                                        >
                                            {item.Title}
                                        </button>
                                    </li>
                                )
                                }
                            </ul>
                    }
                </div>
            </div>
            <div style={{ padding: '10px' }} />
            <div style={{ position: 'relative', flex: 3 }} >
                <div /* businesses list */ className="scrollable" style={{ scrollBehavior: 'smooth', height: '100%' }} ref={businessContainer} >
                    {
                    (loadingBusiness && businessList.length == 0) || isLoading ?
                        null
                    :
                    selectedCategory == null ?
                        <div style={{color: 'darkgrey', height: '100%', display: 'flex', justifyContent: 'flex-start', alignItems: "center", flexDirection: 'row' }} >
                            <span style={{ fontSize: '100px', marginRight: '35px' }}>&#8678;</span>
                            <h3> Select from there  </h3>
                        </div>
                    : 
                    businessList.length == 0 ?
                        <div style={{ color: 'darkgrey', height: '100%', display: 'flex', justifyContent: 'center', alignItems: "center", flexDirection: 'row' }} >
                            {/*<span style={{ fontSize: '100px', marginRight: '35px' }}>X</span> */}
                            <h3> No items found  </h3>
                        </div>
                    :
                    businessList.map((item, index) =>
                        <div className="business-info-container" key={item.Id}>
                            <div style={{ width: 200, height: 200 }} >
                                <img src={item.Image_Url} alt={`this image for ${item.Name}`} style={{ width: 200, height: 200, objectFit: 'contain' }} />
                            </div>
                            <div className="business-info">
                                <h4 style={{ fontWeight: "bold" }}>{item.Name}</h4>
                                <small>{item.Price && item.Price.replaceAll("$", "💰")}</small>
                                <div style={{ display: 'flex', flexDirection: 'row', alignItems: 'center' }} >
                                    <span style={{ color: Math.floor(item.Rating) >= 1 ? "goldenrod" : "darkgrey" }}>★</span>
                                    <span style={{ color: Math.floor(item.Rating) >= 2 ? "goldenrod" : "darkgrey" }}>★</span>
                                    <span style={{ color: Math.floor(item.Rating) >= 3 ? "goldenrod" : "darkgrey" }}>★</span>
                                    <span style={{ color: Math.floor(item.Rating) >= 4 ? "goldenrod" : "darkgrey" }}>★</span>
                                    <span style={{ color: Math.floor(item.Rating) >= 5 ? "goldenrod" : "darkgrey" }}>★</span>
                                    &nbsp;
                                    <span style={{ color: "goldenrod" }}> {item.Rating} </span>
                                    &nbsp;
                                    <small style={{ color: "grey" }}> &nbsp; | &nbsp; </small>
                                    <span style={{ color: "grey" }}>{item.Review_Count}</span>
                                </div>
                                <h6><i>{item.Location.DisplayAddress}</i></h6>
                                <a href={item.Url} target="_blank" style={{ alignSelf: 'flex-start' }}>Visit ></a>
                            </div>
                        </div>
                    )
                }
                </div>
            {
                loadingBusiness
                &&
                    <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', color: 'white', position: 'absolute', top: 0, bottom: 0, height: '100%', width: '100%', backgroundColor: 'rgba(0,0,0,0.5)' }} >
                    <h2>Getting selected ...</h2>
                </div>
            }
            </div>
            {
                isLoading
                &&
                <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', color: 'darkgrey', position: 'absolute', top: 0, bottom: 0, width: '100%', backgroundColor: 'rgba(255,255,255,0.8)' }} >
                    <h1>Getting things ready...</h1>
                </div>
            }
        </div>
    );
}

function Text() {

    return "Hello this is text";

}

let domContainer = document.querySelector('#Yelp-API-Explorer-Container');
ReactDOM.render(<YelpAPIExplorer />, domContainer);