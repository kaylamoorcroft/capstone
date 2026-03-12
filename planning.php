<!DOCTYPE html>
<?php
    include "dbConnection.php";
    $sql_statement = "SELECT courseID, courseName FROM compsci UNION SELECT courseID, courseName FROM math";
    $result = mysqli_query($con, $sql_statement);
?>

<html lang="en">
<head>
    <link rel="icon" href="images/logo.png" type="image/x-icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <script src="https://kit.fontawesome.com/ededc88243.js" crossorigin="anonymous"></script> -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=disabled_by_default" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
    <div class="container">
        <nav id="home-navbar" class="navbar navbar-expand-lg my-2">
            <a id="logo" class="navbar-brand" href="index.html">
                <img src="images/logo.png" width="60" height="50">
            </a>
            <!-- <a class="btn nav-link"><i class="fa-solid fa-gear fa-2x"></i></a> -->
        </nav>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h3>Add courses to Planner</h3>

                <!-- search bar feature -->
                <input id="course_search" type="text" class="form-control" placeholder="Search...">

                <div class="list-group" id="planCourse">
                    <?php
                        while($row = mysqli_fetch_array($result)) {
                            echo "<li class='addCourse list-group-item list-group-item-action' data-courseid='" . $row['courseID'] . "' data-coursename='" . $row['courseName'] . "'>" . $row['courseName'] . "</li>";
                        }
                        // Free result set
                        mysqli_free_result($result);
                        mysqli_close($con);
                    ?>
                </div>
            </div>
            <div class="col-md-5">
                <h1>Planner</h1>
                <div id="planner-controls" class="d-flex justify-content-between">
                    <button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="collapse" data-bs-target="#collapseSemAdd" aria-expanded="false" aria-controls="collapseSemAdd">
                        Add new semester
                    </button>
                    <button type="button" id="clear-sem-btn" class="btn btn-outline-dark btn-sm">Clear semester</button>
                </div>
                <div class="collapse" id="collapseSemAdd">
                    <div class="card card-body">
                        <select name="sem-add" id="sem-add" class="form-control" required>
                            <option value="Fall">Fall</option>
                            <option value="Winter">Winter</option>
                            <option value="Summer">Summer</option>
                        </select>
                        <select name="year-add" id="year-add" class="form-control" required>
                        </select>
                        <button id="add-sem-btn" type="button" class="btn btn-primary">Add</button>
                    </div>
                </div>
                <p class="empty-msg d-none">There are no semesters in the planner yet... click "Add new semester" to add a semester.</p>
                <select name="semester" id="semester" class="form-control blue-input" required>
                </select>
                <ul class="course-list", id="dragZone">
                </ul>
                
                <div class="d-flex justify-content-end">
                    <button style="background-color: rgb(172, 214, 227); border-color: rgb(172, 214, 227); border-radius: 8px; padding: 4px; border-style: solid">
                        <a style="padding: 10px; color: black" href="planner-collection.html">View all Plans</a>
                    </button>
                </div>

                <div id="recommendations">
                <h3>Recommended courses</h3>
                <ul class="course-list">
                    <li class="course">Course 1</li>
                    <li class="course">Course 2</li>
                    <li class="course">Course 3</li>
                </ul>
            </div>
            </div>

            <div class="col-md-3">
                <h3 style="margin-bottom: 20px">Add New Course</h3>
                <form id="newCourse">
                    <div class="form-group pb-4">
                        <label for="nCourseName">Course Name</label>
                        <input type="text" class="form-control" id="nCourseName" placeholder="Enter name..." required>
                    </div>
                    <div class="form-group pb-4">
                        <label for="nCourseID">Course ID</label>
                        <input type="text" class="form-control" id="nCourseID" placeholder="XXXX-NNNN">
                    </div>
                    <div class="d-flex justify-content-end">
                        <button type="button" id="add-new-course" class="btn btn-outline-dark btn-sm" data-bs-toggle='modal' data-bs-target='#myModal' data-type='new-course'>Add Course</button>
                    </div>
                </form>
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
    <script type="module" src="js/planning.js"></script>
</body>
</html>