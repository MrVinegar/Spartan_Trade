<%-- 
    Document   : Login
    Created on : Mar 30, 2020, 1:55:41 PM
    Author     : harmanbains
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>

        <script src="assets/js/HomepageForm.js"></script>
        <script src="http://malsup.github.com/jquery.form.js"></script> 
        <title>Login</title>
    </head>
    <body>
        <h1>Login to Spartan Trade account.</h1>

        <div class="container">
            <form action="Acc" method="post" id="loginTEST" onclick="validation()"> 
                <input type="hidden" name="code" value="SignIn">

                <!-- Currently only accepts UNCG email address. -->
                <div class="form-group needs-validation" novalidate>
                    <label for="emailAddress">Email:</label>
                    <input type="email" class="form-control" id="email" name="email"
                           placeholder="Enter UNCG email address" pattern="[a-z0-9._%+-]+@uncg.edu$" required="true">
                    <p id="validationResult"></p>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" 
                           placeholder="Enter password" required="true">
                </div>
                <button id ="submit" type="submit" class="btn btn-success" disabled="true">Log In</button>
            </form>
        </div>



        <script>
            function validation() {
                var inputEmail, inputPassword, responseEmail = "", responsePassword = "";
                var submitButton = document.getElementById("submit")
                var pattern = new RegExp("[a-z0-9._%+-]+@uncg.edu$");
                // Get the value of the input field with id="numb"
                inputEmail = document.getElementById("email").value;
                inputPassword = document.getElementById("password").value;

                console.log("inputEmail = " + inputEmail);
                // If x is Not a Number or less than one or greater than 10
                if (pattern.test(inputEmail) && inputPassword.length > 1) {
                    submitButton.disabled = false;
                } else {
//                    responseEmail = "Valid email";
                    responseEmail = "Please enter a UNCG email";


                }
//                if (inputPassword.length < 1){
//                    responsePassword = "Enter a password.";
//                } 
                document.getElementById("validationResult").innerHTML = responseEmail;
                document.getElementById("validationResultPassword").innerHTML = responsePassword;

            }
        </script>
    </body>
</html>
