<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="mis.Dbcon"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"><title>Individual Fee Table Modify</title>
<script type="text/javascript">
var proceed="no";
function checkall(){
	var amount=document.getElementById("amount").value;
	var fee=document.getElementById("fee_name").value;
	if(fee=="select"){	
		alert("select a fee");
		proceed="no";
		
	}
	else if(amount==""){
		alert("fill the amount");
		proceed="no";
	}else proceed="yes";
	if(proceed=="yes"){
		return true;
	}else
	 return false;
}
</script>
</head>
<body bgcolor="skyblue">

<%
String roll=request.getParameter("roll_num");
String fee_name=request.getParameter("fee_name");
String discount=request.getParameter("discount");
String amount=request.getParameter("fee");
String month=request.getParameter("month");
String rc_num=request.getParameter("rc_num");

%>
<form action="ModifyIfee.jsp" onsubmit="return checkall()">
<input type="hidden" name="roll_num" value=<%=roll %>>
<input type="hidden" name="old_fee_name" value=<%=fee_name %>>
<input type="hidden" name="old_amount" value=<%=amount %>>
<input type="hidden" name="old_discount" value=<%=discount %>>
<input type="hidden" name="rc_num" value=<%=rc_num %>>
<br><br><br><br><br>
<center>
<table border="1">
<h3><%=roll %>  on   <%=month %></h3>
<tr><td width=90><%=fee_name %></td><td width=90><%=discount %></td><td width=90><%=amount %></td></tr>
</table><br><br><br><br>
<table cellpadding="10"><tr><th>Fee Name:</th>

<td><select name="fee_name" id="fee_name">
<option value="select">Select</option>
<%
Dbcon d=new Dbcon();
Connection con= d.getConnection();
Statement st1=con.createStatement();
ResultSet rs=st1.executeQuery("select fee_name from feemaster_tab");
while(rs.next()){%>
				<option value=<%=rs.getString(1) %>><%=rs.getString(1) %></option>
    <%} %>      
         </select> </td><td>
         
          <td>
          <center>
          <input name="discountx"  type="radio" value="Concession"  />Concession<br />
          <input name="discountx" type="radio" value="Merit"  />Merit<br />
          <input name="discountx" type="radio" value="Discount"  />Discount<br />
          <input name="discountx" type="radio" value="Others"  checked/>Others
          </center>
          
           </td>
         <td>Fee Amount:<input type="text" id="amount" name="amount"></td>
           </tr> </table>
          
           <input type="submit" value="Modify"> </center>
       </form>

</body>
</html>