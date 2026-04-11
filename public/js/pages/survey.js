function compYearDisplayToggle() {
    //show first year preference options
    if ($("#comp-year").val() == "1") {
        $("#first-year-group").removeClass("d-none");
        $('#first-year-pref').prop('required', true);
    } else {
        $("#first-year-group").addClass("d-none");
        $("#first-year-pref").val("");
        $('#first-year-pref').prop('required', false);
    }
}

function degreeLevelDisplayToggle() {
    //show postgraduate degree options
    if ($("#degree-level").val() == "postgrad") {
        $("#postgrad-group").removeClass("d-none");
        $('#postgrad-option').prop('required', true);
    } else {
        $("#postgrad-group").addClass("d-none");
        $("#postgrad-option").val("");
        $('#postgrad-option').prop('required', false);
    }
}

function compTypeDisplayToggle() {
    // show applied option dropdown if comp type is applied
    if ($("#comp-type").val() == "BACS") {
        $("#applied-option-group").removeClass("d-none");
        $('#applied-option').prop('required', true); // applied option field is now required
    }
    // otherwise, hide the dropdown and clear the option selection
    else {
        $("#applied-option-group").addClass("d-none");
        $("#applied-option").val("");
        $('#applied-option').prop('required', false); // applied option field is now not required
    }
}

// change listeners
$("#comp-year").on("change", compYearDisplayToggle);
$("#degree-level").on("change", degreeLevelDisplayToggle);
$("#comp-type").on("change", compTypeDisplayToggle);


// load in previous responses if exist
const prefs = JSON.parse(localStorage.getItem("survey")) || {};
if (prefs != {}) {
    console.log('Here are youre previous responses for the survey:');
    for (const field in prefs) {
        console.log(`${field}: ${prefs[field]}`);
        $(`[name="${field}"]`).val(prefs[field]);
        // show extra fields depending on the prefs
        if (field == 'comp-year') compYearDisplayToggle();
        else if (field == 'degree-level') degreeLevelDisplayToggle();
        else if (field == 'comp-type') compTypeDisplayToggle();
    }
}

//store form info in localStorage
const form = document.getElementById('survey');
form.addEventListener('submit', function (event) {
    event.preventDefault(); // Prevent default submission
    const formData = new FormData(form);
    const formObject = Object.fromEntries(formData.entries()); //convert form data to JS object
    console.log(formObject); 
    localStorage.setItem("survey", JSON.stringify(formObject));
    window.location.href = "planning.php"; // redirect to planning page
});

