<%-- 
    Document   : review
    Created on : Mar 4, 2017, 6:33:06 PM
    Author     : jwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Water Bottle - Reviews</title>
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
                    String waterid = (String) request.getAttribute("waterid");

                    if (image != null) {



                    %>
                    <div class="col-md-6">
                        <img style="display:block;margin-left:auto;margin-right:auto" class="img-responsive" src="water_images/<%= image %>.jpg">
                        <h3 style="text-align:center"><%= name %></h3>
                    </div>


                    <%    

                        }
                    %>
                    <div class="col-md-6">

                        <br>

                        <form action="SubmitReview?id=<%= waterid %>" method='POST'>
                            <div class="form-group">
                                <label>Taste:</label>
                                <select name="taste" required>
                                    <option value="good">Great</option>
                                    <option value="ok">Ok</option>
                                    <option value="bad">Bad</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Grip:</label>
                                <select name="grip" required>
                                    <option value="good">Great</option>
                                    <option value="ok">Ok</option>
                                    <option value="bad">Bad</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label>Bottle Head Opening:</label>
                                <select name="opening" required>
                                    <option value="good">Great</option>
                                    <option value="ok">Ok</option>
                                    <option value="bad">Bad</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label>Write your own review!</label><br>
                                <textarea rows="3" cols="50" <input type="text" id="review" name="review"></textarea>
                            </div>
                            
                            <button class="btn btn-success" type="submit">Post Review</button>

                        </form><br>

                        <form action="DisplayImagesR">
                            <button class="btn btn-default" type="submit">Read Reviews</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
