import { loadPlanner, loadSemCourses, clearCurrentSem, addCourse } from "../components/planner.js";
import { getCurrentSem, addSem } from "../components/sems.js";
import { courseSearch } from "../services/courseService.js";

console.log('here');
// redirect to survey if prefs not set
if (localStorage.getItem('survey') === null) {
    window.location.href = "intake-survey.html"
}

let selectedCourse = "";

function initDraggables() {
    // Select items that aren't already initialized to avoid "double-binding"
    $(".addCourse:not(.ui-draggable)").draggable({
        revert: "invalid", // Snap back if not dropped on a valid drop zone
        cursor: "grabbing",   
        helper: 'clone',
        start: function(event, ui) {
            $(this).css("opacity", "0.5"); 
            // keep same width
            const originalWidth = $(this).outerWidth();
            ui.helper.css({
                'width': originalWidth
            });
        },
        stop: function(event, ui) {
            $(this).css("opacity", "1");
        }
    });

    $("#dragZone").droppable({
        accept: function(draggable) {
            var itemId = draggable.data("courseid");
            // Return true only if no child in the dropzone has this ID
            return $(this).find("[data-courseid='" + itemId + "']").length === 0;
        },
        over: function(event, ui) {
            $(this).css("background-color", "rgb(245, 237, 216)");
        },
        out: function(event, ui) {
            $(this).css("background-color", "rgb(221, 227, 230)");
        },
        drop: function(event, ui) {
            const course = { 
                id: ui.draggable.data("courseid"),
                name: ui.draggable.data("coursename")
            }
            $(this).css("background-color", "rgb(221, 227, 230)");
            addCourse(course, getCurrentSem());
        }
    });
}

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