<%-- 
    Document   : searchresults
    Created on : Mar 7, 2017, 10:30:39 PM
    Author     : jwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Water Bottle - Search Results</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        
        
    </head>
    <body>
        <div class="container" style="margin-top: 50px">
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="container">
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="login.jsp">Login</a></li>
                            <li><a href="/WaterBottle/DisplayImagesR">Read Review</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="container navbar-spacing">
                <div class="container-fluid">
                    <h1>Search Results</h1>
                    <form action="SearchWater" method='GET'>
                        <label>Search:</label><input type="text" id="search" name="search" placeholder="E.g. Dasani">
                        <button type="submit" class="btn btn-default">Search</button>
                    </form>

                    <%

                    String name = (String) request.getAttribute("singleBottleName");
                    String id = (String) request.getAttribute("singleBottleId");
                    String image = (String) request.getAttribute("singleBottleImage");

                    String error = (String) request.getAttribute("error");
                    if (error != null) {
                    %>
                    <div class="alert alert-danger" role="alert"><%= error %></div>
                    <%
                        } else {
                    %>
                    <div class="container">
                        <div class="col-xs-4">
                            <a href="GetId?id=<%= id %>">
                                <img style="display:block;margin-left:auto;margin-right:auto" src="water_images/<%= image %>" height="300" width="250">
                            </a><br><h3 style="text-align:center"><%= name %></h3>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
