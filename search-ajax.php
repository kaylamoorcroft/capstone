<?php
include "dbConnection.php";

if (isset($_POST['course_search'])) {
    $searchRequest = $_POST['course_search'];
    
//show course name results which match value in search bar
    $Query = "SELECT courseName FROM compSci WHERE courseName LIKE '%$searchRequest%'";
//Query execution
    $ExecQuery = MySQLi_query($con, $Query);
    //display results in table format (for the time being)
        echo '
    <table>
        ';

    while ($Result = MySQLi_fetch_array($ExecQuery)) {
    ?>
    <tr>
        <td>
            <a>
    <!-- Assigning searched result in "Search box" in "planning.php" file. -->
            <?php echo $Result['courseName']; ?>
    </td>
</tr>
</a>
    <?php
}}
?>
</table>