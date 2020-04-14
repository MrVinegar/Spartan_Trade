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
            Edit Listing &middot; 
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>

        <script src="assets/js/Trade.js"></script>
        <script src="http://malsup.github.com/jquery.form.js"></script> 
<link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/W3schools-edited.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            int image_count = 0;

            request.getSession();

            STList_ITEM item = (STList_ITEM) request.getAttribute("SearchResult");
        %>
        <div class="container">
            <div class="row">
                <%@ include file="SideBar.jspf"%>
                <div class="col-md-9 content "> 
                    <div class="dashhead">
                        <div class="dashhead-titles">
                            <h6 class="dashhead-subtitle">Dashboards</h6>
                            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Item Editing</h2>
                        </div>
                    </div>

                    <div class="pt-1 ml-1">  
<form action="Trade" method="POST" id="edit_form" class="needs-validation" novalidate>   

                        <div class="w3-panel w3-border w3-border-light-blue w3-hover-border-amber py-5 px-5">
                            <!--<form action="Trade" method="POST" id="edit_form" class="needs-validation" novalidate>-->   
                                <input type="hidden" name="code" value="updateItemU">

                                <input type="hidden" name="itemId" value="<%= item.getItemId()%>">
                                <input type="hidden" name="validationId" value="<%= item.getValidationId()%>">
                                <input type="hidden" name="status" value="<%= item.getStatus()%>">
                                <input type="hidden" name="userId" value="<%= item.getUserId()%>">
                                <input type="hidden" name="email" value="<%= item.getEmail()%>">


                                <div class="form-group row">
                                    <div class="form-group ">                       
                                        <label for="emailAddress" class="col-sm-4 text-info font-weight-bold">Email:</label>
                                        <p readonly class="form-control-plaintext text-success ml-3"><%=item.getEmail()%></p>
                                    </div>
                                </div>

                        </div>
                        <div class="w3-panel w3-border w3-border-light-blue w3-hover-border-amber py-5 px-5">

                            <div class="form-group">
                                <label for="title" class="col-sm-4 text-info font-weight-bold">Title:</label>
                                <input type="text" class="form-control" id="title" name="title" value="<%= item.getTitle()%>" 
                                       required="true">
                                <hr class="visible-xs" style="opacity: 0.3;">
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div>
                            </div>
                            <div class="form-group">
                                <label for="description" class="col-sm-4 text-info font-weight-bold">Description:</label>
                                <textarea class="form-control" rows="6" id="description" name="description" 
                                          required="true"><%=item.getDescription()%></textarea>
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div>
                            </div>
                            <div class="form-group">
                                <label for="price" class="col-sm-4 text-info font-weight-bold">Price:</label>
                                <input type="number" class="form-control" id="price" name="price" 
                                       min="0" step="0.01" value="<%= item.getPrice()%>" required="true">
                            </div>

                            <div hidden id="category1"><%=item.getCategoryId()%></div>
                            <div class="form-group row">
                                <div class="col-sm-4 text-info font-weight-bold">Category</div>
                                <div class="col-sm-8">
                                    <select class="custom-select custom-select-lg mb-3 text-success" id="categoryList" name="categoryId" required>
                                        <option value="">Please Select a Category:</option>
                                        <option value="1" >Textbooks</option>
                                        <option value="2" >Services</option>
                                        <option value="3" >Roommates</option>
                                        <option value="4" >Supplies</option>
                                    </select>
                                    <div class="valid-feedback">Valid.</div>
                                    <div class="invalid-feedback">Please Select a Category</div>
                                </div>
                            </div>
                        </div>

                        <p hidden id="contact1"><%= item.getContactMethod()%></p>
                        <div class="w3-panel w3-border w3-border-light-blue w3-hover-border-amber py-5 px-5">
                            <div class="form-group row">
                                <div class="col-sm-4 text-info font-weight-bold">Preferred Contact Method</div>
                                <div class="col-sm-8">
                                    <select class="custom-select custom-select-lg mb-3 text-success" id="contactMethod" name="contactMethod" required
                                            onmouseout="numberToggle()" onchange = "numberToggle()">
                                        <option value="">Choose a Contact Method:</option>
                                        <option value="call">Call</option>
                                        <option value="email">Email</option>
                                    </select>
                                    <div class="valid-feedback">Valid.</div>
                                    <div class="invalid-feedback">Please Select a Preferred Contact Method</div>
                                </div>
                            </div>
                            <div class="form-group" id="phoneNumber">
                                <label for="Number">Phone number (XXX-XXX-XXXX):</label>
                                <input type="tel" class="form-control input-medium bfh-phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
                                       value="<%= item.getPhone()%>" id="Number" name="phone">
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div> 
                            </div>
                            <button type="submit" id="submitItem" class="btn btn-success">Submit</button>
<!--<button type="submit" class="btn btn-default btn-primary mt-5" id="submit">Submit Changes</button>-->
                            </form>



                        </div>
                    </div>
                </div>
                <!--</div>-->
<!--<script src="assets/js/jquery.min.js"></script>-->
                <script src="assets/js/tether.min.js"></script>
                <script src="assets/js/chart.js"></script>
                <script src="assets/js/tablesorter.min.js"></script>
                <script src="assets/js/toolkit.js"></script>
                <script src="assets/js/application.js"></script>
                <script>

            
            
                                                $(document).ready(function ($) {
                                                    var contactMethod = document.getElementById('contact1').innerHTML;
                                                    var contactMethodOption = document.getElementById('contactMethod');
                                                    var user_info = document.getElementById("phoneNumber");
                                                    user_info.style.display = "none";
                                                    contactMethodOption.value = contactMethod;
                                                    if (contactMethod === "call") {
                                                        user_info.style.display = "block";
                                                    } else {

                                                        user_info.style.display = "none";
                                                    }
                                                    ;

                                                    var category = document.getElementById('category1').innerHTML;
                                                    var categoryOption = document.getElementById('categoryList');
                                                    categoryOption.value = category;
                                                });
                                                (function () {
                                                    'use strict';
                                                    window.addEventListener('load', function () {
                                                        // Fetch all the forms we want to apply custom Bootstrap validation styles to
                                                        var forms = document.getElementsByClassName('needs-validation');
                                                        // Loop over them and prevent submission
                                                        var validation = Array.prototype.filter.call(forms, function (form) {
                                                            form.addEventListener('submit', function (event) {
                                                                if (form.checkValidity() === false) {
                                                                    event.preventDefault();
                                                                    event.stopPropagation();
                                                                }
                                                                form.classList.add('was-validated');
                                                            }, false);                 
                                                        });
                                                    }, false);                                            
    })();

                                                // execute/clear BS loaders for docs
                                                $(function () {
                                                    while (window.BS && window.BS.loader && window.BS.loader.length) {
                                                        (window.BS.loader.pop())()
                                                    }
                                                })

                                                const selectElement = document.querySelector('.categoryoption');

                                                selectElement.addEventListener('change', (event) => {
                                                    const result = document.querySelector('.result');
                                                    result.textContent = `You like ${event.target.value}`;
                                                });

                                                document.getElementById("call").click = function () {
                                                    alert("fsadfas");
                                                    document.getElementById("callInput").display = "inline";
                                                }




                </script>
                </body>
                </html>

