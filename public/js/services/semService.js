import {Semesters} from '../constants.js'
import { toTitleCase } from '../utils/format.js';
import { getPlanner, getPrefs } from '../utils/storage.js';

function getOfferedSems(terms) {
    const courseSems = terms.split(",");
    const offeredSems = [];
    for (const sem of courseSems) {
        offeredSems.push(Semesters[sem].name);
    }
    return offeredSems.join(", ");
}

/**
 * 
 * @param {*} course 
 * @param {String} currentSem current sem string e.g., "Fall 2020"
 * @returns true if course is offered in currentSem, false if not
 */
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

function findCurrentYear(currentSem) {
    const [semName, year] = currentSem.split(" ");
    const prefs = getPrefs();
    // do math with sems and year to figure out year
    const yearDif = parseInt(year) - parseInt(prefs['start-year']);
    const semDif = Semesters[semName].index - Semesters[toTitleCase(prefs['start-semester'])].index;
    console.log(`year dif ${yearDif}`);
    console.log(`sem dif ${semDif}`);
    if (semDif == 0) return yearDif + 1;
    else return yearDif;
}

function getCoursesInSem(sem) {
    const planner = getPlanner();
    console.log(planner);
    const plan = planner.find(plan => plan.sem.display === sem);
    return plan.courses;
}

export {getOfferedSems, isCourseOfferedInSem, findNextSem, semComparator, findCurrentYear, getCoursesInSem};