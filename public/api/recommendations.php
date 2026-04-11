<?php
// query page for whenever want to get more info on recs from the id
header('Content-Type: application/json'); // Set header to indicate JSON response

require_once __DIR__ . '/../../src/config/dbConnection.php';

// Get data sent from JavaScript via POST request
// Use prepared statements to prevent SQL injection!
$id = $_POST['progId'] ?? ''; 

if (!empty($id)) {
    $stmt = $con->prepare("SELECT
    programs.code AS program,
    requirements.minsubrequirements AS minSrs,
    subrequirements.mingroups AS minGroups,
    subrequirementgroups.id AS groupId,
    subrequirementgroups.mincredits AS groupMinCreds,
    subrequirementCourses.id AS courseId,
    subrequirementCourses.coursename AS courseCode,
    subrequirementCourses.title AS courseTitle,
    fromcourses.id AS fromCourseId,
    fromcourses.coursename AS fromCourseCode,
    fromcourses.title AS fromCourseTitle
FROM
    `programRequirements`
LEFT JOIN programs ON programs.id = programRequirements.programId
RIGHT JOIN requirements ON requirements.id = programRequirements.requirementId
LEFT JOIN subrequirements ON subrequirements.requirementsid = requirements.id
LEFT JOIN subrequirementgroups ON subrequirementgroups.subrequirementid = subrequirements.id
LEFT JOIN subrequirementCourses ON subrequirementCourses.groupsid = subrequirementgroups.id
LEFT JOIN fromCourses ON fromcourses.groupsid = subrequirementgroups.id
WHERE
    programs.id = ?
    AND (subrequirementCourses.id IS NOT NULL OR fromcourses.id IS NOT NULL)
ORDER BY
    requirements.id,
    subrequirements.id,
    subrequirementgroups.id,
    subrequirementCourses.id,
    fromCourses.id");
    $stmt->bind_param("i", $id); // "i" for integer type, "s" for string type
    // Execute the query
    $stmt->execute();

    // Get the result
    $result = $stmt->get_result();

    $rawData = [];
    $dataFound = false;
    while($row = $result->fetch_assoc()) {
        $rawData = $row;
        extract($rawData);
        $dataFound = true;
        if ($groupId != null) {
            $data[] = [
                "program" => $program,
                "minSubRequirements" => $minSrs,
                "minGroups" => $minGroups,
                "groupId" => $groupId,
                "groupMinCreds" => $groupMinCreds,
                "courseId" => $courseId ?? $fromCourseId,
                "courseCode" => $courseCode ?? $fromCourseCode,
                "courseTitle" => $courseTitle ?? $fromCourseTitle,
            ];
        }
    }
    if($dataFound) {
        echo json_encode($data);
    } else {
        echo json_encode(["error" => "0 results for course sections"]);
    }
    $stmt->close();
} else {
    echo json_encode(["error" => "No course sections"]);
}

$con->close();
?>
