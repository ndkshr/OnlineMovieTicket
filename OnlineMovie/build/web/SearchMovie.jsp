<%-- 
    Document   : SearchMovie
    Created on : 14 Oct, 2018, 7:48:03 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

             
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
        <h1>Search movie by entering date</h1>
        <form method="post" action="SearchMovie">
            
            <div class="form-group row">
                <div class="col-xs-2">
                    <label for="Date">Enter preferred Date </label>
                    <input type="date" name="Date" placeholder="Date" id="Date" class="form-control">
                </div>
            </div>
            <button type="submit" class="btn btn-success">Search</button>
            <a href="index.jsp"><button type="button" class="btn btn-default">Back to home</button></a>            
        </form>
        </div>
        
        <div class="container">
            
        </div>
        
    </body>
</html>
