<!DOCTYPE html>
<?php
    $con = mysqli_connect("localhost", "catalogue_user", "passw0rd", "courseCatalogue_db");

    // Check connection
    if (mysqli_connect_errno()) {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
    $sql_statement = "SELECT courseName FROM compsci";
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
    <title>Course Map</title>
</head>
<body>
    <div class="container">
        <nav id="home-navbar" class="navbar navbar-expand-lg my-2">
            <a id="logo" class="navbar-brand" href="index.html">
                <img src="cmap_logo.png" width="60" height="50">
            </a>
            <a class="btn btn-outline-primary nav-link"><i class="fa-solid fa-gear fa-2x"></i></a>
        </nav>
    </div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 courses">
                    <input class="form-control" type="search" placeholder="Search...">
                    <!-- <table>
                        <thead>
                            <tr>
                                <th>Available CS Courses</th>
                            </tr>
                        </thead>
                        <tbody> -->

                    <!--display cs db table with dropdown menu-->
                    <select id="planCourse" name="planCourse" class="blue-input form-control w-100">
                        <option value="">Add courses to Planner</option>
                        <?php
                            while($row = mysqli_fetch_array($result)) {
                                
                            echo "<option value='". $row['courseName'] . "'>" . $row["courseName"] . "</option>";
                            }
                            // Free result set
                            mysqli_free_result($result);
                            mysqli_close($con);
                        ?>
                    </select>
                        <!-- </tbody>
                    </table> -->
                </div>
                <div class="col-md-7">
                    <h2>Planner</h2>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-row">
                                <select name="semester-1" id="semester-1" class="form-control blue-input" required>
                                    <option value="Fall">Fall</option>
                                    <option value="Winter">Winter</option>
                                </select>
                                <input id="year-1" type="number" value="2026" class="form-control blue-input">
                            </div>
                            <ul class="course-list">
                                <li class="course">Course 1</li>
                                <li class="course">Course 2</li>
                                <li class="course">Course 3</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <div class="form-row">
                                <select name="semester-2" id="semester-2" class="form-control blue-input" required>
                                    <option value="Fall">Fall</option>
                                    <option selected value="Winter">Winter</option>
                                </select>
                                <input id="year-2" type="number" value="2027" class="form-control blue-input">
                            </div>
                            <ul class="course-list">
                                <li class="course">Course 1</li>
                                <li class="course">Course 2</li>
                                <li class="course">Course 3</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <h3>Recommended courses</h3>
                    <ul class="course-list">
                        <li class="course">Course 1</li>
                        <li class="course">Course 2</li>
                        <li class="course">Course 3</li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>