import { dateToLocalTimeString } from "../utils/index.js";

/** fetch req info from db to display in UI */
async function fetchSections(courseId, termId='') {
    try {
        const response = await fetch('api/sections.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({ courseId: courseId, termId: termId }) // Send data as form data
        });
        const data = await response.json(); // Parse the JSON response from the PHP script
        
        if (data.error) {
            console.log('Error: ' + data.error);
            return null;
        } 
        // transform time & bool values
        for (const section of data) {
            section.startTime = dateToLocalTimeString(section.startTime);
            section.endTime = dateToLocalTimeString(section.endTime);
            section.isOnline = section.isOnline == 'true'? true: false;
        }
        return data;

    } catch(error) {
        console.error('Error:',  error);
        return null;
    }
}

export {fetchSections};