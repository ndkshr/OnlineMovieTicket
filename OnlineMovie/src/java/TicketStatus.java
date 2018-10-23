/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TicketStatus extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    public Connection getConnection() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinemovie", "root", "2414nandu");
        return conn;
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = res.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            Connection conn = getConnection();
            Statement stmt = conn.createStatement();
               
            out.println("<!DOCTYPE html>");
            out.println("<html>");
           
            String ticketID = req.getParameter("ticketID");
            String ticketName = req.getParameter("ticketName");
            String[] arrayID = ticketID.split("-");
            String movieCode = arrayID[0];
            String movieTime = arrayID[1];
            String movieDate = arrayID[2] + "-" + arrayID[3] + "-" + arrayID[4];

            String q = "select * from movietickets where ticketID='"+ ticketID +"' and ticketName='"+ ticketName +"'";
            ResultSet rset = stmt.executeQuery(q);
            
            if(rset.next()){
            
            ArrayList r1 = null;
            ArrayList resultList = new ArrayList();
            int count = rset.getMetaData().getColumnCount();         
            while(rset.next()){
                r1 = new ArrayList();
                for(int i=1;i<=count;i++)
                    r1.add(rset.getString(i));
                resultList.add(r1);
                out.println("<h3>"+r1+"</h3>");
            }
            
            Statement stmt1 = conn.createStatement();
            ResultSet movieNameSet = stmt1.executeQuery("select * from movies where movieCode='"+ movieCode +"'");
            movieNameSet.next();
            String movieName = movieNameSet.getString(1);
            
            out.println("<head>");
            out.println("<title>Servlet TicketStatus</title>");    
            out.println("<!-- Latest compiled and minified CSS -->\n" +
"        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n" +
"\n" +
"        <!-- jQuery library -->\n" +
"        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n" +
"\n" +
"        <!-- Latest compiled JavaScript -->\n" +
"        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='container-fluid'>");
            out.println("<form method='post' action='CancelTicket'>");
            out.println("<h1>Name :: " + ticketName + "</h1>");
            out.println("<h1>Ticket ID :: " + ticketID + "</h1>");
            out.println("<h1>Movie Name :: " + movieName + "</h1>");
            
            out.println("<input type='hidden' name='ticketID' value='"+ ticketID +"'>");
            
            out.println("<a href='index.jsp'><button type='button' class='btn btn-default'>Go Back</button></a>");
            out.println("<button type='submit' class='btn btn-danger'>Cancel Ticket</button>");
            
            out.println("</form>");
            }
            else{
                out.println("Invalid ticket details!!");
            }
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TicketStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     *
     * @return
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
