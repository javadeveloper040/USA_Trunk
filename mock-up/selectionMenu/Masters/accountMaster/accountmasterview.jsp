<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.sql.*"%>
<%! String ac1="";%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../../sheet1.css">

<title>Account Master View</title>
<script language="javascript" src="getaccountmaster.js">
</script>
</head>
<body bgcolor="skyblue">
<center>
<form  name="form1" id="form1" method="post" >
<fieldset>
<legend>Account Master View</legend>
<table border="0" align="center">
   <tr>
    <th scope="row" align="left">Account Code</th>
    <td><input type="text" name="accountcode" id="accountcode" /></td>
   <td rowspan="5"><select name="acclist" size="18" onclick="getAcc(this.value)">
   <%
	try {
		 
	        Statement st = vdb.Db.connect().createStatement();
	        
	        ResultSet res = st.executeQuery("SELECT * FROM  Account");
	        while (res.next()) {%>
					<option value="<%=res.getString(2)%>"><%=res.getString(2) %></option>
	        <% }
		}
	      catch (Exception s){
	       s.printStackTrace();
	      }
	  %>
   </select></td>
  </tr>
  <tr>
    <th scope="row" align="left">Account Name</th><td><input type="text" name="accname" id="accname" /></td>   
    </tr>
  <tr>
    <th scope="row" align="left">Bank Name </th>
    <td>
      <label>
        <input type="text" name="bankname" id="bankname" />
      </label>
   </td>
    </tr>
  <tr>
    <th scope="row" align="left">Bank Address</th>
    <td>
      <label>
       <textarea name="bankaddress" id="bankaddress" cols="15" rows="5"></textarea>
      </label>
    </td>
    </tr>
  <tr>
    <th scope="row" align="left">Account Number</th>
    <td>
      <label>
        <input type="text" name="accnumber" id="accnumber" />
      </label>
    </td>
    </tr>
</table>
<br />
<input type="button" value="  View  " name="  View  " onclick="viewAcc()" />
<input name="cancel" type="reset" value=" Refresh "/>
<input name="quit" value="     Quit       " type="button"  onclick="window.close()"/>
</fieldset>
</form>
</center>
</body>
</html>