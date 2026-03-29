<!DOCTYPE html>
<?php
    include "dbConnection.php";
    $sql_statement = "SELECT courses.id, courses.title, courses.description, courses.subjectCode, courses.number, courses.termsoffered, courserequisites.allrequirements
                        FROM courses LEFT JOIN courserequisites ON courses.Id = courserequisites.courseId
                        WHERE MinimumCredits != 0 AND subjectCode = 'COMP' ORDER BY `number`";
    $result = mysqli_query($con, $sql_statement);
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/ededc88243.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=account_box,delete,edit_square,info" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <title>Course Map</title>
</head>
<body>
<!-- <a href="planner-collection.html" class="btn btn-primary">Back</a> -->
<nav class="pc-navbar">
        <div class="pc-menu">
            <!-- <i class="fa fa-bars pc-bars" aria-hidden="true"></i> -->
            <span class="material-icons pc-bars" style="font-size: 30px;">dehaze</span>
            <span class="pc-logo"><img src="images/logo.png" width="80" height="65"></span>
        </div>

        <div class="pc-sidebar">
            <div class="pc-menu">
                <!-- <i class="fa fa-bars pc-bars" aria-hidden="true"></i> -->
                <span class="material-icons pc-bars" style="font-size: 30px;">dehaze</span>
                <span class="pc-logo"><img src="images/logo.png" width="80" height="65"></span>
            </div>
            <div class="pc-sidebar-content">
                <ul class="pc-list">
                    <li class="pc-listItem">
                        <a class="pc-link" href="planning.php">
                            <!-- <i class="fa-regular fa-plus"></i> -->
                            <i class="material-icons" style="font-size: 30px;">add</i>
                            <span class="pc-iconTitle">Plan a Semester<span>
                        </a>
                    </li>
                    <li class="pc-listItem">
                        <a class="pc-link" href="#">
                            <!-- <i class="fa-regular fa-calendar"></i> -->
                            <i class="material-icons" style="font-size: 30px;">calendar_today</i>
                            <span class="pc-iconTitle">Plan by Year</span>
                        </a>
                    </li>
                    <li class="pc-listItem">
                        <a class="pc-link" href="intake-survey.html">
                            <!-- <i class="fa-solid fa-pen-to-square"></i> -->
                            <span class="material-icons material-symbols-outlined">edit_square</span>
                            <span class="pc-iconTitle">Edit Survey Responses</span>
                        </a>
                    </li>
                    <li class="pc-listItem">
                        <a class="pc-link" href="course-info.php">
                        <!-- <i class="fa-regular fa-circle-info"></i> -->
                            <span class="material-icons material-symbols-outlined" style="font-size: 30px;">info</span>
                            <span class="pc-iconTitle">View Course Info</span>
                        </a>
                    </li>
                </ul>
                    <div class="pc-bottom-links">
                        <ul class="pc-list">
                            <li class="pc-listItem">
                                <a class="pc-link" href="profile.html">
                                    <!-- <i class="fa-solid fa-user"></i> -->
                                    <i class="material-icons material-symbols-outlined">account_box</i>
                                    <span class="pc-iconTitle">Profile</span>
                                </a>
                            </li>
                            <li class="pc-listItem">
                                <a class="pc-link" href="index.html">
                                    <!-- <i class="fa-regular fa-arrow-right-from-bracket"></i> -->
                                    <i class="material-icons" style="font-size: 30px;">logout</i>
                                    <span class="pc-iconTitle">Logout</span>
                                </a>
                            </li>
                        </ul>
                    </div>
            </div>
        </div>
    </nav>
    <section class="pc-openMenu"></section>
    <script>
        const navBar = document.querySelector(".pc-navbar"),
            menuButtons = document.querySelectorAll(".pc-bars"),
            overlay = document.querySelector(".pc-openMenu");
        
        menuButtons.forEach(menuButton => {
            menuButton.addEventListener("click", () => {
                navBar.classList.toggle("open");
            });
        });

        overlay.addEventListener("click", () =>{
                navBar.classList.remove("open");
        });
    </script>

    <div class="container" style="width: 75%">
        <input id="info_search" type="text" class="form-control" placeholder="Search for courses..." style="margin: 40px; margin-left: auto;">
    
        <div class="accordion" id="course-accordion">
                    <?php
                        while($row = mysqli_fetch_array($result)) {
                            //turn semesters string from db into array of strings
                            $termsArray = explode(',', $row['termsoffered']);
                            $termsList = '';
                            //loop over array and turn semester initialisms into full semester names
                            foreach($termsArray as $term){
                                if($term == "FA"){
                                    $term = "• Fall\n";
                                    $termsList .= $term;
                                }
                                elseif($term == "WI"){
                                    $term = "• Winter\n";
                                    $termsList .= $term;
                                }
                                elseif($term == "SU"){
                                    $term = "• Summer\n";
                                    $termsList .= $term;
                                }
                                elseif($term == "COI"){
                                    $term = "• Continuous Intake";
                                    $termsList .= $term;
                                }
                                else{
                                    $termsList = "N/A";
                                }
                            }

                            echo "<div class='accordion-item'>
                                    <h2 class='accordion-header'>
                                        <button class='accordion-button collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#panels".$row['id']."' aria-expanded='false' aria-controls='panels".$row['id']."'>"
                                        .$row['title'].
                                        "</button>
                                    </h2>
                                    <div id='panels".$row['id']."' class='accordion-collapse collapse' data-bs-parent='#course-accordion'>
                                        <div class='accordion-body row'>
                                            <h5 style='padding-left: 0'>Description</h5>"
                                                .$row['description'].
                                                "<br><br>
                                            <h5 style='padding-left: 0'>Course ID</h5>"
                                                .$row['subjectCode']."-".$row['number'].
                                                "<br><br>
                                            <h5 style='padding-left: 0'>Requirements</h5>"
                                                .nl2br(htmlspecialchars($row['allrequirements'] ?? 'None')).
                                                "<br><br>
                                            <h5 style='padding-left: 0'>Available</h5>"
                                                .nl2br(htmlspecialchars($termsList)).
                                        "</div>
                                    </div>
                                </div>";
                        }

                        // Note: htmlspecialchars deprecated on null: use null coalescing (??) to make 'None' default val for courses without requisites

                        // Free result set
                        mysqli_free_result($result);
                        mysqli_close($con);
                    ?>
        </div>

    </div>
    <script type="module" src="js/course-info.js"></script>
</body>
</html>