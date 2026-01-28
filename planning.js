import { insertSorted } from './utils.js';

// get list of sems that contain list of courses from cookies
let planner = JSON.parse(localStorage.getItem("planner")) || []; 
console.log("initial planner:");
console.log(planner);
let sems = JSON.parse(localStorage.getItem("sems")) || []; 
console.log("sems:")
console.log(sems);
let currentSem = "";

/** comparator to determine how to sort sems in order
 *  ie., Fall 2026, Winter 2027, Summer 2027, Fall 2027
 */
const semComparator = (sem1, sem2) => {
    const [s1, y1] = sem1.split(" ");
    const [s2, y2] = sem2.split(" ");

    // 1st level of sorting: by year
    if (y1 < y2) return -1;
    if (y1 > y2) return 1;

    // 2nd level of sorting: by season (inverted = winter < summer < spring < fall)
    if (s1 > s2) return -1;
    if (s1 < s2) return 1;
};

/** compare the sems within the plans to sort in order*/
const planComparator = (plan1, plan2) => semComparator(plan1.sem, plan2.sem);

//info from survey:
let prefs = JSON.parse(localStorage.getItem("survey")) || {
    "applied-option": "",
    "comp-type": "BCS",
    "comp-year": "1",
    "degree-level": "undergrad",
    "first-year": "intro-cs",
    "postgrad-option": "",
    "student-type": "full-time"
}; //default prefs if none set
console.log(prefs);

// going to get this info from DB later for prepopulating courses
// need to build different pathways in DB first
const progFirstYear = [
	{id: "COMP-1113", name: "Computer Programming 1"},
	{id: "COMP-1123", name: "Computer Programming 2"}
];
const csFirstYear = [{id: "COMP-1233", name: "Intro to Computer Science"}];

/** Determine if it's the user's first time accessing this page or not */
function isFirstAccess() {
    if (localStorage.getItem('accessed') === null) {
        // If it does not exist, it's a first visit.
        localStorage.setItem('accessed', 'true');
        return true; // first access
    } else {
        return false; // already accessed before
    }
}

/** Create html element for course item */
function formatCourseItem(course) {
    const courseItem = $(`<li class='course' id=${course.id} data-courseid=${course.id} data-coursename=${course.name}>${course.name}</li>`);
    const removeBtn = $(`<i class='fa-regular fa-square-minus remove' onclick=removeCourse('${course.id}')></i>`);
    removeBtn.appendTo(courseItem);
    return courseItem;
}

/** load courses based on sem */ 
function loadSemCourses() {
    const plan = planner.find(plan => plan.sem === currentSem);
    if (plan) {
        const courses = plan.courses;
        $('.course-list').first().html("");
        courses.forEach(course => formatCourseItem(course).appendTo($('.course-list')[0]));
    }
}
/** load sems into dropdown */
function loadSems() {
    $("#semester").html("");
    sems.forEach(sem => {
        const semItem = $(`<option value='${sem}'>${sem}</option>`);
        semItem.appendTo($('#semester'));
    });
    if(sems.length > 0) {
        $("#semester").removeClass("d-none");
        $(".empty-msg").addClass("d-none");
        currentSem = $("#semester").val();
    }
    else {
        console.log("No sems exist");
        $("#semester").addClass("d-none");
        $(".empty-msg").removeClass("d-none");
    }
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
    insertSorted(planner, plan, planComparator);
    insertSorted(sems, sem, semComparator);
    // update UI
    loadSems();
    // update cookies
    localStorage.setItem("planner", JSON.stringify(planner));
    localStorage.setItem("sems", JSON.stringify(sems));
}

/** remove courses from current semester */
function clearCurrentSem() {
    // check with user first, in case it was an accident
    const confirmClear = window.confirm(`Are you sure you want to clear ${currentSem}?`);
    if (confirmClear) {
        const plan = planner.find(plan => plan.sem === currentSem);
        if (plan) {
            plan.courses = [];
            loadSemCourses();
            // save to cookies
            localStorage.setItem("planner", JSON.stringify(planner));
        }
    }
}

/** add course to sem and save to cookies */
function addCourse(course) {
    const plan = planner.find(plan => plan.sem === currentSem);
    // prevent adding duplicate course in same sem
    if (plan.courses.some(curCourse => curCourse.id === course.id)) {
        window.alert("Could not add " + course.name + " because it is already in " + currentSem);
        return;
    }
    plan.courses.push(course);
    formatCourseItem(course).appendTo($('.course-list')[0]);
    localStorage.setItem("planner", JSON.stringify(planner));
}

/** remove course from sem and update cookies */
function removeCourse(id) {
    const plan = planner.find(plan => plan.sem === currentSem);
    plan.courses = plan.courses.filter(course => course.id != id);
    localStorage.setItem("planner", JSON.stringify(planner));
    loadSemCourses();
}

let selectedCourse = "";
loadSems();
loadSemCourses();

if(isFirstAccess()) {
    // prepopulate required courses
    // but if no prefs set, should open survey page before go to planning page.
    console.log("first access");
    if (prefs["comp-year"] == 1) {
        console.log("first year");
        // add sems for first year - need to do programatically based on date join
        addSem("Fall 2026");
        addSem("Winter 2027");
        currentSem = $("#semester").val();
        if (prefs["first-year"] == "programming") {
            console.log("first year programming. adding:");
            progFirstYear.forEach(course => {addCourse(course);
                console.log(course.id);
            });
        } // need to distinguish between winter / fall too
        else {
            console.log("first year cs. adding:");
            csFirstYear.forEach(course => {addCourse(course); console.log(course.id);});
        }
    }
}

// EVENT LISTENERS

// update courses when change sem
$('#semester').change(function() {
    currentSem = $(this).val(); // Get the value
    loadSemCourses();
});

$('#myModal').on('show.bs.modal', function (event) {
    const button = $(event.relatedTarget); // Button that triggered the modal
    selectedCourse = {name: button.data('coursename'), id: button.data('courseid')};
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

$("#clear-sem-btn").click(function (event) {
    clearCurrentSem();
});