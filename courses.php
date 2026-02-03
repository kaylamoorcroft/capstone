<?php
// query page for whenever want to get more info on a course from the course id
header('Content-Type: application/json'); // Set header to indicate JSON response

// Create connection
$con = mysqli_connect("localhost", "catalogue_user", "passw0rd", "courseCatalogue_db");

// Check connection
if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

// Get data sent from JavaScript via POST request
// Use prepared statements to prevent SQL injection!
$course_id = $_POST['courseId'] ?? ''; 

if (!empty($course_id)) {
    $stmt = $con->prepare("SELECT courseID, courseName, sem, preRequisites, lab FROM compSci WHERE courseID = ?");
    $stmt->bind_param("s", $course_id); // "i" for integer type
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
    // $rawData = [];
    // if ($row = $result->fetch_assoc()) {
    //     $rawData = $row;
    // }
    // extract($rawData);
    // $data = array(
    //     "id" => $courseID,
    //     "name" => $courseName
    // );
    // $data = [];
    // if ($result->num_rows > 0) {
    //     // Output data of the unique row
    //     while($row = $result->fetch_assoc()) {
    //         $data = $row;
    //         //echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
    //     }
    //     echo json_encode(["id" => $course_id, "name" => "course name"]);
    // } else {
    //     echo json_encode(["error" => "0 results for courseId"])
    // }
    // $stmt->execute();
    // $result = $stmt->get_result();
    
    
    //$stmt->close();
    // echo json_encode(["id" => "id", "name" => "course name"]);
    //echo json_encode($data); // Encode the result into a JSON object for the JavaScript
} else {
    echo json_encode(["error" => "No course ID provided"]);
}

$con->close();
?>
