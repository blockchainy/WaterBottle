<%-- 
    Document   : displaytext
    Created on : Mar 5, 2017, 8:01:54 PM
    Author     : jwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Water Bottle - Main</title>
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
                    <h1>Display Water - Review</h1>
                    <form action="SearchWater" method='GET'>
                        <label>Search:</label><input type="text" id="search" name="search" placeholder="E.g. Dasani">
                        <button type="submit" class="btn btn-default">Search</button>
                    </form>

                    <div class="container">
                        <%
                            String[] images = (String[]) request.getAttribute("image");
                            String[] waterids = (String[]) request.getAttribute("waterid");
                            String[] names = (String[]) request.getAttribute("name");

                            if (images != null) {
                                for (int i = 0; i < images.length; i++) {

                        %>

                        <div class="col-xs-4">
                            <a style="margin: 0 auto;" href="GetId?id=<%= waterids[i]%>">
                                <img style="display:block;margin-left:auto;margin-right:auto" src="water_images/<%= images[i]%>" height="300" width="250">
                            </a>
                            <h3 style="text-align:center"><%= names[i] %></h3>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
