<%-- 
    Document   : display
    Created on : Mar 4, 2017, 10:26:43 PM
    Author     : jwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Water Bottle - Display</title>
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
                    <h1>Review</h1>
                    <%

                     String name = (String) request.getAttribute("name");
                     String image = (String) request.getAttribute("image");
                     String[] reviews = (String[]) request.getAttribute("reviews");
                     String[] tastes = (String[]) request.getAttribute("tastes");
                     String[] grips = (String[]) request.getAttribute("grips");
                     String[] openings = (String[]) request.getAttribute("openings");

                     if (image != null) {

                     %>
                     <div class="col-md-6">
                         <img style="display:block;margin-left:auto;margin-right:auto" class="img-responsive" src="water_images/<%= image %>">

                     <%
                         }
                     %>
                        <h3 style="text-align:center"><%= name %></h3>
                     </div>
                     <%

                     for (int i = 0; i < reviews.length; i++) {

                     %>
                     <div class="col-md-6">
                        <h4>-"<%= reviews[i] %>"</h4>
                     </div>

                     <%

                         }
                     %>
                </div>
            </div>
        </div>
    </body>
</html>
