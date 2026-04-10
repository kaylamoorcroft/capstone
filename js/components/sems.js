import { Semesters } from "../constants.js";
import { planComparator } from "./planner.js";
import { semComparator } from "../services/semService.js";
import { getSems, saveSems, getPlanner, savePlanner, insertSorted, getSchedule, saveSchedule } from '../utils/index.js'

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
}

function deleteSem(sem) {
    let sems = getSems();
    let planner = getPlanner();
    let schedule = getSchedule();
    const i = sems.findIndex(curSem => curSem.display == sem);
    if (i !== -1) {
        sems.splice(i, 1);
        planner.splice(i,1);
    }
    else {
        console.log('Could not find ' + sem);
        return;
    }
    schedule = schedule.filter(s => s.sem != sem);

    // save to local storage
    saveSems(sems);
    savePlanner(planner);
    saveSchedule(schedule);
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