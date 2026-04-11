const Semesters = [
    { id: "FA", name: "Fall" },
    { id: "WI", name: "Winter" },
    { id: "SU", name: "Summer" },
    { id: "COI", name: "Continuous Intake" }
];
Semesters.forEach((sem, i) => {
    Semesters[sem.id] = { ...sem, index: i };
    Semesters[sem.name] = { ...sem, index: i };
}); // now can access by Semesters.FA.name or Semesters[0].name

const daysOfWeek = {
    '1': { name: "Monday", abbr: "Mon", letter: "M" },
    '2': { name: "Tuesday", abbr: "Tue", letter: "T" },
    '3': { name: "Wednesday", abbr: "Wed", letter: "W" },
    '4': { name: "Thursday", abbr: "Thu", letter: "T" },
    '5': { name: "Friday", abbr: "Fri", letter: "F" }
}

const maxCreds = 21; // max 7 courses, not counting labs

export {Semesters, daysOfWeek, maxCreds};