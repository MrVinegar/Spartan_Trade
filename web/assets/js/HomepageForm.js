/* 
 * AJAX form for Sign Up and Login.
 */

// from https://stackoverflow.com/questions/1960240/jquery-ajax-submit-form

$(document).ready(function () {

    $("#submitLogin").click(function (event) {
        event.preventDefault();
//      if ($("#SignUpTEST").valid()) {
        $("#submitLogin").attr("disabled", "disabled").html("Wait...");
        $(this.form).ajaxSubmit({
            dataType: "json",
            timeout: (30 * 1000),
            error: function (data) {
                setTimeout(function () {
                    $("#submitLogin").removeAttr("disabled").html("Sign Up");
                }, 1500);
            },
            success: function (data) {

                if (data.status == "Redirect") {
                    window.location.replace(data.content);
                } else if (data.status === "Failed") {
                    alert(data.content);
                    $("#submitLogin").removeAttr("disabled").html("Sign Up");
                } else if (data.status === "Error") {
                    alert(data.content);
                    $("#submitLogin").removeAttr("disabled").html("Sign Up");
                } else {
                    alert("Incorrect email or password. Please try again.")
                }

            }
        });
    });
    
    $("#submitSignUp").click(function (event) {
        event.preventDefault();
//      if ($("#SignUpTEST").valid()) {
        $("#submitSignUp").attr("disabled", "disabled").html("Wait...");
        $(this.form).ajaxSubmit({
            dataType: "json",
            timeout: (30 * 1000),
            error: function (data) {
                setTimeout(function () {
                    $("#submitSignUp").removeAttr("disabled").html("Sign Up");
                }, 1500);
            },
            success: function (data) {


                if (data.status == "Redirect") {
                    window.location.replace(data.content);
                } else if (data.status === "Failed") {
                    alert(data.content);
                    $("#submitSignUp").removeAttr("disabled").html("Sign Up");
                } else if (data.status === "Error") {
                    alert(data.content);
                    $("#submitSignUp").removeAttr("disabled").html("Sign Up");
                } else {
                    alert("Incorrect email or password. Please try again.")
                }

            }
        });
    });

});
