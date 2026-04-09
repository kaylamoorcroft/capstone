<!DOCTYPE html>
<?php
    include "dbConnection.php";
    $sql_statement = "SELECT \n"

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

    . "WHERE programs.id = 1\n"

    . "ORDER BY requirements.id, subrequirements.id, subrequirementgroups.id;";

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
    <link rel="stylesheet" href="sass/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <title>Course Map</title>
</head>
<body>
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
                echo "<li>".$row['groupText']."</li>";
            }
            echo "</div></div></div>";
            // Free result set
            mysqli_free_result($result);
            mysqli_close($con);
        ?>
    </div>
</body>