import { insertSorted, toTitleCase } from './utils.js';

// redirect to survey if prefs not set
if (localStorage.getItem('survey') === null) {
    window.location.href = "intake-survey.html"
}
let prefs = JSON.parse(localStorage.getItem("survey"));
// {
//     "applied-option": "",
//     "comp-type": "BCS",
//     "comp-year": "1",
//     "degree-level": "undergrad",
//     "first-year-pref": "comp-programming",
//     "postgrad-option": "",
//     "start-semester": "fall",
//     "start-year": "2020",
//     "student-type": "full-time"
// }
console.log(prefs);

//search bar script
$(document).ready(function(){
    $("#course_search").keyup(function(){
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
                }
            });
        }
    });
});

// get list of sems that contain list of courses from cookies
let planner = JSON.parse(localStorage.getItem("planner")) || []; 
console.log("initial planner:");
console.log(planner);
let sems = JSON.parse(localStorage.getItem("sems")) || []; 
const Semesters = [
    { id: "FA", name: "Fall" },
    { id: "WI", name: "Winter" },
    { id: "SU", name: "Summer" },
    { id: "CI", name: "Continuous Intake" }
];
Semesters.forEach((sem, i) => {
    Semesters[sem.id] = { ...sem, index: i };
}); // now can access by Semesters.FA.name or Semesters[0].name
/**
 * find next sem & year but exclude CI, and optionally include summer
 * @param {int} i Current semester index
 * @param {int} year Current year
 * @param {int} y Current year
 * @returns {string} the string of next semester after the current one
 */
const findNextSem = (i, year, summer=false) => {
    switch(i) {
        case 0: return `${Semesters[++i].name} ${++year}`;
        case 1: return `${(summer ? Semesters[++i].name : Semesters[0].name)} ${year}`;
        case 2: return `${Semesters[0].name} ${year}`;
        default: return "Undefined";
    }
};
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
                "id": course.id,
                "name": course.name,
                "sem": '1111',
                "prereqs": '',
                "lab": ''
            };
            //return null;
        } 

        data.sem = data.sem.toString(2).padStart(4,'0');
        return data;

    } catch(error) {
        console.error('Error:', error);
        return null;
    }
}

/** get existing course info from plan */
function getCourseInfo(id) {
    let courseInfo;
    planner.some(plan => { 
        courseInfo = plan.courses.find(course => course.id === id);
        return courseInfo;
    });
    return courseInfo;
}

/** Create html element for course item */
function formatCourseItem(course, warning=false, message="") {
    const courseItem = $(`<li class='course' id=${course.id} data-courseid=${course.id} data-coursename=${course.name}>${course.name}</li>`);
    if (warning) {
        courseItem.addClass("bg-warning")
            .attr("data-bs-toggle", "tooltip")
            .attr("data-bs-placement", "top")
            .attr("data-bs-title", message);
    }
    const removeBtn = $(`<i class='fa-regular fa-square-minus remove'></i>`);
    removeBtn.click(() => removeCourse(course.id));
    removeBtn.appendTo(courseItem);
    return courseItem;
}

function getOfferedSems(binSemString) {
    const offeredSems = [];
    for (let i = 0; i < binSemString.length; i++) {
        if (binSemString[i] == "1"){
            offeredSems.push(Semesters[i].name);
        }
    }
    return offeredSems.join(", ");
}

function isCourseOfferedInSem(course, currentSem) {
    for (let i = 0; i < course.sem.length; i++) {
        if (currentSem.includes(Semesters[i].name)) {
            if (course.sem[i] == "1") return true;
            else return false;
        }
    }
    return false;
} 

