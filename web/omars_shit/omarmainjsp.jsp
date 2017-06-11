<%--
    Document   : itemdisplay
    Created on : Mar 3, 2017, 10:33:30 PM
    Author     : Omar Villasenor
--%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                margin-top: -100px;
                margin-left: -200px;
            }
        </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <title>Display Page</title>
    </head>
    <body>
        <div class="container text-center" >
            <h1><font color="white">Water Bottle Display Page</font></h1>
            <hr class="featurette divider"/>
        <div class="row featurette">
            <div class="col-md-7 col-md-push-5">
                <h2 class="featurette-heading">
                    <font color="white">Beyond Wonderland 2017</font>
                </h2>
                <p class="lead">
                    <font color="white">NOS Event Center</font>
                </p>
                <p>
                    <font color="white">3/21/17</font>
                </p>
                <p>
                    <font color="white">Ticket Price: $80</font>
                </p>
                <button type="button" class="btn btn-default">Link</button>
            </div>
            <div class="col-md-5 col-md-pull-7">
                <img class="featurette-image img-responsive center-block"
                     data-src="holder.js/500x500/auto" alt="500x500"
                     src="https://s3-us-west-2.amazonaws.com/cis311project/discovery_project_2016_beyond_wonderland_so_cal_competition_asset_1080x1080_r04.png"
                     data-holder-rendered="true">
            </div>
           
        </div>
            <hr class ="featurette-divider"/>
       
    </body>
</html>