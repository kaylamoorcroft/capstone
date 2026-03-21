<?php
    include "dbConnection.php";
?>
    <?php
    if (isset($_POST['course_search'])) {
        $searchRequest = $_POST['course_search'];
        
    //show course name results which match value in search bar
        $Query = "SELECT id, title FROM courses WHERE title LIKE '%$searchRequest%' LIMIT 25";

    //Query execution
        $ExecQuery = MySQLi_query($con, $Query);
        while ($Result = MySQLi_fetch_array($ExecQuery)) {
        ?>
    <!-- Assigning searched result in "Search box" in "planning.php" file. -->
                <?php echo "<li class='addCourse list-group-item list-group-item-action' data-courseid='" . $Result['id'] . "' data-coursename='" . $Result['title'] . "'>" . $Result['title'] . "</li>";
                ?>
        <?php
            }}
        ?>