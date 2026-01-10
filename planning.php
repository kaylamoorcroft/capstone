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
        <nav id="home-navbar" class="navbar navbar-nav navbar-expand-lg my-2">
            <a class="navbar-brand" href="index.html">
                <img src="cmap_logo.png" width="60" height="50">
            </a>
            <a class="btn btn-outline-primary nav-link"><i class="fa-solid fa-gear"></i></a>
        </nav>
    </div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 courses">
                    <table>
                        <thead>
                            <tr>
                                <th>Available CS Courses</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                while($row = mysqli_fetch_array($result)) {
                                    echo "<tr>";
                                echo "<td class='title'>" . $row['courseName'] .  "</td>";
                                    echo "</tr>";
                                }
                                // Free result set
                                mysqli_free_result($result);
                                mysqli_close($con);
                        ?>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-7">
                    <h2>Planner</h2>
                    <div class="row">
                        <div class="col-md-4 semester"></div>
                    
                        <div class="col-md-4 semester"></div>
                        
                        <div class="col-md-4 semester"></div>
                    </div>
                </div>
                <div class="col-md-2">
                    <input type="search" placeholder="search...">
                    <h3>Recommended courses</h3>
                    <ul>
                        <li>Course 1</li>
                        <li>Course 2</li>
                        <li>Course 3</li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>