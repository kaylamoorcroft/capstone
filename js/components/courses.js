import { removeCourse, addCourse } from "./planner.js";
import { getCurrentSem } from "./sems.js";

/** Instead of reloading all courses when reqs change, can just update the warning tooltip */
function updateCourseWarning(course, warning=false, message="") {
    const courseItem = $(`#${course.courseId}`);
    if (warning) {
        courseItem.addClass("course-warning")
            .attr("data-bs-toggle", "tooltip")
            .attr("data-bs-placement", "top")
            .attr("data-bs-title", message);
        courseItem.removeClass("bg-light");
        console.log(`Added warning to ${course.courseCode}`);
        courseItem.tooltip('enable');
    }
    else {
        courseItem.addClass("bg-light");
        courseItem.removeClass("course-warning");
        courseItem.tooltip('disable');
        console.log(`removed warning from ${course.courseCode}`);
    }
}

/** Create html element for course item */
function formatCourseItem(course, warning=false, message="") {
    const courseItem = $(`<li class='course' id=${course.id} data-courseid=${course.id} data-coursename=${course.name}>${course.name}</li>`);
    if (warning) {
        courseItem.addClass("course-warning")
            .attr("data-bs-toggle", "tooltip")
            .attr("data-bs-placement", "top")
            .attr("data-bs-title", message);
    }
    else{courseItem.addClass("bg-light")}
    
    const removeBtn = $(`<i class='material-icons material-symbols-outlined remove'>disabled_by_default</i>`);
    removeBtn.click(() => removeCourse(course.id));
    removeBtn.appendTo(courseItem);
    return courseItem;
}

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
        drag: function (event, ui) {
            $('.tooltip').remove();
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
            $('.tooltip').remove();
        }
    });
}

export {updateCourseWarning, formatCourseItem, initDraggables};