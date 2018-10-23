<%-- 
    Document   : BookingPortal
    Created on : 14 Oct, 2018, 9:15:32 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

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
        <h1>Booking Portal</h1>
        <%
            if(request.getAttribute("BookingDet")!=null){
                ArrayList al = (ArrayList) request.getAttribute("BookingDet");
                out.println("<h4>Movie Code :: "+al.get(0)+"</h4>");
                out.println("<h4>Movie Date :: "+al.get(1)+"</h4>");
                out.println("<h4>Movie Time :: "+al.get(2)+"</h4>");
            
        %>
        <form method="post" action="BookingConfirm">
            <div class="form-group row">
            <div class="col-xs-2">
            <label for="NameTicket">Enter Your Name </label>
            <input type="text" name="NameTicket" placeholder="Name" class="form-control">
            </div>
            <div class="col-xs-2">
            <label for="Priceticket">Price </label>
            <input type="number" name="PriceTicket" placeholder="Price" class="form-control">
            </div>
            </div>
            <input type="hidden" name="DateTicket" value="<%=al.get(1)%>">
            <input type="hidden" name="TimeTicket" value="<%=al.get(2)%>">
            <input type="hidden" name="MovieCode" value="<%=al.get(0)%>">
            <button type="submit" value="Book Ticket" class="btn btn-success">Book Ticket</button>
        </form>
            
            <br/>
            <p>
                Note: All tickets are of Fixed Price <strong>Rs 100/-</strong>
            </p>
        <%
            }
        %>
        <script>
           
        </script>
        </div>
    </body>
</html>
