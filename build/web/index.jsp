<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <div>
        <video id="bgvid" autoplay loop poster="https://s3-us-west-2.amazonaws.com/cis311project/Calm+Water+-+HD+Background+Loop.mp4">
            <source src ="https://s3-us-west-2.amazonaws.com/cis311project/Calm+Water+-+HD+Background+Loop.mp4"
            type ="video/mp4">
        </video>
    </div>
    <style>
            video#bgvid{
                min-width: 100%;
                min-height: 100%;
                width: auto;
                height: auto;
                background: url(https://s3-us-west-2.amazonaws.com/cis311project/Calm+Water+-+HD+Background+Loop.mp4) no-repeat;
                background-size: cover;
                z-index: -100;
                position: fixed;
                top: 0;
            }
            div#divjb {
                height: 200px;
                width: 400px;
                position: fixed;
                top: 50%;
                left: 50%;
                margin-top: -150px;
                margin-left: -225px;
            }
        </style>
    <head>
        <title>Water Bottle Central</title>
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <font color="white">
        <div id="divjb">
            <div class="text-center">
        <h1 id="maintitle">Your #1</h1>
        <h1>Go To</hq>
        <h1><font size="13">Bottled Water</font></h1>
        <h1>Central</h1>
        </font>
        <br>
        <form action="login.jsp">
            <input type="submit" class="btn btn-default" value="START RATING">
        </form> 
        <br>
        <form action="DisplayImagesR">
            <input type="submit" class="btn btn-default" value="READ REVIEWS">
        </form>
            </div>
        </div>
    </body>
</html>
