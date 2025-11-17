
//Bonus: Function to calculate overall grade
function gradeCalc(){
    const assign = document.getElementById("assignment").value;
    const mid = document.getElementById("midterm").value;



    let final;

    //depending on highest avg from each of the 4, determine final grade: based on syllabus

        final = document.getElementById("final").value = assign+mid;
}

document.getElementById("calcButton").addEventListener("click", gradeCalc); //listen for button click "calculate"
