<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">

        <title>
            Spartan Trade &middot; 
        </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
        <script src="assets/js/HmPageUpdate.js"></script>
        <script src="assets/js/HomepageForm.js"></script>
        <script src="http://malsup.github.com/jquery.form.js"></script> 

        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
        <%@page import="Control.Account.Account"%>
        <%@page import="Object.STList_ITEM"%>
        
        <style>
            /* note: this is a hack for ios iframe for bootstrap themes shopify page */
            /* this chunk of css is not part of the toolkit :) */
            body {
                width: 1px;
                min-width: 100%;
                *width: 100%;
            }
        </style>
    </head>
    <body>
        <%
//            Account acc = new Account(request, response);
//            boolean isLogin = acc.checkIsSignIn();
        %>
        <div class="container">
            <div class="row">
                <%@ include file="SideBar.jspf"%>
                <div class="col-md-9 content">
                    <div class="dashhead">
                        <div class="dashhead-titles">
                            <!-- <h6 class="dashhead-subtitle">Dashboards</h6> -->
                            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">SPARTAN TRADE</h2>
                        </div>
                    </div>

                    <div class="hr-divider mt-3">
                        <h3 class="hr-divider-content hr-divider-heading">Categories</h3>
                        <br>
                    </div>

                    <!-- FOR LISTING VIEW ON HOME PAGE-->
                    <div role="tabpanel" class="tab-pane" id="list">
                        <div class="row">
                            <%
                                String[] top5 = {"Textbooks", "Services", "Roommates", "Supplies"};
                                // For loop for the number of categories.
                                for (int i = 0; i < 4; i++) {
                            %>

                            <div class="col-lg-6 mb" style="margin-bottom: 50px">
                                <div class="list-group mb-6" style="margin-bottom:10px">
                                    <!-- Display category titles.-->
                                    <h6 class="list-group-header" style="color:gold;">
                                        <%= top5[i]%>
                                    </h6>
                                    <%
                                        // Cycle through 5 items in each category.
                                        for (int j = 1; j < 6; j++) {
                                    %>   

                                    <!-- Add the id for each item and the href. Using HmPageUpdate.js.-->
                                    <a id="link_<%= i * 5 + j%>" class="list-group-item list-group-item-action justify-content-between" href="">
                                        <span class="list-group-progress"></span>
                                        <span id="title_<%= i * 5 + j%>" class="d-inline-block text-truncate" style="max-width: 500px">Item</span>
                                        <!--<span class="text-muted">See Details</span>-->
                                    </a>
                                    <%
                                        }
                                    %>
                                </div>
                                <div style="text-align: center">
                                    <a href="Search?code=STSR&category=<%= i + 1%>&page=0&To=202" class="btn btn-outline-primary px-3">See More</a>
                                </div>
                            </div>
                            <br>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class ="modal fade" id="login-modal" class="modal fade" role="dialog" style=" background-color: rgba(0,0,0,.5);">
            <div class="modal-dialog modal-lg modal-md" >
<!--                <div class="modal-content" style="
                     /*background-image: url('https://uncgspartans.com/images/2018/12/19/JSMNXIQQMSFNACQ.20181219165618.jpg?width=1920&quality=80&format=jpg');*/
                     background-repeat: no-repeat;
                     background-position: center;
                     background-size:cover;
                     /*opacity: 0.7;*/
                     " >-->
<div class="modal-content" style="
                     /*background-image: url('https://uncgspartans.com/images/2018/12/19/JSMNXIQQMSFNACQ.20181219165618.jpg?width=1920&quality=80&format=jpg');*/
                     background-repeat: no-repeat;
                     background-position: center;
                     background-size:cover;
                     /*opacity: 0.7;*/
                     " >
    <div class="modal-body">
                    <div class="modal-header">
                        <a class="close" data-dismiss="modal">X</a>
                        <!--<span class="icon sidebar-brand-icon"><img src="assets/img/spartan_logo.png" alt=""></span>-->
                    </div>
                    <!--Login form--> 
                    <form action="Acc" method="post" id="loginForm" name="login" role="form"  onclick="validation();">
                        <input type="hidden" name="code" value="SignIn">
                        <div class="modal-body font-weight-bold ">				
                            <h3 class="text-monospace text-primary modal-title display-4 mb-3">Login</h3>

                            <div class="form-group">
                                <label  class="text-muted" for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" 
                                       placeholder="Enter UNCG email address" pattern="[a-z0-9._%+-]+@uncg.edu$" required>
                                <p id="validationResult"></p>

                            </div>
                            <div class="form-group">
                                <label class="text-muted" for="Password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" 
                                       placeholder="Enter password" required>
                            </div>
                            <footer class="screen-login">
                                <a href="#" class="" id="toggle-pwd">Forgot password</a>
                            </footer>
                        </div>
                        <div class="modal-footer">			
                            <button type="button" class="btn btn-default" id="toggle-login" onclick="reset()">Sign Up</button>
                            <input type="submit" class="btn btn-success" id="submitLogin" disabled="true">
                        </div>
                    </form>

                    <!--Sign up form-->
                    <form action="Acc" method="post" id="signUpForm" name="signup" role="form" onclick="validation();">
                        <input type="hidden" name="code" value="SignUp">
                        <div class="modal-body">
                            <h3 class="display-4 text-monospace text-primary modal-title mb-3">Sign Up</h3>				
                            <div class="form-group">
                                <label class="text-muted" for="email">Email</label>
                                <input type="email" class="form-control" id="emailSignUp" name="email" 
                                       placeholder="Enter UNCG email address" pattern="[a-z0-9._%+-]+@uncg.edu$" required>
                                <p id="validationResult"></p>

                            </div>
                            <div class="form-group">
                                <label class="text-muted" for="pwd">Password</label>
                                <input type="password" class="form-control" id="passwordSignUp" name="password" placeholder="Enter password" required>
                            </div>
                        </div>
                        <div class="modal-footer">			
                            <button type="button" class="btn btn-default" id="toggle-signUp" onclick="reset()">Go Back To Login</button>
                            <input type="submit" class="btn btn-success" id="submitSignUp" disabled="true">
                        </div>
                    </form>

                    <form id="pwdForm" name="signup" role="form">
                        <div class="modal-body">
                            <h3 class="display-4 text-monospace text-primary modal-title mb-3">Password Reset</h3>				
                            <div class="form-group">
                                <label class="text-muted" for="email">Enter your email address</label>
                                <input type="email" name="email" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="text-muted" for="pwd">Password</label>
                                <input type="password" name="pwd" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="text-muted" for="pwd-2">Re-enter Password</label>
                                <input type="password" name="pwd-2" class="form-control">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" id="toggle-login2">Go Back To Login</button>
                            <input type="submit" class="btn btn-success" id="submit">
                        </div>
                    </form>
</div>
</div>
                </div>
            </div>
        </div>

        <!--This script checks if email entered is a UNCG email.-->                
        <script>
            function reset() {
                document.getElementById('email').value = '';
                document.getElementById('password').value = '';
                document.getElementById('emailSignUp').value = '';
                document.getElementById('passwordSignUp').value = '';
            }

            function validation() {
                var inputEmailLogin, inputPasswordLogin, inputEmailSignUp, inputPasswordSignUp, responseEmail = "";
                var submitButton = document.getElementById("submitLogin");
                var submitSignUp = document.getElementById("submitSignUp");

                // Check input email against this pattern.
                var pattern = new RegExp("[a-z0-9._%+-]+@uncg.edu$");
                inputEmailLogin = document.getElementById("email").value;
                inputPasswordLogin = document.getElementById("password").value;
                inputEmailSignUp = document.getElementById("emailSignUp").value;
                inputPasswordSignUp = document.getElementById("passwordSignUp").value;

                // Login button
                if (pattern.test(inputEmailLogin) && inputPasswordLogin.length > 1) {
                    submitButton.disabled = false;
                } else {
                    responseEmail = "Please enter a UNCG email";
                    submitButton.disabled = true;
                }

                // Sign up button
                if (pattern.test(inputEmailSignUp) && inputPasswordSignUp.length > 1) {
                    submitSignUp.disabled = false;
                } else {
                    responseEmail = "Please enter a UNCG email";
                    submitSignUp.disabled = true;
                }
                document.getElementById("validationResult").innerHTML = responseEmail;
            }
        </script>             



        <script src="assets/js/tether.min.js"></script>
        <script src="assets/js/chart.js"></script>
        <script src="assets/js/tablesorter.min.js"></script>
        <script src="assets/js/toolkit.js"></script>
        <script src="assets/js/application.js"></script>
        <script>
            // execute/clear BS loaders for docs
            $(function () {
                while (window.BS && window.BS.loader && window.BS.loader.length) {
                    (window.BS.loader.pop())()
                }
            })
            $("document").ready(function () {
                $("#signUpForm").hide();
                $("#pwdForm").hide();
            });

            $("#toggle-login").click(function () {
                $("#loginForm").hide().attr("formnovalidate");
                $("#signUpForm").toggle();
            });

            $("#toggle-signUp").click(function () {
                $("#signUpForm").hide().attr("formnovalidate");
                $("#pwdForm").hide().attr("formnovalidate");
                $("#loginForm").toggle();
            });

            $("#toggle-login2").click(function () {
                $("#pwdForm").hide().attr("formnovalidate");
                $("#loginForm").toggle();
            });

            $("#toggle-pwd").click(function () {
                $("#loginForm").hide().attr("formnovalidate");
                $("#pwdForm").toggle();
            });
            $("#signUp").click(function () {
                $('#loginForm').slideUp(function () {
                    $(this).replaceWith(
                            $("<div style='display:none'>new  html to replace with</div>").slideDown()
                            );
                });
            });
        </script>
    </body>
</html>

