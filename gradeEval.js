function calculateGrade(){ //no need to put parameters in this function: number of grade entires will be variable
    const grade1 = document.getElementById("grade1").value; //fetch grades from grade input boxes in html
    const grade2 = document.getElementById("grade2").value;

    let gradeAverage;
    // const calcAverage = (grade1 + grade2)/2;
    gradeAverage = document.getElementById("gradeOutput").value = (grade1 + grade2)/2;
}

document.getElementById("gradeOutput").addEventListener("calculateGrade", calculateGrade);