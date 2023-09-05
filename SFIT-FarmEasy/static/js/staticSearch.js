var flag = 1;
print(flag);
function print(flag) {
  var arr = [
    "<img src='https://www.bigbasket.com/media/uploads/banner_images/YXNP13032-1200X300-280223.jpg'></img>",
    "<img src='https://www.bigbasket.com/media/uploads/banner_images/220223-fresho-days-fnv-460-Bangalore-22ndFEB.jpg'></img>",
    "<img src='https://www.bigbasket.com/media/uploads/banner_images/hp_sbf_m_snackingstore_1600x460-250122.jpg'></img>",
    "<img src='https://www.bigbasket.com/media/uploads/banner_images/hp_bev_m_beveragestore_1600x460-250122.jpg'></img>",
    "<img src='https://www.bigbasket.com/media/uploads/banner_images/hp_bcd_m_GoodDiet_1600x460-250122.jpg'></img>",
  ];

  let headline = document.getElementById("show1");
  headline.innerHTML = arr[0];

  setInterval(function () {
    if (flag == arr.length) {
      flag = 0;
    }
    headline.innerHTML = arr[flag];
    flag++;
  }, 4000);
}


// getting all required elements
const searchWrapper = document.querySelector(".search-input");
const inputBox = searchWrapper.querySelector("input");
const suggBox = searchWrapper.querySelector(".autocom-box");
const icon = searchWrapper.querySelector(".icon");
let linkTag = searchWrapper.querySelector("a");
let webLink;

// if user press any key and release
inputBox.onkeyup = (e)=>{
    let userData = e.target.value; //user enetered data
    let emptyArray = [];
    if(userData){
        icon.onclick = ()=>{
            webLink = `https://www.google.com/search?q=${userData}`;
            linkTag.setAttribute("href", webLink);
            linkTag.click();
        }
        emptyArray = suggestions.filter((data)=>{
            //filtering array value and user characters to lowercase and return only those words which are start with user enetered chars
            return data.toLocaleLowerCase().startsWith(userData.toLocaleLowerCase());
        });
        emptyArray = emptyArray.map((data)=>{
            // passing return data inside li tag
            return data = `<li>${data}</li>`;
        });
        searchWrapper.classList.add("active"); //show autocomplete box
        showSuggestions(emptyArray);
        let allList = suggBox.querySelectorAll("li");
        for (let i = 0; i < allList.length; i++) {
            //adding onclick attribute in all li tag
            allList[i].setAttribute("onclick", "select(this)");
        }
    }else{
        searchWrapper.classList.remove("active"); //hide autocomplete box
    }
}

function select(element){
    let selectData = element.textContent;
    inputBox.value = selectData;
    icon.onclick = ()=>{
        webLink = `https://www.google.com/search?q=${selectData}`;
        linkTag.setAttribute("href", webLink);
        linkTag.click();
    }
    searchWrapper.classList.remove("active");
}

function showSuggestions(list){
    let listData;
    if(!list.length){
        userValue = inputBox.value;
        listData = `<li>${userValue}</li>`;
    }else{
      listData = list.join('');
    }
    suggBox.innerHTML = listData;
}