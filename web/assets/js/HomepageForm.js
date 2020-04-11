/* 
 * AJAX form for Sign Up and Login.
 */

// from https://stackoverflow.com/questions/1960240/jquery-ajax-submit-form


$(document).ready(function () {

    // AJAX for sign up.
    $("#submit").click(function (event) {
        event.preventDefault();
//      if ($("#SignUpTEST").valid()) {
        $("#submit").attr("disabled", "disabled").html("Wait...");
        $(this.form).ajaxSubmit({
            dataType: "json",
            timeout: (30 * 1000),
            error: function (data) {
                setTimeout(function () {
                    $("#submit").removeAttr("disabled").html("Sign Up");
                }, 1500);
            },
            success: function (data) {


                if (data.status == "Redirect") {
                    window.location.replace(data.content);
                } else if (data.status === "Failed") {
                    alert(data.content);
                    $("#submit").removeAttr("disabled").html("Sign Up");
                } else if (data.status === "Error") {
                    alert("You are already signed in. " + data.content);
                    $("#submit").removeAttr("disabled").html("Sign Up");
                } else {
                    alert("Incorrect email or password. Please try again.")
                }

                //working if statements
//                if (data.status == "Redirect") {
//                    window.location.replace(data.content);
//                }
//                if (data.status == "Failed") {
//                    alert(data.content);
//                    $("#submit").removeAttr("disabled").html("Sign Up");
//                }
//                if (data.status === "Error") {
//                    alert("You are already signed in. " + data.content);
//                    $("#submit").removeAttr("disabled").html("Sign Up");
//                }
//                    if(data.ret.debug === "passed!"){
//                        popTipsSU(data.ret.msg);
//                        setTimeout(function(){
//                            location.assign(data.ret.to);
//                        },2000);
//                    }else{
//                        popTipsSU(data.ret.debug);
//                        $("#SU-button").removeAttr("disabled").html("Sign Up");
//                    }
            }
        });
//         } 
    });




//    var createForm = $('#SignUpTEST');
//
//    $(createForm).submit(function (event) {
//        var email = $('email').val();
//        var password = $('password').val();
//
//        console.log(" IN SIGN UP");
//        event.preventDefault(); // avoid to execute the actual submit of the form.
//
//        //       var form = $(this);
//        //       var url = form.attr('Acc');
//        $.ajax({
//            url: 'Acc',
//            type: 'POST',
////            data: $('SignUpTEST').serialize(), // serializes the form's elements.
//            data: createForm.serialize(), // serializes the form's elements.
//            success: function (data)
//            {
//                console.log("HERE IN SIGN UP");
//                console.log("data  " + data);
//                alert("data " + data); // show response from the php script.
//            },
//            error: function () {
//                console.log("FAIL IN SIGN UP");
//
//                alert("Error");
//            }
//        });
//    });

//    $("#loginForm").submit(function (e) {
//
//        e.preventDefault(); // avoid to execute the actual submit of the form.
//
//        var email = $("#email").val();
//        var password = $("#password").val();
//        
//        console.log("email = " + email);
//        console.log("password = " + password);
//        
//        var form = $(this);
//        var url = form.attr('Acc');
//        $.ajax({
//            type: "POST",
//            url: url,
// //           data: {email: email, password: password}, // serializes the form's elements.
//
//            data: form.serialize(), // serializes the form's elements.
//            success: function (data, status)
//            {
//                console.log("DATA = " + data);
//                alert("Status: " + status + "  data " + data); // show response from the php script.
//
//            },
//            error: function () {
//                alert("Error");
//            }
//        });
//    });
});
