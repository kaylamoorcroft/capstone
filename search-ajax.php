<?php
    include "dbConnection.php";
?>
    <?php
    if (isset($_POST['course_search'])) {
        $searchRequest = $_POST['course_search'];
        
    //show course name results which match value in search bar
        $Query = "SELECT courseID, courseName FROM compSci WHERE courseName LIKE '%$searchRequest%' 
            UNION SELECT courseID, courseName FROM math WHERE courseName LIKE '%$searchRequest%'";

    //Query execution
        $ExecQuery = MySQLi_query($con, $Query);
        while ($Result = MySQLi_fetch_array($ExecQuery)) {
        ?>
    <!-- Assigning searched result in "Search box" in "planning.php" file. -->
                <?php echo "<button type='button' data-bs-toggle='modal' data-bs-target='#myModal' class='list-group-item list-group-item-action' data-courseid='" . $Result['courseID'] . "' data-coursename='" . $Result['courseName'] . "'>" . $Result['courseName'];
                ?>
        <?php
            }}
        ?>