

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;
import java.io.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	throws ServletException,IOException{
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		// req.getRequestDispatcher("backward.html").include(req, res);
		
		try{
			/*setting up connection with database*/
			/*load jdbc driver*/
			Class.forName("oracle.jdbc.driver.OracleDriver");
			/*establish connection with database*/
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
			/*create statement object*/
			Statement st = con.createStatement();
			
			/*use staement object to gather result from database software*/
			ResultSet rs1 = st.executeQuery("Select * from system where username = '"+username+"' and password = '"+password+"'");
			/*processing the result*/
			
           if(rs1.next()){
				
				
				
				do{
				String type = rs1.getString("type");
				if(type.equals("user")){
				String temp = rs1.getString("semester");
				int semester = Integer.parseInt(temp);
				ResultSet rs2 = st.executeQuery("select * from subject where sem = '"+semester+"'");
				if(rs2.next()){
					//pw.println("<center>semester: "+rs2.getString(1)+"<br/>sub1: "+rs2.getString(2)+"<br/>sub2: "+rs2.getString(3)+"<br/>sub3: "+rs2.getString(4)+"<br/>sub4: "+rs2.getString(5)+"<br/>sub5: "+rs2.getString(6)+"</center>");
					
					pw.println("<center>");
					pw.println("<br/><br/>");
					pw.println("<h1 style='color: white;font-family: 'Monoton', cursive;'>USERNAME:  "+username);
					pw.println("</h1>");
					pw.println("<br/>");
					pw.println("<table style=' border-collapse: separate;border-spacing: 10px;'>");
					pw.println("<tr>");
					pw.println("<tr>");
					pw.println("<th>Semester: </th>");
					pw.println("<td>"+rs2.getString(1)+"</td>");
					pw.println("</tr>");
					pw.println("<tr>");
					pw.println("<th>Sub1: </th>");
					pw.println("<td>"+rs2.getString(2)+"</td>");
					pw.println("<th>Sub2: </th>");
					pw.println("<td>"+rs2.getString(3)+"</td>");
					pw.println("<th>Sub3: </th>");
					pw.println("<td>"+rs2.getString(4)+"</td>");
					pw.println("<th>Sub4: </th>");
					pw.println("<td>"+rs2.getString(5)+"</td>");
					pw.println("<th>Sub5: </th>");
					pw.println("<td>"+rs2.getString(6)+"</td>");
					pw.println("</tr>");
					
					
					
					pw.println("</table>");
					pw.println("</center>");
			}
				//RequestDispatcher rd = req.getRequestDispatcher("feedback.html");
				//rd.include(req,res);
				
				ResultSet rs3 = st.executeQuery("Select * from system where username = '"+username+"' and password = '"+password+"'");
				
				if(rs3.next()){
					//pw.println(rs3.getString(1));
					if(semester != 8){
						pw.println("<html>");
						pw.println("<head>");
						pw.println("<body>");
						pw.println("<center>");
						pw.println("<form action='newfeedback' method='post'");
						RequestDispatcher rd = req.getRequestDispatcher("feedback.html");
						rd.include(req,res);
						pw.println("<br/>");
						pw.println("<input type='hidden' name='id' value='"+rs3.getString(1)+"'>");
						pw.println("<input type='hidden' name='branch' value='"+rs3.getString(5)+"'>");
						pw.println("<input type='hidden' name='course' value='"+rs3.getString(6)+"'>");
						//pw.println("<div >");
						pw.println("<input type='submit' style='font-size: 1em;padding: .8em 1em;text-transform: capitalize;border: none;outline: none;background:#00132e;color: #fff;cursor: pointer;width: 15%;font-family: 'Ubuntu', sans-serif;margin: 0 0 0 3em;float:left;' >");
						//pw.println("</div>");
						pw.println("<div >");
						pw.println("<br/>");
						pw.println("</div>");
						pw.println("</form>");
						pw.println("</center>");
						pw.println("</body>");
						pw.println("</html>");
					} else {
						pw.println("<html>");
						pw.println("<body>");
						pw.println("<center>");
						pw.println("<form action='newfeedback' method='post'");
						RequestDispatcher rd = req.getRequestDispatcher("feedback8.html");
						rd.include(req,res);
						pw.println("<br/><br/>");
						pw.println("<input type='hidden' name='id' value='"+rs3.getString(1)+"'>");
						
						pw.println("<input type='submit' style='font-size: 1em;padding: .8em 1em;text-transform: capitalize;border: none;outline: none;background:#00132e;color: #fff;cursor: pointer;width: 25%;font-family: 'Ubuntu', sans-serif;margin: 0 0 0 3em;float:left;' >");
						//pw.println("</div>");
						pw.println("<div >");
						pw.println("<br/><br/>");
						pw.println("</div>");
						pw.println("</form>");
						pw.println("</center>");
						pw.println("</body>");
						pw.println("</html>");
					}

				}
				
				
			} else if(type.equals("admin")){
				res.sendRedirect("report.html");
				/*RequestDispatcher rd = req.getRequestDispatcher("/report.html");
				rd.forward(req,res);*/

			}
			else if(type.equals("submit"))
			{
				RequestDispatcher rd = req.getRequestDispatcher("report_student_login.jsp");
				rd.forward(req,res);
			}
			 else {
				pw.println("<html>");
				pw.println("<body>");
				pw.println("<script type='text/javascript'>");
				pw.println("alert('Invalid user.Register first')");
				pw.println("</script>");
				pw.println("</body>");
				pw.println("</html>");
				RequestDispatcher rd = req.getRequestDispatcher("/Register.html");
				rd.include(req,res);
			}
			}while(rs1.next());
			
			} else {
				pw.println("<html><body><center>");
				pw.println("<h1>ENTERED USERNAME  OR PASSWORD IS WRONG!!!</h1>");
				pw.println("<h2>Please login Again</h2>");
				pw.println("<br/><a href='login.html'><h2>Go Back</h2></a>");
				pw.println("</center></body></html>");
			}

			
			
			/*closing the connection with database*/
			con.close();
			
		}catch(Exception e){
			pw.println("Error:"+e);
		}
	}
}