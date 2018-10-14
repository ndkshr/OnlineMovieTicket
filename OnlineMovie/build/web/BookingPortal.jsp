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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Booking Portal</h1>
        <%
            if(request.getAttribute("BookingDet")!=null){
                ArrayList al = (ArrayList) request.getAttribute("BookingDet");
                out.println(al);
            
        %>
        <form method="post" action="BookingConfirm">
            <input type="text" name="NameTicket" placeholder="Enter your name">
            <input type="number" name="PriceTicket" placeholder="Price">
            <input type="hidden" name="DateTicket" value="<%=al.get(1)%>">
            <input type="hidden" name="TimeTicket" value="<%=al.get(2)%>">
            <input type="hidden" name="MovieCode" value="<%=al.get(0)%>">
            <input type="submit" value="Book Ticket">            
        </form>
            <p>
                Note: All tickets are of Fixed Price <strong>Rs 100/-</strong>
            </p>
        <%
            }
        %>
        <script>
           
        </script>
    </body>
</html>
