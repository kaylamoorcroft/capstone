<?php
// query page for whenever want to get more info on sections from the id
header('Content-Type: application/json'); // Set header to indicate JSON response

require_once __DIR__ . '/../../src/config/dbConnection.php';

// Get data sent from JavaScript via POST request
// Use prepared statements to prevent SQL injection!
$id = $_POST['courseId'] ?? ''; 
$term = $_POST['termId'];
if (empty($term)) $term = null;

if (!empty($id)) {
    $stmt = $con->prepare("SELECT \n"
    . "	   sections.Number AS sectionId,\n"

    . "    terms.TermId AS termId,\n"

    . "    meetings.Days AS days,\n"
    . "    meetings.StartTime AS startTime,\n"
    . "    meetings.EndTime AS endTime,\n"
    . "    meetings.Frequency AS frequency,\n"
    . "    meetings.IsOnline AS isOnline\n"

    . "FROM meetings\n"

    . "LEFT JOIN sections\n"
    . "ON sections.Id = meetings.sectionId\n"

    . "LEFT JOIN Terms\n"
    . "ON Terms.Term_pk = sections.Term_fk\n"

    . "LEFT JOIN courses \n"
    . "ON courses.Id = sections.CourseId\n"

    . "WHERE courses.Id = ?\n"
    . "AND Terms.TermId = COALESCE(?, Terms.TermId)");
    $stmt->bind_param("is", $id, $term); // "i" for integer type, "s" for string type
    //$stmt->bind_param("i", $id); // "i" for integer type, "s" for string type
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
        if ($sectionId != null) {
            $data[] = [
                "sectionId" => $sectionId,
                "termId" => $termId,
                "days" => $days,
                "startTime" => $startTime,
                "endTime" => $endTime,
                "frequency" => $frequency,
                "isOnline" => $isOnline,
                "term" => $term
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
