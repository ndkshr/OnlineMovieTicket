<%-- 
    Document   : SearchResult
    Created on : 14 Oct, 2018, 8:05:50 PM
    Author     : Owner
--%>
<%@ page import="java.util.*" %>
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
        <h1>Movies on <%= request.getAttribute("dateMovie")%></h1>
        <form method="post" action="BookTicket">
            <table class="table table-striped">

            <tr>
                <td><b>Movie code</b></td>
                <td><b>Date</b></td>
                <td><b>Show</b></td>
                <td><b>Seats Left</b></td>  
                <td></td>
            </tr>
            <%
                int count = 0;
                int seats;
                String color = "#F9EBB3";
                if (request.getAttribute("searchResult") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("searchResult");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
                        count ++;
                        ArrayList movies = (ArrayList) itr.next();
                        
            %>
            <tr>
                <td><%=movies.get(0)%></td>
                <td><%=movies.get(1)%></td>
                <td><%=movies.get(2)%></td>
                <td><%=movies.get(3)%></td>
                <input type="hidden" name="dateMovie" value="<%=request.getAttribute("dateMovie")%>">
                <%if(Integer.parseInt((String)movies.get(3))>0)
                {%>
                <td><button type="submit" name="bookCode" value="<%=movies.get(0)%>" class="btn btn-info">Book Ticket</button></td>
                <%}
                else{ %>
<td><button type="button" class="btn btn-danger">House Full</button></td>                <%}%>
            </tr>
            <%
                    }
                }
                if (count == 0) {
            %>
            <tr>
                <td><b>Sorry No movies found..</b></td>
            </tr>
            <%            }
            %>
        </table>
       </form>
        </div>
        
        <div class="container">
            <a href="index.jsp"><button type="button" class="btn btn-default">Back to home</button></a>            
        </div>
    </body>
</html>
