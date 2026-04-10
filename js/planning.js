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
                    $(function() { initDraggables(); });
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
    { id: "COI", name: "Continuous Intake" }
];
Semesters.forEach((sem, i) => {
    Semesters[sem.id] = { ...sem, index: i };
    Semesters[sem.name] = { ...sem, index: i };
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
let schedule = JSON.parse(localStorage.getItem("schedule")) || []; 
console.log("schedule:");
console.log(schedule);

/** comparator to determine how to sort sems in order
 *  ie., Fall 2026, Winter 2027, Summer 2027, Fall 2027
 */
const semComparator = (sem1, sem2) => {
    const [s1, y1] = sem1.display.split(" ");
    const [s2, y2] = sem2.display.split(" ");

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

function findCurrentYear() {
    const [semName, year] = currentSem.split(" ");
    // do math with sems and year to figure out year
    const yearDif = parseInt(year) - parseInt(prefs['start-year']);
    const semDif = Semesters[semName].index - Semesters[toTitleCase(prefs['start-semester'])].index;
    console.log(`year dif ${yearDif}`);
    console.log(`sem dif ${semDif}`);
    if (semDif == 0) return yearDif + 1;
    else return yearDif;
}

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

/** fetch req info from db to display in UI */
async function fetchReqInfo(reqId) {
    // Use the fetch API to send a POST request
    try {
        const response = await fetch('reqs.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({ reqId: reqId }) // Send data as form data
        });
        const data = await response.json(); // Parse the JSON response from the PHP script
        console.log(data);
        if (data.error) {
            console.log('Error: ' + data.error);
            return null;
        } 
        return data;

    } catch(error) {
        console.error('Error:',  error);
        return null;
    }
}

/** get existing course info from plan - by id (byId=true) or by courseCode (byId=false)*/
function getCourseInfo(id,byId=true) {
    let courseInfo;
    planner.some(plan => { 
        if (byId) {
            courseInfo = plan.courses.find(course => course.id == id);
        }
        else {
            courseInfo = plan.courses.find(course => course.courseCode == id);
        }
        return courseInfo;
    });
    return courseInfo;
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

function getOfferedSems(terms) {
    const courseSems = terms.split(",");
    const offeredSems = [];
    for (const sem of courseSems) {
        offeredSems.push(Semesters[sem].name);
    }
    return offeredSems.join(", ");
}

function isCourseOfferedInSem(course, currentSem) {
    if (course.terms == 'NULL' || course.terms == null) {
        return true;
    }
    const courseSems = course.terms.split(",");
    const [name, year] = currentSem.split(" ");
    if (courseSems.includes(Semesters[name].id)) {
        return true;
    }
    return false;
}

function _findIndexOf(wordArray, keywordGroup, startIndex) {
    // not an array, just a single keyword, normal find index
    if (typeof keywordGroup === 'string') {
        return wordArray.indexOf(keywordGroup, startIndex);
    }

    // find index of any of the keywords - return the smallest index
    if (Array.isArray(keywordGroup)) {
        let minIndex = -1;
        for (const keyword of keywordGroup) {
            const curIndex = wordArray.indexOf(keyword, startIndex);
            // initial and iterative cases
            if (minIndex === -1 || (curIndex < minIndex && curIndex != -1)) { 
                minIndex = curIndex;
            }
        }
        return minIndex;
    }
}

// recursive helper fn 
function _splitFromKeywords(wordArray, keywords, i=0) {
    let segments = [];
    const indices = [];

    let startIdx = 0;
    let idx = _findIndexOf(wordArray,keywords[i], startIdx);

    while (idx !== -1) {
        segments.push(wordArray.slice(startIdx,idx));
        indices.push(idx);
        startIdx = idx + 1;
        idx = _findIndexOf(wordArray,keywords[i], startIdx); 
    }
    segments.push(wordArray.slice(startIdx));

    if (i + 1 == keywords.length) {
        if (segments[0][0].toLowerCase() == "take") {
            segments[0] = segments[0].slice(1);
        }
        if (segments[0][0].toLowerCase() == "either") {
            segments[0] = segments[0].slice(1);
        }
        if (segments[0][0].toLowerCase().substring(0,3) == "min") {
            segments[0] = segments[0].slice(2,3);
        }
        const isHourReq = segments[0].join(' ').match(/(\d+)-hours from (\w+)/i);
        if (isHourReq) {
            segments[0][0] = { hours: parseInt(isHourReq[1], 10), subject: isHourReq[2].toUpperCase() };
        }
    
        return segments.map(segment => {
            if(typeof segment[0] === 'string' ) {
                return segment[0].replaceAll(';','');
            }
            return segment[0];
        });
    }
    const children =  segments.map(segment => {
        return _splitFromKeywords(segment, keywords, i + 1);
    });

    switch(i) {
        case 0: return {and: children};
        case 1: 

            if (typeof children[0][0] === 'object' && children[0][0] !== null && !Array.isArray(children[0][0])) {
                return {choiceCourses: [], minimumGrade: children[1]? children[1][0] : null, hourReq: children[0][0]};
            }
            return {choiceCourses: children[0], minimumGrade: children[1]? children[1][0] : null, hourReq: null}; // "minimum grade C- required"
        case 2: return {choiceCourses: children};
        default: return children; 
    }
}

function requisiteComprehension(reqs) {
    if (reqs == null || reqs.length == 0) {
        console.log("no reqs");
        return;
    }
    const requisites = []
    for (const _req of reqs) {
        const req = _req.reqsText;
        const reqWords = req.split(" ");
        console.log(`req: ${req}`);
        // for (let i = 0; i < reqWords.length; i++) {
        //     console.log(`${i}: ${reqWords[i]}`);
        // }
        const keywords = [["and","plus"], "with", "or"];
        let segments = _splitFromKeywords(reqWords,keywords);
        segments["completionOrder"] = _req.completionOrder;
        segments["id"] = _req.id;
        requisites.push(segments);
    }
    console.log(`--ALL REQS:`);
    console.log(requisites);
    return requisites;
}

/** Check if prereqs are in sems before current sem */
function prereqsNotMet(reqs, sem) {
    if (!reqs || reqs.length == 0) { // no prereqs, just return
        return [];
    }
    // parse prereqs into proper list - how handle / for or??? - maybe 2d array?
    const prereqsNotMet = [];
    // iterate through prereqs
    reqs.forEach(req => {
        // initialise variables needed for this section
        let [creds, coursePlanned] = [0, false];

        req.and.forEach(andCourse => {
            // iterate through each sem
            for (const plan of planner) {
                // only check till previous sem if PREreq
                if (req.completionOrder == 'Previous' && plan.sem.display == sem) {
                    break;
                }
                coursePlanned = false;
                if (andCourse.choiceCourses.length > 0) {
                    for (const choiceCourse of andCourse.choiceCourses) {
                        if (plan.courses.some(currentCourse => currentCourse.courseCode == choiceCourse)) {
                            coursePlanned = true;
                            break;
                        }
                    }
                }
                else if (andCourse.hourReq) {
                    plan.courses.forEach(course => {
                        if (course.courseCode.includes(andCourse.hourReq.subject.toUpperCase())) {
                            creds++;
                            console.log(`Taking ${course.courseCode} in ${sem} - creds++ (hours = ${creds*3} now)`);
                        }
                    });
                    if (creds*3 >= andCourse.hourReq.hours) {
                        coursePlanned = true;
                    }
                }
                // if (andCourse.minimumGrade) { // will use later on
                //     console.log("min grade: " + andCourse.minimumGrade);
                // }
                if (coursePlanned) {
                    console.log(andCourse);
                    console.log('√');
                    break;
                }
                if (plan.sem.display == sem) { // only check till current sem if coreq / pre/co req
                    break;
                } 
            }
        });
        if (!coursePlanned) {
            console.log(req);
            console.log('X');
            prereqsNotMet.push(req);
        }
    });
    return prereqsNotMet;
}
/** Check if course is a prereq for any courses occuring it after in the plan
 *  Useful for validation when wanting to remove a course
 */
function isCoursePrereq(courseCode) {
    // only have to start checking at index same as curSem
    const startIndex = planner.findIndex(plan => plan.sem.display === currentSem);
    const coursesWithReq = []; // courses that have id as a prereq
    for (let i = startIndex; i < planner.length; i++) {
        for (const course of planner[i].courses) {
            if (!course.reqs) continue; // if course reqs are null, skip
            for (const req of course.reqs) {
                req.and.forEach(andCourse => {
                    if (andCourse.choiceCourses.length > 0) {
                        for (const choiceCourse of andCourse.choiceCourses) {
                            if (courseCode == choiceCourse) {
                                coursesWithReq.push({courseId: course.id, courseCode: course.courseCode, reqId: req.id});
                                break;
                            }
                        }
                    }
                    else if (andCourse.hourReq) {
                        console.log(`might not have enough hours of ${andCourse.hourReq.subject} if remove this course`)
                    }
                });
            }
        }
    }
    return coursesWithReq;
}

function reqsToString(reqs) {
    return `${reqs.map(req => 
        `${req.and.map(andCourse => {
            if (andCourse.hourReq)
                return `${andCourse.hourReq.hours}-hours from ${andCourse.hourReq.subject}`
            return andCourse.choiceCourses.join(" or ");
        })
        .join(" and ")} (${req.completionOrder})`)
    .join(", ")}`;
}

/** load courses based on sem */ 
async function loadSemCourses() {
    const plan = planner.find(plan => plan.sem.display === currentSem);
    if (plan) {
        const courses = plan.courses;
        $('.course-list').first().html("");
        courses.forEach(course => {
            let [warning, message] = [false, ""];
            if (course["missingReqs"] && course["missingReqs"].length > 0) {
                warning = true;
                message = `Missing requisites: ${reqsToString(course["missingReqs"])}`;
            }
            return formatCourseItem(course, warning, message).appendTo($('.course-list')[0]);
        });
    }
    await populateRecs(); 
}
/** load sems into dropdown */
function loadSems() {
    $("#semester").html("");
    sems.forEach(sem => {
        const semItem = $(`<option value='${sem.display}'>${sem.display}</option>`);
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

async function addSem(termName, year) {
    // prevent adding duplicate sem
    const sem = {id: Semesters[termName].id, year: year, display: `${termName} ${year}`};
    if (sems.includes(sem)) {
        window.alert("Could not add " + sem.display + " because it already exists");
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
        await loadSemCourses(); 
    }
    // update cookies
    localStorage.setItem("planner", JSON.stringify(planner));
    localStorage.setItem("sems", JSON.stringify(sems));
}

/** remove courses from current semester */
async function clearCurrentSem() {
    // check with user first, in case it was an accident
    const confirmClear = window.confirm(`Are you sure you want to clear ${currentSem}?`);
    if (confirmClear) {
        const plan = planner.find(plan => plan.sem.display === currentSem);
        if (plan) {
            plan.courses = [];
            await loadSemCourses();
            // save to cookies
            localStorage.setItem("planner", JSON.stringify(planner));
        }
    }
}

/** add course to sem and save to cookies */
async function addCourse(course, sem) {
    console.log(course);
    const plan = planner.find(plan => plan.sem.display === sem);
    if (!plan) {
        window.alert("Error: please add a semester to start adding courses");
        return;
    }
    // prevent adding duplicate course in same sem
    if (plan.courses.some(curCourse => curCourse.id === course.id)) {
        window.alert("Could not add " + course.name + " because it is already in " + sem);
        return;
    }
    const courseInfo = await fetchCourseInfo(course);
    console.log(courseInfo);
    // if course is not offered in current sem, don't add
    if (!isCourseOfferedInSem(courseInfo, sem)) {
        window.alert(`Sorry. Could not add ${courseInfo.name} because it is not offered in ${sem}. It is offered in: ${getOfferedSems(courseInfo.terms)}`);
        return;
    };
    if (plan.courses.length >= 8) {
        window.alert(`Maximum of 8 courses per semester allowed`);
        return;
    }
    courseInfo.reqs = requisiteComprehension(courseInfo.reqs);
    const missingCourses = prereqsNotMet(courseInfo.reqs, sem);
    let [warning, message] = [false, ""];
    if (missingCourses.length > 0) {
        courseInfo['missingReqs'] = missingCourses;
        warning = true;
        message = `Missing requisites: ${reqsToString(missingCourses)}`;
    }
    plan.courses.push(courseInfo);
    // update UI if add on current sem
    if (sem == currentSem) {
        formatCourseItem(course, warning, message).appendTo($('.course-list')[0]);
    }
    //remove warnings from other courses if this course is prereq for them
    const coursesWithPrereq = isCoursePrereq(courseInfo.courseCode);
    for (const course of coursesWithPrereq) {
        const courseInfo = getCourseInfo(course.courseId);
        const missingCourses = prereqsNotMet(courseInfo.reqs, sem);
        courseInfo.missingReqs = missingCourses; 
        // update UI for concurrent course so that colour change actually show up
        [warning, message] = [false, ""];
        if (missingCourses.length > 0) {
            courseInfo['missingReqs'] = missingCourses;
            warning = true;
            message = `Missing requisites: ${reqsToString(missingCourses)}`;
        }
        updateCourseWarning(course, warning, message);
    }

    localStorage.setItem("planner", JSON.stringify(planner));
}

/** remove course from sem and update cookies */
function removeCourse(id) {
    console.log("removing course with id " + id);
    const courseInfo = getCourseInfo(id);
    const courseCode = courseInfo.courseCode;
    const coursesWithPrereq = isCoursePrereq(courseCode);
    if (coursesWithPrereq.length > 0) {
        const confirm = window.confirm(`Are you sure you want to remove ${courseCode}? It is a prerequisite for ${coursesWithPrereq.map(course => course.courseCode)}`);
        if (!confirm) return;
    }
    // hide tooltip so it doesn't linger after
    const el = $(`#${id}`);
    el.removeClass("bg-warning");
    const tooltip = bootstrap.Tooltip.getInstance(el);
    if (tooltip) tooltip.hide();
    el.remove();

    const plan = planner.find(plan => plan.sem.display === currentSem);
    plan.courses = plan.courses.filter(course => course.id != id);

    // update coursesWithPrereq to have warning
    for (const course of coursesWithPrereq) {
        const courseInfo = getCourseInfo(course.courseId);
        const missingCourses = prereqsNotMet(courseInfo.reqs, currentSem);
        courseInfo.missingReqs = missingCourses;

        let [warning, message] = [false, ""];
        if (missingCourses.length > 0) {
            courseInfo['missingReqs'] = missingCourses;
            warning = true;
            message = `Missing requisites: ${reqsToString(missingCourses)}`;
        }
        updateCourseWarning(course, warning, message);
    }
    // remove from schedule if in there
    const curSchedule = schedule.find(s => s.sem == currentSem);
    if (curSchedule) {
        curSchedule.meetingInfo = curSchedule.meetingInfo.filter(m => m.className != courseCode);
    }
    localStorage.setItem("planner", JSON.stringify(planner));
    localStorage.setItem("schedule", JSON.stringify(schedule));
}

/** fetch rec info from db to display in UI */
async function fetchRecs(progId) {
    console.log('fetching recs for prog id ' + progId); 
    try {
        const response = await fetch('recommendations.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({ progId: progId }) // Send data as form data
        });
        const data = await response.json(); // Parse the JSON response from the PHP script
        if (data.error) {
            console.log('Error: ' + data.error);
            return null;
        } 
        return data;

    } catch(error) {
        console.error('Error:',  error);
        return null;
    }
}

function getProgramIdFromPrefs() {
    switch (prefs['comp-type']) {
        case 'BCS': return 1;
        case 'BCS with Honours': return 2;
        case 'BACS': switch(prefs['applied-option']) {
            case 'muc': return 3;
            case 'game-dev': return 4;
            case 'software-dev': return 5;
            case 'data-analytics': return 6;
            case 'interdisciplinary-studies': return 7;
            default: return -1;
        }
        default: return -1;
    }
}

async function populateRecs() {
    const recsBlock = $('#recommendations').find('ul');
    recsBlock.html("");
    const progId = getProgramIdFromPrefs();
    console.log(prefs);
    console.log(`prog id: ${progId}`);
    const recs = await fetchRecs(progId);
    const curYear = findCurrentYear();
    console.log(`current year: ${curYear}`);
    const thisYearRecs = [];
    for (const rec of recs) {
        const [dep, num] = rec.courseCode.split('-');
        if (num[0] == curYear) {
            const courseInfo = await fetchCourseInfo({id: rec.courseId, name: rec.courseTitle});
            //console.log(`${courseInfo.courseCode}: ${courseInfo.terms}`)
            if (isCourseOfferedInSem(courseInfo, currentSem)) {
                thisYearRecs.push(rec);
            }
        }
    }
    for (const rec of thisYearRecs) {
        //console.log(rec);
        $(recsBlock).append(`<li class='course addCourse' data-courseid='${rec.courseId}' data-coursename='${rec.courseTitle}'>${rec.courseTitle}</li>`);
    }
} 
// can then further filter courses by year - use the course code. eg. "1113" is first year

// drag n drop

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
            addCourse(course, currentSem);
        }
    });
}

if(isFirstAccess()) {
    // prepopulate required courses
    // but if no prefs set, should open survey page before go to planning page.
    console.log("first access");
    // if (prefs["comp-year"] == 1) {
    //     console.log("first year");
    //     // add sems for first year - programatically based on date join
    //     const startSem = toTitleCase(prefs["start-semester"]);
    //     let currentYear = prefs["start-year"];
    //     let curSemIndex = Semesters.findIndex(sem => sem.name === startSem);
    //     let curSem = `${startSem} ${currentYear}`;

    //     (async () => {
    //         if (prefs["first-year-pref"] == "comp-programming") {
    //             console.log("first year programming. adding:");
    //             for (const course of progFirstYear) {
    //                 addSem(startSem, currentYear);
    //                 await addCourse(course, curSem);
    //                 console.log(course.id);
    //                 curSem = findNextSem(curSemIndex++, prefs["start-year"]);
    //             }
    //         } // need to distinguish between winter / fall too
    //         else {
    //             console.log("first year cs. adding:");
    //             //csFirstYear.forEach(course => {addCourse(course, currentSem); console.log(course.id);});
    //             for (const course of csFirstYear) {
    //                 addSem(startSem, currentYear);
    //                 console.log("adding first course: " + course.id);
    //                 await addCourse(course, curSem);
    //                 console.log(course.id);
    //                 curSem = findNextSem(curSemIndex++, prefs["start-year"]);
    //             }
    //         }
    //         currentSem = $("#semester").val();
    //     })();
    //     currentSem = $("#semester").val();
    // }
}

// could use this block to init everything
(async () => {
    try {
        let selectedCourse = "";
        // place year options in add sem dialog based on start year in survey
        const startYear = parseInt(prefs["start-year"]);
        for (let year = startYear; year <= startYear + 4; year++) {
            const yearOption = $(`<option value='${year}'>${year}</option>`);
            yearOption.appendTo($('#year-add'));
        }
        loadSems();
        await loadSemCourses();
        // UI upon page load
        $(() => {
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

        // let dataString = $(this).serialize();

        //     $.ajax({
        //     type: 'POST',
        //     data: dataString,
            // });
    });
});

// EVENT LISTENERS

// update courses when change sem
$('#semester').change(async function() {
    currentSem = $(this).val(); // Get the value
    await loadSemCourses();
});

$('#myModal').on('show.bs.modal', function (event) {
    // const button = $(event.relatedTarget); // Button that triggered the modal
    // if (button.data('type') === 'new-course'){
    selectedCourse = {name: $('#nCourseName').val(), id: $('#nCourseID').val()};
    // } else{
    //     selectedCourse = {name: button.data('coursename'), id: button.data('courseid')};
    // }

    $(this).find('.modal-title').text(`Add ${selectedCourse.name}?`);
});

$("#add-course-btn").click(function (event) {
    $('#myModal').modal("hide");
    // brief delay for modal to disappear before exeuting code in case of alert
    //setTimeout(() => addCourse(selectedCourse), 10);
    addCourse(selectedCourse, currentSem);
    $('#newCourse').trigger('reset');
});

$("#add-sem-btn").click(async function (event) {
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