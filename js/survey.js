$("#comp-year").on("change", () => {
    //show first year preference options
    if ($("#comp-year").val() == "1") {
        $("#first-year-group").removeClass("d-none");
        $('#first-year').prop('required', true);
    }

    else {
        $("#first-year-group").addClass("d-none");
        $("#first-year").val("");
        $('#first-year').prop('required', false);
    }
});

$("#degree-level").on("change", () => {
    //show postgraduate degree options
    if ($("#degree-level").val() == "postgrad") {
        $("#postgrad-group").removeClass("d-none");
        $('#postgrad-option').prop('required', true);
    }

    else {
        $("#postgrad-group").addClass("d-none");
        $("#postgrad-option").val("");
        $('#postgrad-option').prop('required', false);
    }
});

// listener for comp type value change
$("#comp-type").on("change", () => {
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
});

const form = document.getElementById('survey');
form.addEventListener('submit', function (event) {
    event.preventDefault(); // Prevent default submission
    const formData = new FormData(form);
    const formObject = Object.fromEntries(formData.entries());
    console.log(formObject); 
    localStorage.setItem("survey", JSON.stringify(formObject));
});
