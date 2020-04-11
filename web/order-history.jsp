<%@page import="Object.STList_ITEM"%>
<%@page import="Object.STPagination"%>
<%@page import="Control.Account.Account"%>
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
            Order history &middot; 
        </title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>       

        <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic" rel="stylesheet">
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">

        <%

            Account acc = new Account(request, response);
            if (!acc.checkIsSignIn()) {
                response.sendRedirect("index.jsp");
            }

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
        </style>
    </head>


    <body>
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
                                <li class="nav-header">User Account</li>
                                <li class="nav-item">
                                    <a class="nav-link" href="index.jsp">Welcome!
                                        <button class="btn btn-default navbar-btn navbar-btn-avatar ml-2" data-toggle="popover" >
                                            <img class="rounded-circle" src="../acc/docs/assets/img/avatar-dhg.png">
                                        </button>
                                    </a>

                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="index.jsp">Overview</a>
                                </li>


                                <li class="nav-item">
                                    <a class="nav-link active" href="">Order History</a>
                                </li>

                                <li><hr class="visible-xs mt-3"></li>


                                <li class="nav-header">Action</li>
                                <li class="nav-item">
                                    <a class="nav-link" href="SubmitByUser.jsp">
                                        Post a item
                                    </a>
                                </li>
                                
                            </ul>
                            <hr class="visible-xs mt-3">
                        </div>
                    </nav>
                </div>
                <div class="col-md-9 content">
                    <div class="dashhead">
                        <div class="dashhead-titles">
                            <h6 class="dashhead-subtitle">Dashboards</h6>
                            <h2 class="dashhead-title mb-3" style=" font-weight: 500;">Order history</h2>
                        </div>


                    </div>

                    <div class="flextable table-actions">

                        <div class="flextable-item"></div>
                        <div class="flextable-item"></div>

                        <!--                        <div class="flextable-item">
                                                    <div class="btn-toolbar-item input-with-icon">
                                                        <input type="text" class="form-control input-block" placeholder="Search orders">
                                                        <span class="icon icon-magnifying-glass"></span>
                                                    </div>
                                                </div>-->

                    </div>

                    <div class="table-responsive">
                        <table class="table" data-sort="table">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Description</th>
                                    <th>Date</th>
                                    <th>Total</th>
                                    <th>Edit</th>
                                </tr>
                            </thead>

                            <%                                
                                for (Object o : SearchResult.getContent()) {
                                    STList_ITEM sr = (STList_ITEM) o;
                            %>
                            <tbody>
                                <tr>
                                    <td><%= sr.getTitle() %></td>
                                    <td><%= sr.getDescription() %></td>
                                    <td><%= sr.getCreatedDate() %></td>
                                    <td><%= sr.getPrice() %></td>
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-outline-primary">
                                                <span class="icon icon-pencil"></span>
                                            </button>
                                            <button type="button" class="btn btn-outline-primary">
                                                <span class="icon icon-erase"></span>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <%    
                                    }
                                %>

                            </tbody>
                        </table>
                    </div>

                    <div class="text-center">
                        <nav>
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>

                </div>
            </div>
        </div>

        <div id="docsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Example modal</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <p>You're looking at an example modal in the dashboard theme.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cool, got it!</button>
                    </div>
                </div>
            </div>
        </div>


        <!--<script src="../assets/js/jquery.min.js"></script>-->
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

