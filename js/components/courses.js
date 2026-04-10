import { removeCourse } from "./planner.js";
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

export {updateCourseWarning, formatCourseItem};