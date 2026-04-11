<?php
// query page for whenever want to get more info on reqs from the id
header('Content-Type: application/json'); // Set header to indicate JSON response

require_once __DIR__ . '/../../src/config/dbConnection.php';

// Get data sent from JavaScript via POST request
// Use prepared statements to prevent SQL injection!
$id = $_POST['reqId'] ?? ''; 

if (!empty($id)) {
    $stmt = $con->prepare("
        SELECT 
            completionorder,
            displaytext, 
            displaytextextension 
        FROM 
            `requisites` 
        WHERE 
            requirementcode = ?");
    $stmt->bind_param("i", $id); // "i" for integer type, "s" for string type
    // Execute the query
    $stmt->execute();

    // Get the result
    $result = $stmt->get_result();

    $rawData = [];
    while($row = $result->fetch_assoc()) {
        $rawData = $row;
    }
    extract($rawData);
    if ($displaytext != null) {
        // Output data of the unique row
        $data = array(
            "id" => $id,
            "completionOrder" => $completionorder,
            "reqsText" => $displaytext,
            "reqsTextEx" => $displaytextextension
        );

        echo json_encode($data);
    } else {
        echo json_encode(["error" => "0 results for requirement"]);
    }
    $stmt->close();
} else {
    echo json_encode(["error" => "No requirement code provided"]);
}

$con->close();
?>
