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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>TicketStatus</h1>
        <form>
            <input type="text" name="ticketID" placeholder="Ticket ID">
            <input type="text" name="ticketName" placeholder="Name on the ticket">
            <input type="date" name="ticketDate" placeholder="Date on the ticket"><br/>
            <input type="radio" name="ticketTime" value="mrng" > Morning Show<br/>
            <input type="radio" name="ticketTime" value="noon" > Noon Show<br/>
            <input type="radio" name="ticketTime" value="even" > Evening Show<br/>
            <input type="text" name="movieCode" placeholder="Movie Code">
            <input type="submit" value="Check Status">
        </form>
    </body>
</html>
