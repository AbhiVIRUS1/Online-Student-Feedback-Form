<%@ page import="java.sql.*" %>
 <%
  
    String branch = request.getParameter("branch");
    String semester = request.getParameter("semester");
    String subject = request.getParameter("subject");
    String course = request.getParameter("course");
    String sub1 = request.getParameter("sub1");
    String sub2 = request.getParameter("sub2");
    String sub3 = request.getParameter("sub3");
    String sub4 = request.getParameter("sub4");
    String sub5 = request.getParameter("sub5");



    try{
      Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
      Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
      st.executeQuery("insert into subject values('"+semester+"','"+sub1+"','"+sub2+"','"+sub3+"','"+sub4+"','"+sub5+"','"+branch+"','"+course+"')");
  		}
  	catch(Exception e){
      out.println("Error:"+e);
    } 
    finally { }
  
  

%>
