import java.util.*;
import java.lang.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;
import java.io.*;

@WebServlet("/newfeedback")
public class NewFeedbackServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	throws ServletException,IOException,NumberFormatException{
	res.setContentType("text/html");	
	PrintWriter pw = res.getWriter();
	
	String id = req.getParameter("id");
	
	String sub1a = req.getParameter("sub1a");
	String sub2a = req.getParameter("sub2a");
	String sub3a = req.getParameter("sub3a");
	String sub4a = req.getParameter("sub4a");
	String sub5a = req.getParameter("sub5a");
	
	
	String sub1b = req.getParameter("sub1b");
	String sub2b = req.getParameter("sub2b");
	String sub3b = req.getParameter("sub3b");
	String sub4b = req.getParameter("sub4b");
	String sub5b = req.getParameter("sub5b");
	
	String sub1c = req.getParameter("sub1c");
	String sub2c = req.getParameter("sub2c");
	String sub3c = req.getParameter("sub3c");
	String sub4c = req.getParameter("sub4c");
	String sub5c = req.getParameter("sub5c");
	
	String sub1d = req.getParameter("sub1d");
	String sub2d = req.getParameter("sub2d");
	String sub3d = req.getParameter("sub3d");
	String sub4d = req.getParameter("sub4d");
	String sub5d = req.getParameter("sub5d");
	
	String sub1e = req.getParameter("sub1e");
	String sub2e = req.getParameter("sub2e");
	String sub3e = req.getParameter("sub3e");
	String sub4e = req.getParameter("sub4e");
	String sub5e = req.getParameter("sub5e");
	
	

	String sub1f = req.getParameter("sub1f");
	String sub2f = req.getParameter("sub2f");
	String sub3f = req.getParameter("sub3f");
	String sub4f = req.getParameter("sub4f");
	String sub5f = req.getParameter("sub5f");	
	
	String sub1g = req.getParameter("sub1g");
	String sub2g = req.getParameter("sub2g");
	String sub3g = req.getParameter("sub3g");
	String sub4g = req.getParameter("sub4g");
	String sub5g = req.getParameter("sub5g");
	
	String sub1h = req.getParameter("sub1h");
	String sub2h = req.getParameter("sub2h");
	String sub3h = req.getParameter("sub3h");
	String sub4h = req.getParameter("sub4h");
	String sub5h = req.getParameter("sub5h");
	
	String sub1i = req.getParameter("sub1i");
	String sub2i = req.getParameter("sub2i");
	String sub3i = req.getParameter("sub3i");
	String sub4i = req.getParameter("sub4i");
	String sub5i = req.getParameter("sub5i");
	
	String sub1j = req.getParameter("sub1j");
	String sub2j = req.getParameter("sub2j");
	String sub3j = req.getParameter("sub3j");
	String sub4j = req.getParameter("sub4j");
	String sub5j = req.getParameter("sub5j");
	
	String comment = req.getParameter("comment");
	
	/*	String sub1 = Integer.toString(sub1);
	String sub2 = Integer.toString(sub2);
	String sub3 = Integer.toString(sub3);
	String sub4 = Integer.toString(sub4);
	String sub5 = Integer.toString(sub5);*/
	
	String temp = new String();
	int sem = 0;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select semester from system where regid='"+id+"'");
		if(rs.next()){
			sem = Integer.parseInt(rs.getString(1));
		}
		
		if(sem != 8){
			st.addBatch("insert into feedback values('"+id+"','a','"+sub1a+"','"+sub2a+"','"+sub3a+"','"+sub4a+"','"+sub5a+"')");
			st.addBatch("insert into feedback values('"+id+"','b','"+sub1b+"','"+sub2b+"','"+sub3b+"','"+sub4b+"','"+sub5b+"')");
			st.addBatch("insert into feedback values('"+id+"','c','"+sub1c+"','"+sub2c+"','"+sub3c+"','"+sub4c+"','"+sub5c+"')");
			st.addBatch("insert into feedback values('"+id+"','d','"+sub1d+"','"+sub2d+"','"+sub3d+"','"+sub4d+"','"+sub5d+"')");
			st.addBatch("insert into feedback values('"+id+"','e','"+sub1e+"','"+sub2e+"','"+sub3e+"','"+sub4e+"','"+sub5e+"')");
			st.addBatch("insert into feedback values('"+id+"','f','"+sub1f+"','"+sub2f+"','"+sub3f+"','"+sub4f+"','"+sub5f+"')");
			st.addBatch("insert into feedback values('"+id+"','g','"+sub1g+"','"+sub2g+"','"+sub3g+"','"+sub4g+"','"+sub5g+"')");
			st.addBatch("insert into feedback values('"+id+"','h','"+sub1h+"','"+sub2h+"','"+sub3h+"','"+sub4h+"','"+sub5h+"')");
			st.addBatch("insert into feedback values('"+id+"','i','"+sub1i+"','"+sub2i+"','"+sub3i+"','"+sub4i+"','"+sub5i+"')");
			st.addBatch("insert into feedback values('"+id+"','j','"+sub1j+"','"+sub2j+"','"+sub3j+"','"+sub4j+"','"+sub5j+"')");
			st.executeBatch();

			int	count = st.executeUpdate("insert into suggestion values('"+id+"','"+comment+"')");
					if(count>0){
						pw.println("<center><h1>Record inserted..</h1></center>");
					}
					else{
						pw.println("<h1>Try again..</h1>");
					}
		} else {
			st.addBatch("insert into feedback values('"+id+"','a','"+sub1a+"','"+sub2a+"','"+sub3a+"','0','0')");
			st.addBatch("insert into feedback values('"+id+"','b','"+sub1b+"','"+sub2b+"','"+sub3b+"','0','0')");
			st.addBatch("insert into feedback values('"+id+"','c','"+sub1c+"','"+sub2c+"','"+sub3c+"','0','0')");
			st.addBatch("insert into feedback values('"+id+"','d','"+sub1d+"','"+sub2d+"','"+sub3d+"','0','0')");
			st.addBatch("insert into feedback values('"+id+"','e','"+sub1e+"','"+sub2e+"','"+sub3e+"','0','0')");
			st.addBatch("insert into feedback values('"+id+"','f','"+sub1f+"','"+sub2f+"','"+sub3f+"','0','0')");
			st.addBatch("insert into feedback values('"+id+"','g','"+sub1g+"','"+sub2g+"','"+sub3g+"','0','0')");
			st.addBatch("insert into feedback values('"+id+"','h','"+sub1h+"','"+sub2h+"','"+sub3h+"','0','0')");
			st.addBatch("insert into feedback values('"+id+"','i','"+sub1i+"','"+sub2i+"','"+sub3i+"','0','0')");
			st.addBatch("insert into feedback values('"+id+"','j','"+sub1j+"','"+sub2j+"','"+sub3j+"','0','0')");
			st.executeBatch();

			int	count = st.executeUpdate("insert into suggestion values('"+id+"','"+comment+"')");
					if(count>0){
						pw.println("<center><h1>Record inserted..</h1></center>");
					}
					else{
						pw.println("<h1>Try again..</h1>");
					}
		}
		
		st.executeUpdate("update system set type = 'submit' where regid='"+id+"' ");

		pw.println("<html><center><a href='logout' style=' background-color: #4CAF50;border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;margin: 4px 2px;cursor: pointer; -webkit-transition-duration: 0.4s;transition-duration: 0.4s;'>Logout</a></center></html>");
		RequestDispatcher rd = req.getRequestDispatcher("backward.html");
		rd.include(req,res);
	}catch(Exception e){
		pw.println("Error:"+e);

	}
  }
}