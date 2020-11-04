
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;
import java.io.*;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	throws ServletException,IOException{
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		int avg = 0,sum1 = 0,sum2 = 0,sum3 = 0,sum4 = 0,sum5 = 0,count;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
			Statement st = con.createStatement();
			
			

			
			int i=1,j=1;
			//while(j<9){
			//1	
				count = 0;
				String sql = "select * from feedback_sem_1";
				ResultSet rs1 = st.executeQuery("select * from feedback_sem_1");
				
				if(rs1.next()){
					
					do{
						sum1 += Integer.parseInt(rs1.getString(2));
						sum2 += Integer.parseInt(rs1.getString(3));
						sum3 += Integer.parseInt(rs1.getString(4));
						sum4 += Integer.parseInt(rs1.getString(5));
						sum5 += Integer.parseInt(rs1.getString(6));
						count = count + 1;
					
					}while(rs1.next());
					
					//i=1;
					ResultSet rs2 = st.executeQuery("select * from subject");
					while(rs2.next()){
						pw.println("<html>");
						pw.println("<body>");
						pw.println("<h1>SEMESTER: "+i);
						pw.println("<h1>");
						pw.println("<table>");
							pw.println("<tr>");
								pw.println("<th>SUBJECT</th>");
								pw.println("<th>FEEDBACK</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(2)+"</th>");
								pw.println("<th>"+(sum1/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(3)+"</th>");
								pw.println("<th>"+(sum2/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(4)+"</th>");
								pw.println("<th>"+(sum3/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(5)+"</th>");
								pw.println("<th>"+(sum4/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(6)+"</th>");
								pw.println("<th>"+(sum5/count)+"</th>");
								
							pw.println("</tr>");
						pw.println("</table>");
						pw.println("</body>");
						pw.println("<html>");
						
					}
					
				} else {
					
					pw.println("<br/>Record not iserted for semester: "+j+"<br/>");
				}
				
				//j++;
				//2
				j++;i++;
				count = 0;
				sum1=sum2=sum3=sum4=sum5=0;
				sql = "select * from feedback_sem_2";
				rs1 = st.executeQuery("select * from feedback_sem_2");
				
				if(rs1.next()){
					
					do{
						sum1 += Integer.parseInt(rs1.getString(2));
						sum2 += Integer.parseInt(rs1.getString(3));
						sum3 += Integer.parseInt(rs1.getString(4));
						sum4 += Integer.parseInt(rs1.getString(5));
						sum5 += Integer.parseInt(rs1.getString(6));
						count = count + 1;
					
					}while(rs1.next());
					
					ResultSet rs2 = st.executeQuery("select * from subject");
					while(rs2.next()){
						pw.println("<html>");
						pw.println("<body>");
						pw.println("<h1>SEMESTER: "+i);
						pw.println("<h1>");
						pw.println("<table>");
							pw.println("<tr>");
								pw.println("<th>SUBJECT</th>");
								pw.println("<th>FEEDBACK</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(2)+"</th>");
								pw.println("<th>"+(sum1/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(3)+"</th>");
								pw.println("<th>"+(sum2/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(4)+"</th>");
								pw.println("<th>"+(sum3/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(5)+"</th>");
								pw.println("<th>"+(sum4/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(6)+"</th>");
								pw.println("<th>"+(sum5/count)+"</th>");
								
							pw.println("</tr>");
						pw.println("</table>");
						pw.println("</body>");
						pw.println("<html>");
						
					}
					
				} else {
					
					pw.println("<br/>Record not iserted for semester: "+j+"<br/>");
				}
				
				//3
				j++;i++;
				count = 0;
				sum1=sum2=sum3=sum4=sum5=0;
				sql = "select * from feedback_sem_3";
				rs1 = st.executeQuery("select * from feedback_sem_3");
				
				if(rs1.next()){
					
					do{
						sum1 += Integer.parseInt(rs1.getString(2));
						sum2 += Integer.parseInt(rs1.getString(3));
						sum3 += Integer.parseInt(rs1.getString(4));
						sum4 += Integer.parseInt(rs1.getString(5));
						sum5 += Integer.parseInt(rs1.getString(6));
						count = count + 1;
					
					}while(rs1.next());
					
					ResultSet rs2 = st.executeQuery("select * from subject");
					while(rs2.next()){
						pw.println("<html>");
						pw.println("<body>");
						pw.println("<h1>SEMESTER: "+i);
						pw.println("<h1>");
						pw.println("<table>");
							pw.println("<tr>");
								pw.println("<th>SUBJECT</th>");
								pw.println("<th>FEEDBACK</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(2)+"</th>");
								pw.println("<th>"+(sum1/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(3)+"</th>");
								pw.println("<th>"+(sum2/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(4)+"</th>");
								pw.println("<th>"+(sum3/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(5)+"</th>");
								pw.println("<th>"+(sum4/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(6)+"</th>");
								pw.println("<th>"+(sum5/count)+"</th>");
								
							pw.println("</tr>");
						pw.println("</table>");
						pw.println("</body>");
						pw.println("<html>");
						
					}
					
				} else {
					
					pw.println("<br/>Record not iserted for semester: "+j+"<br/>");
				}
				
				//4
				j++;i++;
				count = 0;
				sum1=sum2=sum3=sum4=sum5=0;
				sql = "select * from feedback_sem_4";
				rs1 = st.executeQuery("select * from feedback_sem_4");
				
				if(rs1.next()){
					
					do{
						sum1 += Integer.parseInt(rs1.getString(2));
						sum2 += Integer.parseInt(rs1.getString(3));
						sum3 += Integer.parseInt(rs1.getString(4));
						sum4 += Integer.parseInt(rs1.getString(5));
						sum5 += Integer.parseInt(rs1.getString(6));
						count = count + 1;
					
					}while(rs1.next());
					
					ResultSet rs2 = st.executeQuery("select * from subject");
					while(rs2.next()){
						pw.println("<html>");
						pw.println("<body>");
						pw.println("<h1>SEMESTER: "+i);
						pw.println("<h1>");
						pw.println("<table>");
							pw.println("<tr>");
								pw.println("<th>SUBJECT</th>");
								pw.println("<th>FEEDBACK</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(2)+"</th>");
								pw.println("<th>"+(sum1/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(3)+"</th>");
								pw.println("<th>"+(sum2/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(4)+"</th>");
								pw.println("<th>"+(sum3/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(5)+"</th>");
								pw.println("<th>"+(sum4/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(6)+"</th>");
								pw.println("<th>"+(sum5/count)+"</th>");
								
							pw.println("</tr>");
						pw.println("</table>");
						pw.println("</body>");
						pw.println("<html>");
						
					}
					
				} else {
					
					pw.println("<br/>Record not iserted for semester: "+j+"<br/>");
				}
				
				//5
				j++;i++;
				count = 0;
				sum1=sum2=sum3=sum4=sum5=0;
				sql = "select * from feedback_sem_5";
				rs1 = st.executeQuery("select * from feedback_sem_5");
				
				if(rs1.next()){
					
					do{
						sum1 += Integer.parseInt(rs1.getString(2));
						sum2 += Integer.parseInt(rs1.getString(3));
						sum3 += Integer.parseInt(rs1.getString(4));
						sum4 += Integer.parseInt(rs1.getString(5));
						sum5 += Integer.parseInt(rs1.getString(6));
						count = count + 1;
					
					}while(rs1.next());
					
					ResultSet rs2 = st.executeQuery("select * from subject");
					while(rs2.next()){
						pw.println("<html>");
						pw.println("<body>");
						pw.println("<h1>SEMESTER: "+i);
						pw.println("<h1>");
						pw.println("<table>");
							pw.println("<tr>");
								pw.println("<th>SUBJECT</th>");
								pw.println("<th>FEEDBACK</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(2)+"</th>");
								pw.println("<th>"+(sum1/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(3)+"</th>");
								pw.println("<th>"+(sum2/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(4)+"</th>");
								pw.println("<th>"+(sum3/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(5)+"</th>");
								pw.println("<th>"+(sum4/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(6)+"</th>");
								pw.println("<th>"+(sum5/count)+"</th>");
								
							pw.println("</tr>");
						pw.println("</table>");
						pw.println("</body>");
						pw.println("<html>");
						
					}
					
				} else {
					
					pw.println("<br/>Record not iserted for semester: "+j+"<br/>");
				}
				
				//6
				j++;i++;
				count = 0;
				sum1=sum2=sum3=sum4=sum5=0;
				sql = "select * from feedback_sem_6";
				rs1 = st.executeQuery("select * from feedback_sem_6");
				
				if(rs1.next()){
					
					do{
						sum1 += Integer.parseInt(rs1.getString(2));
						sum2 += Integer.parseInt(rs1.getString(3));
						sum3 += Integer.parseInt(rs1.getString(4));
						sum4 += Integer.parseInt(rs1.getString(5));
						sum5 += Integer.parseInt(rs1.getString(6));
						count = count + 1;
					
					}while(rs1.next());
					
					ResultSet rs2 = st.executeQuery("select * from subject");
					while(rs2.next()){
						pw.println("<html>");
						pw.println("<body>");
						pw.println("<h1>SEMESTER: "+i);
						pw.println("<h1>");
						pw.println("<table>");
							pw.println("<tr>");
								pw.println("<th>SUBJECT</th>");
								pw.println("<th>FEEDBACK</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(2)+"</th>");
								pw.println("<th>"+(sum1/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(3)+"</th>");
								pw.println("<th>"+(sum2/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(4)+"</th>");
								pw.println("<th>"+(sum3/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(5)+"</th>");
								pw.println("<th>"+(sum4/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(6)+"</th>");
								pw.println("<th>"+(sum5/count)+"</th>");
								
							pw.println("</tr>");
						pw.println("</table>");
						pw.println("</body>");
						pw.println("<html>");
						
					}
					
				} else {
					
					pw.println("<br/>Record not iserted for semester: "+j+"<br/>");
				}
				
				//7
				j++;i++;
				count = 0;
				sum1=sum2=sum3=sum4=sum5=0;
				 sql = "select * from feedback_sem_7";
				 rs1 = st.executeQuery("select * from feedback_sem_7");
				
				if(rs1.next()){
					
					do{
						sum1 += Integer.parseInt(rs1.getString(2));
						sum2 += Integer.parseInt(rs1.getString(3));
						sum3 += Integer.parseInt(rs1.getString(4));
						sum4 += Integer.parseInt(rs1.getString(5));
						sum5 += Integer.parseInt(rs1.getString(6));
						count = count + 1;
					
					}while(rs1.next());
					
					ResultSet rs2 = st.executeQuery("select * from subject");
					while(rs2.next()){
						pw.println("<html>");
						pw.println("<body>");
						pw.println("<h1>SEMESTER: "+i);
						pw.println("<h1>");
						pw.println("<table>");
							pw.println("<tr>");
								pw.println("<th>SUBJECT</th>");
								pw.println("<th>FEEDBACK</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(2)+"</th>");
								pw.println("<th>"+(sum1/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(3)+"</th>");
								pw.println("<th>"+(sum2/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(4)+"</th>");
								pw.println("<th>"+(sum3/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(5)+"</th>");
								pw.println("<th>"+(sum4/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(6)+"</th>");
								pw.println("<th>"+(sum5/count)+"</th>");
								
							pw.println("</tr>");
						pw.println("</table>");
						pw.println("</body>");
						pw.println("<html>");
						
					}
					
				} else {
					
					pw.println("<br/>Record not iserted for semester: "+j+"<br/>");
				}
				
				//8
				j++;
				count = 0;
				sum1=sum2=sum3=sum4=sum5=0;
				sql = "select * from feedback_sem_8";
				rs1 = st.executeQuery("select * from feedback_sem_8");
				
				if(rs1.next()){
					
					do{
						sum1 += Integer.parseInt(rs1.getString(2));
						sum2 += Integer.parseInt(rs1.getString(3));
						sum3 += Integer.parseInt(rs1.getString(4));
						sum4 += Integer.parseInt(rs1.getString(5));
						sum5 += Integer.parseInt(rs1.getString(6));
						count = count + 1;
					
					}while(rs1.next());
					
					ResultSet rs2 = st.executeQuery("select * from subject");
					while(rs2.next()){
						pw.println("<html>");
						pw.println("<body>");
						pw.println("<h1>SEMESTER: "+i);
						pw.println("<h1>");
						pw.println("<table>");
							pw.println("<tr>");
								pw.println("<th>SUBJECT</th>");
								pw.println("<th>FEEDBACK</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(2)+"</th>");
								pw.println("<th>"+(sum1/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(3)+"</th>");
								pw.println("<th>"+(sum2/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(4)+"</th>");
								pw.println("<th>"+(sum3/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(5)+"</th>");
								pw.println("<th>"+(sum4/count)+"</th>");
								
							pw.println("</tr>");
							pw.println("<tr>");
								pw.println("<th>"+rs2.getString(6)+"</th>");
								pw.println("<th>"+(sum5/count)+"</th>");
								
							pw.println("</tr>");
						pw.println("</table>");
						pw.println("</body>");
						pw.println("<html>");
						
					}
					
				} else {
					
					pw.println("<br/>Record not iserted for semester: "+j+"<br/>");
				}
				
				
			con.close();
		}catch(Exception e){
			pw.println("Error:"+e);
		}
	
	}
}