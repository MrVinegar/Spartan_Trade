<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">

        <%@page import="Object.STList_ITEM"%>

<link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
<link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
        <link href="assets/css/application.css" rel="stylesheet">
        <link href="assets/css/W3schools-edited.css" rel="stylesheet">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="assets/js/HomepageForm.js"></script>
        <script src="http://malsup.github.com/jquery.form.js"></script> 


        <!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet"> -->

        <%
            STList_ITEM item = (STList_ITEM) request.getAttribute("ItemDetail");
        %>
        <title><%= item.getTitle()%></title>

        <style>
            /* note: this is a hack for ios iframe for bootstrap themes shopify page */
            /* this chunk of css is not part of the toolkit :) */
            .mySlides {
                display: none;
            }

            body {
                width: 1px;
                min-width: 100%;
                *width: 100%;
            }

            .image_list li {
                display: -webkit-box;
                display: -moz-box;
                display: -ms-flexbox;
                display: -webkit-flex;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 165px;
                border: solid 5px #ffb71b;
                box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
                margin-bottom: 15px;
                cursor: pointer;
                padding: 15px;
                -webkit-transition: all 200ms ease;
                -moz-transition: all 200ms ease;
                -ms-transition: all 200ms ease;
                -o-transition: all 200ms ease;
                transition: all 200ms ease;
                overflow: hidden
            }

            .image_list li:last-child {
                margin-bottom: 0
            }

            .image_list li:hover {
                box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.3)
            }

            .image_list li img {
                max-width: 100%
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="row">
                <%@ include file="SideBar.jspf"%>
                <div class="col-md-9 content">
                    <div class="dashhead">
                        <div class="dashhead-titles">
                            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Full Description
                            </h2>
                        </div>

                    </div>

                    <div class="hr-divider mt-3">
                        <h3 class="hr-divider-content hr-divider-heading"></h3>
                    </div>
                    <div class="row">
                    </div>

                    <div class="container">
                        <div class="jumbotron" style="background-color: #0f2044;">
                            <div>
                                <span class="badge-danger badge text-wrap lead float-right font-weight-bolder">$<%= item.getPrice()%></span>
                                <h1 class="text-shadow mt-5 mb-3 text-primary "><%= item.getTitle()%></h1>
                                <!-- <img src="like.svg"> -->
                            </div>
                            <p class="text-secondary font-weight-light"><%= item.getDescription()%></p>
                            <hr class="my-4">

                            <h3 class="mb-5 text-info">Seller Information</h3>
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="col-md-12">
                                        <tbody>
                                            <tr class="row mt-10">
                                                <td class="col-md-4"><span class="p_specification">Preferred Contact Method:
                                                    </span> </td>
                                                <td class="col-md-8">
                                                    <ul>
                                                        <li><%= item.getContactMethod()%></li>
                                                    </ul>
                                                </td>
                                            </tr>
                                            <tr class="row mt-10">
                                                <td class="col-md-4"><span class="p_specification">Updated Date: </span>
                                                </td>
                                                <td class="col-md-8">
                                                    <ul>
                                                        <li><%= item.getUpdatedDate() %></li>
                                                    </ul>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <!-- Only display which contact method a user has chosen.-->
                            <button type="button" class="btn btn-lg btn-success" data-toggle="popover"
                                    title="How to buy?"
                                    <%
                                        // Check which contact method user selected.
                                        String contactMethod = item.getEmail();
                                        try {
                                            if (item.getContactMethod().equals("call")) {
                                                contactMethod = item.getPhone();
                                            }
                                        } catch (Exception e) {
                                            System.out.println("No contact method selected.");
                                            contactMethod = item.getEmail();
                                        }
                                    %>
                                    data-content="Contact Seller at <%=contactMethod%>">Interested in buying me?
                            </button>
                        </div>
                    </div>
                </div>
            </div>
<!--        </div>-->

                            <div class ="modal fade" id="login-modal" class="modal fade" role="dialog" style=" background-color: rgba(0,0,0,.5);">
                                <div class="modal-dialog modal-lg modal-md" >
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
        <script src="assets/js/popper.min.js"></script>
        <!--<script src="assets/js/jquery.min.js"></script>-->
        <script src="assets/js/tether.min.js"></script>
        <script src="assets/js/chart.js"></script>
        <script src="assets/js/tablesorter.min.js"></script>
        <script src="assets/js/toolkit.js"></script>
        <script src="assets/js/application.js"></script>
        <script>
            
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
            
            
            
            $(document).ready(function () {
                $('[data-toggle="popover"]').popover();
            });

            var slideIndex = 1;
            showDivs(slideIndex);

            function plusDivs(n) {
                showDivs(slideIndex += n);
            }

            function showDivs(n) {
                var i;
                var x = document.getElementsByClassName("mySlides");
                if (n > x.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = x.length
                }
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                x[slideIndex - 1].style.display = "block";
            }

            // execute/clear BS loaders for docs
            $(function () {
                while (window.BS && window.BS.loader && window.BS.loader.length) {
                    (window.BS.loader.pop())()
                }
            })
        </script>
    </body>

</html>