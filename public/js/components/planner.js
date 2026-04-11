import { fetchCourseInfo, updateMissingCourses } from "../services/courseService.js";
import {semComparator, isCourseOfferedInSem, getCoursesInSem, getOfferedSems} from '../services/semService.js';
import { populateRecs } from "./recommendations.js";
import {reqsToString, requisiteComprehension, isCoursePrereq, prereqsNotMet} from '../services/requisiteService.js';
import { formatCourseItem } from "./courses.js";
import { loadSems, getCurrentSem } from "./sems.js";
import { getCourseInfo } from "../services/courseService.js";
import { getPlanner, savePlanner, saveSchedule, getSchedule, getPrefs } from "../utils/storage.js";
import { maxCreds } from "../constants.js";

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
    console.log(planner);
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
            const removedCourses = getCoursesInSem(currentSem);
            plan.courses = [];
            savePlanner(planner);
            await loadSemCourses(currentSem);
            // add warnings if remove prereqs
            for (const course of removedCourses) {
                // check if course is prereq for any other sem - check from start (index 0)
                const coursesWithPrereq = isCoursePrereq(course.courseCode, planner, currentSem);
                updateMissingCourses(coursesWithPrereq);
            }
        }
    }
}

/**
 * calculate the number of credits for a given sem and check that the amount of 
 * creds from the course to be added doesn't exceed maxCreds 
 * @param {*} planner 
 * @param {*} sem 
 * @param {*} addCourseCreds 
 * @returns true if adding course will exceed max creds. false, if course may be added with no issue
 */
function addCourseExceedsMaxCreds(planner, sem, addCourseCreds) {
    const plan = planner.find(plan => plan.sem.display == sem);
    let totalCreds = 0;
    if (!addCourseCreds) addCourseCreds = 3; // assume 3 creds if not given (e.g., for custom courses)
    for (const course of plan.courses) {
        totalCreds += course.creds ?? 3; // assume 3 if not given
    }
    return (totalCreds + addCourseCreds) > maxCreds;
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
    if (addCourseExceedsMaxCreds(planner, sem, courseInfo.creds)) {
        window.alert(`Maximum of ${maxCreds} credits (${maxCreds/3} courses, excluding labs) allowed per semester`);
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
    savePlanner(planner);
    // update UI if add on current sem
    if (sem == getCurrentSem()) {
        formatCourseItem(course, warning, message).appendTo($('.course-list')[0]);
    }
    //remove warnings from other courses if this course is prereq for them
    const coursesWithPrereq = isCoursePrereq(courseInfo.courseCode, planner, sem);
    updateMissingCourses(coursesWithPrereq);
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
    savePlanner(planner);

    // add warnings if removed a prereq course
    updateMissingCourses(coursesWithPrereq);
    loadSemCourses(currentSem);

    const schedule = getSchedule();
    const curSchedule = schedule.find(s => s.sem == currentSem);
    if (curSchedule) {
        curSchedule.meetingInfo = curSchedule.meetingInfo.filter(m => m.className != courseCode);
    }
    saveSchedule(schedule);
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