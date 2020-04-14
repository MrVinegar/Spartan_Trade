<%-- 
    Document   : FullDescription
    Created on : Mar 24, 2020, 4:15:05 PM
    Author     : harmanbains
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Object.STList_ITEM"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>       
        <%
            STList_ITEM item = (STList_ITEM) request.getAttribute("ItemDetail");
        %>
        <title><%= item.getTitle() %></title>

    </head>
    <body>
         <!-- Display title and price.-->
        <div class="d-flex justify-content-center">
            <h1><%= item.getTitle() %></h1>  
            <h1> - </h1>
            <h1>$<%= item.getPrice() %></h1> 
        </div>

        <%
            // Counter for the number of images available.
            int image_counter = item.images.size();

            // No images available.
            if (image_counter == 0) {
        %>      <h3 class="text-center">No Images Available.</h3><%
            } else if (image_counter == 1) { 
        %>
                <!-- Display the single image. -->
                <div class="d-flex justify-content-center">
                    <img src="<%= item.images.get(0) %>" alt="<%= item.images.get(0) %>" width="600" height="450" >
                </div> 
        <%
            }
            else {
                // Display multiple images in a carousel.
        %>
        <div class="d-flex justify-content-center">
            <div id="image_carousel" class="carousel slide" data-interval="false">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="<%= item.images.get(0) %>" alt="<%= item.images.get(0) %>" width="600" height="450" >
                    </div>
                    <%
                        // Cycle through each image available and add to the carousel.
                        for (int i = 0; i < image_counter; i++) {
                    %>
                    <!-- Display the images in a carousel. -->
                    <div class="carousel-item">
                        <img src="<%= item.images.get(0 + i) %>" alt="<%= item.images.get(0 + i) %>"  width="600" height="450" >
                    </div> 
                    <%
                        }
                    %>
                </div>
                <!-- These are the next and previous buttons to cycle through images. -->
                <a class="carousel-control-prev" class="btn" href="#image_carousel" data-slide="prev">
                    <span class="carousel-control-prev-icon"  style="color:white"></span>
                </a>
                <a class="carousel-control-next" class="btn" href="#image_carousel" data-slide="next">
                    <span class="carousel-control-next-icon" style="color:white"></span>
                </a>
            </div>
        </div>
        <%
        }
        %>
   
        <!-- Display the full description.-->
        <div class="d-flex justify-content-center">
            <p><%= item.getDescription() %></p>
        </div>

        <!-- Display the information about the posted item.-->
        <div class="d-flex justify-content-around">
            <p>Updated: <%= item.getUpdatedDate() %></p>
            <p>Phone: <%= item.getPhone() %></p>
            <p>E-mail: <%= item.getEmail() %></p>
        </div>
    </body>
</html>
