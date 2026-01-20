// get list of sems that contain list of courses from cookies
let planner = JSON.parse(localStorage.getItem("planner")) || []; 
console.log("initial planner:");
console.log(planner);
let sems = JSON.parse(localStorage.getItem("sems")) || []; // ["Fall 2026", "Winter 2027"];
console.log(sems);
let currentSem = "";

/** load courses based on sem */ 
function loadSemCourses() {
    const plan = planner.find(plan => plan.sem === currentSem);
    if (plan) {
        const courses = plan.courses;
        $('.course-list').first().html("");
        courses.forEach(course => {
            const courseItem = $("<li class='course'></li>").text(course.name);
            courseItem.appendTo($('.course-list')[0]);
        });
    }
    else {
        console.log("No sems exist");
    }
}
/** load sems into dropdown */
function loadSems() {
    sems.forEach(sem => {
        const semItem = $(`<option value='${sem}'>${sem}</option>`);
        semItem.appendTo($('#semester'));
    });
    currentSem = $("#semester").val();
}

function addSem(sem) {
    // prevent adding duplicate sem
    if (sems.includes(sem)) {
        window.alert("Could not add " + sem + " because it already exists");
        return;
    }
    // update planner & list of sems
    const plan = {
        sem: sem, 
        courses: []
    };
    planner.push(plan);
    sems.push(sem);
    // update UI
    const semItem = $(`<option value='${sem}'>${sem}</option>`);
    semItem.appendTo($('#semester'));
    // update cookies
    localStorage.setItem("planner", JSON.stringify(planner));
    localStorage.setItem("sems", JSON.stringify(sems));
}

/** add course to sem and save to cookies */
function addCourse(course) {
    const plan = planner.find(plan => plan.sem === currentSem);
    // prevent adding duplicate course in same sem
    if (plan.courses.some(course => course.id === course.id)) {
        window.alert("Could not add " + course.name + " because it is already in " + currentSem);
        return;
    }
    plan.courses.push(course);
    const courseItem = $(`<li class='course' data-courseid='${course.id}'></li>`).text(course.name);
    courseItem.appendTo($('.course-list')[0]);
    localStorage.setItem("planner", JSON.stringify(planner));
}

let selectedCourse = "";
loadSems();
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
    addCourse(selectedCourse);
});

$("#add-sem-btn").click(function (event) {
    addSem(`${$("#sem-add").val()} ${$("#year-add").val()}`);
    $("#collapseSemAdd").collapse('hide');
});