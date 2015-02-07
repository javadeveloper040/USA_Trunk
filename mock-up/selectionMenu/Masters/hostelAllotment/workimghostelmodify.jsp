<%@ page language="java" import="java.util.*,vdb.Db,java.sql.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>HOSTEL ALLOTMENT Modify</title><link rel="stylesheet" href="../../sheet1.css">

		<script language="javascript">
function getRequestObject()
{
if(window.XMLHttpRequest)
	{
	return(new XMLHttpRequest());
	}
else if(window.ActiveXObject)
	{
	return(new ActiveXObject("Microsoft.XMLHTTP"));
	}
else
	{
	return(null);
	}
}
function fun(rollno)
{
   	var request=getRequestObject();
	request.onreadystatechange=function(){handleResponse(request);};
	request.open("GET","student_hostel_view.jsp?rollno="+rollno,true);
	request.send(null);     
}
function handleResponse(request)
{
	if(request.readystate==4){
	var s=request.responseText;
	if(s=="abc"){
	document.f1.sem.value="";
	document.f1.parent.value="";
	document.f1.student.value="";
	document.f1.branch.value="";	
	}
	else{
	a1=String(s);
	x=a1.split('$');
	
		document.f1.sem.value	=x[0];
	document.f1.parent.value=x[1];
	document.f1.student.value=x[2];
	document.f1.branch.value=x[3];
	document.getElementById("all_data").style.visibility="hidden";
	document.getElementById("select_id").style.visibility="visible";
	var hcode=x[4];
	var rno=x[5];
	var dat=x[7];
	var rollno=x[6];
		document.getElementById("img").src=x[8];
	var canceldate=x[9];
	select_id.innerHTML ="<table border=\"1\" align=\"center\" ><tr bgcolor=\"lightblue\"><th>ROLL NO</th><th>NAME</th><th>HOSTEL CODE</th><th>ROOM NO.</th><th>MONTH & YEAR</th><th>DISC DATE</th></tr><tr><td>"+x[6]+"</td><td>"+x[2]+"</td><td>"+hcode+"</td><td>"+rno+"</td><td>"+dat+"</td><td>"+canceldate+"</td></table>"; 
	}}
}	function val()
		{
		var hostel=document.getElementById("hostel").value;
			if(hostel==0)
			{
				alert("enter the hostel name");
				document.f1.hostel.focus();
				return false;
			}
			var rollno=document.getElementById("rollno").value;
			if(rollno=="")
			{
				alert("enter the roll number");
				document.f1.rollno.focus();
				return false;
			}
			var branch=document.getElementById("branch").value;
			if(branch=="")
			{
				alert("enter the branch name");
				document.f1.branch.focus();
				return false;
			}
			var sem=document.getElementById("sem").value;
			if(sem=="")
			{
				alert("enter the semister");
				document.f1.sem.focus();
				return false;
			}
			var hostel=document.getElementById("hostel").value;
			if(hostel==0)
			{
				alert("enter the hostel name");
				document.f1.hostel.focus();
				return false;
			}
			var student=document.getElementById("student").value;
			if(student=="")
			{
				alert("enter the student name");
				document.f1.student.focus();
				return false;
			}
			var parent=document.getElementById("parent").value;
			if(parent=="")
			{
				alert("enter the parent name");
				document.f1.parent.focus();
				return false;
			}
			var room=document.getElementById("room_num").value;
			if(room==0)
			{
				alert("enter your room number");
				document.f1.roomno.focus();
				return false;
			}
			var month=document.getElementById("month").value;
			if(month==0)
			{
				alert("enter your month");
				document.f1.month.focus();
				return false;
			}
			var year=document.getElementById("year").value;
			if(year==0)
			{
				alert("enter your year");
				document.f1.year.focus();
				return false;
			}
		}
		</script>
  </head>
  
  <body bgcolor="skyblue">   

		<%!Connection con = null;
			PreparedStatement pst=null;
			ResultSet rs=null; 
			String hostelcode=null;%>
		<%
		hostelcode=request.getParameter("hostelcode");
		try{
    	con=Db.connect(); 
		}
	catch(Exception e)
	{}
 	%>
		<form action="./student_hostel_modify.jsp" name="f1" onsubmit="return val()">
			<table cellpadding="10">
				<tr>
					<th align="left">
						HostelCode:
						<select name="hostelcode" style="width:100%" title="select hostel code">
							<option value="select">Select Hostel</option>
							<%
										 pst=con.prepareStatement("select distinct hostel_code from hostel_room  order by hostel_code");
										 rs=pst.executeQuery();
										while(rs.next()){%>
	  									<option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
  										<%}pst.close(); %>
							
						</select>
					</th>
					<td>&nbsp;
					</td>
					<td rowspan="2">
						<img src="a.jpg" id="img" width="150" height="150" alt="loading.."></img>
					</td>
				</tr>
				<tr>
					<td>
  						<fieldset>
    						<legend><b>Student Details:</b></legend>
    						<table cellpadding="5">
    							<tr>
    								<th align="left">
    									Roll no: 
    								</th>
    								<td>
    									<input type="text" name="rollno" id="rollno" onblur="fun(this.value)" title="Enter roll number"/>
    								</td>
    								<th align="left">
    									Branch: 
    								</th>
    								<td>
    									<input type="text" size="6" name="branch" id="branch"/>		
    								</td>
    								<th align="left">
    									Sem:
    								</th>
    								<td>
    									<input type="text" size="4" name="sem" id="sem"/>
    								</td>
    							</tr>
    							<tr>
    								<th align="left">
    									Student : 
    								</th>
    								<td colspan="5">
    									<input type="text" style="width:100%" name="student" id="student" />
    								</td>
    							</tr>
    							<tr>
    								<th align="left">
    									Parent :
    								</th>
    								<td colspan="5">
    									<input type="text" style="width:100%" name="parent" id="parent" />
    								</td>
    							</tr>
    						</table>    						
  						</fieldset>
  					</td>
  					<td>
  						<table cellpadding="5">
  							<tr>
  								<th align="left">
  									Room no:
  								</th>
  								<td>
                                 	<select name="room_num" id="room_num" title="select a room">
  										  	<option value="select">SELECT</option>   								          					
  								           <%  								           
  								            pst=con.prepareStatement("select distinct room_num from hostel_room ");
  								            ResultSet rs=pst.executeQuery();
  								            while(rs.next()){
  								            %>
  								            <option value="<%=rs.getString(1)%>"><%= rs.getString(1)%></option>
  								            <%} pst.close(); %>
  									</select>
  								</td>
  							</tr>
  							<tr>
  								<th align="left">
  									Month:
  								</th>
  								<td>
  									<select name="month" title="select a month">
	  									<option value="0">select
  										<option value="01">Jan
  										<option value="02">Feb
  										<option value="03">Mar
  										<option value="04">Apr
  										<option value="05">May
  										<option value="06">Jun
  										<option value="07">Jul
  										<option value="08">Aug
  										<option value="09">Sep
  										<option value="10">Oct
  										<option value="11">Nov
  										<option value="12">Dec
  									</select>
  								</td>
  							</tr>
  							<tr>
  								<th align="left">
  									Year:
  								</th>
  								<td>
  									<select name="year">
	  									<option>select</option>
  										<%for(int i=2000;i<2035;i++){%>   <option value="<%=i%>"><%=i%></option>   <%}%>		
  									</select>
  								</td>
  							</tr>
							<tr>
  								<th align="left">
  									Date:
  								</th>
  								<td>
  									<select name="Date">
  									<option>select</option>
	  									<%for(int i=1;i<31;i++){%>   <option value="<%=i%>"><%=i%></option>   <%}%>
  									</select>
  								</td>
  							</tr>
  						</table>
 					</td>
  				</tr>
  			</table>
  			<br/><hr><br/>
  			<div id="button" style="visibility:visible">
		<center>
  				<input type="submit" value="  Modify "> &nbsp;
  				<input type="reset" value="Cancel">&nbsp;
  				<input type="button" value="    Quit    " onClick="window.close()" >&nbsp;
			</center>
			</div><br><br>
  			<div id="select_id" style="visibility:hidden;">
   				</div>
  			<div id="all_data" style="visibility:visible;overflow:auto;height:200">
  						
  			<table align="center" border="1" width="100%">
  				<tr bgcolor="lightblue">
  					<th>ROLL. NO.</th>
  					<th>HOSTEL CODE</th>
  					<th>ROOM NO.</th>
  					<th>MONTH &amp; YEAR</th>
  				</tr>
  				<%  				
  				pst=con.prepareStatement("select * from student_accomodation_details_tab");
				 rs=pst.executeQuery();
				while(rs.next()){if(rs.getString("cancel_date")==null){
				%>
				<tr>
  					<td><%= rs.getString("roll_num")%></td>
  					<td><%=rs.getString("hostel_code")%></td>
  					<td><%=rs.getString("room_num")%></td>
  					<td><%=rs.getString("reg_date")%></td>  					
  		   		</tr>  
  		   		<%}}
				pst.close();
  				%>
  				
   			</table></div>
   			  			<br/><br/>				

			</form>
</body>
</html>
