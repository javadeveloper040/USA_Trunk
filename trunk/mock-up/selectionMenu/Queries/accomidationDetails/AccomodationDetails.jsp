<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<html>
<head><title>Accomodation Details</title>
<script type="text/javascript" src="script2.js"></script>
</head>
<body bgcolor="skyblue">
<form name="nr">
<fieldset>
<legend><b>Accomodation Details</b></legend>
<fieldset>
	<table  cellspacing="10" border=0 align="left">
		<tr>
			<td width="40%">
				<table width="450px" border=0>
					<tr>
						<th align="left">Hostel:</th>
						<td colspan="3"><select name="hostel_name" id="hostel_name" onchange="getHostelDetails()" style="width:100%">
								<option value="select">select</option>
								<%Dbcon d= new Dbcon();
									Connection con=d.getConnection();
									Statement st=con.createStatement();
									ResultSet rs=st.executeQuery("select distinct hostel_name from hostel_tab");
								while(rs.next()){
									System.out.println(rs.getString(1));
 				%>
				<option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
<%} %>     
</select>
</td>
</tr>
					<tr>
						<th align="left" >Total Capacity:</th>
						<td  ><input type="text" name="total_capacity" id="total_capacity" size="5">
						</td>
						<th align="left" >Total Vacancy:</th>
						<td ><input type="text" name="total_vacancy" id="total_vacancy" size="5">
						</td>
					</tr>
					<tr>
						<th align="left" width="150px">Total No. of Rooms:</th>
						<td  width="100px" colspan="3"><input type="text" name="total_rooms" id="total_rooms" size="5">
						</td>
					</tr>					
				</table>
			</td>
			<td width="30%">
				<fieldset>
				<legend><b>Fee Details</b></legend>
				<table>
				<tr>
				<td>old admission fee:</td>
					<td><input type="text" name="ofee"></input></td></tr>
					<tr>
					<td>new admission fee:</td>
					<td><input type="text" name="nfee"></input></td></tr>
					</table>
				</fieldset>
			</td>
			<td width="30%">
				<fieldset >
				<legend>free rooms</legend>
				<table border="1" width="100%">
				<tr>
				<th width="50%">Room No</th>
				<th width="50%">free beds</th>
				</tr>
				</table>
				<table id="det" width="100%" border="1">
				</table>
				</fieldset>
			</td>
		</tr>
	</table>
</fieldset>
<br>
<table border=1 width="100%">
<tr bgcolor="#339999">
	<th width="10%">S.No.</th>
	<th width="10%">Reg No.</th>
	<th width="10%">Name</th>
	<th width="10%">Branch</th>
	<th width="10%">Reg. Date</th>
	<th width="10%">Room No.</th>
	<th width="10%">Guardian</th>
	<th width="10%">Phone</th>
	<th width="10%">Paid Amt.</th>
	<th width="10%">Due Amt.</th>
</tr><tr ></table>


<table id="newtable" border="1" width="100%">
				
				</table>
<br>
<hr>
<table align="center" border=0 width="100%">
	<tr><th width="30%">Total Collected Amount :</th>
		<td><input type="text" size="5" name="tca"></td>
		<th width="30%">Total Due Amount:</th>
		<td><input type="text" size="5" name="tda"></td>
	</tr>
</table>
<hr>
<center>
<input type="button" value="   View   " onclick="pview()" >
<input type="button" value="   Quit   " onClick="window.close()"></center>
</fieldset>
</form>
</body>
</html>