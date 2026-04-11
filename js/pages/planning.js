import { loadPlanner, loadSemCourses, clearCurrentSem, addCourse } from "../components/planner.js";
import { getCurrentSem, addSem } from "../components/sems.js";
import { courseSearch, initDraggables } from "../services/courseService.js";

console.log('here');
// redirect to survey if prefs not set
if (localStorage.getItem('survey') === null) {
    window.location.href = "intake-survey.html"
}

let selectedCourse = "";

// could use this block to init everything
(async () => {
    try {
        await loadPlanner();
        // UI upon page load
        $(() => {
            $("#course_search").keyup(courseSearch);
            initDraggables();
        });
    } catch (error) {
        console.error("Failed to load:", error);
    }
})();

//validate course ID input
jQuery.validator.addMethod("courseID", function(value, element){
    return this.optional(element) || /^[A-Z]{4}-[0-9]{4}$/.test(value);
}, "Please enter a valid course ID.");

//validate course name input
jQuery.validator.addMethod("courseName", function(value, element){
    return this.optional(element) || /^[a-zA-Z][\w ]{1,49}/.test(value);
}, "Please enter a valid course name.");

//Custom course input validation
jQuery('#newCourse').validate({
    errorClass: 'error', //for css styling
    rules:{
        nCourseName: {required: true, maxlength: 40, courseName: true},
        nCourseID: {required: true, courseID: true},
    }
});

//prevent "Add Course" button from refreshing the page (type=submit)
$(function(){
    jQuery('#newCourse').on('submit', function(event){
        event.preventDefault();

        //only show modal if form is valid
        if ($('#newCourse').valid()){
            $('#myModal').modal('show');
        }
    });
});



// EVENT LISTENERS

// update courses when change sem
$('#semester').change(async function() {
    await loadSemCourses($(this).val());
});

$('#myModal').on('show.bs.modal', function (event) {
    selectedCourse = {name: $('#nCourseName').val(), id: $('#nCourseID').val()};
    $(this).find('.modal-title').text(`Add ${selectedCourse.name}?`);
});

$("#add-course-btn").click(function (event) {
    $('#myModal').modal("hide");
    addCourse(selectedCourse, getCurrentSem());
    $('#newCourse').trigger('reset');
});

$("#add-sem-btn").click(async function (event) {
    console.log($("#year-add").val());
    await addSem($("#sem-add").val(), $("#year-add").val());
    $("#collapseSemAdd").collapse('hide');
});

$("#clear-sem-btn").click(async function (event) {
    await clearCurrentSem();
});

// tooltips
$(document).on('mouseenter', '[data-bs-toggle="tooltip"]', function () {
    if (!bootstrap.Tooltip.getInstance(this)) {
        new bootstrap.Tooltip(this).show();
    }
});
