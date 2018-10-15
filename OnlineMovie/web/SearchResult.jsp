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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Search Results</h1>
        <form method="post" action="BookTicket">
         <table style="border:1px solid #000000;">
            <tr>
                <td colspan=4 align="center"
                    style="background-color:#FA2379">
                    <b>Movies on <%= request.getAttribute("dateMovie")%></b></td>
            </tr>
            <tr style="background-color:lightgrey;">
                <td><b>Movie code</b></td>
                <td><b>Date</b></td>
                <td><b>Show</b></td>
                <td><b>Seats Left</b></td>                
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
            <tr style="background-color:<%=color%>;">
                <td><%=movies.get(0)%></td>
                <td><%=movies.get(1)%></td>
                <td><%=movies.get(2)%></td>
                <td><%=movies.get(3)%></td>
                <input type="hidden" name="dateMovie" value="<%=request.getAttribute("dateMovie")%>">
                <%if(Integer.parseInt((String)movies.get(3))>0)
                {%>
                <td><button type="submit" name="bookCode" value="<%=movies.get(0)%>">Book Ticket</button></td>
                <%}
                else{ %>
                <td>House Full</td>
                <%}%>
            </tr>
            <%
                    }
                }
                if (count == 0) {
            %>
            <tr>
                <td colspan=4 align="center"
                    style="background-color:#eeffee"><b>Sorry No movies found..</b></td>
            </tr>
            <%            }
            %>
        </table>
       </form>
    </body>
</html>
