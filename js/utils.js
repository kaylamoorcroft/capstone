const daysOfWeek = {
    '1': { name: "Monday", abbr: "Mon", letter: "M" },
    '2': { name: "Tuesday", abbr: "Tue", letter: "T" },
    '3': { name: "Wednesday", abbr: "Wed", letter: "W" },
    '4': { name: "Thursday", abbr: "Thu", letter: "T" },
    '5': { name: "Friday", abbr: "Fri", letter: "F" }
}


/** Insert newItem into arr and maintain arr to be sorted with custom comparator 
 *  Uses binary search for efficient insertion
 * @param {Array<Object>} arr - The sorted array of objects.
 * @param {Object} newItem - The object to insert.
 * @param {Function} comparator - A function that compares two elements (a, b)
 *                                and returns a negative number if a < b, 0 if a == b,
 *                                or a positive number if a > b.
*/
export function insertSorted(arr, newItem, comparator) {
    let low = 0;
    let high = arr.length;

    // Binary search to find the correct index
    while (low < high) {
        const mid = Math.floor(low + (high - low) / 2);
        if (comparator(newItem, arr[mid]) > 0) {
            low = mid + 1;
        } else {
            high = mid;
        }
    }

    // Insert the element at the found index
    arr.splice(low, 0, newItem);
    return arr;
}

/**
 * 
 * @param {string} str 
 * @returns formatted string in title case. E.g. "APPLE CIDER" => "Apple Cider"
 */
export function toTitleCase(str) {
  return str.toLowerCase().split(' ').map((word) =>
    word.charAt(0).toUpperCase() + word.slice(1)).join(' '); 
}

/**
 * 
 * @param {string} dateString valid date in string format
 * @returns time, formatted HH:MM for UTC-3 or null if invalid date
 */
export function dateToLocalTimeString(dateString) {
    const localDate = new Date(dateString);

    if (isNaN(localDate)) return null; // invalid date

    // return only time, formatted HH:MM in UTC-3 
    return localDate.toLocaleTimeString([],{
        timeZone: 'Etc/GMT+3', // UTC-3: sign is reversed 
        hour: '2-digit',
        minute: '2-digit',
        hour12: false
    });
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