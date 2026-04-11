import { deleteSem } from "../components/sems.js";
import { getPlanner, savePlanner, saveSems } from "../utils/index.js";

let sems = JSON.parse(localStorage.getItem("sems")) || []; 
console.log("sems:")
console.log(sems);
let schedule = JSON.parse(localStorage.getItem("schedule")) || []; 
console.log("schedule:");
console.log(schedule);

/** display sem plans in planner-collection.html */
function displaySemPlans() {
    const planner = getPlanner();
    $("#plan-collection").html("");
    planner.forEach(plan => {
        let planItem = `<div class="pc-plans"><span class="pc-plan-header"><span><!--empty span for spacing--></span><h4>${plan.sem.display}</h4>`;
        planItem += `<button type="button" class="btn-close delete-plan" data-sem='${plan.sem.display}' aria-label="Close"></button></span><ul>`;
        plan.courses.forEach(course => planItem += `<li data-bs-toggle="tooltip" data-bs-placement="top" title="${course.name}">${course.courseCode}</li>`);
        planItem += `</ul></div>`
        $(planItem).appendTo($("#plan-collection"));
    });
    // control visibility of planner empty message
    if (planner.length > 0) {
        $(".empty-msg").addClass("d-none");
    }
    else {
        $(".empty-msg").removeClass("d-none");
    }
    // initialise tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    });
}

/** remove sem and associated courses from planner */
function removeSem(sem) {
    // check with user first, in case it was an accident
    const confirmDelete = window.confirm(`Are you sure you want to delete ${sem}?`);
    if (confirmDelete) {
        deleteSem(sem);
        displaySemPlans();
    }
}

/** Clear the entire planner to restart */
function clearPlanner() {
    // check with user first, in case it was an accident
    const confirmClear = window.confirm(`Are you sure you want to clear the entire planner? You cannot undo this.`);
    if (confirmClear) {
        console.log("Clearing entire planner");
        savePlanner([]);
        saveSems([]);
        displaySemPlans();
    }
}

$(function() {
    displaySemPlans();

    $("#reset-planner").click(function (event) {
        clearPlanner();
    });
    $(".delete-plan").click(function (event) {
        removeSem($(this).data('sem'));
    });
});

