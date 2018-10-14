
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;


public class SearchMovie extends HttpServlet {
    
    public Connection getConnection() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinemovie", "root", "2414nandu");
        return conn;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = res.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            
            String dateMovie = req.getParameter("Date");
            
            out.println(dateMovie);
            
            req.setAttribute("dateMovie", dateMovie);
            
            String q = "select * from movieshows where movieDate='" + dateMovie+"'";
            ResultSet rset = stmt.executeQuery(q);
            
            ArrayList r1 = null;
            ArrayList resultList = new ArrayList();
            int count = rset.getMetaData().getColumnCount();         
            while(rset.next()){
                r1 = new ArrayList();
                for(int i=1;i<=count;i++)
                    r1.add(rset.getString(i));
                resultList.add(r1);
            }
            
            req.setAttribute("searchResult", resultList);
            RequestDispatcher view = req.getRequestDispatcher("/SearchResult.jsp");
            view.forward(req, res);
            conn.close();
           
            out.println("</body>");
            out.println("</html>");
            } catch (SQLException | ClassNotFoundException ex) {                
            Logger.getLogger(SearchMovie.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
