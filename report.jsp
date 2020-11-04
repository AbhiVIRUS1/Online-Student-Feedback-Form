<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" %>
<!DOCTYPE html> 
<html>

<head>    
  <title>DEMO</title>
  <link rel="stylesheet" type="text/css" href="/Content/font-awesome/css/font-awesome.min.css" />
  <link rel="stylesheet" type="text/css" href="all.min.css" />
  <link rel="stylesheet" href="w3colors.css">
  <script type="text/javascript" src="shieldui-all.min.js"></script>
  <script type="text/javascript" src="jszip.min.js"></script>
  <link rel="stylesheet" href="w3.css">
  <script src="html2pdf.bundle.min.js"></script>
  <link rel="stylesheet" type="text/css" href="style_report.css">
  <style type="text/css">
  .vssutLogo img {
   margin-left: 30px;
   float: left;
   width: 150px;
   height: 150px;

 }
  body{
    background:white;
    
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
  #container{
    margin-left:auto;
    margin-right:auto;
    height:auto; 
    background-color: #e79b80;
  }
  #exportButton {
    border-radius: 0;
  }


 .header h1 {
  position: relative;
  top: 18px;
  left: 10px;
  
  height: 400%;


}
.container{
	background-color:#efc050;
}
.header{
  text-align: center;
}
.w3-myfont {
   font-family: 'Alfa Slab One', cursive, sans-serif;
}
.w3-container {
  margin-top: 1em;
}
 a{
    text-decoration: none;
  }
h1 h2 h3 {
  text-align: center;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333333;
  width: 600px;
}
li  {
  display: inline-block;
  color: white;
  padding: 16px;
  text-decoration: none;
  font-size: large;
}
table {
  border-collapse: separate;
  font-size: 130%;
  margin-top: 20px;
}
th, td {
  padding: 5px;
  padding-left: 25px;
  padding-right: 25px;
  text-align: center;
}
table tr:nth-child(even) {
  background-color: #eee;
}
table tr:nth-child(odd) {
 background-color: #fff;
}
table th {
  background-color: #E1CD66;
  color: black;
}
.w3-table {
  width: 80em;

}
.container .subtitle{
  font-family: 'Alfa Slab One',cursive,sans-serif;
}
/*.container{
  background-color: #efc050;
}*/
.w3-theme{
   background-color: #efc050;
}

</style>
</head>

<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<body>

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
<div>
  <center><h1 class="w3-container subtitle">STUDENT FEEDBACK REPORT</h1></center>
  </div>


 <%
 String course = request.getParameter("course");
 String branch = request.getParameter("branch");
 String semester = request.getParameter("semester");
 float avg = 0,sum1 = 0,sum2 = 0,sum3 = 0,sum4 = 0,sum5 = 0,count,nost;

 try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
 Statement st = con.createStatement();

 int i=1,j=1;


 nost=0;
 ResultSet rs = st.executeQuery("select count(distinct id) from feedback,system where system.regid=feedback.id and system.course='"+course+"' and system.branch='"+branch+"' and system.semester='"+semester+"'");
 if(rs.next()){
 nost = Integer.parseInt(rs.getString(1));
}


count = 0;

ResultSet rs1 = st.executeQuery("select * from system,feedback where system.course='"+course+"' and system.branch='"+branch+"' and system.semester='"+semester+"' and system.regid=feedback.id");

if(rs1.next()){

do{
sum1 += Integer.parseInt(rs1.getString(12));
sum2 += Integer.parseInt(rs1.getString(13));
sum3 += Integer.parseInt(rs1.getString(14));
sum4 += Integer.parseInt(rs1.getString(15));
sum5 += Integer.parseInt(rs1.getString(16));
count = count + 1;

}while(rs1.next());
          //out.println("count: "+count+",sum1: "+sum1);
          
          
          ResultSet rs2 = st.executeQuery("select * from subject where course='"+course+"' and branch='"+branch+"' and sem='"+semester+"'");
          while(rs2.next()){
          out.println("<html>");
          out.println("<body>");
            out.println("<center>");  
              out.println("<h1>SEMESTER: "+semester);
              out.println("</h1>");
              out.println("<ul>");
                out.println("<li >Course: "+course+"</li>");
                out.println("<li >No of Feedbacks : "+(nost)+"</li>");
                out.println("<li >Branch: "+branch+"</li>");
              out.println("</ul>");
            out.println("</table>");
           // out.println("<div class='container'>");  
              out.println("<table id='exportButton' class='table table-hover'>");
                out.println("<tr>");
                  out.println("<th>SUBJECT</th>");
                  out.println("<th>AVG POINTS</th>");

                out.println("</tr>");
                out.println("<tr>");
                  out.println("<td>"+rs2.getString(2)+"</th>");
                    out.println("<td>"+(sum1/count)+"</th>");

                    out.println("</tr>");
                    out.println("<tr>");
                      out.println("<td>"+rs2.getString(3)+"</th>");
                        out.println("<td>"+(sum2/count)+"</th>");

                        out.println("</tr>");
                        out.println("<tr>");
                          out.println("<td>"+rs2.getString(4)+"</th>");
                            out.println("<td>"+(sum3/count)+"</th>");

                            out.println("</tr>");
                            out.println("<tr>");
                              out.println("<td>"+rs2.getString(5)+"</th>");
                                out.println("<td>"+(sum4/count)+"</th>");

                                out.println("</tr>");
                                out.println("<tr>");
                                  out.println("<td>"+rs2.getString(6)+"</th>");
                                    out.println("<td>"+(sum5/count)+"</th>");

                                    out.println("</tr>");
                                  out.println("</table>");
                                out.println("</div>");
                              out.println("</center>");
                            out.println("</body>");
                            out.println("</html>");

                          }

                        } else {

                        out.println("<br/><center><h1>Record not inserted for semester: "+semester+"</h1><center><br/>");
                      }













                      con.close();
                    }catch(Exception e){
                    out.println("Error:"+e);
                  } finally { }



                  %>

                </div>
                 </div>
                <br><br><br><br>
                </div>
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