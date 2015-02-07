<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<html>
  <head>
    <title>Course Master Modify</title>
  <script language="javascript" src="getcoursemaster.js">
  </script>
  </head>
  <body bgcolor="skyblue">
  <fieldset> 
  <legend><b>Modify the Course Details Here</b></legend>
  
   <table cellspacing="5" cellpadding="10">
    <tr>
		      <td width="70%">
		      	<form name="form1" action="./modifyCoursedet.jsp">
		      	
							  		<table>
							  			<tr>
							  				<th align="left">Course Name:</th>
							  				<td><input type="text" name="course_name" id="course_name" value='<%=request.getParameter("course_name")%>' onblur="viewCoursebyname()"></td>
							  				<th align="left">Duration:</th>
							  				<td><input type="text" name="course_duration" id="course_duration" size="6" value='<%=request.getParameter("course_duration")%>'></td>						  				
							  			</tr>
							  			<tr >
							  				<th align="left">University:</th>
							  				<td colspan="4"><input type="text" name="university_name" id="university_name" value='<%=request.getParameter("university_name")%>'/>
							  				</td>
							  				<td><input type="submit" value="  modify  " onclick="valCourse()"/> </td>
							  				<td><input type="button" value="  view  " onclick="viewCoursebyname()"/> </td>
							  			</tr>				  			
							  		</table>
				</form>
				<form name="form2" action="./modifyFeedet.jsp">	
					  		
							  		<fieldset>
							  		<legend><b>Fee Details</b></legend>
							  			<table>
							  			<tr>
							  				<th align="left">Fee name:
							  				<input type="text" name="fee_name" id="fee_name" size="35" onblur="viewFee()"/>
							  				</th>
							  				<td>
							  					<fieldset>
							  					<legend><b>Month &amp; Year</b></legend>
							  					<table>
							  					<tr>
							  					<td>
							  					<input type="text" name="month" id="month" size="6"/>
							  					</td>
							  					<td>
							  					<input type="text" name="year" id="year" size="8"/>
							  					</td>
							  					</tr>
							  					</table> 
							  					</fieldset> 					
							  				</td>
							  				<th align="left">Amount<br>
							  				<input type="text" name="amount" id="amount" style="text-align:right" size="12">
							  				</th>
							  				<td><input type="submit" value="  modify  " onclick="valFee()"/> </td>
							  				<th>
							  				<input type="button" value="  view  " onclick="viewFee()"/>
							  				</th>
							  			</tr>
							  			</table>
							  			<table border="1" width="100%">
							  				<tr>
							  					<th width="40%">Fee Name</th>
							  					<th width="20%">Month</th>
							  					<th width="20%">Year</th>
							  					<th width="20%">Amount</th>
							  				</tr>
							  				 <%try {		 
	        Statement st = vdb.Db.connect().createStatement();        
	        ResultSet res = st.executeQuery("SELECT * FROM  fee_coursemaster_details where course_name='"+session.getAttribute("course_name")+"'");
	        while (res.next()) {%>
					<tr>
					<td><%=res.getString(2) %></td>
					<td><%=res.getString(3) %></td>
					<td><%=res.getString(4) %></td>
					<td><%=res.getString(5) %></td>
					</tr>
	        <% }
		}
	      catch (Exception s){
	       s.printStackTrace();
	      }%>
							  				
							  			</table> 		 		  		
							  		</fieldset>
						</form>
		  		</td> 
		  		 		
  		<td width="30%">
  		<form name="form0">
  		<fieldset>
  		<legend><b>Existing courses</b></legend>
  		<select name="existing_courses" id="existing_courses" size="5" style="width:100%" onclick="modifyCourse(this.value)">
  		 <%try {		 
	        Statement st = vdb.Db.connect().createStatement();        
	        ResultSet res = st.executeQuery("SELECT * FROM  coursemaster_tab");
	        while (res.next()) {%>
					<option value="<%=res.getString(1)%>"><%=res.getString(1) %></option>
	        <% }
		}
	      catch (Exception s){
	       s.printStackTrace();
	      }%>
  		</select>
  		</fieldset>
  		</form>
  		<form name="form3" action="./modifyBranchdet.jsp">
  		<fieldset>
  		<legend><b>Branch Details</b></legend>
  			<table  cellspacing="5">
  				<tr>
  					<th align="left">BranchCode<input type="text" name="branch_code" id="branch_code" size="9" onblur="viewBranch()"></th>
  					<th align="left">Branch Name<input type="text" name="branch_name" id="branch_name" size="30"></th>
  					<th align="left">Ref:<input type="text" name="ref" id="ref" size="5"></th>
  					<th align="left">Seats:<input type="text" name="seats" id="seats" size="3"></th>
  					<td><input type="submit" value="  modify  " onclick="valBranch()"/> </td>
  					<td><input type="button" value="  View  " onclick="viewBranch()"></td>
  				</tr>
  				<tr>
  					<td colspan="4">
		  					<table border="1" width="100%">
		  					<tr>
			  					<th width="25%">BranchCode</th>
			  					<th width="45%">Branch Name</th>
			  					<th width="15%">Ref:</th>
			  					<th width="15%">Seats:</th>
		  					</tr>
		  					<%try {		 
	        Statement st = vdb.Db.connect().createStatement();        
	        ResultSet res = st.executeQuery("SELECT * FROM  branch_coursemaster_details where course_name='"+session.getAttribute("course_name")+"'");
	        while (res.next()) {%>
					<tr>
					<td><%=res.getString(2) %></td>
					<td><%=res.getString(3) %></td>
					<td><%=res.getString(4) %></td>
					<td><%=res.getString(5) %></td>
					</tr>
	        <% }
		}
	      catch (Exception s){
	       s.printStackTrace();
	      }%>
		  					</table>
		  			</td>
  				</tr>
  			</table>  			
  		</fieldset>
  		</form>
  		</tr>
  		
  		<tr>
	  		<td width="60%">
		  		<table width="100%">
		  		<tr>
			  		<td>
			  			<form name="form4" action="./modifySeatdet.jsp">
			  			<fieldset>
				  		<legend><b>Seat Details</b></legend>
				  		<table cellspacing="5">
					  			<tr>
					  				<th align="left" width="40%">Fee Category:
					  				<select name="fee_category" id="fee_category" style="width:100%"><option value="Common">All</option>
					  				<option value="Diff">Non-Regular</option></select>
					  				</th>
					  				<th align="left" width="40%">Seat Category:
					  				<select name="seat_category" id="seat_category" style="width:100%"><option value="OC">OC</option>
					  				<option value="BC-A">BC-A</option><option value="BC-B">BC-B</option><option value="BC-C">BC-C</option>
					  				<option value="BC-D">BC-D</option><option value="SC">SC</option><option value="ST">ST</option>
					  				<option value="PHP">PH</option><option value="OTHERS">OTHERS</option>
					  				</select>  					
					  				</th>
					  				<th align="left" width="10%">Percentage:
					  				<input type="text" name="percentage" id="percentage" size="5">
					  				</th>
					  				<td><input type="submit" value="  Modify  " onclick="valSeat()"></td>
					  		</tr>
					  			</table>
					  			
					  			<table border="1" width="100%">
					  				<tr>
					  					<th width="40%">Fee Category</th>
					  					<th width="40%">Seat Category</th>
					  					<th width="20%">Percentage</th>  					
					  				</tr>
					  				<%try {		 
	        Statement st = vdb.Db.connect().createStatement();        
	        ResultSet res = st.executeQuery("SELECT * FROM  seat_coursemaster_details where course_name='"+session.getAttribute("course_name")+"'");
	        while (res.next()) {%>
					<tr>
					<td><%=res.getString(2) %></td>
					<td><%=res.getString(3) %></td>
					<td><%=res.getString(4) %></td>
					</tr>
	        <% }
		}
	      catch (Exception s){
	       s.printStackTrace();
	      }%>
					  			</table>
				  		</fieldset>
				  		</form>
			  		</td>			  		
     			</tr>
     			</table>
     		  </td> 
     		     			
			  <td width="30%">
			  <form name="form5" action="./modifySemdet.jsp">
			  <fieldset>
			  		<legend><b>Semester Details</b></legend>
			  			<table>
			  			<tr>
			  				<th align="left" width="20%">Year:<input type="text" name="year" id="year" size="5"></th>
			  				<th align="left" width="30%">Semester:<input type="text" name="semester" id="semester" size="10"></th>
			  				<th align="left" width="30%">Completion <br> of Course:<input name="comp_course" id="comp_course" type="checkbox" value="yes"></th>
			  				<th align="left" width="20%">Annual <br> Exam:<input type="checkbox" name="annual_exam" id="annual_exam" value="yes"></th>
			  				<td><input type="submit" value="  Modiy  " onclick="valSem()"></td>
			  			</tr>
			  			</table>
			  			<table border="1">
			  				<tr>
			  					<th width="20%">Year</th>
			  					<th width="30%">Semester</th>
			  					<th width="30%">Completion of course</th>
			  					<th width="20%">Annual Exam</th>
			  				</tr>
			  				<%try {		 
	        Statement st = vdb.Db.connect().createStatement();        
	        ResultSet res = st.executeQuery("SELECT * FROM  semester_coursemaster_details where course_name='"+session.getAttribute("course_name")+"'");
	        while (res.next()) {%>
					<tr>
					<td><%=res.getString(2) %></td>
					<td><%=res.getString(3) %></td>
					<td><%=res.getString(4) %></td>
					<td><%=res.getString(5) %></td>
					</tr>
	        <% }
		}
	      catch (Exception s){
	       s.printStackTrace();
	      }%>
			  				
			  			</table>
			  	</fieldset>
			  	</form>
			  </td>
		  	</tr>	  		
		 </table>

<center><input type="button" value="   Quit   " onClick="window.close()"></center>
 
    </fieldset>   
   </body>
 </html>