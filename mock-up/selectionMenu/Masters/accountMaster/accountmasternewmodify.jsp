<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.sql.*"%>
<%! String ac1="";%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../../sheet1.css">

<title>Account Master New or Modify</title>
<script language="javascript" src="getaccountmaster.js">
</script>
</head>
<body bgcolor="skyblue">
<center>
<form id="form1" name="form1" method="post" action="./newAccount.jsp">
<fieldset>
<legend>Account Master New/Modify</legend>
<table border="0" align="center">
   <tr>
    <th scope="row" align="left">Account Code</th>
    <td><input type="text" name="accountcode" id="accountcode" value='<%
    ResultSet res1=null;
    String max=null;	
try {
		    Statement st = vdb.Db.connect().createStatement();       
	        res1=st.executeQuery("select max(account_code) from Account");
	        res1.next(); 
	        max=res1.getString(1);
	        String max1=max.substring(2);
	        		int i=Integer.parseInt(max1);
	   				i=i+1;
	        		ac1="ac"+String.valueOf(i);
	        		session.setAttribute("account_code",ac1);
	        		%><%=ac1%><%        
      }
      catch(NullPointerException e) {
      		ac1="ac101";
	        	session.setAttribute("account_code",ac1);
	        	%><%=ac1%><%	
      }
      catch(Exception s){
	       s.printStackTrace();
	      }%>'/></td>
   <td rowspan="5"><select name="acclist" title="Existing Accounts" size="18" onclick="getAcc(this.value)">
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
    <th scope="row" align="left">Account Name</th><td><input type="text" name="accname" id="accname" title="Enter the Account Name"/></td>   
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
<input name="newmodify" type="submit" value="New/Modify" onclick="return val()" />
<input name="cancel" type="reset" value=" Refresh "/>
<input name="quit" value="     Quit       " type="button"  onclick="window.close()"/>
</fieldset>
</form>
</center>
</body>
</html>