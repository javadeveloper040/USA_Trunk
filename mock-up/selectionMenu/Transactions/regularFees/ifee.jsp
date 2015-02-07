<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Regular Fees</title>
<script src="script.js" type="text/javascript">
</script>
</head>
<body bgcolor="skyblue">
<form name="form1">
<table cellpadding="10" cellspacing="10" align="center"><tr><td>
<fieldset><legend><b>Student Details</b></legend>
<table cellpadding="7" >
	<tr><th>Roll No:</th>
		<td><input name="roll_number" id="roll_number" type="text" size="10" maxlength="10" onblur="getDetails()"/>
		</td>
		<th>Branch:</th>
			<td><input name="branch" type="text"  size="5" maxlength="5" /></td>
		<th>Sem:</th>
		<td><input name="sem" type="text"  size="7" maxlength="5" /></td></tr>
	<tr><th>Student:</th>
		<td colspan="5"><input name="student" type="text"  size="50" maxlength="50" style="width:100%" /></td></tr>
	<tr><th>Parent:</th>
		<td colspan="5"><input name="parent" type="text"  size="50" maxlength="50" style="width:100%"/></td></tr></table></fieldset></td><td><img src="C:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\image.jpg" width="130" height="130" name="pick"/></td></tr>

	<tr><td>

<% String cname=(String)session.getAttribute("f1");
Dbcon d= new Dbcon();
Connection con=d.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select distinct fee_name from feemaster_tab where counter_name='"+cname+"'" );

%>
<table cellpadding="10"><tr><th>Fee Name:</th><td><select name="fee_name" id="fee_name">
<option value="Select">Select</option>
<%while(rs.next()){ %>
<option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
		<%} %>
                
         </select>  </td>
          <td>
          
          <input name="concession"  id="concession" type="radio" value="Concession" checked />concession<br />
          <input name="concession"  id="concession" type="radio" value="Merit"  />Merit<br />
          <input name="concession"  id="concession" type="radio" value="Discount"  />Discount<br />
          <input name="concession" id="concession" type="radio" value="Others"  />Others
          
           </td>
           <td><b>Fee Amount:</b><br /><input name="feeamt" id="feeamt" type="text"  size="10" maxlength="10" /></td>
           </tr> </table> </td></tr></table>
           
           <center>
  				<input type="submit" value="  Save  " onclick="savefee()"> &nbsp;
  				<input type="reset" value="Cancel">&nbsp;
  				<input type="button" value="    Quit    " onClick="window.close()" >&nbsp;
			</center>
           
          
          
	
	
	
</form>


</body>
</html>
