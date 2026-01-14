<!DOCTYPE html>
<?php
    $con = mysqli_connect("localhost", "catalogue_user", "passw0rd", "courseCatalogue_db");

    // Check connection
    if (mysqli_connect_errno()) {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
    $sql_statement = "SELECT courseID, courseName FROM compsci";
    $result = mysqli_query($con, $sql_statement);
?>

<html lang="en">
<head>
    <link rel="icon" href="cmap_logo.png" type="image/x-icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/ededc88243.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <div class="container">
        <nav id="home-navbar" class="navbar navbar-expand-lg my-2">
            <a id="logo" class="navbar-brand" href="index.html">
                <img src="cmap_logo.png" width="60" height="50">
            </a>
            <a class="btn btn-outline-primary nav-link"><i class="fa-solid fa-gear fa-2x"></i></a>
        </nav>
    </div>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h3>Add courses to Planner</h3>
                <input id="course-search" class="form-control" type="search" placeholder="Search...">
                <div class="list-group" id="planCourse">
                    <?php
                        while($row = mysqli_fetch_array($result)) {
                            echo "<button type='button' data-toggle='modal' data-target='#myModal' class='list-group-item list-group-item-action' data-courseid='" . $row['courseID'] . "' data-coursename='" . $row['courseName'] . "'>" . $row['courseName'] . "</td><tr>";
                        }
                        // Free result set
                        mysqli_free_result($result);
                        mysqli_close($con);
                    ?>
                </div>
            </div>
            <div class="col-md-6">
                <h1>Planner</h1>
                    <div class="form-row">
                        <select name="semester" id="semester" class="form-control blue-input" required>
                            <option value="Fall 2026">Fall 2026</option>
                            <option value="Winter 2027">Winter 2027</option>
                        </select>
                    </div>
                    <ul class="course-list">
                    </ul>
            </div>
            <div class="col-md-3">
                <h3>Recommended courses</h3>
                <ul class="course-list">
                    <li class="course">Course 1</li>
                    <li class="course">Course 2</li>
                    <li class="course">Course 3</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
        
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add course</h4>
                </div>
                <div class="modal-body">
                    <p>Add course to current semester?</p>
                    <!--
                    <select name="sem-year-add" id="sem-year-add" class="form-control" required>
                    </select>
                    -->
                </div>
                <div class="modal-footer">
                    <button id="add-course-btn" type="button" class="btn btn-primary">Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    <script src="planning.js"></script>
</body>
</html>