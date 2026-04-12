import { getProgramIdFromPrefs } from "../utils/program.js";
import { getPrefs } from "../utils/storage.js";

/** Set search params for link to programRequirements page in sidebar */
export function setProgramLink() {
    const prefs = getPrefs();
    const progId = getProgramIdFromPrefs(prefs['comp-type'],prefs['applied-option']);

    const startUrl = 'capstone/' + $("#progLink").attr('href');
    let url = new URL(startUrl, window.location.origin);
    url.searchParams.set('program', progId); 
    $("#progLink").attr('href', url.toString());
}