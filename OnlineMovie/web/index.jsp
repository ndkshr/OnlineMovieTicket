<%-- 
    Document   : index
    Created on : 22 Oct, 2018, 10:00:42 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Movie Tickets</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
    </head>
    <body>
        <div class="container">
            <h1>Movie Tickets </h1>
            <a href="SearchMovie.jsp"><button class="btn btn-primary">Search Movies</button></a>
            <a href="TicketStatus.jsp"><button class="btn btn-warning">Check Ticket Status</button></a>
        </div>
        
        <br/>
        <br/>
        <div>
          <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                url = "jdbc:mysql://localhost/onlinemovie"
                user = "root"  password = "2414nandu"/>

          <sql:query dataSource = "${snapshot}" var = "result">
             select movies.movieCode, movieName, movieLang, movieDate, movieTime, movieSeats from movies, movieshows where movies.movieCode = movieshows.movieCode;
          </sql:query>

         <div class="container">
             <h3>Available Movies</h3>
             <table class="table table-hover">
             <tr>
                <th>Movie Code</th>
                <th>Movie Name</th>
                <th>Language</th>
                <th>Date</th>
                <th>Show Timing</th>
                <th>Seats Left</th>
             </tr>

             <c:forEach var = "row" items = "${result.rows}">
                <tr>
                   <td><c:out value = "${row.movieCode}"/></td>
                   <td><c:out value = "${row.movieName}"/></td>
                   <td><c:out value = "${row.movieLang}"/></td>
                   <td><c:out value = "${row.movieDate}"/></td>
                   <td><c:out value = "${row.movieTime}"/></td>
                   <td><c:out value = "${row.movieSeats}"/></td>
                </tr>
             </c:forEach>
          </table>
                
        </div>
        
    </body>
</html>
