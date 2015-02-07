<%@page import="java.sql.*,vdb.Db" %>
<html>
<head>
<title>Building Master Delete</title>
<LINK REL="StyleSheet" HREF="table.css" TYPE="text/css" ><link rel="stylesheet" href="../../sheet1.css">
</head>
<body bgcolor="skyblue">
<%!String a[]=new String[5];
int i=0;
Connection con = null;
PreparedStatement pst=null;
ResultSet rs=null;
 %>
<%
try{
    con=Db.connect(); 
}
catch(Exception e){}
 %>
 <form name="buildingmaster" Action="./BuildingMasterDeleteData.jsp">
<fieldset>
<legend><b>Enter the building details</b></legend>
<table align="center" cellpadding="15">
<tr>
 	<td>Block No:<br><input type="text" id="block_num" name="block_num" title="Enter Block Name "></td>
	<td>Room No:<br><input type="text" id="room_num" name="room_num" title="Enter Room Number and And Click on Delete"></td>
        </tr>
<tr>
<th colspan="2"><input type="submit" value="Delete">&nbsp;&nbsp;&nbsp;<input type="reset" value=" Cancel "> &nbsp;&nbsp;&nbsp;<input type="button" value="   Quit   " onclick="window.close()"></th>
</tr>
</table>
</fieldset>
<br>
<br>
<div style="height:200;overflow-y: scroll;
            overflow-x: hidden;
            border: solid #66CC99;
            border-width: 0px 0px 1px 0px;">
<table class="a" align="center" border="1" cellspacing="0" cellpadding="0" >
<thead>
<tr>
	<th class="a">Block Number</th>
	<th class="a">Room Number</th>
	<th class="a">Alloted</th>
	<th class="a">Branch</th>
	<th class="a">Semester</th>
	</tr>
	</thead>
	<tbody>
<tr><td>1</td><td>1</td><td>1</td><td>1</td></tr>
	<%
	pst=con.prepareStatement("select * from building_tab order by block_name");
	rs=pst.executeQuery();int i=0;
	while(rs.next()) {
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
		<td><%=rs.getString(2) %></td><td><%=rs.getString(1) %></td>
		<td><%=rs.getString(5) %></td><td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td></tr>
		<%	}
		pst.close();
		con.close();
		 %>
		 </tbody>
</table><br><br>
<table width="100%">
</table>
</div>
<center>&nbsp;&nbsp;&nbsp;&nbsp;</center>
</form>
</body>
</html>