
<%@ page language="java" contentType="text/html" %>

 <%@ page import ="java.sql.*" %>

<% String un= request.getParameter("username");
                String p= request.getParameter("pass");%>
                <%
        try
        {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
        
        PreparedStatement pstmt1 = conn.prepareStatement("SELECT password FROM account23 WHERE username=?");
    pstmt1.setString(1, un);
    ResultSet rs1 = pstmt1.executeQuery();

    String op = null;

    if (rs1.next()) {
        op = rs1.getString("password");
    }
        PreparedStatement pstmt = conn.prepareStatement("UPDATE account23 SET password=? WHERE username=?");
        pstmt.setString(1, p);
        pstmt.setString(2, un);
        int rowsUpdated = pstmt.executeUpdate();
        
        // Close the database connection
        pstmt.close();
        conn.close();
        
        // Check if the update was successful
        if (op!= p)
        {
            out.println("<center><h1><p style='color:rgb(11, 239, 30);'> Password  Changed !</p></h1></center>");
                out.println("<center><h1><a href='account.html'><br>go to Login page</a></h1></center>");
            
        }
        
        }
        catch (Exception e) 
        {
            
            e.printStackTrace();
        }
    
        %>         
           