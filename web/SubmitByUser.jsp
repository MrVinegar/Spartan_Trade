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
        <script src="http://malsup.github.com/jquery.form.js"></script> 

        <script src="assets/js/Trade.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/W3schools-edited.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">
        <title>Submit Listing by User</title>
        <%@page import="java.util.Map"%>
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
            Map map = (Map) request.getSession().getAttribute("CurrentUserInfo");
        %>
        <div class="container">
            <div class="row">
                <%@ include file="SideBar.jspf"%>
                <div class="col-md-9 content "> 
                    <div class="dashhead">
                        <div class="dashhead-titles">
                            <h6 class="dashhead-subtitle">Dashboards</h6>
                            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Post Item by User</h2>
                        </div>
                    </div>

                    <div class="pt-1 ml-1">  
                        <div class="w3-panel w3-border w3-border-light-blue w3-hover-border-amber py-5 px-5">
                            <form action="Trade" method="POST" id="submitDefault" class="needs-validation " novalidate>   
                                <input type="hidden" name="code" value="postItemU">

                                <div class="form-group row">
                                    <div class="form-group ">                       
                                        <label for="emailAddress" class="col-sm-4 text-info font-weight-bold">Email:</label>
                                        <p readonly class="form-control-plaintext text-success ml-3"><%= map.get("userName")%></p>
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

        <!--From working jsp-->
        <!--        <div class="container">
                    <h2>Post item</h2>
        
                     Each input for posting an item for sale. Some fields are not required to post an item.
                            <form action="UploadImage.jsp" method="POST">     
                    <form action="Trade" method="POST" id="submitDefault"> 
                        <input type="hidden" name="code" value="postItemU">
        
                         Currently only accepts UNCG email address. 
                        <div class="form-group needs-validation" novalidate>
                            <label for="emailAddress">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%= map.get("userName")%>" 
                                   placeholder="Enter UNCG email address" pattern="[a-z0-9._%+-]+@uncg.edu$" required="true" readonly class="form-control-plaintext">
                        </div>
                        <div class="form-group">
                            <label for="title">Title:</label>
                            <input type="text" class="form-control" id="title" name="title" placeholder="Enter title" required="true">
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <textarea class="form-control" rows="6" id="description" name="description" placeholder="Enter description"
                                      required="true"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="price">Price:</label>
                            <input type="number" min="0" step="0.01" class="form-control" id="price" name="price" 
                                   placeholder="Enter price" required="true">
                        </div>
                         Only accept the phone number if formatted correctly.
                        <div class="form-group">
                            <label for="phoneNumber">Phone number (XXX-XXX-XXXX):</label>
                            <input type="tel" class="form-control input-medium bfh-phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
                                   id="phone" name="phone" required="true">
                        </div>
        
                         Radio buttons for selecting contact method. 
                        <h4>Select contact method</h4>
                        <div class="radio">
                            <label>
                                <input type="radio" name="contactMethod" id="contactMethod" value="email" required="true" checked> Email 
                            </label>
                        </div>   
                        <div class="radio">
                            <label>
                                <input type="radio" name="contactMethod" id="contactMethod" value="call"> Call 
                            </label>
                        </div> 
        
                         Radio buttons for selecting category. 
                        <h4>Select a category</h4>
                        <div class="radio">
                            <label>
                                <input type="radio" name="categoryId" id="categoryId" value="1" required="true" checked> Textbooks 
                            </label>
                        </div>   
                        <div class="radio">
                            <label>
                                <input type="radio" name="categoryId" id="categoryId" value="2"> Roommates 
                            </label>
                        </div> 
                        <div class="radio">
                            <label>
                                <input type="radio" name="categoryId" id="categoryId" value="3"> Supplies 
                            </label>
                        </div> 
                        <div class="radio">
                            <label>
                                <input type="radio" name="categoryId" id="categoryId" value="4"> Services 
                            </label>
                        </div> 
        
                         Take user to another page to add images. Otherwise submit their listing.
                        <button id="addImage" class="btn btn-primary" type="button" onclick="addImage()">Add Image</button>
                        <a href="UploadImage.jsp" class="btn btn-primary" role="button">Add Images</a>
        
                         Used for adding new images to listing. 
                        <div id="newImage">
                        </div>
        
        
                        <button type="button" id="submitItem" class="btn btn-success">Submit (Without Images)</button>
        
                        Delete button will open a confirmation modal.
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delete_confirmation">Delete Listing</button>
        
                    </form>
        
                     A modal pop-up to confirm the deletion of a listing.
                                <div class="modal" id="delete_confirmation" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h3 class="modal-title">Confirm Delete</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p>Do you really want to delete this listing? This is irreversible.</p>
                                            </div>
                                            <div class="modal-footer">       
                                                <div class="button" class="btn btn-danger" data-dismiss="modal">Delete</div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    
        
                </div>-->


        <script src="assets/js/tether.min.js"></script>
        <script src="assets/js/chart.js"></script>
        <script src="assets/js/tablesorter.min.js"></script>
        <script src="assets/js/toolkit.js"></script>
        <script src="assets/js/application.js"></script>

        <!-- Add or delete images when the respective button is clicked. --> 
        <script>

