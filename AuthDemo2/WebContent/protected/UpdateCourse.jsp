<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="sql.*" %> 
       <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<style>
table.myTable
{
    width:100%;
}
myTable td
{
    border: solid 1px #cecece;
}
 
#tableA tr:hover {background-color: #f5f569}
 
 
 
 
 
#container { width: 80%; margin: auto;  padding: 20px; }
    .row {   margin-bottom: 20px; position: relative; }
    .row div { height: 100%; }
    .single { background-color: white; }
    .column-2 { width: 48%; }
    .column-3 { width: 30%; }
    .left {  float: left; }
    .center { float: left; margin: 0 5%;   }
    .right {  float: right; }
 
 </style>
</head>
<body> <jsp:include page="../menus/menu_lecturer.jsp" flush="true" /><center>
<h1>Update Course</h1>
<%
 
if((session.getAttribute("MsgUpdateSubject")+"").contains("ucc"))
{out.print(session.getAttribute("MsgUpdateSubject")+"");
session.setAttribute("MsgUpdateSubject","");}
else
{out.print( "Ready."  +"");
session.setAttribute("MsgUpdateSubject","");
}
String subjectid= request.getParameter("subjectcode");
String securitytoken= request.getParameter("securitytoken");

String key=session.getAttribute("staffid") +"";
BusinessLogic b= new BusinessLogic(); 
//lecturer_subject_view
String	  sql="SELECT * FROM lecturer_subject_view   where staffid LIKE '"+ key +"' AND subjectcode like '"+ subjectid +"' ";
if(b.SQLInjectionFilter(sql))
{
//pass	
}
else
{
//sql injection is coming.	
}

ResultSet rs = b.executeQuery(sql) ;
int   counter=0;
%>
<!-- class="myT" -->
<table   class="myTable"  id="tableA"> 
<tr>
<td>No</td>
<td>Subject Code</td>
<td>Subject Name</td>
 
<td>Credit Hour</td></tr>
<% int  no=0;
while(rs.next())
{
	%><tr><td><%=++no%></td><% 
	%> <td><%=rs.getString("subjectcode")%></td><% 
	%><td><%=rs.getString("subjectname")%></td><% 
	%><td><%=rs.getString("credithour")%></td><% 
	 
	%><td>   </td></tr>
 </table></center>


<form action="../UpdateSubject.do" method="GET">
  
    <div id="container">
    <div class="row single">
 <div class="column-2 left">No :</div><div class="column-2 right"><input type="text" name="no" value="<%=no %>" /></div></div>
 
  <div class="row double">
 <div class="column-2 left">
 Subject Code :</div><div class="column-2 right"><input type="text" name="subjectcode" readonly value="<%=rs.getString("subjectcode") %>" /></div> </div>

 <div class="row double">
 <div class="column-2 left">
 Subject Name :</div><div class="column-2 right"><input type="text" name="subjectname" value="<%=rs.getString("subjectname") %>" /></div></div>

 <div class="row double">
 <div class="column-2 left">Credit Hour : </div><div class="column-2 right"><input type="text" name="credithour" value="<%=rs.getString("credithour") %>" /></div>
   </div>
    	     
    </div><br /><br />
    <p align="center"> <input type= "hidden" name="subjectcode" value= "<%=rs.getString("subjectcode") %>" />
            		    <input type= "hidden" name="securitytoken" value= "534534rffwwefwefhh" />
            		     <input type= "hidden" name="code" value= "update" />
            	  <input class="text"  type="submit" value="Save"  /></p>
</form><% 
}
%><% 
rs.close();
b.close();
%>
</body>
</html>