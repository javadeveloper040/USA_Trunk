<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transport Details</title>
<script type="text/javascript" src="transport.js"></script>
</head>
<body bgcolor="skyblue">
<form>
<fieldset>
<legend><b>Select the route and Bus No. to view the details</b></legend>
<table border=0 width="100%" >
<tr>
	<td>
			<table border=0 width="100%">
				<tr>
					<td>Route:<br/>
					<select name="route" id="route" onchange="getDet()">
					<option>select</option>
					<% Dbcon d= new Dbcon();
						Connection con=d.getConnection();
   					 	PreparedStatement pst=con.prepareStatement("select * from area_tab");
   					 	ResultSet rs=pst.executeQuery();
    					while(rs.next()){
    				%>  
      				<option value="<%=rs.getString(2) %>"> <%=rs.getString(2) %> </option>
    				 <%} %>
					</select>
					</td>
					<td>Bus
					<select name="bus" id="bus" style="visibility: hidden" onchange="getBus()">
					<option value="select">select</option>
					 </select></td>
					
					<td>No. of Seats:<br/>
						<input type="text" name="num_of_seats" id="num_of_seats">
					</td>
					<td>Filled Seats:<br/>
						<input type="text" name="filled_seats" id="filled_seats">
					</td>
					<td>Free Seats:<br/>
						<input type="text" name="free_seats" id="free_seats">
					</td>
				</tr>
				<tr align="middle"><td></td><td></td>
			<td><input type="button" value="View" onclick="getDetails()"></td><td></td><td></td>
			</tr>
				<tr>
					<td colspan="5">
					<table border=1 width="600">
						<tr>
							
						</tr>		
					</table>
				<span id="fillTable"></span>
				

					</td>
				</tr>
			</table>
	</td>
	<td>
			<table border=0>
			
			<tr>
				<td>
					<fieldset>
					<table border=0 width="100%">
					
						<tr>
							<td >Total targer Amt:</td>
						</tr>
						<tr>
							<td align="right"><input type="text" name="total_target_amount" id="total_target_amount" style="text-align:right"  size="8"></td>
						</tr>
						<tr>
							<td>Target Amt for Filled seats:</td>
						</tr>
						<tr>
							<td align="right"><input type="text" name="total_amount_for_filled" id="total_target_amount_for_filled" style="text-align:right"  size="8"></td>
						</tr>
						<tr>
							<td>Total Collected Amt:</td>
						</tr>
						<tr>
							<td align="right"><input type="text" name="total_collected_amount" id="total_collected_amount" style="text-align:right"  size="8"></td>
						</tr>
						<tr>
							<td>Total Due Amt:</td>
						</tr>
						
						<tr>
							<td align="right"><input type="text" name="total_due_amount" id="total_due_amount" style="text-align:right"  size="8"></td>
						</tr>
						<tr>
					<td align="center"><input type="button" value="view"  onclick="getAmount()"></td>
					</tr>
						
					</table>
					</fieldset>
				</td>
			</tr>
			</table>
	</td>
</tr>
</table>


							
					
</fieldset>
<center><input type="button" value="  QUIT  " onclick="window.close()">
</center>

</form>
</body>
</html>
