<?php
// query page for whenever want to get more info on a course from the course id
header('Content-Type: application/json'); // Set header to indicate JSON response

require_once __DIR__ . '/../../src/config/dbConnection.php';

// Get data sent from JavaScript via POST request
// Use prepared statements to prevent SQL injection!
$id = $_POST['courseId'] ?? ''; 

if (!empty($id)) {
    $stmt = $con->prepare("
        SELECT 
            courses.title AS name,
            courses.subjectCode AS subjectCode, 
            courses.Number AS number, 
            courses.YearsOffered AS years, 
            courses.TermsOffered AS terms, 
            requisites.requirementCode AS reqId,
            requisites.completionorder AS completionOrder, 
            requisites.displaytext AS reqs, 
            requisites.displaytextextension AS reqsEx 
        FROM 
            requisites 
        RIGHT JOIN courses ON courses.Id = requisites.courseId 
        WHERE 
            courses.Id = ?");
    $stmt->bind_param("i", $id); // "i" for integer type, "s" for string type
    // Execute the query
    $stmt->execute();

    // Get the result
    $result = $stmt->get_result();

    $data = [];
    $firstRow = true;

    while ($row = $result->fetch_assoc()) {
        extract($row);

        // Only set the main course data once
        if ($firstRow) {
            $data = [
                "id" => $id,
                "courseCode" => "$subjectCode-$number",
                "name" => $name,
                "years" => $years,
                "terms" => $terms,
                "reqs" => [] 
            ];
            $firstRow = false;
        }

        if ($reqId != null) {
            $data["reqs"][] = [
                "id" => $reqId,
                "completionOrder" => $completionOrder,
                "reqsText" => $reqs,
                "reqsTextEx" => $reqsEx
            ];
        }
    }

    if ($data !== null && $number !== null) {
        echo json_encode($data);
    } else {
        echo json_encode(["error" => "Course not found or invalid number"]);
    }
}

$con->close();
?>
