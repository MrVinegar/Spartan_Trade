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
            Category &middot;
        </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
        <script src="http://malsup.github.com/jquery.form.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
<link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/w3school-edited.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">


        <%@page import="Object.STList_SR"%>
        <%@page import="Object.STPagination"%>
        <%
            STPagination SearchResult = (STPagination) request.getAttribute("SearchResult");
        %>
        <style>
            /* note: this is a hack for ios iframe for bootstrap themes shopify page */
            /* this chunk of css is not part of the toolkit :) */
            body {
                width: 1px;
                min-width: 100%;
                *width: 100%;
            }
            #batman {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.20);
                border-radius:14px;
                background-image: url('assets/img/avatar-dhg.png');
                background-position: center;
            }
        </style>
    </head>

    <body>
        <div class="with-iconav">
            <div class="container">
                <div class="row">
                    <%@ include file="SideBar.jspf"%>

                    <div class="col-md-9 content">
                        <div class="container">
                            <div class="dashhead">
                                <div class="dashhead-titles">
                                    <h6 class="dashhead-subtitle">Dashboards</h6>
                                    <h3 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Category</h3>
                                </div>

                            </div>

                            <ul class="nav nav-bordered mt-4 mt-md-2 mb-0 clearfix" role="tablist">

                                <li class="nav-item" role="presentation">
                                    <a href="#thumb" class="nav-link active" role="tab" data-toggle="tab" aria-controls="thumb">View Items</a>
                                </li>
                            </ul>

                            <hr class="mt-0 mb-5">

                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="thumb">
                                    <div class="row statcards">
                                        <%
                                            int totalPages = SearchResult.getTotalPages() - 1;
                                            STList_SR x = null;
                                            for (Object o : SearchResult.getContent()) {
                                                STList_SR sr = (STList_SR) o;
                                                x = (STList_SR) o;
                                        %>

                                        <div class="col-md-6 col-lg-12 mb-md-3">
                                            <div class="statcard">
                                                <div class="m-0">
                                                    <h2 class=" text-shadow"><%=sr.getTitle()%></h2>
                                                    <span><small class="badge badge-danger badge-pill">$<%= sr.getPrice()%></small></span>
                                                    <p class=" mt-3 text-muted">
                                                        <%= sr.getDescription()%>
                                                    </p>
                                                    <a href="Search?code=STitem&itemid=<%=sr.getItemId()%>&To=203" class="badge badge-primary">See Details</a>
                                                </div>
                                            </div>
                                            <hr class="visible-xs">
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>

                                    <!-- Pagination for the category page.-->
                                    <div class="d-flex justify-content-center">
                                        <nav>
                                            <ul class="pagination">                                         
                                                <%
                                                    for (int i = 0; i <= totalPages; i++) {
                                                %>
                                                <li class="page-item"><a class="page-link" href="Search?code=STSR&category=<%= x.getCategoryId() %>&page=<%= i%>&To=202"> <%= i + 1%> </a></li>
                                                    <%
                                                        }
                                                    %>                                                
                                            </ul>
                                        </nav>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="assets/js/tether.min.js"></script>
        <script src="assets/js/chart.js"></script>
        <script src="assets/js/tablesorter.min.js"></script>
        <script src="assets/js/toolkit.js"></script>
        <script src="assets/js/application.js"></script>
        <script>
        // execute/clear BS loaders for docs
        $(function () {
            while (window.BS && window.BS.loader && window.BS.loader.length) {
                (window.BS.loader.pop())();
            }
        });
        </script>
    </body>
</html>