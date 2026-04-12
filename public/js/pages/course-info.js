import { setProgramLink } from "../components/sidebar.js";

//search bar script for course info page
$(document).ready(function(){
    setProgramLink();

    $("#info_search").keyup(function(){
        var request = $('#info_search').val();

        //if no results match search, return empty string
        if (request == null){
            $("#course-accordion").html("");
        }
        else{
            //call AJAX
            $.ajax({
                type: "POST",
                url: "search-ajax.php",
                data: {
                info_search: request
                },
                //call function if result is found
                success: function(param){
                    $("#course-accordion").html(param);
                }
            });
        }
    });
});