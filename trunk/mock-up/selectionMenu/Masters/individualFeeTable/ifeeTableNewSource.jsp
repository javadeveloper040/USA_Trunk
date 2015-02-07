<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Individual Fee Table New or Modify</title>
<script src="script.js" type="text/javascript">
</script>
</head>
<body bgcolor="skyblue" >
<form name="form1" action="ifeeSave.jsp" onsubmit="return checkall()" >
<table cellpadding="10" cellspacing="10" align="center"><tr><td>
<fieldset><legend><b>Enter Student Details</b></legend>
<table cellpadding="7" >
	<tr><th>Roll No:</th>
		<td><input name="roll_num" id="roll_num" type="text" size="10" title="enter rollnumber" maxlength="10" onblur="getDetails()"/>
		</td>
		<th>Branch:</th>
			<td><input name="branch" type="text"  size="5" maxlength="5"  /></td>
		<th>Sem:</th>
		<td><input name="sem" type="text"  size="7" maxlength="5"  /></td></tr>
	<tr><th>Student:</th>
		<td colspan="5"><input name="student" type="text"  size="50" maxlength="50" style="width:100%"  /></td></tr>
	<tr><th>Parent:</th>
		<td colspan="5"><input name="parent" type="text"  size="50" maxlength="50" style="width:100%" /></td></tr></table></fieldset></td>
		<td><img src="" width="130" height="130" name="pick"/></td></tr>

	<tr><td>
<table cellpadding="10"><tr><th>Fee Name:</th><td><select name="fee_name" id="fee_name">
<option value="select">Select</option>
<%

	Dbcon d=new Dbcon();
	Connection con=d.getConnection();
	Statement st3=con.createStatement();
	ResultSet rs=st3.executeQuery("select * from feemaster_tab");
	while(rs.next()){
		%><option value=<%=rs.getString(2)%>><%=rs.getString(2)%></option>
		
<%	} %>
        </select> </td><td>
        </td>
        <td>
         <input name="discount" type="radio" value="Concession" checked />concession<br />
          <input name="discount" type="radio" value="Merit"  />Merit<br />
          <input name="discount" type="radio" value="Discount"  />Discount<br />
          <input name="discount" type="radio" value="Others"  checked />Others
        </td>
           <td><b>Fee Amount:</b><br /><input name="feeamt" type="text" title="enter fee amount and press save" size="10" maxlength="10" /></td>
           </tr> </table> </td></tr></table>
          <center>
  				<input type="submit" value="    Save   "/> &nbsp;<input name="quit" value="     Quit       " type="button"  onclick="window.close()"/>
	</center>
		
	
</form>


</body>
</html>
