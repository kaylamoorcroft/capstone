<?php
    require_once __DIR__ . '/../../src/config/dbConnection.php';
?>
    <?php
    if (isset($_POST['course_search'])) {
        $searchRequest = $_POST['course_search'];
        
    //show course name results which match value in search bar
        $Query = "SELECT id, title, subjectCode, `number` FROM courses WHERE title LIKE '%$searchRequest%' OR `number` LIKE '%$searchRequest%' LIMIT 25";

    //Query execution
        $ExecQuery = MySQLi_query($con, $Query);
        while ($Result = MySQLi_fetch_array($ExecQuery)) {
        ?>
    <!-- Assigning searched result in "Search box" in "planning.php" file. -->
                <?php echo "<li class='addCourse list-group-item list-group-item-action' id='addCourse-".$Result['id']."' data-bs-toggle='tooltip' title='" . $Result['subjectCode'] . ' ' . $Result['number'] . "'data-courseid='" . $Result['id'] . "' data-coursename='" . $Result['title'] . "'>" . $Result['title'] . "</li>";
                ?>
        <?php
            }}
        ?>

    <!-- search bar for course details page -->
    <?php
    if (isset($_POST['info_search'])) {
        $infoRequest = $_POST['info_search'];
        $infoQuery = "SELECT courses.id, courses.title, courses.description, courses.subjectCode, courses.number, courses.termsoffered, courserequisites.allrequirements
                        FROM courses LEFT JOIN courserequisites ON courses.Id = courserequisites.courseId
                        WHERE MinimumCredits != 0 AND title LIKE '%$infoRequest%' OR `number` LIKE '%$infoRequest%' ORDER BY title LIMIT 25";
                        
        $ExecInfoQuery = MySQLi_query($con, $infoQuery);

        while ($Result = MySQLi_fetch_array($ExecInfoQuery)){
            //turn semesters string from db into array of strings
            $termsArray = explode(',', $Result['termsoffered']);
            $termsList = '';
            //loop over array and turn semester initialisms into full semester names
            foreach($termsArray as $term){
                switch($term){
                    case "FA":
                        $term = "• Fall\n";
                        $termsList .= $term;
                        break;
                    case "WI":
                        $term = "• Winter\n";
                        $termsList .= $term;
                        break;
                    case "SU":
                        $term = "• Summer\n";
                        $termsList .= $term;
                        break;
                    case "COI":
                        $term = "• Continuous Intake";
                        $termsList .= $term;
                        break;
                    default:
                    $termsList = "N/A";
                }
            }
        ?>
    <!-- show search results as accordion buttons -->
                <?php echo "<div class='accordion-item'>
                                    <h2 class='accordion-header'>
                                        <button class='accordion-button collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#panels".$Result['id']."' aria-expanded='false' aria-controls='panels".$Result['id']."'>
                                            ".$Result['title']."
                                        </button>
                                    </h2>
                                    <div id='panels".$Result['id']."' class='accordion-collapse collapse' data-bs-parent='#course-accordion'>
                                        <div class='accordion-body row'>
                                            <h5 style='padding-left: 0'>Description</h5>
                                                ".$Result['description']."
                                                <br><br>
                                            <h5 style='padding-left: 0'>Course ID</h5>
                                                ".$Result['subjectCode']."-".$Result['number']."
                                                <br><br>
                                            <h5 style='padding-left: 0'>Requirements</h5>
                                                ".nl2br(htmlspecialchars($Result['allrequirements'] ?? 'None'))."
                                                <br><br>
                                            <h5 style='padding-left: 0'>Available</h5>"
                                                .nl2br(htmlspecialchars($termsList)).
                                        "</div>
                                    </div>
                        </div>";
                ?>
        <?php
            }}
        ?>