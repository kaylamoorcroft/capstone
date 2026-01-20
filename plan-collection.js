let planner = JSON.parse(localStorage.getItem("planner")) || []; 
console.log("initial planner:");
console.log(planner);

/** display sem plans in planner-collection.html */
function displaySemPlans() {
    planner.forEach(plan => {
        let planItem = `<div class="pc-plans"><h4>${plan.sem}</h4><ul>`;
        plan.courses.forEach(course => planItem += `<li>${course.id}</li>`);
        planItem += `</ul></div>`
        $(planItem).appendTo($("#plan-collection"));
    });
}

displaySemPlans();