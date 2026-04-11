import { fetchCourseInfo } from "../services/courseService.js";
import {semComparator, isCourseOfferedInSem} from '../services/semService.js';
import { populateRecs } from "./recommendations.js";
import {reqsToString, requisiteComprehension, isCoursePrereq, prereqsNotMet} from '../services/requisiteService.js';
import { formatCourseItem, updateCourseWarning } from "./courses.js";
import { loadSems, getCurrentSem } from "./sems.js";
import { getCourseInfo } from "../services/courseService.js";
import { getPlanner, savePlanner, saveSchedule, getSchedule, getPrefs } from "../utils/storage.js";

/** compare the sems within the plans to sort in order*/
const planComparator = (plan1, plan2) => semComparator(plan1.sem, plan2.sem);

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

/** load courses based on sem */ 
async function loadSemCourses(currentSem) {
    const planner = getPlanner();
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
    await populateRecs(currentSem); 
}

/** remove courses from current semester */
async function clearCurrentSem(currentSem) {
    const planner = getPlanner();
    // check with user first, in case it was an accident
    const confirmClear = window.confirm(`Are you sure you want to clear ${currentSem}?`);
    if (confirmClear) {
        const plan = planner.find(plan => plan.sem.display === currentSem);
        if (plan) {
            plan.courses = [];
            await loadSemCourses(currentSem);
            // save to cookies
            localStorage.setItem("planner", JSON.stringify(planner));
        }
    }
}

/** add course to sem and save to localstorage */
async function addCourse(course, sem) {
    const planner = getPlanner();
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
    const missingCourses = prereqsNotMet(courseInfo.reqs, sem, planner);
    let [warning, message] = [false, ""];
    if (missingCourses.length > 0) {
        courseInfo['missingReqs'] = missingCourses;
        warning = true;
        message = `Missing requisites: ${reqsToString(missingCourses)}`;
    }
    plan.courses.push(courseInfo);
    // update UI if add on current sem
    if (sem == getCurrentSem()) {
        formatCourseItem(course, warning, message).appendTo($('.course-list')[0]);
    }
    //remove warnings from other courses if this course is prereq for them
    const coursesWithPrereq = isCoursePrereq(courseInfo.courseCode, planner, sem);
    console.log(`courses with ${courseInfo.courseCode} as a prereq: `);
    console.log(coursesWithPrereq);
    for (const course of coursesWithPrereq) {
        let courseToMod;
        let semester;
        for (const plan of planner) {
            for (const curCourse of plan.courses) {
                if (curCourse.id == course.courseId) {
                    courseToMod = curCourse;
                    semester = plan.sem;
                    break;
                }
            }
            if (semester) break;
        }
        //const courseInfo = getCourseInfo(course.courseId);
        const missingCourses = prereqsNotMet(courseToMod.reqs, semester, planner);
        courseToMod.missingReqs = missingCourses; 
    }
    savePlanner(planner);
    console.log(planner);
    loadSemCourses(getCurrentSem());
}

/** remove course from sem and update cookies */
function removeCourse(id) {
    console.log("removing course with id " + id);
    const courseInfo = getCourseInfo(id);
    const courseCode = courseInfo.courseCode;
    const planner = getPlanner();
    const currentSem = getCurrentSem();
    const coursesWithPrereq = isCoursePrereq(courseCode, planner, currentSem);
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
        let courseToMod;
        let semester;
        for (const plan of planner) {
            for (const curCourse of plan.courses) {
                if (curCourse.id == course.courseId) {
                    courseToMod = curCourse;
                    semester = plan.sem;
                    break;
                }
            }
            if (semester) break;
        }
        const missingCourses = prereqsNotMet(courseToMod.reqs, semester, planner);
        courseToMod.missingReqs = missingCourses;
    }
    // remove from schedule if in there
    const schedule = getSchedule();
    const curSchedule = schedule.find(s => s.sem == currentSem);
    if (curSchedule) {
        curSchedule.meetingInfo = curSchedule.meetingInfo.filter(m => m.className != courseCode);
    }
    savePlanner(planner);
    saveSchedule(schedule);
    console.log(planner);
    loadSemCourses(currentSem);
}

async function loadPlanner() {
    // place year options in add sem dialog based on start year in survey
    const startYear = parseInt(getPrefs()["start-year"]);
    for (let year = startYear; year <= startYear + 4; year++) {
        const yearOption = $(`<option value='${year}'>${year}</option>`);
        yearOption.appendTo($('#year-add'));
    }
    loadSems();
    await loadSemCourses(getCurrentSem());
}

export {planComparator, isFirstAccess, loadSemCourses, addCourse, removeCourse, loadPlanner, clearCurrentSem};