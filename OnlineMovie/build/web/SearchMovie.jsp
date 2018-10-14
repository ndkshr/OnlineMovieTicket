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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Search movie by entering date</h1>
        <form method="post" action="SearchMovie">
            <input type="date" name="Date" placeholder="Date">
            <button type="submit">Search</button>
        </form>
    </body>
</html>
