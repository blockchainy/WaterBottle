<%-- 
    Document   : signup
    Created on : Mar 1, 2017, 7:18:07 PM
    Author     : jwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Water Bottle - Sign Up</title>
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
                    <h1>Signup</h1>
                    <%
                    String errorMessage = (String) request.getAttribute("errorMessage");

                    if (errorMessage != null) {
                    %>
                    <div class="alert alert-danger" role="alert"><%= errorMessage %></div>
                    <%
                        }
                    %>
                    <form action="VerifySignup" method='POST'>
                        <div class="form-group">
                            <input type="text" id="username" name="username" placeholder="Username" required>
                        </div>
                            
                        <div class="form-group">
                            <input type="text" id="email" name="email" placeholder="Email here" required>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" id="pass" name="pass" placeholder="Password" required>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" id="repeat-pass" name="repeat-pass" placeholder="Repeat password" required>
                        </div>

                        <button class="btn btn-primary" type="submit">Sign Up</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
