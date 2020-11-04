<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" %>
<!DOCTYPE html> 
<html>
 <head>    
  <title>subject wise</title>
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
    color: white;
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
ul {
  list-style-type: none;
  margin: 0;
  margin-bottom: 2em;
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

.w3-myfont {
  margin-top: 2em;
  margin-bottom: 1em;
}
.w3-table {
  width: 40em;
}
.w3-theme { background-color:#efc050 !important}



  </style>
  </head>
  <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
     <div id="element-to-print">
      <div class="w3-row">
        <div class="w3-container w3-theme">
          <div class="w3-col  m2 vssutLogo ">
            <img src="NuaOdisha-158-vssut.png">
          </div>
          <div class="w3-col  m10">  
            <div class=" w3-center w3-myfont ">
              <h1 class="w3-xxlarge">VEER SURENDRA SAI UNIVERSITY OF TECHNOLOGY</h1>
              <p class=" w3-center w3-xlarge">BURLA,ODISHA</p>
            </div>
          </div>
        </div>
      </div>
  <div class="w3-container ">
    <center><h1>SUBJECT WISE AVERAGE POINTS</h1></center>
</div>
  <div>
                                


 <%
    String course = request.getParameter("course");
    String branch = request.getParameter("branch");
    String semester = request.getParameter("semester");
	
    String subject = request.getParameter("subject");
    float avg = 0;
    float cnt=0,sum1 = 0,sum2 = 0,sum3 = 0,sum4 = 0,sum5 = 0,sum6=0,sum7=0,sum8=0,sum9=0,sum10=0,count=0;
    int i=0;
    String sub1=null,sub2=null,sub3=null,sub4=null,sub5=null;
    String ques[] = new String[10];
    ResultSet r=null,rs1=null,rs2=null;
    try{
      Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
      Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
      rs2=st.executeQuery("select * from question");
      while(rs2.next()){
           
           ques[i]=rs2.getString(2);
           i++;
      }
  
      r = st.executeQuery("select count(distinct regid) from system where course = '"+course+"' and branch = '"+branch+"' and semester = '"+semester+"' and type='submit'");
                r.last();
                cnt=r.getInt(1);
                
              rs1 = st.executeQuery("select * from subject where course = '"+course+"' and branch = '"+branch+"' and sem = '"+Integer.parseInt(semester)+"'");
              if(rs1.next())
              {
                 sub1=rs1.getString(2);
                 sub2=rs1.getString(3);
                 sub3=rs1.getString(4);
                 sub4=rs1.getString(5);
                 sub5=rs1.getString(6);
              }

              rs1 = st.executeQuery("select * from system,feedback where system.course='"+course+"' and system.branch='"+branch+"' and system.semester='"+semester+"' and system.regid=feedback.id");
              if(sub1.equals(subject))
              {
                   
                   while(rs1.next()){
                       
                       switch(rs1.getString("question")){
                            case "a":sum1 += Float.parseFloat(rs1.getString("sub1"));
                            break;
                            case "b":sum2 += Float.parseFloat(rs1.getString("sub1"));
                            break;
                            case "c":sum3 += Float.parseFloat(rs1.getString("sub1"));
                            break;
                            case "d":sum4 += Float.parseFloat(rs1.getString("sub1"));
                            break;
                            case "e":sum5 += Float.parseFloat(rs1.getString("sub1"));
                            break;
                            case "f":sum6 += Float.parseFloat(rs1.getString("sub1"));
                            break;
                            case "g":sum7 += Float.parseFloat(rs1.getString("sub1"));
                            break;
                            case "h":sum8 += Float.parseFloat(rs1.getString("sub1"));
                            break;
                            case "i":sum9 += Float.parseFloat(rs1.getString("sub1"));
                            break;
                            case "j":sum10 += Float.parseFloat(rs1.getString("sub1"));
                            break;
                    }
                    

                 }
                 

              }
              else if(sub2.equals(subject))
              {
                  
                   while(rs1.next()){
                        
                       switch(rs1.getString("question")){
                            case "a":sum1 += Float.parseFloat(rs1.getString("sub2"));
                            break;
                            case "b":sum2 += Float.parseFloat(rs1.getString("sub2"));
                            break;
                            case "c":sum3 += Float.parseFloat(rs1.getString("sub2"));
                            break;
                            case "d":sum4 += Float.parseFloat(rs1.getString("sub2"));
                            break;
                            case "e":sum5 += Float.parseFloat(rs1.getString("sub2"));
                            break;
                            case "f":sum6 += Float.parseFloat(rs1.getString("sub2"));
                            break;
                            case "g":sum7 += Float.parseFloat(rs1.getString("sub2"));
                            break;
                            case "h":sum8 += Float.parseFloat(rs1.getString("sub2"));
                            break;
                            case "i":sum9 += Float.parseFloat(rs1.getString("sub2"));
                            break;
                            case "j":sum10 += Float.parseFloat(rs1.getString("sub2"));
                            break;
                    }
                 }
                 
              }
               else if(sub3.equals(subject))
              {
                  
                   while(rs1.next()){
                       
                       switch(rs1.getString("question")){
                            case "a":sum1 += Float.parseFloat(rs1.getString("sub3"));
                            break;
                            case "b":sum2 += Float.parseFloat(rs1.getString("sub3"));
                            break;
                            case "c":sum3 += Float.parseFloat(rs1.getString("sub3"));
                            break;
                            case "d":sum4 += Float.parseFloat(rs1.getString("sub3"));
                            break;
                            case "e":sum5 += Float.parseFloat(rs1.getString("sub3"));
                            break;
                            case "f":sum6 += Float.parseFloat(rs1.getString("sub3"));
                            break;
                            case "g":sum7 += Float.parseFloat(rs1.getString("sub3"));
                            break;
                            case "h":sum8 += Float.parseFloat(rs1.getString("sub3"));
                            break;
                            case "i":sum9 += Float.parseFloat(rs1.getString("sub3"));
                            break;
                            case "j":sum10 += Float.parseFloat(rs1.getString("sub3"));
                            break;
                    }
                 }
                 
              }
               else if(sub4.equals(subject))
              {
                  
                   while(rs1.next()){
                        
                       switch(rs1.getString("question")){
                            case "a":sum1 += Float.parseFloat(rs1.getString("sub4"));
                            break;
                            case "b":sum2 += Float.parseFloat(rs1.getString("sub4"));
                            break;
                            case "c":sum3 += Float.parseFloat(rs1.getString("sub4"));
                            break;
                            case "d":sum4 += Float.parseFloat(rs1.getString("sub4"));
                            break;
                            case "e":sum5 += Float.parseFloat(rs1.getString("sub4"));
                            break;
                            case "f":sum6 += Float.parseFloat(rs1.getString("sub4"));
                            break;
                            case "g":sum7 += Float.parseFloat(rs1.getString("sub4"));
                            break;
                            case "h":sum8 += Float.parseFloat(rs1.getString("sub4"));
                            break;
                            case "i":sum9 += Float.parseFloat(rs1.getString("sub4"));
                            break;
                            case "j":sum10 += Float.parseFloat(rs1.getString("sub4"));
                            break;
                    }
                 }
                 
              } else if(sub5.equals(subject))
              {
                  
                   while(rs1.next()){
                        
                       switch(rs1.getString("question")){
                            case "a":sum1 += Float.parseFloat(rs1.getString("sub5"));
                            break;
                            case "b":sum2 += Float.parseFloat(rs1.getString("sub5"));
                            break;
                            case "c":sum3 += Float.parseFloat(rs1.getString("sub5"));
                            break;
                            case "d":sum4 += Float.parseFloat(rs1.getString("sub5"));
                            break;
                            case "e":sum5 += Float.parseFloat(rs1.getString("sub5"));
                            break;
                            case "f":sum6 += Float.parseFloat(rs1.getString("sub5"));
                            break;
                            case "g":sum7 += Float.parseFloat(rs1.getString("sub5"));
                            break;
                            case "h":sum8 += Float.parseFloat(rs1.getString("sub5"));
                            break;
                            case "i":sum9 += Float.parseFloat(rs1.getString("sub5"));
                            break;
                            case "j":sum10 += Float.parseFloat(rs1.getString("sub5"));
                            break;
                    }
                 }
                 
              }

           
           
           out.println("<html>");
            out.println("<body>");
            out.println("<center>");  
            out.println("<h1>SUBJECT: "+subject);
            out.println("</h1>");
            out.println("<ul>");
            out.println("<li class='list1'>No of Students submitted: "+(cnt)+"</li>");
            out.println("<li class='list2'>Branch: "+branch+"</li>");
            out.println("</ul>");
           // out.println("</table>");  
           out.println("<table class='w3-table w3-striped w3-bordered w3-hoverable w3-card-4'>");
              out.println("<tr>");
                out.println("<th>QUESTIONS</th>");
                out.println("<th>Points</th>");
                
              out.println("</tr>");
              out.println("<tr>");
                out.println("<td>"+ques[0]+ "</td>");
                out.println("<td>"+(sum1/cnt)+"</td>");
                
              out.println("</tr>");
              out.println("<tr>");
                out.println("<td>"+ques[1]+"</th>");
                out.println("<td>"+(sum2/cnt)+"</th>");
                
              out.println("</tr>");
              out.println("<tr>");
                out.println("<td>"+ques[2]+"</th>");
                out.println("<td>"+(sum3/cnt)+"</th>");
                
              out.println("</tr>");
              out.println("<tr>");
                out.println("<td>"+ques[3]+"</th>");
                out.println("<td>"+(sum4/cnt)+"</th>");
                
              out.println("</tr>");
              out.println("<tr>");
                out.println("<td>"+ques[4]+"</th>");
                out.println("<td>"+(sum5/cnt)+"</th>");
                
              out.println("</tr>");
              out.println("<tr>");
                out.println("<td>"+ques[5]+"</th>");
                out.println("<td>"+(sum6/cnt)+"</th>");
                
              out.println("</tr>");
              out.println("<tr>");
                out.println("<td>"+ques[6]+"</th>");
                out.println("<td>"+(sum7/cnt)+"</th>");
                
              out.println("</tr>");
              out.println("<tr>");
                out.println("<td>"+ques[7]+"</th>");
                out.println("<td>"+(sum8/cnt)+"</th>");
                
              out.println("</tr>");
              out.println("<tr>");
                out.println("<td>"+ques[8]+"</th>");
                out.println("<td>"+(sum9/cnt)+"</th>");
                
              out.println("</tr>");
              out.println("<tr>");
                out.println("<td>"+ques[9]+"</th>");
                out.println("<td>"+(sum10/cnt)+"</th>");
                
              out.println("</tr>");
            out.println("</table>");
            avg=(sum1+sum2+sum3+sum4+sum5+sum6+sum7+sum8+sum9+sum10)/(10*cnt);
            
            out.println("<h4>Average in the: "+subject+" = "+avg+" ");
            out.println("</h4>");
            out.println("</center>");
            out.println("</body>");
            out.println("</html>");
       
			
        
      con.close();
    }catch(Exception e){
      out.println("Error:"+e);
    } finally { }
  
  

%>
  </div>
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