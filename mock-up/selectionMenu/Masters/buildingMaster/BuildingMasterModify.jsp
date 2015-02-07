<%@page import="java.sql.*,vdb.Db"%>
<html>
<head>
<title>Building master New or Modify</title>
<LINK REL=StyleSheet HREF="table.css" TYPE="text/css" >
<link rel="stylesheet" href="../../sheet1.css">

<script language="javascript">
function val()
{
var block=document.getElementById("block_num").value;
if(block=="")
{
alert("enter the block number properly")
document.buildingmaster.block_num.focus();
return false;
}
var room=document.getElementById("room_num").value;
if(room=="")
{
alert("enter the room number correctly");
document.buildingmaster.room_num.focus();
return false;
}
var branch=document.getElementById("branch").value;
if(branch==0)
{
alert("enter your branch correctly");
document.buildingmaster.branch.focus();
return false;
}
var sem=document.getElementById("sem").value;
if(sem==0)
{
alert("enter your sem correctly");
document.buildingmaster.sem.focus();
return false;
}
}
function dis()
{
document.getElementById("branch").disabled=true;
document.getElementById("sem").disabled=true;
document.getElementById("course").disabled=true;
}
function ena()
{
if(document.getElementById("alloted").checked)
{
document.getElementById("branch").disabled=false;
document.getElementById("sem").disabled=false;
document.getElementById("course").disabled=false;

}
if(!(document.getElementById("alloted").checked))
{
document.getElementById("branch").disabled=true;
document.getElementById("sem").disabled=true;
document.getElementById("course").disabled=true;
}
}

</script>
</head>
<body bgcolor="skyblue" onload="dis()">
<center><h2>Building Details</h2></center>
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

<form name="buildingmaster" action="./BuildingMasteModifyData.jsp" >
<fieldset>
<legend><b>Enter the Building Details</b></legend>
<table align="center" cellpadding="15">
<tr>
 	<td>Block No:<br><input type="text" id="block_num" name="block_num" title="Enter Block Name "></td>
	<td>Room No:<br><input type="text" id="room_num" name="room_num" title="Enter Room Number"></td>
        <td><input type="checkbox" id="alloted" name="alloted" onclick="ena()" title="Check if u want to allocate a Room "> &nbsp;&nbsp; Alloted</td> 
	<td>Branch:<br><select id="branch" name="branch" title="select a branch">
			<option id="select" value="0">select</option>
			<option id="ECE" value="ECE">ECE</option>
			<option id="CSE" value="CSE">CSE</option>
			<option id="EEE" value="EEE">EEE</option>
			<option id="IT" value="IT">IT</option>
			<option id="MCA" value="MCA">MCA</option>
			<option id="MBA" value="MBA">MBA</option>
			</select>
	</td>
	<td>Course:<br><select id="course" name="course" title="select a course">
			<option id="select" value="0">select</option>
			<option id="B.Tech" value="B.Tech">B.tech</option>
			<option id="M.Tech" value="M.tech">M.tech</option>
			</select>
	</td>
	
	<td><b>Semester:</b><br><select id="sem" name="sem" title="select a semester">
			<option id="select" value="0">select</option>
            <option id="1" value="1">1</option>
            <option id="2" value="2">2</option>
            <option id="3" value="3">3</option>
            <option id="4" value="4">4</option>
            <option id="5" value="5">5</option>
            <option id="6" value="6">6</option>
            <option id="7" value="7">7</option>
            <option id="8" value="8">8</option>
             			
			</select>
	</td>
</tr>
</table>
<table width="100%">
<tr>
<th width="30%"><input type="submit" value="New/Modify"></th>
<th width="30%"><input type="reset" value="   Cancel   "></th>
<th width="30%"><input type="button" value="   Quit   " onclick="window.close()"></th>
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
	pst=con.prepareStatement("select * from building_tab");
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
		<%	}
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