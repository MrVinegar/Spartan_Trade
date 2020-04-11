<%-- 
    Document   : UploadImage
    Created on : Mar 24, 2020, 3:45:50 PM
    Author     : harmanbains
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Upload Image</title>
    </head>
    <body>
        <div class="container">
            <h1>Upload images below</h1>

            <!-- UPDATE THE PAGE NAME HERE -->
            <form action="/ENTER PAGE HERE">

                <%
                    int maxImages = 5;
                    for (int i = 0; i < maxImages; i++) {
                %>	
                <!-- Only accept image files.-->
                <input type="file" id="imageFile<%=i%>" name="image<%=i%>" accept=".jpg, .jpeg, .png, .gif">
                <%
                    }
                %>
                <br>
                <div class="mt-3">
                    <button type="submit" class="btn btn-success">Submit</button>
                    <button type="reset" class="btn btn-danger">Reset Images</button>
                </div>
            </form>	
        </div>

    </body>
</html>
