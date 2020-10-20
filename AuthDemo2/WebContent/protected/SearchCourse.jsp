<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       
	  

 
    
<table   class="myTable"  >
	        <tr>
	       <td ><form action="DisplaySearchedCourses.jsp" method="GET" id="searchkey" class="center"> 
							
									<input class="input" size="70" name="key" type="text"  id="key" value="some text..." onFocus="if (this.value == 'some text...') {this.value = '';}" onBlur="if (this.value == '') {this.value = 'some text...';}" />
							 <input type="submit" class="button"  value="<< Search"  />
							 
					</form>
					  
						 </td>
	       
	         </tr>
	        </table> 
	        <table>
	        <tr> <td><form action="DisplayCourses.jsp" method="GET" id="searchkey" class="center">
							 
									<input class="input" name="all" type="hidden" id="key" value="all"  />
								<input type="submit" class="button"   value="Show All"    />
						</form>		
						
						
						</td><td>	<form action="AddCourse.jsp" method="GET" id="searchkey" class="center">
							 
									<input class="input" name="addNew" type="hidden" id="addNew" value="nonce"  />
								<input type="submit" class="button"   value="Add New"    />
						</form>	</td><td></td> <td></td></tr></table>