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
            Overview &middot; 
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
        <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic" rel="stylesheet">

        <!--                <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
                        <link href="assets/css/application.css" rel="stylesheet">
                        <link rel="stylesheet" href="toolkit-inverse.css" type="text/css"/>
                        <link rel="stylesheet" href="application.css" type="text/css">
                          
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
                
                        <script src="assets/js/HomepageForm.js"></script>
                        <script src="assets/js/HmPageUpdate.js"></script>
                
                        <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic" rel="stylesheet">
                        <script src="http://malsup.github.com/jquery.form.js"></script> -->



        <%@page import="Object.STList_ITEM"%>
        <%--<%@page import="static Dict.API.API_DOMAIN"%>--%>
        <style>
            /* note: this is a hack for ios iframe for bootstrap themes shopify page */
            /* this chunk of css is not part of the toolkit :) */
            body {
                width: 1px;
                min-width: 100%;
                *width: 100%;
            }
/*
            .modal-header { 
                           border-bottom: 0 none; 
            }        
            .modal-footer { 
                           border-top: 0 none; 
            } */
        </style>
    </head>


    <body>
        <!--        <div class="container">
                    <form action="Acc" method="post" id="loginTEST"> 
                        <input type="hidden" name="code" value="SignIn">
        
                         Currently only accepts UNCG email address. 
                        <div class="form-group needs-validation" novalidate>
                            <label for="emailAddress">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" 
                                   placeholder="Enter UNCG email address" pattern="[a-z0-9._%+-]+@uncg.edu$" required="true">
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" class="form-control" id="password" name="password" 
                                   placeholder="Enter password" required="true">
                        </div>
                        <button id ="submit" type="submit" class="btn btn-success">Log In</button>
                    </form>
                </div>-->
        <div class="container">
            <div class="row">
                <div class="col-md-3 sidebar">
                    <nav class="sidebar-nav">
                        <div class="sidebar-header">
                            <button class="nav-toggler nav-toggler-md sidebar-toggler" type="button" data-toggle="collapse" data-target="#nav-toggleable-md">
                                <span class="sr-only">Toggle nav</span>
                            </button>
                            <a class="sidebar-brand img-responsive" href="index.html">
                                <span class="icon sidebar-brand-icon"><img src="assets/img/spartan_logo.png" alt=""></span>

                            </a>
                        </div>

                        <div class="collapse nav-toggleable-md" id="nav-toggleable-md">
                            <form class="sidebar-form">
                                <input class="form-control" type="text" placeholder="Search...">
                                <button type="submit" class="btn-link">
                                    <span class="icon icon-magnifying-glass"></span>
                                </button>
                            </form>


                            <ul class="nav nav-pills nav-stacked flex-column">

                                <div id="user_panel" class="nav" >
                                    <li class="nav-header">User Account</li>

                                    <li class="nav-item">



                                    <li class="nav-item" id="js-popoverContent">
                                        <a class="nav-link active" href="acc/docs/index.html">
                                            Welcome! 
                                            <button class="btn btn-default navbar-btn navbar-btn-avatar ml-2" data-toggle="popover" >
                                                <img class="rounded-circle" src="acc/docs/assets/img/avatar-dhg.png">
                                            </button>
                                        </a>

                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" href="main-menu.html">Main Menu</a>
                                    </li>

                                    <li class="nav-item">
                                        <hr class="visible-xs mt-3">
                                    </li>
                                </div>

                                <div id="main_panel" class="nav-item">
                                    <li class="nav-header">Dashboards</li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="index.html">Overview</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " data-toggle="modal" data-target="#login-modal">SIGN UP/LOGIN</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " href="SubmitListing.jsp" style="color: inherit;">Submit Listing</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " href="EditListing.jsp" style="color: inherit;">Edit Listing</a>
                                    </li>

                                    <li class="nav-item">

                                        <hr class="visible-xs mt-3">
                                    </li>

                                </div>

                                <li class="nav-header">Categories</li>
                                <li class="nav-item">
                                    <a class="nav-link "href="icon-nav/index.html">
                                        Category1
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="" target="blank">
                                        Category2
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="">
                                        Category3
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="" data-toggle="modal">
                                        Category4
                                    </a>
                                </li>
                            </ul>

                        </div>

                    </nav>
                </div>

                <div class="col-md-9 content">
                    <div class="dashhead">
                        <div class="dashhead-titles">

                            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">SPARTAN TRADE</h2>
                        </div>

                        <!--                        <div class="btn-toolbar dashhead-toolbar">
                                                    <div class="btn-toolbar-item input-with-icon">
                                                        <input type="text" value="01/01/20 - 01/08/20" class="form-control" data-provide="datepicker">
                                                        <span class="icon icon-calendar"></span>
                                                    </div>
                                                </div>-->
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
                                    <h6 class="list-group-header">
                                        <%= top5[i]%>
                                    </h6>
                                    <%
                                        // Cycle through 5 items in each category.
                                        for (int j = 1; j < 6; j++) {
                                    %>   

                                    <!-- Add the id for each item and the href. Using HmPageUpdate.js.-->
                                    <a id="link_<%= i * 5 + j%>" class="list-group-item list-group-item-action justify-content-between" href="">
                                        <span class="list-group-progress"></span>
                                        <span id="title_<%= i * 5 + j%>" class="d-inline-block text-truncate" style="max-width: 300px">Item</span>
                                        <!--<span class="text-muted">See Details</span>-->
                                    </a>

                                    <%
                                        }
                                    %>

                                </div>
                                <div style="text-align: center">
                                    <a href="" class="btn btn-outline-primary px-3">See More</a>

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

        <div class ="modal fade" id="login-modal"  role="dialog" style=" background-color: rgba(0,0,0,.5);">
            <div class="modal-dialog modal-lg modal-md" >
                <div class="modal-content" style="
                     /*background-image: url('https://uncgspartans.com/images/2018/12/19/JSMNXIQQMSFNACQ.20181219165618.jpg?width=1920&quality=80&format=jpg');*/
                     background-repeat: no-repeat;
                     background-position: center;
                     background-size:cover;
                     /*opacity: 0.7;*/
                     " >
                    <div class="modal-header">
                        <a class="close" data-dismiss="modal">x</a>
                        <span class="icon sidebar-brand-icon"><img src="assets/img/spartan_logo.png" alt=""></span>
                    </div>

                    
                    <!--Login form--> 
                    <form action="Acc" method="post" id="loginForm" name="login" role="form">
                        <input type="hidden" name="code" value="SignIn">
                        <div class="modal-body font-weight-bold ">				
                            <h3 class="text-monospace text-primary modal-title display-4 mb-3">Login</h3>

                            <!--Currently only accepts UNCG email address.--> 
                            <div class="form-group needs-validation" novalidate>
                                <label class="text-muted" for="emailAddress">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" 
                                       placeholder="Enter UNCG email address" pattern="[a-z0-9._%+-]+@uncg.edu$" required>
                            </div>
                            <div class="form-group">
                                <label class="text-muted" for="pass">Password:</label>
                                <input type="password" class="form-control" id="password" name="password" 
                                       placeholder="Enter password" required>
                            </div>

                            <footer class="screen-login">
                                <a href="#" class="" id="toggle-pwd">Forgot password</a>
                            </footer>
                        </div>
                        <div class="modal-footer">			
                            <button type="button" class="btn btn-default" id="toggle-login">Sign Up</button>
                            <input type="submit" class="btn btn-success" id="submitLogin">
                        </div>
                    </form>


                    <!--Sign up form-->
                    <form action="Acc" method="post" id="signUpIndex" > 
                        <input type="hidden" name="code" value="SignUp">
                        <div class="modal-body">
                            <h3 class="display-4 text-monospace text-primary modal-title mb-3">Sign Up</h3>				
                            <!--Currently only accepts UNCG email address.--> 
                            <div class="form-group needs-validation" novalidate>
                                <label class="text-muted" for="emailAddress">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" 
                                       placeholder="Enter UNCG email address" pattern="[a-z0-9._%+-]+@uncg.edu$" required>
                            </div>
                            <div class="form-group">
                                <label class="text-muted" for="pass">Password:</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                            </div>
                            <!--Removed confirm password--> 
                        </div>
                        <div class="modal-footer">			
                            <button type="button" class="btn btn-default" id="toggle-signUp">Go Back To Login</button>
                            <input type="submit" class="btn btn-success" id="submit">
                        </div>
                    </form>

                    <!--Forgot password form--> 
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


        <!--<script src="assets/js/jquery.min.js"></script>-->
        <script src="assets/js/tether.min.js"></script>
        <script src="assets/js/chart.js"></script>
        <script src="assets/js/tablesorter.min.js"></script>
        <script src="assets/js/toolkit.js"></script>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>-->
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

