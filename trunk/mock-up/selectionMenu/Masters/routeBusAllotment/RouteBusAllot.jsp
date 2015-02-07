<%@ page language="java" import="java.util.*,vdb.Db,java.sql.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ROUTE/BUS ALLOTMENT</title>
    <LINK REL=StyleSheet HREF="table.css" TYPE="text/css" >
        <link rel="stylesheet" href="../../sheet1.css">
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

	request.open("GET","student_det_dis.jsp?rollno="+rollno,true);
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
	document.f1.sem.value	=x[2];
	document.f1.parent.value=x[3];
	document.f1.student.value=x[0];
	document.f1.branch.value=x[1];
	document.getElementById("img").src=x[4];
	}}
}
		
		</script>
  </head>
  
  <body bgcolor="skyblue">   

		<%!Connection con = null;
			PreparedStatement pst=null;
			PreparedStatement pst1=null;
			ResultSet rs=null; 
			String hostelcode=null;int i=0;
			%>
		<%
		hostelcode=request.getParameter("hostelcode");
		try{
    	con=Db.connect(); 
		}
	catch(Exception e)
	{}
 	%>
		<form action="routebusinsert.jsp" name="f1">
			<table cellpadding="10">
				<tr>
					
					
					<td rowspan="2">
						<img src="a.jpg" id="img" width="150" height="150" alt="loading..."></img>
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
    									<input type="text" name="rollno" id="rollno" onblur="fun(this.value)" title="enter rollnumber"/>
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
  									Route:
  								</th>
  								<td>
                                 	<select name="route" id="route" title="select route id">
  										  	<option value="select">SELECT</option>   								          					
  								           <%  								           
  								            pst=con.prepareStatement("select distinct area_name from area_tab");
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
  									Bus Number:
  								</th>
  								<td>
  									<select name="bus_num" id="bus_num" title="select bus number">
  										  	<option value="select">SELECT</option>   								          					
  								           <%  								           
  								            pst1=con.prepareStatement("select distinct bus_num from bus_details_tab");
  								            ResultSet rs1=pst1.executeQuery();
  								            while(rs1.next()){
  								            %>
  								            <option value="<%=rs1.getString(1)%>"><%= rs1.getString(1)%></option>
  								            <%} pst1.close(); %>
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
  				<input type="submit" value="  New "> &nbsp;
  				<input type="reset" value="Cancel">&nbsp;
  				<input type="button" value="    Quit    " onClick="window.close()" >&nbsp;
			</center>
			</div><br><br>
  			<div id="select_id" style="visibility:hidden;">
   				</div>
  			<div id="all_data" style="height:100;overflow-y: scroll;
            overflow-x: hidden;
            border: solid #66CC99;
            border-width: 0px 0px 1px 0px;">
  	 			<table class="a" align="center" border="1"  cellspacing="0" cellpadding="0">
  				<thead>
  				<tr>
  					<th class="a">ROLL. NO.</th>
  					<th class="a">DATE</th>
  					<th class="a">AREANAME</th>
  					<th class="a">BUSNUMBER</th>
  				</tr>
  				</thead>
  				<tbody><tr><td>1</td><td>1</td><td>1</td><td>1</td></tr>
  				<%  				
  				pst=con.prepareStatement("select * from student_bus_acc_details_tab");
				 rs=pst.executeQuery();
				while(rs.next()){
					if(rs.getString("bus_cancel_date")==null){
						if(i==0)
		{
		%>
		<tr class="alt">
		<%
		i=1;
		}
		else
		{
			%>
			<tr class="a">
			<%
			i=0;
		}
		%>				
			
  					<td><%= rs.getString("roll_num")%></td>
  					<td><%=rs.getString("bus_reg_date")%></td>
  					<td><%=rs.getString("area_name")%></td>
  					<td><%=rs.getString("bus_num")%></td>  					
  		   		<%}}
				pst.close();
				con.close();
  				%>
  			</tbody>	
   			</table></div>
   			  			<br/><br/>				

			</form>
</body>
</html>
