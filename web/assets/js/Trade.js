/* 
 * AJAX for submitting an item.
 */
$(document).ready(function () { 
    $("#submitItem").click(function (event) {
//        $("#edit_form").submit(function(event) {
        event.preventDefault();                
                
        $("#submitItem").attr("disabled", "disabled").html("Wait...");
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
});

//$(document).ready(function () {
//    $("#edit_form").validate({
//        rules: {
//            title: {
//                required: true
//            },
//            description: {
//                required: true
//            },
//        },
//        highlight: function (element) {
//            $(element).closest('.form-group').addClass('has-error');
//        },
//        messages:{
//          title:{
//              required: "need title"
//          },  
//        },
//        submitHandler: function (form) {
//            //Will execute only when the form passed validation.
//                console.log("HERERERERE");
//                $(this.form).ajaxSubmit({
//                    dataType: "json",
//                    timeout: (30 * 1000),
//                    error: function (data) {
//                                        console.log("ERROR LINE 68 " + data.toString());
//
//                        setTimeout(function () {
//                            $("#submitItem").removeAttr("disabled").html("Submit");
//                        }, 1500);
//                    },
//                    success: function (data) {
//
//                        if (data.status === "Redirect") {
//                            alert("redirect" + data.content);
////                    window.location.replace(data.content);
//                        }
//                        if (data.status === "Success") {
//                            alert("success" + data.content);
//                            window.location.replace("Search?code=URSR&To=204");
//                        }
//                        if (data.status === "SuccessDefault") {
//                            alert("success DEFAULT" + data.content);
////                    window.location.replace("Home.jsp");
//                        }
//                        if (data.status === "Failed") {
//                            alert("FAIELD  " + data.content);
//                            $("#submitItem").removeAttr("disabled").html("Submit");
//                        }
//
//                    }
//                });
//
//        }
//    });
//
//});



//    $("#submitItem").click(function (event) {
//        //event.preventDefault();
//        alert($("#edit-form").valid());
//        console.log($("#edit-form").valid());
//        if($("#edit-form").valid()){
//            
//        
//        
//
//        $("#submitItem").attr("disabled", "disabled").html("Wait...");
//        $(this.form).ajaxSubmit({
//            dataType: "json",
//            timeout: (30 * 1000),
//            error: function (data) {
//                setTimeout(function () {
//                    $("#submitItem").removeAttr("disabled").html("Submit");
//                }, 1500);
//            },
//            success: function (data) {
//
//                if (data.status === "Redirect") {
//                    alert("redirect" + data.content);
////                    window.location.replace(data.content);
//                }
//                if (data.status === "Success") {
//                                        alert("success" + data.content);
//
//                    window.location.replace("Search?code=URSR&To=204");
//                }
//                if (data.status === "SuccessDefault") {
//                    alert("success DEFAULT" + data.content);
////                    window.location.replace("Home.jsp");
//                }
//                if (data.status === "Failed") {
//                    alert("FAIELD  " + data.content);
//                    $("#submitItem").removeAttr("disabled").html("Submit");
//                }
//
//            }
//        });
//        } else {
//            alert("error");
//        }
//    });

//});









// not redirecting
//$("#edit_form").validate({
//       rules: {   
//         title: {
//            required: true,
//            title :true
//         }, 
//         description: {
//            required: true,
//            description :true
//         },
//         price: {
//            required: true,
//            price :true
//         },
//         categoryId: {
//            required: true,
//            categoryId :true
//         }
//        },
//       submitHandler : function() {
//        $.ajax({
//            dataType: "json",
//            timeout: (30 * 1000),
//            error: function (data) {
//
//            },
//            success: function (data) {
//
//                if (data.status === "Redirect") {
//                    window.location.replace(data.content);
//                }
//                if (data.status === "Success") {
//                    window.location.replace("Search?code=URSR&To=204");
//                }                
//                if (data.status === "SuccessDefault") {
//                    window.location.replace("Home.jsp");
//                }
//                if (data.status === "Failed") {
//                    alert(data.content);
//                    $("#submitItem").removeAttr("disabled").html("Submit");
//                }
//
//            }              
//        });
//
//       }
//    });  