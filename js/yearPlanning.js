import { dateToLocalTimeString, getDayText } from './utils.js';

let planner = JSON.parse(localStorage.getItem("planner")) || []; 
let sections = [];
let sems = JSON.parse(localStorage.getItem("sems")) || []; 
console.log("initial planner:");
console.log(planner);
let currentSem = {index: -1};
let schedule = JSON.parse(localStorage.getItem("schedule")) || {}; 
console.log("schedule:");
console.log(schedule);

for (let i = 0; i < sems.length; i++) {
    if (i == 0) {
        $('#sem-nav').append(`
            <li class="page-item disabled" id="prev-sem">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
            </li>`
        );
    }
    $('#sem-nav').append(`
        <li class="page-item" data-sem="${i}">
            <a class="page-link" href="#">${sems[i].display}</a>
        </li>`
    );
    if (i == sems.length - 1) {
        const disabled = sems.length == 1; // no next, because only 1 sem
        $('#sem-nav').append(`
            <li class="page-item${ disabled? " disabled" : "" }" id="next-sem">
                <a class="page-link${ disabled? ' aria-disabled="true"' : "" }" href="#">Next</a>
            </li>`
        );
    }
}

async function loadSem(semIndex) {
    const curSem = planner[semIndex].sem;
    const termId = curSem.year + curSem.id;
    console.log(termId);
    $('#sections-div').html("");
    for (const course of planner[semIndex].courses) {
        const sectionInfo = await fetchSections(course.id, termId);
        sections.push({courseId: course.id, termId: termId, sectionInfo: sectionInfo});
        let sectionsHtml = '';
        if (sectionInfo) {
            sectionsHtml = `<div class="list-group" data-course=${course.courseCode}>`;
            for (const section of sectionInfo) {
                const dayText = getDayText(section.days);
                sectionsHtml += `
                    <button type="button" class="list-group-item list-group-item-action section" data-days=${section.days} data-start=${section.startTime} data-end=${section.endTime} id='${course.courseCode}_${section.sectionId}'>
                        <div class="ms-2 me-auto">
                            <div class="fw-bold">${section.sectionId}</div>
                            ${dayText? dayText : ''}
                            ${section.startTime ? `<p>${section.startTime}-${section.endTime}</p>` : ''}
                            ${section.isOnline? '<p>Online</p>' : ''}
                        </div>
                    </button>`;
            }
            sectionsHtml += '</div>';
        }
        else {
            sectionsHtml = '<p>No sections available</p>';
        }
        /* <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Section 1</a></li>
                            <li><a class="dropdown-item" href="#">Section 2</a></li>
                            <li><a class="dropdown-item" href="#">Section 3</a></li>
                        </ul>*/
        const courseCard = `
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">${course.courseCode}</h5>
                    ${sectionsHtml}
                </div>
            </div>`;
        $('#sections-div').append(courseCard);
    }
    if (semIndex in schedule) {
        for (const {className, sectionId, days, startTime, endTime} of schedule[semIndex]) {
            setActiveSection(className, sectionId);
            insertClass(className, days, startTime, endTime);
        }
    }
    $('.section').click(function() {
        const [className, sectionId] = $(this).attr('id').split('_');
        setAndLoadActiveSection(className, sectionId);
    });
}

function setActiveSection(className, sectionId) {
    const section = $(`#${className}_${sectionId}`);

    // reset previous active item
    $(`div[data-course="${className}"]`).find('.list-group-item.active') 
        .removeClass('active')
        .removeAttr('aria-current');
    // set clicked item to be active
    section 
        .addClass('active')
        .attr('aria-current', 'true');
}

function setAndLoadActiveSection(className, sectionId) {
    const section = $(`#${className}_${sectionId}`);
    setActiveSection(className, sectionId);

    const days = section.data('days');
    const start = section.data('start');
    const end = section.data('end');

    if (hasOverlap(days, start, end)) {
        window.alert(`Sorry. Could not set ${className} to ${sectionId}. There is a conflict with another class in the schedule at the same time.`);
        return;
    }
    removeClass(className);
    addClassToSchedule(className,sectionId,days,start,end);
}

