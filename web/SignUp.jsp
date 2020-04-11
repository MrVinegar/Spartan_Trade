<%-- 
    Document   : SignUp
    Created on : Mar 30, 2020, 2:49:34 PM
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
        <title>Sign Up</title>
    </head>
    <body>
        <h1>Create Spartan Trade account</h1>
        <div class="container">
            <form action="Acc" method="post" id="SignUpTEST" > 
                <input type="hidden" name="code" value="SignUp">

                <!-- Currently only accepts UNCG email address. -->
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" 
                           placeholder="Enter UNCG email address" pattern="[a-z0-9._%+-]+@uncg.edu$" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                </div>
                <button id="submit" type="button" class="btn btn-success">Sign Up</button>
            </form>
        </div>
     </body>
</html>