/** Check if prereqs are in sems before current sem */
function prereqsNotMet(prereqString, sem) {
    if (!prereqString) { // no prereqs, just return
        return [];
    }
    // parse prereqs into proper list - how handle / for or??? - maybe 2d array?
    const prereqs = prereqString.split(", ");
    const prereqsNotMet = [];
    // iterate through prereqs
    prereqs.forEach(req => {
        // initialise variables needed for this section
        let [creds, credCount, dep, coursePlanned, isHourReq, isChoiceReq, choiceReqs] = [0, 0, "", false, false, false, []];
        // if not a course but something like "6h Comp"
        if (!isNaN(parseInt(req[0]))) { 
            isHourReq = true;
            let hrs = 0;
            [hrs, dep] = req.split(" ");
            creds = parseInt(hrs)/3;
        }
        // if there is a choice of courses eg. "COMP-1123 / COMP-1233"
        if (req.includes("/")) {
            isChoiceReq = true;
            choiceReqs = req.split(" / ");
        }
        // iterate through each sem
        for (const plan of planner) {
            if (plan.sem == sem) { // only check before current sem
                break;
            } 
            if (isChoiceReq) {
                for (const choice of choiceReqs) { // if at least 1 course completed
                    if (plan.courses.some(currentCourse => currentCourse.id == choice)) {
                        coursePlanned = true;
                        break;
                    }
                }
            }
            else if (isHourReq) { // check if course id contains enough hours from dep (ie. COMP-1123 contains "Comp")
                plan.courses.some(currentCourse => {
                    if (currentCourse.id.includes(dep.toUpperCase())) {
                        console.log(`${currentCourse.id} contains ${dep.toUpperCase()}`);
                        credCount++;
                    }
                });
                coursePlanned = credCount >= creds ? true : false;
            }
            else {
                coursePlanned = plan.courses.some(currentCourse => currentCourse.id == req);
            }
            if (coursePlanned) {
                console.log(`${req} √`);
                break;
            }
        }
        if (!coursePlanned) {
            console.log(`${req} X`)
            prereqsNotMet.push(req);
        }
    });
    return prereqsNotMet;
}
/** Check if course is a prereq for any courses occuring it after in the plan
 *  Useful for validation when wanting to remove a course
 */
function isCoursePrereq(id) {
    // only have to start checking at index after curSem
    const startIndex = planner.findIndex(plan => plan.sem === currentSem) + 1;
    const coursesWithPrereq = []; // courses that have id as a prereq
    for (let i = startIndex; i < planner.length; i++) {
        for (const course of planner[i].courses) {
            for (const req of course.prereqs.split(",")) {
                if (!isNaN(parseInt(req[0]))) {  // how will know if have enough hours????
                    const [hrs, dep] = req.split(" ");
                    const creds = parseInt(hrs)/3;
                    console.log(`need ${creds} courses in ${dep}. Dunno if will have enough if remove course -> ${id} might be a prereq for ${course.id}`);
                }
                // if there is a choice of courses eg. "COMP-1123 / COMP-1233"
                else if (req.includes("/")) {
                    const choiceReqs = req.split(" / ");
                    if (choiceReqs.some(req => req == id)) { coursesWithPrereq.push(course.id); }
                }
                else if (req == id) { coursesWithPrereq.push(course.id); }
            }
        }
    }
    return coursesWithPrereq;
}

