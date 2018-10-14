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
            //String q = "select * from movies";
            //ResultSet rset = stmt.executeQuery(q);
    
           
            String movieShow = req.getParameter("MovieShow");
            String ticketNo = req.getParameter("TicketNo");
            String nameOnTicket = req.getParameter("Name");
            String dateOnTicket = req.getParameter("Date");
            String movieCode = req.getParameter("MovieCode");
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TicketStatus</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>MovieShow :: " + movieShow +" :: "+ ticketNo + "</h1>");
            out.println("<h1>Name :: " + nameOnTicket + "</h1>");
            out.println("<h1>Date :: " + dateOnTicket + "</h1>");
            out.println("<h1>Movie Code :: " + movieCode + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TicketStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
