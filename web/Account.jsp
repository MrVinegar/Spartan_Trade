<%@page import="Object.STList_SR"%>
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
            Listing History &middot; 
        </title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>       

<link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
<link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">

        <%

            Account accCheck = new Account(request, response);
            if (!accCheck.checkIsSignIn()) {
                response.sendRedirect("Home.jsp");
            }

            STPagination SearchResult = (STPagination) request.getAttribute("SearchResult");
        %>
        <style>
            /* note: this is a hack for ios iframe for bootstrap themes shopify page */
            /* this chunk of css is not part of the toolkit :) */
            #post {
                display: none;
            }
            table.fixed { table-layout:fixed; }
            table.fixed td { overflow: hidden; white-space:nowrap ; 
                             text-overflow: ellipsis;}
            td:hover {overflow: visible;}

        </style>
    </head>

    <body>
        <div class="container">
            <div class="row">
                <%@ include file="SideBar.jspf"%>
                <div class="col-md-9 content">
                    <div class="dashhead">
                        <div class="dashhead-titles">
                            <h6 class="dashhead-subtitle">Dashboards</h6>
                            <h2 class="dashhead-title mb-3" style=" font-weight: 500;">Listing History</h2>
                        </div>
                    </div>

                    <div class="flextable table-actions">
                        <div class="flextable-item"></div>
                        <div class="flextable-item"></div>
                    </div>

                    <div class="table-responsive">
                        <table class="table fixed" data-sort="table">
                            <col width="30px" />
                            <col width="50px" />
                            <col width="18px" />
                            <col width="10px" />
                            <col width="10px" />
                            <thead>
                                <tr>
                                    <th style="color: white">Title</th>
                                    <th style="color: white">Description</th>
                                    <th style="color: white">Date</th>
                                    <th style="color: white">Total</th>
                                    <th style="color: white">Edit</th>
                                </tr>
                            </thead>
                            <%                               
                                int totalPages = SearchResult.getTotalPages() - 1;
                                System.out.println("total =" +totalPages);
                                STList_ITEM x = null;
                                for (Object o : SearchResult.getContent()) {
                                    STList_ITEM sr = (STList_ITEM) o;
                                    x = (STList_ITEM) o;
                            %>
                            <tbody>
                                <tr>
                                    <td style="color: white"><%= sr.getTitle()%></td>
                                    <td style="color: white"><%= sr.getDescription()%></td>
                                    <td style="color: white"><%= sr.getUpdatedDate()%></td>
                                    <td style="color: white"><%= sr.getPrice()%></td>
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-outline-primary" onclick="window.location.href = 'Search?code=URitem&itemID=<%=sr.getItemId()%>&To=206'"> 
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


                </div>
            </div>
        </div>


        <!-- Pagination for the account page.-->
        <div class="d-flex justify-content-center">
            <nav>
                <ul class="pagination">                                         
                    <%
                        int pages = SearchResult.getTotalPages();
                        for (int i = 0; i < pages; i++) {
                    %>
                    <!--<li><a href="Search?code=URSR&To=204&page=<%=i%>"><%=i + 1%></a></li>-->
                    <li class="page-item"><a class="page-link" href="Search?code=URSR&To=204&page=<%=i%>"> <%= i + 1%> </a></li>

                        <%
                            }
                        %>                                                
                </ul>
            </nav>
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

