// listener for comp type value change
$("#comp-type").on("change", () => {
    // show applied option dropdown if comp type is applied
    if ($("#comp-type").val() == "BACS") {
        $("#applied-option-group").removeClass("hidden");
        $('#applied-option').prop('required', true); // applied option field is now required
    }
    // otherwise, hide the dropdown and clear the option selection
    else {
        $("#applied-option-group").addClass("hidden");
        $("#applied-option").val("");
        $('#applied-option').prop('required', false); // applied option field is now not required
    }
});