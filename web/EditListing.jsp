<%-- 
    Document   : EditListing
    Created on : Apr 1, 2020, 2:40:40 PM
    Author     : harmanbains
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Object.STList_ITEM"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Edit Listing</title>
    </head>
    <body>
        <%
            String[] categories = {"Textbooks", "Roommates", "Supplies", "Services", "Other"};
            int image_count = 3;
            
            request.getSession();
            
            STList_ITEM item = (STList_ITEM) request.getAttribute("ItemDetail");

        %>

        <div class="container">
            <h2>Edit your listing</h2>

            <!-- Each input for editing an item for sale.-->
            <form action="ItemConfirmation.html" method="POST" id="edit_form"> 

                <!-- Currently only accepts UNCG email address. -->
                <div class="form-group needs-validation" novalidate>
                    <label for="emailAddress">Email:</label>
                    <input type="email" readonly class="form-control-plaintext" id="emailAddress" name="email" 
                           value="HERE" disabled="disabled">
                </div>
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="" 
                           required="true">
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea class="form-control" rows="6" id="description" name="description" 
                              placeholder="" required="true"></textarea>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" class="form-control" id="price" name="price" 
                           min="0" step="0.01" placeholder="" required="true">
                </div>
                <!-- Only accept the phone number if formatted correctly.-->
                <div class="form-group">
                    <label for="phoneNumber">Phone number (XXX-XXX-XXXX):</label>
                    <input type="tel" class="form-control input-medium bfh-phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
                           placeholder="" id="phoneNumber" name="phone" required="true">
                </div>

                <!-- Radio buttons for selecting category. -->
                <h4>Select a category</h4>
                <div class="radio">
                    <label>
                        <input type="radio" name="option" id="1" required="true"> Textbooks 
                    </label>
                </div>   
                <div class="radio">
                    <label>
                        <input type="radio" name="option" id="2"> Roommates 
                    </label>
                </div> 
                <div class="radio">
                    <label>
                        <input type="radio" name="option" id="3"> Supplies 
                    </label>
                </div> 
                <div class="radio">
                    <label>
                        <input type="radio" name="option" id="4"> Services 
                    </label>
                </div> 
                <div class="radio">
                    <label>
                        <input type="radio" name="option" id="5"> Other 
                    </label>
                </div> 


                <%
                    //Display previously uploaded images first.
                    for (int i = 0; i < image_count; i++) {
                %>        
                <div id="inputImage" class="input-group mb-3">
                    <img src="bio_text.jpg" alt="image" width="400" height="300" >
                    <button id="deleteImage" type="button" class="btn btn-danger" onclick="deleteImage()">Delete</button>
                </div>
                <br>
                <%
                    }
                %>

                <button id="addImage" class="btn btn-primary" type="button" onclick="addImage()">Add Additional Image</button>

                <!-- Used for adding new images to listing. -->
                <div id="newImage">
                </div>

                <br>
                <button type="submit" class="btn btn-success">Submit Changes</button>
                
                <!-- Button to delete entire listing.-->
                <button id="deleteListing" type="button" class="btn btn-danger">Delete Entire Listing</button>

            </form>


        </div>

        <!-- Add or delete images when the respective button is clicked. --> 
        <script type="text/javascript">
            $("#addImage").click(function () {
                var html = '';
                html += '<br>';
                html += '<div id="inputImage" class="input-group mb-3">';
                html += '<input type="file" id="imageFile" class="form-control" name="imageFile1" accept=".jpg, .jpeg, .png, .gif, .heic">';
                html += '<div class="input-group-append">';
                html += '<button id="deleteImage" type="button" class="btn btn-danger" onclick="deleteImage()">Delete Image</button>';
                html += '</div>';
                html += '</div>';

                $('#newImage').append(html);
            });

            // Delete the image closest to the delete button.
            $(document).on('click', '#deleteImage', function () {
                $(this).closest('#inputImage').remove();
            });
        </script>

    </body>
</html>
