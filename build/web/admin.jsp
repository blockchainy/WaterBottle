<%-- 
    Document   : admin
    Created on : Mar 4, 2017, 11:28:16 PM
    Author     : jwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Water Bottle - Admin</title>
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
                    <h1>Admin</h1>
                    <%
                    String error = (String) request.getAttribute("error");
                    if (error != null) {
                    %>
                    <div class="alert alert-danger" role="alert"><%= error %></div>

                    <%
                        }
                    %>
                    <form action="AddItem" method="POST">
                        <div class="form-group">
                            <label>Name:</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label>Image:</label>
                            <input type="text" id="image" name="image">
                        </div>
                        <div class="form-group">
                            <label>Water ID:</label>
                            <input type="text" id="waterid" name="waterid" required>
                        </div>
                        <button class="btn btn-primary" type="submit">Submit Item</button>
                    </form>
                </div>
            </div>  
        </div>
    </body>
</html>
