<%@ page language="java" contentType="text/html" %>

<%@ page import ="java.sql.*" %>

<%String unr= request.getParameter("uname");
			 String mailr= request.getParameter("email");
			 String pwdr= request.getParameter("pwd");
	 		 String sexr= request.getParameter("gender");
			 String ager= request.getParameter("age");%>

 <%
try{

 Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system"); 

PreparedStatement pst= con.prepareStatement("insert into account23 values(?,?,?,?,?)");
 
pst.setString(1,unr);
pst.setString(2,pwdr);
pst.setString(3,mailr);pst.setString(4,sexr);pst.setString(5,ager);

pst.executeUpdate();

if(pst!=null)
{
out.print("");

%>
<h1><center>Registred successfully....<br>record inserted</center></h1>
<%
}
con.close();  
}
catch(Exception e)
{%>

<%=e%>

<%}%>
