import { getPlanner } from "../utils/index.js";
import { initDraggables } from "../components/courses.js";

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

export {courseSearch, fetchCourseInfo, getCourseInfo};