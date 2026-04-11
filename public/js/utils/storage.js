function savePlanner(planner) {
    localStorage.setItem("planner", JSON.stringify(planner));
}
function getPlanner() {
    return JSON.parse(localStorage.getItem("planner")) || []; 
}
function saveSems(sems) {
    localStorage.setItem("sems", JSON.stringify(sems));
}
function getSems() {
    return JSON.parse(localStorage.getItem("sems")) || []; 
}
function getPrefs() {
    return JSON.parse(localStorage.getItem("survey")) || {};
}
function saveSchedule(schedule) {
    localStorage.setItem("schedule", JSON.stringify(schedule));
}
function getSchedule() {
    return JSON.parse(localStorage.getItem("schedule")) || []; 
}

export {savePlanner, getPlanner, saveSems, getSems, getPrefs, saveSchedule, getSchedule};