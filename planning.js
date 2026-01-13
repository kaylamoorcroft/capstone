let selectedCourse = "";

$('#myModal').on('show.bs.modal', function (event) {
    const button = $(event.relatedTarget); // Button that triggered the modal
    selectedCourse = button.data('courseid');
    console.log("course to add: " + selectedCourse);
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
    const modal = $(this);
    modal.find('.modal-title').text('Select semester for ' + selectedCourse);
    const opt1 = `${$("#semester-1").val()} ${$("#year-1").val()}`;
    const opt2 = `${$("#semester-2").val()} ${$("#year-2").val()}`;
    $("#sem-year-add").html(`<option value="1">${opt1}</option>
                            <option value="2">${opt2}</option>`);
});

$("#add-course-btn").on("click", function (event) {
    $('#myModal').modal("hide");
    const sem = $("#sem-year-add").val();
    const courseItem = $("<li class='course'></li>").text(selectedCourse);
    if (sem == 1) {
        courseItem.appendTo($('.course-list')[0]);
    }
    else {
        courseItem.appendTo($('.course-list')[1]);
    }
});