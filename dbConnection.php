<?php
$con = mysqli_connect("localhost", "catalogue_user", "passw0rd", "courseCatalogue_db");

    // Check connection
    if (mysqli_connect_errno()) {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
?>