function updateActiveSem(semIndex) {
    // Remove 'active' class from current active item and add to the new one
    $('#sem-nav .page-item.active').removeClass('active');
    $('#sem-nav .page-item[data-sem="' + semIndex + '"]').addClass('active');
    if (semIndex == 0) {
        $('#prev-sem').addClass('disabled');
    }
    else {
        $('#prev-sem').removeClass('disabled');
    }
    if (semIndex == sems.length - 1) {
        $('#next-sem').addClass('disabled');
    }
    else {
        $('#next-sem').removeClass('disabled');
    }

  }

// Handle pagination link clicks
$('#sem-nav').on('click', '.page-item a', function(e) {
    e.preventDefault(); 

    let newSem = -1;
    if ($(this).parent('.page-item').attr('id') == 'prev-sem') {
        newSem = currentSem.index - 1;
        newSem = newSem < 0 ? 0 : newSem; // limit to lowest val 0 
    }
    else if ($(this).parent('.page-item').attr('id') == 'next-sem') {
        newSem = currentSem.index + 1;
        newSem = newSem > sems.length - 1 ? sems.length - 1 : newSem;
    }
    else {
        newSem = $(this).parent('.page-item').data('sem');
    }

    // Call a function to handle the page change and content update
    loadSem(newSem);
    updateActiveSem(newSem);
});

if (planner.length > 0) {
    currentSem = planner[0].sem;
    currentSem.index = 0;
}
$('#cur-sem').text(currentSem.index != -1 ? currentSem.display : "No semesters to display");
console.log("Current sem: " + currentSem.display);
console.log(planner[currentSem.index]);

loadSem(currentSem.index);
updateActiveSem(currentSem.index);

for (let h = 8; h < 17; h++) { // hours
    let hourSlot = $(`<tr id='t${h}-0'></tr>`);
    hourSlot.append(`<th scope="row" rowspan="3" class="border time" style="border-top-width: 2px !important;">${h}:00</th>`);
    for (let d = 1; d < 6; d++) { // days of week
        hourSlot.append(`<td class="border border-bottom-0" id="d${d}-${h}-0" style="border-top-width: 2px !important;"></td>`);
    }
    $('#time-rows').append(hourSlot);
    // <th scope="row" rowspan="3" class="border">8:00</th>
    for (let m = 10; m < 60; m += 10) { // mins
        let hourSlot = $(`<tr id='t${h}-${m}'></tr>`);
        if (m == 30) {
            hourSlot.append(`<th scope="row" rowspan="3" class="border time"></th>`);
            for (let d = 1; d < 6; d++) { // days of week
                hourSlot.append(`<td class="border border-bottom-0" id="d${d}-${h}-${m}"></td>`);
            }
        }
        else if (m == 50 && h == 16) {
            for (let d = 1; d < 6; d++) { // days of week
                hourSlot.append(`<td class="border border-top-0" id="d${d}-${h}-${m}"></td>`);
            }
        }
        else {
            for (let d = 1; d < 6; d++) { // days of week
                hourSlot.append(`<td class="border-start border-end" id="d${d}-${h}-${m}"></td>`);
            } 
        }
        $('#time-rows').append(hourSlot);
    }
}

function hasOverlap(daysString,startTime,endTime) {
    for (const day of daysString.toString().split(',')) {
        console.log('current schedule:');
        console.log(schedule[currentSem.index]);
        const hasOverlap = schedule[currentSem.index].some(course => {
            const cDays = course.days.toString().split(',');
            if (!(cDays.includes(day))) return false; // won't overlap, cuz not on same day
            console.log(`compare to: ${course.className}`);
            console.log(`start: ${course.startTime} vs ${startTime} (insert)`);
            console.log(`end: ${course.endTime} vs ${endTime} (insert)`);
            if (startTime >= course.startTime && startTime <= course.endTime) {
                console.log('overlap - STARTTIME of insert is between start & end of course compared to');
                return true;
            }
            else if (endTime >= course.startTime && endTime <= course.endTime) {
                console.log('overlap - ENDTIME of insert is between start & end of course compared to');
                return true;
            }
            else {
                console.log('no overlap - fine to insert');
                return false;
            }
        });
        if (hasOverlap) return true;
    }
    return false;
}

