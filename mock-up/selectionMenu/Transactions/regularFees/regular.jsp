<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Regular Fee</title>
</head>
<body bgcolor="skyblue">
<fieldset>
<legend><b>Enter Counter Details</b></legend>
<form action="check.jsp"  method="post" name="reg">
<table width="100%" border=0 align="center" cellpadding="10">
<tr>
<th width="50%" align="right">counter:</th>
<td width="50%"><select name="counter_name" id="counter_name" >
<option value="select">select</option>
<%Dbcon d= new Dbcon();
Connection con=d.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select distinct counter_name from counter_tab");
while(rs.next()){
 %>
				<option value=<%=rs.getString(1) %>><%=rs.getString(1) %></option>
<%} %>     
</select> </td>
   </tr>
   <tr>
<th width="50%" align="right">password:</th>
<td width="50%"><input type="password" name="pwd" id="pwd"> 
</td>
  </tr>
  <tr>
    <th colspan="2">
    <input name="ok" type="submit"    value="&nbsp;&nbsp;OK&nbsp;&nbsp;" />&nbsp;&nbsp;&nbsp;
    <input name="cancel" type="reset" value="&nbsp;&nbsp;Cancel&nbsp;&nbsp;"/>&nbsp;&nbsp;&nbsp;
    <input type="button" value="    Quit    " onClick="window.close()" />&nbsp;&nbsp;&nbsp;
    </th>
  </tr>
    </table>
  
    </form>
    </fieldset>
</body>
</html>