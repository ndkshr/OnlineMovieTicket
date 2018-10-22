<%-- 
    Document   : index
    Created on : 22 Oct, 2018, 10:00:42 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Movie Tickets</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Movie Tickets JSP</h1>
        <a href="SearchMovie.jsp"><button>Search Movies</button></a>
        <a href="TicketStatus.jsp"><button>Check Ticket Status</button></a>
        
        <div>
          <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                url = "jdbc:mysql://localhost/onlinemovie"
                user = "root"  password = "2414nandu"/>

          <sql:query dataSource = "${snapshot}" var = "result">
             select * from movies;
          </sql:query>

          <table border = "1" width = "100%">
             <tr>
                <th>Movie Code</th>
                <th>Movie Name</th>
                <th>Language</th>
             </tr>

             <c:forEach var = "row" items = "${result.rows}">
                <tr>
                   <td><c:out value = "${row.movieCode}"/></td>
                   <td><c:out value = "${row.movieName}"/></td>
                   <td><c:out value = "${row.movieLang}"/></td>
                </tr>
             </c:forEach>
          </table>
                
        </div>>
        
    </body>
</html>
