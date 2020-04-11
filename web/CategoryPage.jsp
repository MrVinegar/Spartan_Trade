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

            Icon nav &middot;

        </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
        <script src="http://malsup.github.com/jquery.form.js"></script>

        <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic" rel="stylesheet">
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/w3school-edited.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">


        <%@page import="Object.STList_SR"%>
        <%@page import="Object.STPagination"%>
        <%
//            ArrayList<STList_SR> SearchResult = (ArrayList<STList_SR>) request.getAttribute();

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
                    <div class="col-md-3 sidebar">
                        <nav class="sidebar-nav">
                            <div class="sidebar-header">
                                <button class="nav-toggler nav-toggler-md sidebar-toggler" type="button" data-toggle="collapse" data-target="#nav-toggleable-md">
                                    <span class="sr-only">Toggle nav</span>
                                </button>
                                <a class="sidebar-brand img-responsive" href="index.jsp">
                                    <span class="icon sidebar-brand-icon"><img src="spartan_logo.png" alt=""></span>

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
                                            <a class="nav-link" href="acc/docs/index.html">
                                                Welcome!
                                                <button class="btn btn-default navbar-btn navbar-btn-avatar ml-2" data-toggle="popover" >
                                                    <img class="rounded-circle" src="acc/docs/assets/img/avatar-dhg.png">
                                                </button>
                                            </a>

                                        </li>
                                        <!-- <li class="nav-item">

                                        </li> -->

                                        <li class="nav-item">
                                            <a class="nav-link active" href="index.html">Overview</a>
                                        </li>

                                        <li class="nav-item">
                                            <a class="nav-link" href="" onclick="harman()" >List an Item</a>
                                        </li>

                                        <li class="nav-item">
                                            <a class="nav-link " href="order-history/order-history.html">Order History</a>
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
                                            <a class="nav-link " data-toggle="modal" data-target="#exampleModalCenter">SIGN UP/LOGIN</a>
                                        </li>

                                        <div class  ="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog" role="document" >
                                                <div class="modal-content">
                                                    <div class="modal-header" >
                                                        <h5 class="modal-title" id="exampleModalCenterTitle">Login/Sigh UP</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">

                                                        <div class="container-content-middle">
                                                            <form role="form" class="mx-auto text-center app-login-form">

                                                                <a href="../index.html" class="app-brand mb-5">
                                                                    <img src="../spartan_logo.png" alt="brand">
                                                                    <!-- ../assets/img/brand.png -->
                                                                </a>
                                                                <section id="main_form">
                                                                    <div class="form-group">
                                                                        <input class="form-control" placeholder="Username" required>
                                                                    </div>

                                                                    <div class="form-group mb-3">
                                                                        <input type="password" class="form-control" placeholder="Password" required>
                                                                    </div>

                                                                    <div class="mb-5">
                                                                        <button class="btn btn-primary" onclick="showStuff('user_panel', 'main_panel')" data-dismiss="modal" aria-label="Close">Log In</button>
                                                                        <button class="btn btn-secondary" onclick="showStuff('hidden_form', 'main_form')">Sign up</button>
                                                                    </div>

                                                                    <footer class="screen-login">
                                                                        <a href="#" class="text-muted">Forgot password</a>
                                                                    </footer>
                                                                </section>

                                                                <section id="hidden_form">
                                                                    <div class="form-group">
                                                                        <input class="form-control" placeholder="Username" required>
                                                                    </div>

                                                                    <div class="form-group mb-3">
                                                                        <input type="password" class="form-control" placeholder="Password" required>
                                                                    </div>

                                                                    <div class="form-group mb-3">
                                                                        <input type="email" class="form-control" placeholder="E-mail" required>
                                                                    </div>

                                                                    <div class="mb-5">
                                                                        <button class="btn btn-secondary" onclick="showStuff('main_form', 'hidden_form')">Go back to Login</button>
                                                                        <button class="btn btn-primary">Sign up</button>
                                                                    </div>
                                                                </section>

                                                            </form>
                                                        </div>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- <li class="nav-item">
                                          <a class="nav-link "href="fluid/index.html"></a>

                                        </li> -->
                                        <li class="nav-item">
                                            <a class="nav-link " href="order-history/index.html">Service Request</a>
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


                        <div class="container">
                            <div class="dashhead">
                                <div class="dashhead-titles">
                                    <h6 class="dashhead-subtitle">Dashboards</h6>
                                    <h3 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Category</h3>
                                </div>

                            </div>

                            <ul class="nav nav-bordered mt-4 mt-md-2 mb-0 clearfix" role="tablist">

                                <li class="nav-item" role="presentation">
                                    <a href="#thumb" class="nav-link active" role="tab" data-toggle="tab" aria-controls="thumb">Thumb</a>
                                </li>
                            </ul>

                            <hr class="mt-0 mb-5">

                            <div class="tab-content">

                                <%                                    int totalPages = SearchResult.getTotalPages() - 1; //2
                                    int currentPage = SearchResult.getCurrentPage();
                                    for (Object o : SearchResult.getContent()) {
                                        STList_SR sr = (STList_SR) o;
                                %>

                                <div role="tabpanel" class="tab-pane active" id="thumb">
                                    <div class="row statcards">
                                        <div class="col-md-6 col-lg-12 mb-md-3">
                                            <div class="statcard">

                                                <div class="m-0">

                                                    <h2 class=" text-shadow"><%=sr.getTitle()%></h2>
                                                    <span><small class="badge badge-danger badge-pill"><%=sr.getUpdatedDate()%></small></span>
                                                    <p class=" mt-3 text-muted">
                                                        Description.
                                                    </p>
                                                    <a href="Search?code=STitem&itemid=<%=sr.getItemId()%>" class="badge badge-primary">See Details</a>
                                                </div>
                                            </div>
                                            <hr class="visible-xs">
                                        </div>
                                        <%     }
                                        %>
                                    </div>
                                    <ul class="pagination">
                                        <%
                                            for (int i = 0; i <= totalPages; i++) {
                                        %>
                                        <li class="active"><a href="Search?code=STSR&category=1&page=<%= i%>"><%= i + 1%></a></li>
                                        <li></li>
                                            <%
                                                }
                                            %>
                                    </ul>
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
                                                                                    (window.BS.loader.pop())()
                                                                                }
                                                                            })
        </script>
    </body>
</html>