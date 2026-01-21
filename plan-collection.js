let planner = JSON.parse(localStorage.getItem("planner")) || []; 
console.log("initial planner:");
console.log(planner);
let sems = JSON.parse(localStorage.getItem("sems")) || []; 
console.log("sems:")
console.log(sems);

/** display sem plans in planner-collection.html */
function displaySemPlans() {
    $("#plan-collection").html("");
    planner.forEach(plan => {
        let planItem = `<div class="pc-plans"><span class="pc-plan-header"><span><!--empty span for spacing--></span><h4>${plan.sem}</h4>`;
        planItem += `<button type="button" class="btn-close delete-plan" onclick="removeSem('${plan.sem}')" aria-label="Close"></button></span><ul>`;
        plan.courses.forEach(course => planItem += `<li data-bs-toggle="tooltip" data-bs-placement="top" title="${course.name}">${course.id}</li>`);
        planItem += `</ul></div>`
        $(planItem).appendTo($("#plan-collection"));
    });
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    });
}

/** remove sem and associated courses from planner */
function removeSem(sem) {
    const i = sems.indexOf(sem);
    if (i !== -1) {
        sems.splice(i, 1);
        planner.splice(i,1);
    }
    displaySemPlans();
    // save to cookies
    localStorage.setItem("sems", JSON.stringify(sems));
    localStorage.setItem("planner", JSON.stringify(planner));
}

displaySemPlans();