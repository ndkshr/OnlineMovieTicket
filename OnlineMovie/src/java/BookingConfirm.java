/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Owner
 */
public class BookingConfirm extends HttpServlet {

    public Connection getConnection() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinemovie", "root", "2414nandu");
        return conn;
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String nameTicket = request.getParameter("NameTicket");
            String dateTicket = request.getParameter("DateTicket");
            String timeTicket = request.getParameter("TimeTicket");
            String movieCode = request.getParameter("MovieCode");
            String ticketID;
            Random rand = new Random();
            ticketID = movieCode + "-" + timeTicket + "-" + dateTicket + "-" + (rand.nextInt(1000)+1000);
            out.println(nameTicket + " - "
                    + dateTicket + " - "
                    + timeTicket + " - "
                    + movieCode + " - ");
            out.println("<h1>"+ticketID+"</h1>");
            
            Connection conn = getConnection();
            Statement st1 = conn.createStatement();
            String query = "insert into movietickets value('"+(ticketID)+"', '"+(nameTicket)+"', '"+(dateTicket)+"', '"+(timeTicket)+"', '"+(movieCode)+"')";
            int result1 = st1.executeUpdate(query);
            
            query = "update movieshows set movieSeats=movieSeats-1 where movieCode='"+(movieCode)+"' and movieDate='"+(dateTicket)+"' and movieTime='"+(timeTicket)+"'";
            Statement st2 = conn.createStatement();
            int result2 = st2.executeUpdate(query);
            
            out.println(result1 +"--"+ result2);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(BookingConfirm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookingConfirm.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(BookingConfirm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookingConfirm.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
