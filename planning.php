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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/ededc88243.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <nav id="home-navbar" class="navbar navbar-expand-lg my-2">
            <a id="logo" class="navbar-brand" href="index.html">
                <img src="cmap_logo.png" width="60" height="50">
            </a>
            <button style="margin-right: auto"><a style="padding: 10px; text-decoration: none" href="planner-collection.html">View all Courses</a></button>
            <a class="btn btn-outline-primary nav-link"><i class="fa-solid fa-gear fa-2x"></i></a>
        </nav>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h3>Add courses to Planner</h3>
                <input id="course-search" class="form-control" type="search" placeholder="Search...">
                <div class="list-group" id="planCourse">
                    <?php
                        while($row = mysqli_fetch_array($result)) {
                            echo "<button type='button' data-bs-toggle='modal' data-bs-target='#myModal' class='list-group-item list-group-item-action' data-courseid='" . $row['courseID'] . "' data-coursename='" . $row['courseName'] . "'>" . $row['courseName'] . "</td><tr>";
                        }
                        // Free result set
                        mysqli_free_result($result);
                        mysqli_close($con);
                    ?>
                </div>
            </div>
            <div class="col-md-6">
                <h1>Planner</h1>
                <div id="planner-controls" class="d-flex justify-content-between">
                    <button type="button" class="btn btn-outline-dark" data-bs-toggle="collapse" data-bs-target="#collapseSemAdd" aria-expanded="false" aria-controls="collapseSemAdd">
                        Add new semester
                    </button>
                    <button type="button" id="clear-sem-btn" class="btn btn-outline-dark">Clear semester</button>
                </div>
                <div class="collapse" id="collapseSemAdd">
                    <div class="card card-body">
                        <select name="sem-add" id="sem-add" class="form-control" required>
                            <option value="Fall">Fall</option>
                            <option value="Winter">Winter</option>
                            <option value="Summer">Summer</option>
                        </select>
                        <select name="year-add" id="year-add" class="form-control" required>
                            <option value="2026">2026</option>
                            <option value="2027">2027</option>
                            <option value="2028">2028</option>
                            <option value="2029">2029</option>
                            <option value="2030">2030</option>
                        </select>
                        <button id="add-sem-btn" type="button" class="btn btn-primary">Add</button>
                    </div>
                </div>
                <select name="semester" id="semester" class="form-control blue-input" required>
                </select>
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
                    <h4 class="modal-title">Add course</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Add course to current semester?</p>
                </div>
                <div class="modal-footer">
                    <button id="add-course-btn" type="button" class="btn btn-primary">Add</button>
                    <button type="button" class="btn btn-default" data-bs-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    <script src="planning.js"></script>
</body>
</html>