//                                                $(document).ready(function ($) {
//                                                    var contactMethod = document.getElementById('contact1').innerHTML;
//                                                    var contactMethodOption = document.getElementById('contactMethod');
//                                                    var user_info = document.getElementById("phoneNumber");
//                                                    user_info.style.display = "none";
//                                                    contactMethodOption.value = contactMethod;
//                                                    if (contactMethod === "call") {
//                                                        user_info.style.display = "block";
//                                                    } else {
//
//                                                        user_info.style.display = "none";
//                                                    }
//                                                    ;
//
//                                                    var category = document.getElementById('category1').innerHTML;
//                                                    var categoryOption = document.getElementById('categoryList');
//                                                    categoryOption.value = category;
//                                                });
//                                                (function () {
//                                                    'use strict';
//                                                    window.addEventListener('load', function () {
//                                                        // Fetch all the forms we want to apply custom Bootstrap validation styles to
//                                                        var forms = document.getElementsByClassName('needs-validation');
//                                                        // Loop over them and prevent submission
//                                                        var validation = Array.prototype.filter.call(forms, function (form) {
//                                                            form.addEventListener('submitItem', function (event) {
//                                                                if (form.checkValidity() === false) {
//                                                                    event.preventDefault();
//                                                                    event.stopPropagation();
//                                                                }
//                                                                form.classList.add('was-validated');
//                                                            }, false);
//                                                        });
//                                                    }, false);
//                                                })();
//
//                                                // execute/clear BS loaders for docs
//                                                $(function () {
//                                                    while (window.BS && window.BS.loader && window.BS.loader.length) {
//                                                        (window.BS.loader.pop())()
//                                                    }
//                                                })
//
//                                                const selectElement = document.querySelector('.categoryoption');
//
//                                                selectElement.addEventListener('change', (event) => {
//                                                    const result = document.querySelector('.result');
//                                                    result.textContent = `You like ${event.target.value}`;
//                                                });
//
//                                                document.getElementById("call").click = function () {
//                                                    alert("fsadfas");
//                                                    document.getElementById("callInput").display = "inline";
//                                                }






                                                // Add image script
//                                                $("#addImage").click(function () {
//                                                    var html = '';
//                                                    html += '<br>';
//                                                    html += '<div id="inputImage" class="input-group mb-3">';
//                                                    html += '<input type="file" id="imageFile" class="form-control" name="imageFile1" accept=".jpg, .jpeg, .png, .gif, .heic">';
//                                                    html += '<div class="input-group-append">';
//                                                    html += '<button id="deleteImage" type="button" class="btn btn-danger" onclick="deleteImage()">Delete Image</button>';
//                                                    html += '</div>';
//                                                    html += '</div>';
//
//                                                    $('#newImage').append(html);
//                                                });
//
//                                                $(document).on('click', '#deleteImage', function () {
//                                                    $(this).closest('#inputImage').remove();
//                                                });
        </script>
    </body>
</html>
