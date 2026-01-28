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