/** load courses based on sem */ 
function loadSemCourses() {
    const plan = planner.find(plan => plan.sem === currentSem);
    if (plan) {
        const courses = plan.courses;
        $('.course-list').first().html("");
        courses.forEach(course => {
            let [warning, message] = [false, ""];
            if (course["missingPrereqs"] && course["missingPrereqs"].length > 0) {
                warning = true;
                message = `You do not meet the prerequisites: ${course["missingPrereqs"]}`;
            }
            return formatCourseItem(course, warning, message).appendTo($('.course-list')[0]);
        });
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
    const oldSem = currentSem;
    loadSems();
    // if value of current sem changed during add, load new sem's courses
    if (currentSem != oldSem) { 
        loadSemCourses(); 
    }
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
async function addCourse(course, sem) {
    const plan = planner.find(plan => plan.sem === sem);
    // prevent adding duplicate course in same sem
    if (plan.courses.some(curCourse => curCourse.id === course.id)) {
        window.alert("Could not add " + course.name + " because it is already in " + sem);
        return;
    }
    const courseInfo = await fetchCourseInfo(course);
    console.log(courseInfo);
    // if course is not offered in current sem, don't add
    if (!isCourseOfferedInSem(courseInfo, sem)) {
        window.alert(`Sorry. Could not add ${courseInfo.name} because it is not offered in ${sem}. It is offered in: ${getOfferedSems(courseInfo.sem)}`);
        return;
    };
    console.log(`checking course ${course.id} for ${sem}`);
    const missingCourses = prereqsNotMet(courseInfo.prereqs, sem);
    let [warning, message] = [false, ""];
    if (missingCourses.length > 0) {
        courseInfo['missingPrereqs'] = missingCourses;
        warning = true;
        message = `You do not meet the prerequisites: ${missingCourses}`;
    }
    plan.courses.push(courseInfo);
    // update UI if add on current sem
    if (sem == currentSem) { 
        formatCourseItem(course, warning, message).appendTo($('.course-list')[0]); 
    } 
    // remove warnings from other courses if this course is prereq for them
    const coursesWithPrereq = isCoursePrereq(course.id);
    for (const course of coursesWithPrereq) {
        const courseInfo = getCourseInfo(course);
        courseInfo.missingPrereqs = courseInfo.missingPrereqs.filter(curCourse => curCourse.id !== course.id);
        console.log("updated courseInfo:");
        console.log(courseInfo);
    }

    localStorage.setItem("planner", JSON.stringify(planner));
}

/** remove course from sem and update cookies */
function removeCourse(id) {
    const coursesWithPrereq = isCoursePrereq(id);
    if (coursesWithPrereq.length > 0) {
        const confirm = window.confirm(`Are you sure you want to remove ${id}? It is a prerequisite for ${coursesWithPrereq}`);
        if (!confirm) return;
    }
    // update coursesWithPrereq to have warning
    for (const course of coursesWithPrereq) {
        const courseInfo = getCourseInfo(course);
        courseInfo.missingPrereqs ??= []; 
        courseInfo.missingPrereqs.push(id);
        console.log("updated courseInfo:");
        console.log(courseInfo);
    }
    // hide tooltip so it doesn't linger after
    const el = $(`#${id}`);
    el.removeClass("bg-warning");
    const tooltip = bootstrap.Tooltip.getInstance(el);
    if (tooltip) tooltip.hide();

    const plan = planner.find(plan => plan.sem === currentSem);
    plan.courses = plan.courses.filter(course => course.id != id);
    localStorage.setItem("planner", JSON.stringify(planner));
    loadSemCourses();
}

// UI upon page load

let selectedCourse = "";
loadSems();
loadSemCourses();

// place year options in add sem dialog based on start year in survey
const startYear = parseInt(prefs["start-year"]);
for (let year = startYear; year <= startYear + 4; year++) {
    const yearOption = $(`<option value='${year}'>${year}</option>`);
    yearOption.appendTo($('#year-add'));
}

if(isFirstAccess()) {
    // prepopulate required courses
    // but if no prefs set, should open survey page before go to planning page.
    console.log("first access");
    if (prefs["comp-year"] == 1) {
        console.log("first year");
        // add sems for first year - programatically based on date join
        const startSem = toTitleCase(prefs["start-semester"]);
        let currentYear = prefs["start-year"];
        let curSemIndex = Semesters.findIndex(sem => sem.name === startSem);
        let curSem = `${startSem} ${currentYear}`;

        (async () => {
            if (prefs["first-year-pref"] == "comp-programming") {
                console.log("first year programming. adding:");
                for (const course of progFirstYear) {
                    addSem(curSem);
                    await addCourse(course, curSem);
                    console.log(course.id);
                    curSem = findNextSem(curSemIndex++, prefs["start-year"]);
                }
            } // need to distinguish between winter / fall too
            else {
                console.log("first year cs. adding:");
                //csFirstYear.forEach(course => {addCourse(course, currentSem); console.log(course.id);});
                for (const course of csFirstYear) {
                    addSem(curSem);
                    console.log("adding first course: " + course.id);
                    await addCourse(course, curSem);
                    console.log(course.id);
                    curSem = findNextSem(curSemIndex++, prefs["start-year"]);
                }
            }
            currentSem = $("#semester").val();
        })();
        
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
    if (button.data('type') === 'new-course'){
        selectedCourse = {name: $('#nCourseName').val(), id: $('#nCourseID').val()};
    } else{
        selectedCourse = {name: button.data('coursename'), id: button.data('courseid')};
    }

    $(this).find('.modal-title').text(`Add ${selectedCourse.name}?`);
});

$("#add-course-btn").click(function (event) {
    $('#myModal').modal("hide");
    // brief delay for modal to disappear before exeuting code in case of alert
    //setTimeout(() => addCourse(selectedCourse), 10);
    addCourse(selectedCourse, currentSem);
});

$("#add-sem-btn").click(function (event) {
    addSem(`${$("#sem-add").val()} ${$("#year-add").val()}`);
    $("#collapseSemAdd").collapse('hide');
});

$("#clear-sem-btn").click(function (event) {
    clearCurrentSem();
});

// tooltips
$(document).on('mouseenter', '[data-bs-toggle="tooltip"]', function () {
    if (!bootstrap.Tooltip.getInstance(this)) {
        new bootstrap.Tooltip(this).show();
    }
});