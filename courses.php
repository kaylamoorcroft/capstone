<?php
// query page for whenever want to get more info on a course from the course id
header('Content-Type: application/json'); // Set header to indicate JSON response

include "dbConnection.php";

// Get data sent from JavaScript via POST request
// Use prepared statements to prevent SQL injection!
$course_id = $_POST['courseId'] ?? ''; 

if (!empty($course_id)) {
    $stmt = $con->prepare("SELECT courseID, courseName, sem, preRequisites, lab FROM compSci WHERE courseID = ?
        UNION SELECT courseID, courseName, sem, preRequisites, lab FROM math WHERE courseID = ?");
    $stmt->bind_param("ss", $course_id, $course_id); // "i" for integer type, "s" for string type
    // Execute the query
    $stmt->execute();

    // Get the result
    $result = $stmt->get_result();
    //echo json_encode($data);
    $rawData = [];
    while($row = $result->fetch_assoc()) {
        $rawData = $row;
    }
    extract($rawData);
    if ($courseID != null) {
        // Output data of the unique row
        $data = array(
            "id" => $courseID,
            "name" => $courseName,
            "sem" => $sem,
            "prereqs" => $preRequisites,
            "lab" => $lab
        );
        echo json_encode($data);
    } else {
        echo json_encode(["error" => "0 results for courseId"]);
    }
    $stmt->close();
} else {
    echo json_encode(["error" => "No course ID provided"]);
}

$con->close();
?>
