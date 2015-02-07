<%@ page language="java" import="java.sql.*,vdb.Db"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<title>Give New Permissions</title>
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
function get(rollno)
{
   	var request=getRequestObject();
	request.onreadystatechange=function(){handleResponse(request);};
	request.open("GET","permission_display.jsp?rollno="+rollno,true);
	request.send(null);     
}
function handleResponse(request)
{
	if(request.readystate==4){
	var s=request.responseText;
	if(s=="sorry"){
	p1.innerText="THIS ID IS INVALID";
	document.f1.sem.value="";
	document.f1.parname.value="";
	document.f1.stuname.value="";
	document.f1.branch.value="";
	
	}
	else
	{
x=s.split("$");
	document.f1.branch.value	=x[0];
	document.f1.sem.value=x[1];
	document.f1.stuname.value=x[2];
	document.f1.parname.value=x[3];
}
}
}
 </script>
  </head>
  <body bgcolor="skyblue">
  <form name="f1" action="permissionsinsert.jsp">
  <fieldset><legend>Student Details</legend>
  	<table align="center" cellpadding="4">
  	<tr><th>RollNo:</th><td><input type="text" id="rollno" name="rollno" onblur="get(this.value)" title="Enter Roll Number"></td><td><p id="p1"></p></td></tr>
  	<tr><th>Branch:</th><td><input type="text" id="branch" name="branch"></td></tr>
  	<tr><th>Semester:</th><td><input type="text" id="sem" name="sem"></td></tr>
  	<tr><th>StudentName:</th><td><input type="text" id="stuname" name="stuname"></td></tr>
  	<tr><th>ParentName:</th><td><input type="text" id="parname" name="parname"></td></tr>
  	</table>
  	</fieldset>
  	<fieldset><legend>Enter The Details Of The Permissions</legend>
  	<table align="center" cellpadding="4">
  	<tr><th>Permission for:</th><td>
   	<select name="fee_name" title="select fee name">
  	<option value="0">select</option>
<%try
{
	Connection con=Db.connect();
	PreparedStatement pst=con.prepareStatement("select fee_name from feemaster_tab");
	ResultSet rs=pst.executeQuery();
	while(rs.next())
	{%>
		<option value="<%=rs.getString("fee_name")%>"><%=rs.getString("fee_name")%></option>
	<% }
}
catch(Exception e)
{
	System.out.println(e);
}%>
</select></td></tr>
  	<tr><th>Target Date:</th><td>Date:<select name="date" title="select date"><option value="0">select</option>
  														<%for(int i=1;i<=31;i++){%>   <option value="<%=i%>"><%=i%></option>   <%}%>
														</select>
  								Month:<select name="month" title="select month"><option value="0">select</option>
  														<option value="jan">JAN</option>
  														<option value="feb">FEB</option>
  														<option value="mar">MAR</option>
  														<option value="apr">APR</option>
  														<option value="may">MAY</option>
    												  	<option value="jun">JUN</option>
 													   	<option value="july">JULY</option>
 													   	<option value="aug">AUG</option>
    													<option value="sep">SEP</option>
    													<option value="oct">OCT</option>
    													<option value="nov">NOV</option>
    													<option value="dec">DEC</option>
  														</select>
 								Year:<select name="year" title="select year">
	  									<option>select</option>
									<%for(int i=2000;i<2035;i++){%>   
									<option value="<%=i%>"><%=i%></option>   
									<%}%>								
  									</select></td></tr>				 													
  	<tr><th>Amount:</th><td><input type="text" name="amount" id="amount" title="enter the amount"></td></tr>
  	<tr><th>No.Of Installments:</th><td><input type="text" name="ins" id="ins" title="enter no.of installments"></td></tr>
  	<tr><th>Permissions given by:</th><td><select name="perby" title="select a person to give permissions"><option value="0">select</option>
  														<option value="principal">PRINCIPAL</option>
  														<option value="secretary">SECRETARY</option>
  														<option value="correspondent">CORRESPONDENT</option></select></td></tr>
  	</table>
  	</fieldset>
  	<br>
  	<br>
  	<center>
  	<input type="submit" value="GivePermission">
  	<input type="button" value="   Quit   " onclick="window.close()" />
  	<input type="reset" value= "    Cancel    ">
  	</center>
  	</form>
  </body>
</html>
