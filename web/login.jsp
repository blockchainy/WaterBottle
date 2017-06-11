<%-- 
    Document   : index
    Created on : Mar 1, 2017, 6:51:53 PM
    Author     : jwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Water Bottle - Sign In</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
                    <h1>Login Page</h1>
                    <%
                        String errorMessage = (String) request.getAttribute("errorM");
                        if (errorMessage != null) {
                    %>
                        <div class="alert alert-danger" role="alert"><%= errorMessage %></div>
                    <%
                        }
                    %>
                    <form action="VerifyLogin" method='POST'>
                        <div class="form-group">
                            <label>Username:</label>
                            <input type="text" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label>Password:</label>
                            <input type="password" id="password" name="password" required>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Log In">
                    </form><br>
                    <form action="signup.jsp">
                        <input type="submit" class="btn btn-default" value="Sign Up">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
