<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" %>
<!DOCTYPE html> 
<html>
 <head>    
  <title>DEMO</title>
       <!-- <link rel="stylesheet" type="text/css" href="style_report.css"> -->
       
  <link rel="stylesheet" type="text/css" href="/Content/font-awesome/css/font-awesome.min.css" />
  <link rel="stylesheet" type="text/css" href="all.min.css" />
  <link rel="stylesheet" href="w3colors.css">
  <script type="text/javascript" src="shieldui-all.min.js"></script>
  <script type="text/javascript" src="jszip.min.js"></script>
  <link rel="stylesheet" href="w3.css">
  <script src="html2pdf.bundle.min.js"></script>
  <link rel="stylesheet" type="text/css" href="style_report.css">
  <style type="text/css">
  body{
    background:white;
    /*overflow: scroll;*/
  }
  a{
    text-decoration: none;
  }
  .vssutLogo img {
   margin-left: 30px;
   float: left;
   width: 150px;
   height: 150px;


 }
.w3-container {
  margin-top: 1em;
}

 .button {
  display: inline-block;
  padding: 0.5em 1em;
  font-size: 20px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #636466;
  border: none;
  border-radius: 15px;
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
}

.button:hover {background-color: #D3FFE0;color: black;}

.button:active {
  background-color: #D3FFE0;
  box-shadow: 0 5px #666;
  transform: translateY(4px);

}
.button1{
  margin-top: 2em;
  margin-bottom: 3em;
  padding: 0.5em 1em;
  font-size: 20px;
  color: #fff;
  background-color: #636466;
  border: none;
  border-radius: 15px;
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
  text-align: center;
  text-decoration: none;
  display: inline-block;
}
h1 h2 h3 {
  text-align: center;
}
ul {
  list-style-type: none;
  margin: 0;
   margin-bottom: 1em; 
  padding: 0;
  overflow: hidden;
  background-color: #333333;
  width: 750px;

 
}
li  {
  display: inline-block;
  color: white;
  padding: 15px;
  text-decoration: none;
  font-size: 20px;
}

.container .subtitle{
 font-family: 'Alfa Slab One', cursive, sans-serif;
}

.container {
 background-color: #efc050;
}
.w3-myfont {
    margin-top: 2em;
    margin-bottom: 1em;
  }
.w3-table {
  width: 0em;
}
.


   
  </style>
  </head>
  <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
  <div id="element-to-print">
      <div class="w3-row">
    <div class="w3-container container">
      <div class="w3-col  m3 vssutLogo ">
      <img src="NuaOdisha-158-vssut.png">
    </div>
    <div class="w3-col  m9">  
      <div class=" w3-center w3-theme">
        <h1 class="w3-xxlarge">VEER SURENDRA SAI UNIVERSITY OF TECHNOLOGY</h1>
        <p class=" w3-center w3-xlarge">BURLA,ODISHA</p>
      </div>
    </div>
    </div>
  </div>

  

<div >
    <center><h1 class="w3-container subtitle">STUDENT FEEDBACK REPORT</h1></center>


  

  
<%
  String course = request.getParameter("course");
  String branch = request.getParameter("branch");
  String semester = request.getParameter("semester");
  int sem = Integer.parseInt(semester);
  String id = request.getParameter("regid");
  float sum1=0,sum2=0,sum3=0,sum4=0,sum5=0,cnt=0;
  try{

      Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
      Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
      ResultSet rs= null;
      ResultSet rs1=null;
      ResultSet rs3=null;
        String str = " "; 
        String str1 = " "; 
        String str2 = " "; 
        String str3 = " "; 
        String str4 = " "; 
        String str5 = " "; 
        out.println("<html>");
        out.println("<body>");
        
        rs3=st.executeQuery("select * from system where regid='"+id+"'");
        if(rs3.next()){
          out.println("<center>");
          out.println("<ul >");
          out.println("<li >REGISTRATION ID: "+rs3.getString("regid")+"</li>");
          out.println("<li >BRANCH: "+branch+"</li>");
          out.println("<li >SEMESTER: "+semester+"</li>");
          out.println("</ul>");
        }
        else
          {
            out.println("<br/><center><h1>PLEASE ENTER CORRECT REGISTRATION NUMBER</h1><center><br/>");
          }


        
        out.println("<table class='w3-table w3-striped w3-bordered w3-hoverable w3-card-4'>");
          out.println("<tr>");
          out.println("<th>FEEDBACK QUERIES</td>");
          out.println("<th>POINTS</th>");
          out.println("<th>POINTS</th>");
          out.println("<th>POINTS</th>");
          out.println("<th>POINTS</th>");
          out.println("<th>POINTS</th>");
           out.println("</tr>");
          ResultSet rs2 = st.executeQuery("select * from subject where sem = '"+sem+"' and branch = '"+branch+"' and course = '"+course+"'");
          if(rs2.next()){
            out.println("<tr>");
              
              out.println("<th></td>");
              out.println("<th>"+rs2.getString(2)+"</th>");
              out.println("<th>"+rs2.getString(3)+"</th>");
              out.println("<th>"+rs2.getString(4)+"</th>");
              out.println("<th>"+rs2.getString(5)+"</th>");
              out.println("<th>"+rs2.getString(6)+"</th>");
              
            out.println("</tr>");
          }

          rs=st.executeQuery("select * from question,feedback,system where system.course='"+course+"' and system.branch='"+branch+"' AND system.semester='"+semester+"' and system.regid='"+id+"' and system.regid=feedback.id and feedback.question=question.qno order by qno");
          
          
          while(rs.next()){
           
           str = rs.getString("ques");
           str1 = rs.getString("sub1");
           str2 = rs.getString("sub2");
           str3 = rs.getString("sub3");
           str4 = rs.getString("sub4");
           str5 = rs.getString("sub5");

           sum1+=Float.parseFloat(str1);
           sum2+=Float.parseFloat(str2);
           sum3+=Float.parseFloat(str3);
           sum4+=Float.parseFloat(str4);
           sum5+=Float.parseFloat(str5);
          
              out.println("<tr>");
              
                out.println("<td>"+str+"</td>");
                out.println("<td>"+str1);
                out.println("</td>");
                out.println("<td>"+str2);
                out.println("</td>");
                out.println("<td>"+str3);
                out.println("</td>");
                out.println("<td>"+str4);
                out.println("</td>");
                out.println("<td>"+str5);
                out.println("</td>");
              
              out.println("</tr>");
              cnt++;
            }
            out.println("<tr>");

                out.println("<td>Average</td>");
                out.println("<td>"+(sum1/cnt));
                out.println("</td>");
                out.println("<td>"+(sum2/cnt));
                out.println("</td>");
                out.println("<td>"+(sum3/cnt));
                out.println("</td>");
                out.println("<td>"+(sum4/cnt));
                out.println("</td>");
                out.println("<td>"+(sum5/cnt));
                out.println("</td>");
              
           out.println("</tr>");

      
      out.println("</table>");
      rs=st.executeQuery("select * from suggestion where id='"+id+"'");
      if(rs.next())
      {
        str = rs.getString(2);
      }
      out.println("<div>");
      out.println("<h2>Suggestion</h2>");
      out.println("<p>"+str+"</p>");
      out.println("</div>");
      out.println("</center>");
      out.println("</body>");
      out.println("</html>");
  } catch(Exception e){
    out.println("Error:"+e);
  } finally {}



%>

  </div>
</div>
<br>
</body>
<center>
  <div class="w3-show-inline-block">
    <div class="w3-bar">
      <button class="button "><a href="logout" >Logout</a></button>
      <button  onclick="printReport()" class="button1 ">Print</button>
    </div>






</center>
  <script type="text/javascript">
    function printReport() {
      console.log('printing');
      var element = document.getElementById('element-to-print');
      var opt = {
        margin:       0.1,
        filename:     'report.pdf',
        image:        { type: 'jpeg', quality: 0.98 },
        html2canvas:  { scale: 1 },
        jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
      };

      // New Promise-based usage:
      html2pdf().from(element).set(opt).save();
    }
  </script>
</html>