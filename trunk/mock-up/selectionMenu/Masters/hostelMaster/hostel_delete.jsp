<%@page import="java.sql.*" %>
<%! String ho1=""; %>
<html>
<head>
<title>Hostel Master Delete </title>
<script language="javascript" src="getHostel.js">
</script>
</head>
<body bgcolor="skyblue">
<center>
<form id="form1" name="form1" method="get" action="./newHostelMaster.jsp">
<fieldset>
<legend><b>Delete Hostel Details</b></legend>
<br>
<table  border=0 width="100%">
<tr>
<th align="left" width="20%">Hostel code:</th>
<td width="30%"> <input type="text" name="hostel_code" id="hostel_code" value='<%ResultSet res1=null;
    String max=null;	
try {
		    Statement st = vdb.Db.connect().createStatement();       
	        res1=st.executeQuery("select max(hostel_code) from hostel_tab");
	        res1.next(); 
	        max=res1.getString(1);
	        String max1=max.substring(2);
	        		int i=Integer.parseInt(max1);
	   				i=i+1;
	        		ho1="ho"+String.valueOf(i);
	        		//System.out.println(max+":"+max1+":"+":"+i+":"+ac1);
	        		session.setAttribute("hostel_code",ho1);
	        		%><%=ho1 %><%        
      }
      catch(NullPointerException e) {
      	//e.printStackTrace();  	
	        	ho1="ho101";
	        	session.setAttribute("hostel_code",ho1);
	        	//System.out.println("hi");
	        	%><%=ho1%><%	
      }
      catch(Exception s){
	       s.printStackTrace();
	      }%>'/></td>
<td rowspan="4" width="50%"><select name="hostel_name_select" size="8" onclick="getHost(this.value)" style="width:100%">
   <%
	try {
		 
	        Statement st = vdb.Db.connect().createStatement();
	        
	        ResultSet res = st.executeQuery("SELECT * FROM  hostel_tab");
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
<th align="left">Hostel name:</th>
<td><input type="text" name="hostel_name" id="hostel_name" style="width:100%"></td>
</tr>
<tr>
<td colspan="2">
<fieldset>
<legend><b>Hostel Fee</b></legend>
<table>
<tr>
<th>Mess Fee:</th>
<td><input type="text" name="new_admn_fee" id="new_admn_fee" value="0.00" style="text-align:right" size="8"></td>
<th>Acc Fee:</th>
<td><input type="text" name="old_admn_fee" id="old_admn_fee" value="0.00" style="text-align:right" size="8"></td>
<td></td>
</tr>
</table>
</fieldset>
</td>
</tr>
<tr>
<td colspan="2" align="center">
</td>
</tr>
</table>
</fieldset>
<br><br>
<table width="100%">
<tr>
<th><input type="reset" value=" Cancel "></th><th>
<input type="button" value="Delete" onclick="if(confirm('Are u sure?')) delHos();"/></th><th>
<input type="button" value="   Quit   " onclick="window.close()">
</th>
</tr>
</table>
</form>
</center>
</body>
</html>