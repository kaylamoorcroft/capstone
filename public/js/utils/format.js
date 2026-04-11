import {daysOfWeek} from '../constants.js';

/**
 * 
 * @param {string} str 
 * @returns formatted string in title case. E.g. "APPLE CIDER" => "Apple Cider"
 */
export function toTitleCase(str) {
  return str.toLowerCase().split(' ').map((word) =>
    word.charAt(0).toUpperCase() + word.slice(1)).join(' '); 
}

export function getDayText(daysString, type='abbr') {
    if (!daysString) return null;

    const days = daysString.split(',');
    return days.map(day => {        
        switch (type) {
            case "name":
                return daysOfWeek[day].name;
            case "abbr":
                return daysOfWeek[day].abbr;
            case "letter":
                return daysOfWeek[day].letter;
            default: 
                return daysOfWeek[day].abbr;
        }
    }).join(", ");
}