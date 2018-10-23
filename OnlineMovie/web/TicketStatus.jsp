<%-- 
    Document   : TicketStatus
    Created on : 15 Oct, 2018, 5:54:18 AM
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
        <div class="container-fluid">
        <h1>TicketStatus</h1>
        <form method="post" action="TicketStatus">
            <div class=" form-group row">
            <div class="col-xs-4">
                <input type="text" name="ticketID" placeholder="Ticket ID" class="form-control">
            </div>
            <div class="col-xs-4">
                <input type="text" name="ticketName" placeholder="Name on the ticket" class="form-control">
            </div>
            </div>
            <button type="submit" value="Check Status" class="btn btn-primary">Check Status</button>
            <a href="index.jsp"><button type="button" class="btn btn-default">Back to home</button></a>            
        </form>
        </div>
    </body>
</html>
