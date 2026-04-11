import { getPlanner } from "../utils/index.js";
import { addCourse } from "../components/planner.js";
import { getCurrentSem } from "../components/sems.js";

function courseSearch() {
    var request = $('#course_search').val();

    //if no results match search, return empty string
    if (request == null){
        $("#planCourse").html("");
    }
    else{
        //call AJAX
        $.ajax({
            type: "POST",
            url: "search-ajax.php",
            data: {
            course_search: request
            },
            //call function if result is found
            success: function(param){
                $("#planCourse").html(param);
                $(function() { initDraggables(); });
            }
        });
    }
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

/** fetch course info from db to add to plan */
async function fetchCourseInfo(course) {
    // Use the fetch API to send a POST request
    try {
        const response = await fetch('courses.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({ courseId: course.id }) // Send data as form data
        });
        const data = await response.json(); // Parse the JSON response from the PHP script
        if (data.error) {
            console.log('Error: ' + data.error);
            return {
                "id": course.id || "AAAA-0000",
                "courseCode": course.id || "AAAA-0000",
                "name": course.name || "Course Name",
                "years": 'NULL',
                "terms": 'NULL',
                "reqs": []
            };
        } 
        return data;

    } catch(error) {
        console.error('Error:', error);
        return { // returns this for custom course input since id is a string, not int
            "id": course.id || "AAAA-0000",
            "courseCode": course.id || "AAAA-0000",
            "name": course.name || "Course Name",
            "years": 'NULL',
            "terms": 'NULL',
            "reqs": []
        };
    }
}

/** get existing course info from plan - by id (byId=true) or by courseCode (byId=false)*/
function getCourseInfo(id) {
    const planner = getPlanner();
    let courseInfo;
    planner.some(plan => { 
        courseInfo = plan.courses.find(course => course.id == id);
        return courseInfo;
    });
    return courseInfo;
}

export {courseSearch, fetchCourseInfo, getCourseInfo, initDraggables};