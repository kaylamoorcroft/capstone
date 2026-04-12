<!DOCTYPE html>
<?php
    require_once __DIR__ . '/../src/config/dbConnection.php'; 
    $progId = $_GET['program'] ?? 1;
    $stmt = $con->prepare("SELECT \n"

    . "    programs.id AS progId,\n"

    . "    requirements.id AS reqId,\n"

    . "    subrequirements.id AS srId,\n"

    . "    programs.title AS program,\n"

    . "    requirements.description AS req,\n"

    . "    subrequirements.code AS srCode,\n"

    . "    subrequirements.displaytext AS srText,\n"

    . "    subrequirements.directive AS srDir,\n"

    . "    subrequirementgroups.code as groupCode,\n"

    . "    subrequirementgroups.searchtext AS groupText,\n"

    . "    subrequirementgroups.mincredits AS groupMinCreds\n"

    . "FROM \n"

    . "	`programRequirements`\n"

    . "LEFT JOIN programs\n"

    . "ON programs.id = programRequirements.programId\n"

    . "RIGHT JOIN requirements\n"

    . "ON requirements.id = programRequirements.requirementId\n"

    . "LEFT JOIN subrequirements\n"

    . "ON subrequirements.requirementsid = requirements.id\n"

    . "LEFT JOIN subrequirementgroups\n"

    . "ON subrequirementgroups.subrequirementid = subrequirements.id\n"

    . "WHERE programs.id = ?\n"

    . "ORDER BY requirements.id, subrequirements.id, subrequirementgroups.id;");
    $stmt->bind_param("i", $progId);
    $stmt->execute();
    //$result = mysqli_query($con, $sql_statement);
    $result = $stmt->get_result();
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/ededc88243.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=account_box,delete,edit_square,info,library_books,task" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <title>Course Map</title>
</head>
<body style="background-color: rgb(220, 239, 248)">
    <nav class="pc-navbar">
        <div class="pc-menu">
            <span class="material-icons pc-bars" style="font-size: 30px;">dehaze</span>
            <a id="logo" class="navbar-brand" href="index.html"><img src="images/logo.png" width="60" height="50"></a>
        </div>
        <div style="font-size: 1.5rem">Program Requirements</div>

        <div class="pc-sidebar">
            <div class="pc-menu">
                <span class="material-icons pc-bars" style="font-size: 30px;">dehaze</span>
                <span class="pc-logo"><a class="navbar-brand" href="index.html"><img src="images/logo.png" width="80" height="65"></a></span>
            </div>
            <div class="pc-sidebar-content">
                <ul class="pc-list">
                    <li class="pc-listItem">
                        <a class="pc-link" href="planning.php">
                            <i class="material-icons" style="font-size: 30px;">add</i>
                            <span class="pc-iconTitle">Plan a Semester<span>
                        </a>
                    </li>
                    <li class="pc-listItem">
                        <a class="pc-link" href="yearplanning.html">
                            <i class="material-icons" style="font-size: 30px;">calendar_today</i>
                            <span class="pc-iconTitle">Plan by Year</span>
                        </a>
                    </li>
                    <li class="pc-listItem">
                        <a class="pc-link" href="planner-collection.html">
                            <span class="material-icons material-symbols-outlined" style="font-size: 30px;">library_books</span>
                            <span class="pc-iconTitle">View all Plans</span>
                        </a>
                    </li>
                    <li class="pc-listItem">
                        <a class="pc-link" id="progLink" href="programRequirements.php">
                            <i class="material-icons material-symbols-outlined" style="font-size: 30px;">task</i>
                            <span class="pc-iconTitle">View Program Requirements</span>
                        </a>
                    </li>
                    <li class="pc-listItem">
                        <a class="pc-link" href="course-info.php">
                            <span class="material-icons material-symbols-outlined" style="font-size: 30px;">info</span>
                            <span class="pc-iconTitle">View Course Info</span>
                        </a>
                    </li>
                </ul>
                    <div class="pc-bottom-links">
                        <ul class="pc-list">
                            <li class="pc-listItem">
                                <a class="pc-link" href="profile.html">
                                    <i class="material-icons material-symbols-outlined">account_box</i>
                                    <span class="pc-iconTitle">Profile</span>
                                </a>
                            </li>
                            <li class="pc-listItem">
                                <a class="pc-link" href="index.html">
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
    <?php
        if ($progId < 1 || $progId > 7) {
            echo "<div class='container my-5 d-flex flex-column align-items-center'>
                    <p>No program selected... please complete the intake survey to see this content</p>
                    <div id='link-button'><a href='intake-survey.html'>Complete survey</a></div>
                </div>";
        }
    ?>
    <div class="container my-5 accordion" id="requirements-accordion">
        <?php
            $prevReq = '';
            $prevSr = '';
            $firstRow = true;
            $firstReq = true;
            $firstSr = true;
            while($row = mysqli_fetch_array($result)) {
                if ($firstRow) {
                    echo "<h2>".$row['program']."</h2>";
                    $firstRow = false;
                }
                if ($prevReq != $row['req']) {
                    if (!$firstReq) echo "</div></div></div>";
                    $firstReq = false;
                    $firstSr = true;

                    echo "<div class='accordion-item'>
                            <h2 class='accordion-header'>
                                <button class='accordion-button collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#panels".$row['progId']."-".$row['reqId']."' aria-expanded='false' aria-controls='panels".$row['progId']."-".$row['reqId']."'>
                                    ".$row['req']."
                                </button>
                            </h2>
                            <div id='panels".$row['progId']."-".$row['reqId']."' class='accordion-collapse collapse' data-bs-parent='#requirements-accordion'>
                                <div class='accordion-body row'>";
                    
                    $prevReq = $row['req'];
                    $prevSr = '';
                }
                if ($prevSr != $row['srCode']) {
                    if (!$firstSr) echo "<br><br>";
                    $firstSr = false;

                    echo "<p><strong>".$row['srCode']."</strong></p>";
                    if ($row['srText']) echo "<p><em>".$row['srText']."</em></p>";
                    echo "<p>".$row['srDir']."</p>";

                    $prevSr = $row['srCode'];
                }
                echo "<li style='list-style-type: none;'> • ".$row['groupText']."</li>";
            }
            echo "</div></div></div>";
            // Free result set
            mysqli_free_result($result);
            mysqli_close($con);
        ?>
    </div>
    <script type="module">
        import { setProgramLink } from "./js/components/sidebar.js";
        setProgramLink();
    </script>
</body>