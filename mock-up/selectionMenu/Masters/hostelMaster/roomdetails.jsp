<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<% session.setAttribute("hostel_code",request.getParameter("hostel_code"));
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head><title>View Room Details</title>
    <script language="javascript" src="roomdetails.js">
	</script>
  </head>  
  <body bgcolor="skyblue">
  <form name="form1">
    <fieldset>
<legend><b>Enter the details of rooms in the hostel</b></legend>
<table cellspacing="10" width="100%">
<tr>
<th align="left">Hostel code:</th>
<th align="left">Room no.(code):</th>
<th align="left">Capacity:</th>
</tr>
<tr>
<td> <input type="text" name="hostel_code" id="hostel_code" value='<%=request.getParameter("hostel_code")%>'/>
<td><input type="text" name="room_num" id="room_num" ></td>
<td><input type="text" name="room_capacity" id="room_capacity"></td>
<td><input type="button" name="add_room" id="add_room" value="new/modify" onclick="addroom()"/></td>
<td><input type="button" name="delete_room" id="delete_room" value="delete" onclick="delroom()"/></td>
<td><input type="button" value="  Quit  " onclick="window.close()"></td>
</tr>
</table>
<table  border="1" width="100%">
<tr bgcolor="lightblue">
<th>Room no</th>
<th>Capacity</th>
</tr>
<%
try {
			        
		 Statement st=vdb.Db.connect().createStatement();
		 
			String que="SELECT * FROM  hostel_room where hostel_code='"+request.getParameter("hostel_code")+"'";
				        ResultSet res = st.executeQuery(que);
	        while(res.next()) {
					%>
					<tr><td><%=res.getString(2) %></td><td><%=res.getString(3) %></td></tr>
					<%	        
	        }
	}
	catch(Exception e) {
	System.out.println("in form2 catch");
	e.printStackTrace();
	}

 %>
</table>
</fieldset>
</form>
</body>
</html>
