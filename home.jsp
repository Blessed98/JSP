<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db.myDB" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home | JSP</title>
    </head>
    <body>
        <center><h3>Hello ${theUser}! welcome... to JSP Start-Up Class</h3>
        <h4>List of registered Users</h4></center>
            <%
            
                myDB dbcon = new myDB();
                String url = "jdbc:mysql://localhost:3306/users";
                String usr = "root";
                String psw = "";
            try{    
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = dbcon.getConn();
                    
                con    = DriverManager.getConnection(url,usr, psw);
            Statement stmt = con.createStatement();
                     //ResultSet users =  dbcon.fetchRecord("SELECT * FROM users");
                //}catch(Exception e){
                //   out.println(e.getMessage());
                //}
  //*                   
                    ResultSet users = stmt.executeQuery("SELECT * FROM users");
                     out.println("<center>");
                     
                     out.println("<table border='1px solid' width='70%'>");
                      
                     while(users.next()){
                         out.println("<tr>");
                            out.println("<td>"+users.getString("id")+"</td>");
                            out.println("<td>"+users.getString("name")+"</td>");
                            out.println("<td>"+users.getString("username")+"</td>");
                            out.println("<td>"+users.getString("password")+"</td>");                           
                          out.println("</tr>");
                       }
                     
                     out.println("</table>");
                     out.println("</center>");
//*/        
            }catch(Exception e){
    
            }
              
            %>
        
        
    </body>
</html>