function insertIntoTable(cell, day, hour, min) {
    const row = $(`#t${parseInt(hour)}-${parseInt(min)}`);
    const rowEls = row.children('td'); 
    const daysOccupied = 5 - rowEls.length;
    const prevCell = rowEls.eq(parseInt(day) - daysOccupied - 1);
    if (parseInt(day) - daysOccupied - 1 == -1) { // insert at start
        row.children().eq(0).after(cell);
    }
    else {
        prevCell.after(cell);
    }
}

function addClassToSchedule(className, sectionId, daysString, startTime, endTime) {
    console.log(`--add ${className} to schedule--`);
    if (!(currentSem.index in schedule)) {schedule[currentSem.index] = []};
    
    schedule[currentSem.index].push({className: className, sectionId: sectionId, days: daysString, startTime: startTime, endTime: endTime});
    localStorage.setItem('schedule', JSON.stringify(schedule));

    insertClass(className, daysString, startTime, endTime);
}

function insertClass(className, daysString, startTime, endTime) {
    const days = daysString.toString().split(','); // toString in case single number passed in
    const [startHour, startMin] = startTime.split(':');
    const [endHour, endMin] = endTime.split(':');
    const blockCount = (endHour - startHour) * 6 + (endMin - startMin)/10;

    for (const day of days) {
        let curHour = parseInt(startHour);
        let curMin = parseInt(startMin);

        const newClass = `<td class="border-start border-end bg-info" data-course=${className} data-start="d${day}-${startHour}-${startMin}" data-end="d${day}-${endHour}-${endMin}" rowspan="${blockCount}">${className}</td>`;
        insertIntoTable(newClass,day,startHour,startMin);

        for (let r = 0; r < blockCount; r++) {
            const curId = `d${day}-${curHour}-${curMin}`
            curMin += 10;
            if (curMin >= 60) {
                curMin = 0;
                curHour += 1;
            }
            $(`#${curId}`).remove();
        } 
    }
}

function removeClass(className) {
    const classesToRemove = $(`td[data-course=${className}]`).toArray();
    for (const c of classesToRemove) {
        const start = $(c).data('start');
        const end = $(c).data('end');

        const { groups: { day, startHour, startMin } } = start.match(/d(?<day>\d)-(?<startHour>\d+)-(?<startMin>\d+)/);
        const { groups: { endHour, endMin } } = end.match(/d(?<day>\d)-(?<endHour>\d+)-(?<endMin>\d+)/);

        let m = parseInt(startMin);
        for (let h = parseInt(startHour); h <= parseInt(endHour); h++) { 
            m = h == parseInt(startHour) ? m : 0;
            for (;(h < parseInt(endHour) && m < 60) || (h == parseInt(endHour) && m < parseInt(endMin)); m += 10) { 
                let cell = `<td class="border-start border-end" id="d${day}-${h}-${m}"></td>`;
                if (m == 0) {
                    cell = `<td class="border border-bottom-0" id="d${day}-${h}-${m}" style="border-top-width: 2px !important;"></td>`;
                }
                else if (m == 30) {
                    cell = `<td class="border border-bottom-0" id="d${day}-${h}-${m}"></td>`;
                }
                else if (m == 50 && h == 16) { // bottom of table
                    cell = `<td class="border border-top-0" id="d${day}-${h}-${m}"></td>`;
                }
                insertIntoTable(cell,day,h,m);
            }
        }
        $(c).remove();
        schedule[currentSem.index] = schedule[currentSem.index].filter(meeting => meeting.className != className);
        console.log(`removed ${className}:`);
        console.log(schedule[currentSem.index]);
        localStorage.setItem('schedule', JSON.stringify(schedule));
    }
    //window.alert(`removed ${className}`);
}

/** fetch req info from db to display in UI */
async function fetchSections(courseId, termId='') {
    try {
        const response = await fetch('sections.php', {
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

// insertClass('COMP-1113','1,3,5','9:30','10:20');
// insertClass('COMP-1110L','5','13:00','13:50');
//addClassToSchedule('COMP-1234','WI01','1,3','12:30','13:20');
// if (currentSem.index in schedule) {
//     for (const {className, sectionId, days, startTime, endTime} of schedule[currentSem.index]) {
//         //insertClass(className, days, startTime, endTime);
//         setActiveSection(className, sectionId);
//     }
// }
