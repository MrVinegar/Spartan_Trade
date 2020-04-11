<%-- 
    Document   : SubmitListing
    Created on : Mar 24, 2020, 4:09:41 PM
    Author     : harmanbains
--%>
<%@page import="java.util.Map"%>
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
        <title>Submit Listing by User</title>
    </head>
    <body>
 <%
             Map map = (Map)request.getSession().getAttribute("CurrentUserInfo");

 %>
        <div class="container">
            <h2>Post item</h2>

            <!-- Each input for posting an item for sale. Some fields are not required to post an item.-->
<!--        <form action="UploadImage.jsp" method="POST">    --> 
            <form action="Trade" method="POST" id="submitDefault"> 
                <input type="hidden" name="code" value="postItemU">

                <!-- Currently only accepts UNCG email address. -->
                <div class="form-group needs-validation" novalidate>
                    <label for="emailAddress">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= map.get("userName") %>" 
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
                <!-- Only accept the phone number if formatted correctly.-->
                <div class="form-group">
                    <label for="phoneNumber">Phone number (XXX-XXX-XXXX):</label>
                    <input type="tel" class="form-control input-medium bfh-phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
                           id="phone" name="phone" required="true">
                </div>

                <!-- Radio buttons for selecting category. -->
                <h4>Select a category</h4>
                <div class="radio">
                    <label>
                        <input type="radio" name="categoryId" id="categoryId" value="1" required="true"> Textbooks 
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

                <!-- Take user to another page to add images. Otherwise submit their listing.-->
                <button id="addImage" class="btn btn-primary" type="button" onclick="addImage()">Add Image</button>
                <!--<a href="UploadImage.jsp" class="btn btn-primary" role="button">Add Images</a>-->

                <!-- Used for adding new images to listing. -->
                <div id="newImage">
                </div>

                
                <button type="button" id="submitItem" class="btn btn-success">Submit (Without Images)</button>

                 <!--Delete button will open a confirmation modal.-->
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delete_confirmation">Delete Listing</button>
      
            </form>

            <!-- A modal pop-up to confirm the deletion of a listing.-->
            <!--            <div class="modal" id="delete_confirmation" role="dialog">
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
            -->

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

            $(document).on('click', '#deleteImage', function () {
                $(this).closest('#inputImage').remove();
            });
        </script>
    </body>
</html>
