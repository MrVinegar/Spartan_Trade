/* 
 * AJAX for submitting an item.
 */
//$(document).ready(function () { 
//    $("#submitItem").click(function (event) {
////        $("#edit_form").submit(function(event) {
//        event.preventDefault();                
//                
//        $("#submitItem").attr("disabled", "disabled").html("Wait...");
//        $(this.form).ajaxSubmit({
//            dataType: "json",
//            timeout: (30 * 1000),
//            error: function (data) {
//                alert("Please check all fields.");
//                setTimeout(function () {
//                    $("#submitItem").removeAttr("disabled").html("Submit");
//                }, 1500);
//            },
//            success: function (data) {
//
//                if (data.status === "Redirect") {
//                    window.location.replace(data.content);
//                }
//                if (data.status === "Success") {
//                    window.location.replace("Search?code=URSR&To=204&page=0");
//                }
//                if (data.status === "SuccessDefault") {
//                    window.location.replace("ItemConfirmation.html");
//                }
//                if (data.status === "Failed") {
//                    alert(data.content);
//                    $("#submitItem").removeAttr("disabled").html("Submit");
//                }
//
//            }
//        });
//    });
//});


$(document).ready(function () {

    $('#submit_form').validate({
        rules: {
            title: {
                required: true
            },
            description: {
                required: true
            },
            price: {
                required: true
            },
            categoryId: {
                required: true
            }
        },
        submitHandler: function (form) {

            $("#submitItem").click(function (event) {

                event.preventDefault();


                $(this.form).ajaxSubmit({
                    dataType: "json",
                    timeout: (30 * 1000),
                    error: function (data) {
                        alert("Please check all fields.");
                        setTimeout(function () {
                            $("#submitItem").removeAttr("disabled").html("Submit");
                        }, 1500);
                    },
                    success: function (data) {
                        if (data.status === "Redirect") {
                            window.location.replace(data.content);
                        }
                        if (data.status === "Success") {
                            window.location.replace("Search?code=URSR&To=204&page=0");
                        }
                        if (data.status === "SuccessDefault") {
                            window.location.replace("ItemConfirmation.html");
                        }
                        if (data.status === "Failed") {
                            alert(data.content);
                            $("#submitItem").removeAttr("disabled").html("Submit");
                        }

                    }
                });
            });
        }
    });
});