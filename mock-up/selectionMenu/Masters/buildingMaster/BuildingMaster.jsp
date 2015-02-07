<%@page import="java.sql.*,vdb.Db" %>
<html>
<head>
<LINK REL="StyleSheet" HREF="table.css" TYPE="text/css" >
<link rel="stylesheet" href="../../sheet1.css">
<title>Building Master View</title>
<script language="javascript">
function call()
{
var res=document.getElementById("block_num").value;
Window.navigate("BuildingMaster.jsp?block_num="+res);
}
</script>
</head>
<body bgcolor="skyblue">
<form name="buildingmaster" onsubmit="call()">
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
<fieldset>
<legend><b>Enter the Building Details</b></legend>
<table align="center" cellpadding="15" width="100%">
<tr>
 	<td align="center" colspan="2"><b>Enter Block No:</b><input type="text" id="block_num" name="block_num" title="Enter Block Name and click on view"></td>
</tr>	
<tr>
<th ><input type="submit" value="    View    "/>
<input name="quit" value="    Quit      " type="button"  onclick="window.close()"/>
</th>
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
	String block_num=request.getParameter("block_num");
	if(block_num==null){
	pst=con.prepareStatement("select * from building_tab order by block_name");
	rs=pst.executeQuery();
	int i=0;
	while(rs.next()){
		
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
		<%}
		pst.close();
		con.close();
	}else{
		pst=con.prepareStatement("select * from building_tab where block_name=? order by block_name");
		pst.setString(1,block_num);
		rs=pst.executeQuery();
		int i=0;
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
			<%	}}
			pst.close();
			con.close();
			 %>
</tbody>
</table>
</div>
<br><br>
</form>
</body>
</html>