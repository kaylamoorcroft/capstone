import { Semesters } from "../constants.js";
import { loadSemCourses, planComparator } from "./planner.js";
import { getCoursesInSem, semComparator } from "../services/semService.js";
import { getSems, saveSems, getPlanner, savePlanner, insertSorted, getSchedule, saveSchedule } from '../utils/index.js'
import { updateMissingCourses } from "../services/courseService.js";
import { isCoursePrereq } from "../services/requisiteService.js";

async function addSem(termName, year) {
    let sems = getSems();
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
    let planner = getPlanner();

    insertSorted(planner, plan, planComparator);
    insertSorted(sems, sem, semComparator);
    // update local storage
    savePlanner(planner);
    saveSems(sems);
    // update UI
    loadSems();
    setCurrentSem(sem.display);
    loadSemCourses(sem.display);
}

function deleteSem(sem) {
    let sems = getSems();
    let planner = getPlanner();
    let schedule = getSchedule();
    const i = sems.findIndex(curSem => curSem.display == sem);
    if (i !== -1) {
        const removedCourses = getCoursesInSem(sem);
        // remove sem from sems, planner & schedule
        sems.splice(i, 1);
        planner.splice(i,1);
        schedule = schedule.filter(s => s.sem != sem);
        // save to local storage
        saveSems(sems);
        saveSchedule(schedule);
        savePlanner(planner);
        // add warnings if remove prereqs
        for (const course of removedCourses) {
            // check if course is prereq for any other sem - check from start (index 0)
            const coursesWithPrereq = isCoursePrereq(course.courseCode, planner, sems[0].display);
            updateMissingCourses(coursesWithPrereq);
        }
    }
    else {
        console.log('Could not find ' + sem);
        return;
    }
}

function getCurrentSem() {
    console.log('current sem: ' + $("#semester").val());
    return $("#semester").val();
}

function setCurrentSem(sem) {
    $("#semester").val(sem);
}

/** load sems into dropdown */
function loadSems() {
    const sems = getSems();
    $("#semester").html("");
    sems.forEach(sem => {
        const semItem = $(`<option value='${sem.display}'>${sem.display}</option>`);
        semItem.appendTo($('#semester'));
    });
    if(sems.length > 0) {
        $("#semester").removeClass("d-none");
        $(".empty-msg").addClass("d-none");
    }
    else {
        console.log("No sems exist");
        $("#semester").addClass("d-none");
        $(".empty-msg").removeClass("d-none");
    }
}

export {addSem, deleteSem, loadSems, getCurrentSem};