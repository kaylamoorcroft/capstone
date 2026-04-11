//display form info
const surveyObject = JSON.parse(localStorage.getItem("survey"));
    //loop over object.entries
    let surveyData = "";
        for (const [key, value] of Object.entries(surveyObject)){
            surveyData += key + ": " + value + "<br>";
        }

    // below is the same as document.getElementById("elementID").innerHTML = surveyObject['keyName'];
    $("#degree-level").html(surveyObject['degree-level']);
    $("#postgrad-option").html(surveyObject['postgrad-option']);
    $("#comp-year").html(surveyObject['comp-year']);
    $("#first-year-pref").html(surveyObject['first-year-pref']);
    $("#start-date").html(surveyObject['start-semester'] + " " + surveyObject['start-year']);
    $("#comp-type").html(surveyObject['comp-type'] + " " + surveyObject['applied-option']);
    $("#student-type").html(surveyObject['student-type']);
