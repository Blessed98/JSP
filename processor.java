
import db.myDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet(urlPatterns = {"/processor"})
public class processor extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String user = request.getParameter("uuser");
            String pass = request.getParameter("upass");
            String _userDB="";
            String _userPassDB="";
            String userID="";
            String user_name="";
            
             myDB conn = new  myDB();
             out.println(conn.checkCon());
             Connection conObj;
             try{
                conObj = conn.getConn();
                Statement stmt = conObj.createStatement();
                ResultSet rs =    stmt.executeQuery("SELECT * FROM users WHERE username = '"+user+"'");
                
                while(rs.next()){
                    userID = rs.getString("id");
                    user_name = rs.getString("name");
                    _userDB = rs.getString("username");
                    _userPassDB = rs.getString("password");
                }
                
                if(user.equals("") && pass.equals("")){                    
                    request.setAttribute("msg", "Username 'n' Password Boxes are empty!");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }else if(user.equals(_userDB)){
                    if(pass.equals(_userPassDB)){                        
                        request.setAttribute("theUser",user_name);
                        request.getRequestDispatcher("home.jsp").forward(request, response);
                    }else{
                        request.setAttribute("msg", "Invalid Password");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                }else{
                    request.setAttribute("msg", "Invalid User name");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                
                
                
             }catch(Exception e){
                 out.println(e.getMessage());
             }
             
        }
    }

}
