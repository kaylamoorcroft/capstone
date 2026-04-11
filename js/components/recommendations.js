import { initDraggables } from "./courses";
import { filterRecsBySem } from "../services/recommendationService.js";
export async function populateRecs(currentSem) {
    const recsBlock = $('#recommendations').find('ul');
    recsBlock.html("");
    const recs = await filterRecsBySem(currentSem)

    for (const rec of recs) {
        //console.log(rec);
        $(recsBlock).append(`<li class='course addCourse' id='recCourse-${rec.courseId}' data-bs-toggle='tooltip' title='${rec.courseCode}' data-courseid='${rec.courseId}' data-coursename='${rec.courseTitle}'>${rec.courseTitle}</li>`);
    }

    initDraggables();
} 
