<%-- 
    Document   : SubmitListing
    Created on : Mar 24, 2020, 4:09:41 PM
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

        <script src="assets/js/Trade.js"></script>
        <script src="http://malsup.github.com/jquery.form.js"></script> 
        <title>Submit Listing</title>
<link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/W3schools-edited.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">
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

        <div class="container">
            <div class="row">
                <%@ include file="SideBar.jspf"%>
                <div class="col-md-9 content "> 
                    <div class="dashhead">
                        <div class="dashhead-titles">
                            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Post Item by Default User</h2>
                        </div>
                    </div>

                    <div class="pt-1 ml-1">  
                        <div class="w3-panel w3-border w3-border-light-blue w3-hover-border-amber py-5 px-5">
                            <form action="Trade" method="POST" id="submitDefault" class="needs-validation " novalidate>   
                                <input type="hidden" name="code" value="postItemD">

                                <div class="form-group row">
                                    <div class="form-group ">                       
                                        <label for="emailAddress" class="col-sm-4 text-info font-weight-bold">Email:</label>
                                        <input type="email" class="form-control" id="email" name="email" 
                                               placeholder="Enter UNCG email address" pattern="[a-z0-9._%+-]+@uncg.edu$" required="true">
                                    </div>
                                </div>
                        </div>
                        <div class="w3-panel w3-border w3-border-light-blue w3-hover-border-amber py-5 px-5">
                            <div class="form-group">
                                <label for="title" class="col-sm-4 text-info font-weight-bold">Title:</label>
                                <input type="text" class="form-control" id="title" name="title" required="true">
                                <hr class="visible-xs" style="opacity: 0.3;">
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div>
                            </div>
                            <div class="form-group">
                                <label for="description" class="col-sm-4 text-info font-weight-bold">Description:</label>
                                <textarea class="form-control" rows="6" id="description" name="description" 
                                          required="true"></textarea>
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div>
                            </div>
                            <div class="form-group">
                                <label for="price" class="col-sm-4 text-info font-weight-bold">Price:</label>
                                <input type="number" class="form-control" id="price" name="price" 
                                       min="0" step="0.01" required="true">
                            </div>

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

                        <p hidden id="contact1" value="email"></p>
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
                                       id="Number" name="phone">
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div> 
                            </div>

                            <button type="button" id="submitItem" class="btn btn-success">Submit</button>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add or delete images when the respective button is clicked. --> 
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



//            $("#addImage").click(function () {
//                var html = '';
//                html += '<br>';
//                html += '<div id="inputImage" class="input-group mb-3">';
//                html += '<input type="file" id="imageFile" class="form-control" name="imageFile1" accept=".jpg, .jpeg, .png, .gif, .heic">';
//                html += '<div class="input-group-append">';
//                html += '<button id="deleteImage" type="button" class="btn btn-danger" onclick="deleteImage()">Delete Image</button>';
//                html += '</div>';
//                html += '</div>';
//
//                $('#newImage').append(html);
//            });
//
//            $(document).on('click', '#deleteImage', function () {
//                $(this).closest('#inputImage').remove();
//            });
        </script>
    </body>
</html>
