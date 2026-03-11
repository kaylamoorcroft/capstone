//display form info
const displayButton = document.getElementById("display-button");
displayButton.addEventListener("click", displayForm); //on click, display form data

function displayForm(){
const surveyObject = JSON.parse(localStorage.getItem("survey"));
    //loop over object.entries
    let surveyData = "";
        for (const [key, value] of Object.entries(surveyObject)){
            surveyData += key + ": " + value + "<br>";
        }
        document.getElementById("display-area").innerHTML = surveyData; //show form data in <p>
    }