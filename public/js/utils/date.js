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