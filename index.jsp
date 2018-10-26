<%-- 
    Document   : index
    Created on : Oct 23, 2018, 11:37:17 AM
    Author     : Esosa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login Below</h1>
        <form method="post" action = "processor">
            <p>
                <input type="text" name="uuser" placeholder="Enter your username">
            </p>
             <p>
                <input type="text" name="upass" placeholder="Enter your password">
            </p>
             <p>
                <input type="submit" name="sub" value="login">
            </p>
        </form>
        
        <h3>${msg}</h3>
    </body>
</html>
