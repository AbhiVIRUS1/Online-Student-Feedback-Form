<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" %>
<!DOCTYPE html> 
<html>
<head>    
  <title>DEMO</title>
  <!-- <link rel="stylesheet" type="text/css" href="style_report.css"> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="/Content/font-awesome/css/font-awesome.min.css" />
  <link rel="stylesheet" type="text/css" href="all.min.css" />
  <link rel="stylesheet" href="w3colors.css">
  <script type="text/javascript" src="shieldui-all.min.js"></script>
  <script type="text/javascript" src="jszip.min.js"></script>
  <link rel="stylesheet" href="w3.css">
  <script src="html2pdf.bundle.min.js"></script>
  <style type="text/css">
    body{
      background:white;
      /*overflow: scroll;*/
    }
    a {
      text-decoration: none;
    }
    .w3-container {
      margin-top: 1em;
    }
    .vssutLogo img {
     margin-left: 30px;
     float: left;
     width: 150px;
     height: 150px;

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

  .w3-myfont {
    margin-top: 2em;
    margin-bottom: 1em;
  }
  .w3-table {
    width: 0em;
  }
  .w3-theme { background-color:#efc050 !important}

</style>
</head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<div id="element-to-print">
  <div class="w3-row">
    <div class="w3-container w3-theme">
      <div class="w3-col  m3 vssutLogo ">
        <img src="NuaOdisha-158-vssut.png">
      </div>
      <div class="w3-col  m9">  
        <div class=" w3-center w3-myfont ">
          <h1 class="w3-xxlarge">VEER SURENDRA SAI UNIVERSITY OF TECHNOLOGY</h1>
          <p class=" w3-center w3-xlarge">BURLA,ODISHA</p>
        </div>
      </div>
    </div>
  </div>

  <div class="w3-container ">
    <center><h1>STUDENT FEEDBACK REPORT</h1></center>


    <%
    String username=request.getParameter("username");

    String password = request.getParameter("password");
    String branch=null,id=null,course=null;
    int semester=0;
    try{

    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
    Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    ResultSet rs= null;
    ResultSet rs1=null;
    ResultSet rs3 =st.executeQuery("select * from system where username ='"+username+"'and password ='"+password+"'");
    if(rs3.next()){
    branch = rs3.getString(5);
    semester =Integer.parseInt( rs3.getString(6));
    id = rs3.getString(1);
    course = rs3.getString(9);

  }

  String str = " "; 
  String str1 = " "; 
  String str2 = " "; 
  String str3 = " "; 
  String str4 = " "; 
  String str5 = " "; 

  out.println("<html>");
  out.println("<body>");
  out.println("<center>");
  out.println("<table class='w3-table w3-striped w3-bordered w3-hoverable w3-card-4'>");

  out.println("<th>FEEDBACK QUERIES</td>");
  out.println("<th>POINTS</th>");
  out.println("<th>POINTS</th>");
  out.println("<th>POINTS</th>");
  out.println("<th>POINTS</th>");
  out.println("<th>POINTS</th>");

  ResultSet rs2 = st.executeQuery("select * from subject where sem = '"+semester+"' and branch='"+branch+"' and course = '"+course+"'");
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
}




out.println("</table>");
rs=st.executeQuery("select * from suggestion where id='"+id+"'");
if(rs.next())
{
  str = rs.getString(2);
}
out.println("<div>");
out.println("<h2>Suggestion</h2>");
out.println("<p >"+str+"</p>");
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