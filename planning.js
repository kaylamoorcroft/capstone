// get list of sems that contain list of courses from cookies
let planner = JSON.parse(localStorage.getItem("planner")) || [
    {
        sem: "Fall 2026", 
        courses: []
    }, 
    {
        sem: "Winter 2027", 
        courses: []
    }
]; // will remove hardcoded once have ability to add sems
console.log("initial planner:");
console.log(planner);

let currentSem = $("#semester").val();

/** load courses based on sem */ 
function loadSemCourses() {
    const courses = planner.find(plan => plan.sem === currentSem).courses;
    $('.course-list').first().html("");
    courses.forEach(course => {
        const courseItem = $("<li class='course'></li>").text(course.name);
        courseItem.appendTo($('.course-list')[0]);
    });
}

/** add course to sem and save to cookies */
function addCourse(course) {
    const plan = planner.find(plan => plan.sem === currentSem);
    plan.courses.push(course);
    const courseItem = $(`<li class='course' data-courseid='${course.id}'></li>`).text(course.name);
    courseItem.appendTo($('.course-list')[0]);
    console.log(planner);
    localStorage.setItem("planner", JSON.stringify(planner));
}

let selectedCourse = "";
loadSemCourses();

// update courses when change sem
$('#semester').change(function() {
    currentSem = $(this).val(); // Get the value
    loadSemCourses();
});

$('#myModal').on('show.bs.modal', function (event) {
    const button = $(event.relatedTarget); // Button that triggered the modal
    selectedCourse = {name: button.data('coursename'), id: button.data('courseid')};
    console.log("course to add: " + selectedCourse.id + " " + selectedCourse.name);
    $(this).find('.modal-title').text(`Add ${selectedCourse.name}?`);
});

$("#add-course-btn").click(function (event) {
    $('#myModal').modal("hide");
    // const courseItem = $("<li class='course'></li>").text(selectedCourse);
    // courseItem.appendTo($('.course-list')[0]);
    addCourse(selectedCourse);
});