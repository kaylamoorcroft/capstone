import { findCurrentYear, isCourseOfferedInSem } from "./semService.js";
import { fetchCourseInfo } from "./courseService.js";
import { getProgramIdFromPrefs, getPrefs } from "../utils/index.js";
/** fetch rec info from db to display in UI */
async function fetchRecs(progId) {
    console.log('fetching recs for prog id ' + progId); 
    try {
        const response = await fetch('api/recommendations.php', {
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

async function filterRecsBySem(currentSem) {
    const prefs = getPrefs();
    console.log(prefs);
    const progId = getProgramIdFromPrefs(prefs['comp-type'],prefs['applied-option']);
    console.log(`prog id: ${progId}`);
    const recs = await fetchRecs(progId);
    const curYear = findCurrentYear(currentSem);
    console.log(`current year: ${curYear}`);
    const filteredRecs = [];
    for (const rec of recs) {
        const [_, num] = rec.courseCode.split('-');
        if (num[0] == curYear) {
            const courseInfo = await fetchCourseInfo({id: rec.courseId, name: rec.courseTitle});
            //console.log(`${courseInfo.courseCode}: ${courseInfo.terms}`)
            if (isCourseOfferedInSem(courseInfo, currentSem)) {
                filteredRecs.push(rec);
            }
        }
    }
    return filteredRecs;
}

export {filterRecsBySem};