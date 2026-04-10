/** fetch req info from db to display in UI */
async function fetchReqInfo(reqId) {
    // Use the fetch API to send a POST request
    try {
        const response = await fetch('reqs.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({ reqId: reqId }) // Send data as form data
        });
        const data = await response.json(); // Parse the JSON response from the PHP script
        console.log(data);
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

function _findIndexOf(wordArray, keywordGroup, startIndex) {
    // not an array, just a single keyword, normal find index
    if (typeof keywordGroup === 'string') {
        return wordArray.indexOf(keywordGroup, startIndex);
    }

    // find index of any of the keywords - return the smallest index
    if (Array.isArray(keywordGroup)) {
        let minIndex = -1;
        for (const keyword of keywordGroup) {
            const curIndex = wordArray.indexOf(keyword, startIndex);
            // initial and iterative cases
            if (minIndex === -1 || (curIndex < minIndex && curIndex != -1)) { 
                minIndex = curIndex;
            }
        }
        return minIndex;
    }
}

// recursive helper fn 
function _splitFromKeywords(wordArray, keywords, i=0) {
    let segments = [];
    const indices = [];

    let startIdx = 0;
    let idx = _findIndexOf(wordArray,keywords[i], startIdx);

    while (idx !== -1) {
        segments.push(wordArray.slice(startIdx,idx));
        indices.push(idx);
        startIdx = idx + 1;
        idx = _findIndexOf(wordArray,keywords[i], startIdx); 
    }
    segments.push(wordArray.slice(startIdx));

    if (i + 1 == keywords.length) {
        if (segments[0][0].toLowerCase() == "take") {
            segments[0] = segments[0].slice(1);
        }
        if (segments[0][0].toLowerCase() == "either") {
            segments[0] = segments[0].slice(1);
        }
        if (segments[0][0].toLowerCase().substring(0,3) == "min") {
            segments[0] = segments[0].slice(2,3);
        }
        const isHourReq = segments[0].join(' ').match(/(\d+)-hours from (\w+)/i);
        if (isHourReq) {
            segments[0][0] = { hours: parseInt(isHourReq[1], 10), subject: isHourReq[2].toUpperCase() };
        }
    
        return segments.map(segment => {
            if(typeof segment[0] === 'string' ) {
                return segment[0].replaceAll(';','');
            }
            return segment[0];
        });
    }
    const children =  segments.map(segment => {
        return _splitFromKeywords(segment, keywords, i + 1);
    });

    switch(i) {
        case 0: return {and: children};
        case 1: 

            if (typeof children[0][0] === 'object' && children[0][0] !== null && !Array.isArray(children[0][0])) {
                return {choiceCourses: [], minimumGrade: children[1]? children[1][0] : null, hourReq: children[0][0]};
            }
            return {choiceCourses: children[0], minimumGrade: children[1]? children[1][0] : null, hourReq: null}; // "minimum grade C- required"
        case 2: return {choiceCourses: children};
        default: return children; 
    }
}

function requisiteComprehension(reqs) {
    if (reqs == null || reqs.length == 0) {
        console.log("no reqs");
        return;
    }
    const requisites = []
    for (const _req of reqs) {
        const req = _req.reqsText;
        const reqWords = req.split(" ");
        console.log(`req: ${req}`);
        // for (let i = 0; i < reqWords.length; i++) {
        //     console.log(`${i}: ${reqWords[i]}`);
        // }
        const keywords = [["and","plus"], "with", "or"];
        let segments = _splitFromKeywords(reqWords,keywords);
        segments["completionOrder"] = _req.completionOrder;
        segments["id"] = _req.id;
        requisites.push(segments);
    }
    console.log(`--ALL REQS:`);
    console.log(requisites);
    return requisites;
}

/** Check if prereqs are in sems before current sem */
function prereqsNotMet(reqs, sem, planner) {
    if (!reqs || reqs.length == 0) { // no prereqs, just return
        return [];
    }
    // parse prereqs into proper list - how handle / for or??? - maybe 2d array?
    const prereqsNotMet = [];
    // iterate through prereqs
    reqs.forEach(req => {
        // initialise variables needed for this section
        let [creds, coursePlanned] = [0, false];
        req.and.forEach(andCourse => {
            // iterate through each sem
            for (const plan of planner) {
                // only check till previous sem if PREreq
                if (req.completionOrder == 'Previous' && plan.sem.display == sem) {
                    break;
                }
                coursePlanned = false;
                if (andCourse.choiceCourses.length > 0) {
                    for (const choiceCourse of andCourse.choiceCourses) {
                        if (plan.courses.some(currentCourse => currentCourse.courseCode == choiceCourse)) {
                            coursePlanned = true;
                            break;
                        }
                    }
                }
                else if (andCourse.hourReq) {
                    plan.courses.forEach(course => {
                        if (course.courseCode.includes(andCourse.hourReq.subject.toUpperCase())) {
                            creds++;
                            console.log(`Taking ${course.courseCode} in ${sem} - creds++ (hours = ${creds*3} now)`);
                        }
                    });
                    if (creds*3 >= andCourse.hourReq.hours) {
                        coursePlanned = true;
                    }
                }
                // if (andCourse.minimumGrade) { // will use later on
                //     console.log("min grade: " + andCourse.minimumGrade);
                // }
                if (coursePlanned) {
                    console.log(andCourse);
                    console.log('√');
                    break;
                }
                if (plan.sem.display == sem) { // only check till current sem if coreq / pre/co req
                    break;
                } 
            }
        });
        if (!coursePlanned) {
            console.log(req);
            console.log('X');
            prereqsNotMet.push(req);
        }
    });
    return prereqsNotMet;
}

/** Check if course is a prereq for any courses occuring it after in the plan
 *  Useful for validation when wanting to remove a course
 */
function isCoursePrereq(courseCode, planner, currentSem) {
    // only have to start checking at index same as curSem
    const startIndex = planner.findIndex(plan => plan.sem.display === currentSem);
    const coursesWithReq = []; // courses that have id as a prereq
    for (let i = startIndex; i < planner.length; i++) {
        for (const course of planner[i].courses) {
            if (!course.reqs) continue; // if course reqs are null, skip
            for (const req of course.reqs) {
                req.and.forEach(andCourse => {
                    if (andCourse.choiceCourses.length > 0) {
                        for (const choiceCourse of andCourse.choiceCourses) {
                            if (courseCode == choiceCourse) {
                                coursesWithReq.push({courseId: course.id, courseCode: course.courseCode, reqId: req.id});
                                break;
                            }
                        }
                    }
                    else if (andCourse.hourReq) {
                        console.log(`might not have enough hours of ${andCourse.hourReq.subject} if remove this course`)
                    }
                });
            }
        }
    }
    return coursesWithReq;
}

function reqsToString(reqs) {
    return `${reqs.map(req => 
        `${req.and.map(andCourse => {
            if (andCourse.hourReq)
                return `${andCourse.hourReq.hours}-hours from ${andCourse.hourReq.subject}`
            return andCourse.choiceCourses.join(" or ");
        })
        .join(" and ")} (${req.completionOrder})`)
    .join(", ")}`;
}

export {fetchReqInfo, requisiteComprehension, prereqsNotMet, isCoursePrereq, reqsToString}