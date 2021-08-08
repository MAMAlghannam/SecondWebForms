'use strict'

/* To get this run in asp.net 4.x install these libraries:
 *  - JavaScriptEngineSwitcher.V8
 *  - Microsoft.ClearScript.V8.Native.win-x86
 * */

const { useState, useEffect } = React;

function YelpAPIExplorer() {

    const [isLoading, setIsLoading] = useState(true)
    const [categories, setCategories] = useState([])
    const [selectedCategory, setSelectedCategory] = useState(null)
    const [loadingBusiness, setIsLoadingBusiness] = useState(false)
    const [businessList, setBusinessList] = useState([])

    useEffect(() => {

        console.log("loading categories");
        fetch("https://localhost:44339"+"/api/TestREST/Categories")
        .then(rep => rep.json() )
        .then(repJson => {
            setCategories(repJson);
            setIsLoading(false)
        })
        .catch(err=> alert(err))

    }, [])

    useEffect(() => {

        if (selectedCategory != null) {
            setIsLoadingBusiness(true);
            fetch(`https://localhost:44339` + `/api/TestREST/GetBusinessByCategory/${selectedCategory}`)
            .then(rep => rep.json())
                .then(repJson => {
                    console.log(repJson)
                setBusinessList(repJson);
                setIsLoadingBusiness(false)
            })
            .catch(err => alert(err))
        }

    }, [selectedCategory])

    return (
        <div style={{ display: "flex", height: "500px", position: 'relative' }} >
            <div /* categoies list */ className="listContainer scrollable" style={{ flex: 1, border: '1px solid red', padding: 10 }} >
            {
                categories.length == 0 ?
                     <span> nothing to show ! </span>
                :
                    <ul>
                    {   categories.map((item, index) =>
                        <li className={selectedCategory == item.Alias ? "selected" : ""} key={item.Alias} >
                            {item.Alias}
                            <button type="button" style={{ textAlign: 'left' }} onClick={() => setSelectedCategory(item.Alias)} >
                                    {item.Title}
                                </button>
                            </li>
                        )
                    }
                    </ul>
            }
            </div>
            <div /* businesses list */
                style={{ position: 'relative', flex: 3, border: '1px solid green', padding: 10 }}
                className="scrollable"
            >
                {
                    businessList.length == 0 ?
                        <span>Nothing is selected !</span>
                        :
                        businessList.map((item, index) =>
                            <div className="business-info-container" key={item.Id}>
                                <div style={{ width: 200, height: 200 }} >
                                    <img src={item.Image_Url} alt={`this image for ${item.Name}`} style={{ width: 200, height: 200, objectFit: 'contain'}} />
                                </div>
                                <div className="business-info">
                                    <h4 style={{fontWeight: "bold"}}>{item.Name}</h4>
                                    <small>{item.Price}</small>
                                    <span style={{ color: "goldenrod" }}>★★★★★  {item.Rating}
                                        <b style={{ color: "grey" }}> | </b>
                                        <small style={{ color: "grey" }}>{item.Review_Count}</small>
                                    </span>
                                    <h6><i>{item.Location.DisplayAddress}</i></h6>
                                    <a href={item.Url} target="_blank" style={{ alignSelf: 'flex-start' }}>Visit ></a>
                                </div>
                            </div>
                        )
                }
                {
                    loadingBusiness
                    &&
                    <div style={{ position: 'absolute', top: 0, bottom: 0, height: '100%', width: '100%', backgroundColor: 'rgba(0,0,0,0.5)' }} >
                            <h2>Getting selected ...</h2>
                        </div>
                }
            </div>
            {
                isLoading
                &&
                <div style={{ position: 'absolute', top: 0, bottom: 0, width: '100%', backgroundColor: 'rgba(0,0,0,0.5)' }} >
                    <h2>Getting things ready...</h2>
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