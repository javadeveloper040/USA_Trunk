<%@ page language="java" import="java.sql.*,vdb.Db" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../../sheet1.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="student_academic_personal.js" language="javascript">
</script>
</head>
<body bgcolor="skyblue">
<%!
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
%>
<%
String rollno=session.getAttribute("rollno").toString();
String street=(String)session.getAttribute("street");
String area=(String)session.getAttribute("area");
String drno=(String)session.getAttribute("doorno");
System.out.println("academic detaisl page"+drno);
String district=(String)session.getAttribute("district");
System.out.println("academic detaisl page"+district);
String pin=(String)session.getAttribute("pin1");
System.out.println("academic detaisl page"+pin);
String addr1=drno+"$"+street+"$"+area+"$"+pin+"$"+district+"$";
String addr=addr1.replace(' ','#');
System.out.println("academic detaisl page"+addr1);
System.out.println("academic detaisl page"+addr);
%>

<form name="studentmaster" action="student_academic_personal_insert.jsp" method="post" onsubmit="return val()">
<center> <b>RollNO:</b>&nbsp;&nbsp;<input type="text" name="rollno" id="rollno" value=<%=rollno %> readonly="readonly" ></center>
				<table width="1000" cellpadding="5"  align="center">
				
				<tr>
					<td>
					<input type="hidden" name="hid" id="hid" value=<%=addr %>>
						<fieldset><legend>Permanent address seperate feilds</legend><table>
						<tr><td>Dr.No:</td><td><input type="text" name="pdoorno" id="pdoorno" size="20" ></td></tr>
						<tr><td>Street:</td><td><input type="text" name="pstreet" id="pstreet" size="20" ></td></tr>
						<tr><td>Area:</td><td><input type="text" name="parea" id="parea" size="20" ></td></tr>
						<tr><td>District:</td><td><input type="text" name="pdistrict" id="pdistrict" size="20" ></td></tr>
						<tr><td>Pin:</td><td><input type="text" name="ppin" id="ppin" size="10" ></td></tr>
						<tr><td colspan="2"><input type="checkbox" id="same" name="same" value="yes" onclick="checktick()">&nbsp;Same as correspondence address.</td></tr>
						</table>
						</fieldset>
					</td>
					<td>
						<fieldset><legend>Address Merged Fields</legend>
							<table>
								<tr>
									<td>Correspondence:&nbsp;<input type="checkbox" id="mergec" name="mergec" onclick="correspondence()">:Merge corr add fields
									<br><textarea id="addc" name="addc" rows="3" cols="30"></textarea>
									<br>Permanent:&nbsp;<input type="checkbox" id="mergep" name="mergep" onclick="permanent()">:Merge perm add fields
									<br><textarea id="addp" name="addp" rows="3" cols="30"></textarea>
									</td>
								</tr>
							</table>
						</fieldset>
					</td>
					<td>
						<table>
							<tr>
								<td>
									<fieldset><legend>Other Details</legend>
										<table>
											<tr>
												<td>Blood Group:</td>
												<td><input type="text" id="bg" name="bg" size="5" ></td>
												<td>A/C No:</td>
												<td><input type="text" id="acno" name="acno" size="20"></td>
											</tr>
											<tr>
												<td>Bank name:</td>
												<td colspan="3"><input type="text" id="bankname" name="bankname" size="40"></td>
											</tr>
											<tr>
												<td>Branch:</td>
												<td colspan="3"><input type="text" id="bankbranch" name="bankbranch" size="40"></td>
											</tr>											
										</table>
									</fieldset>
								</td>
							</tr>
							<tr>
								<td>
									<fieldset><legend>Discontinuation/Leaving Details</legend>
										<table>
											<tr>
												<td><input type="checkbox" id="disc" name="disc" value="yes" onclick="checkdisc()">&nbsp;
												Discontinued date:</td><td><input type="text" id="ddate" name="ddate" size="10" value="disabled" disabled="disabled">
													
												</td>												
											</tr>
											<tr>
												<td align="right">Date of Leaving:</td><td><input type="text" id="ldate" name="ldate" size="10" value="disabled" disabled="disabled" onblur="dtval('discontinue')"></td>
											</tr>
										</table>
									</fieldset>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
				<tr>
				<td><fieldset><legend>Bus Facility</legend><table>
				<tr><td><table><tr><td><input type="radio" name="avail" id="byes" value="yes"  onclick="availability()"></td><td>Available</td></tr></table></td>
				<td><input type="radio" name="avail" id="bno"  value="no" checked="checked" onclick="availability()">Not Available</td></tr>
				<tr><td>Reg Date:</td><td><input type="text" size="30" name="bregdate" id="bregdate" disabled="disabled"></td></tr>
				<tr><td>Area:</td><td><select name="busarea" id="busarea" disabled="disabled">
				<option value="0">select area</option>
				<%  	try{					
					                          System.out.println("ghfdsahjkhdsjkfds");
					                           con=Db.connect();
  								            pst=con.prepareStatement("select distinct area_name from area_tab");
  								            System.out.println(pst);
  								            rs=pst.executeQuery();
  								            System.out.println(rs);
  								            while(rs.next()){System.out.println("inside while");
  								            %>
  								            <option value="<%=rs.getString("area_name")%>"><%=rs.getString("area_name")%></option>
  								            <%} }
				catch(Exception e){} %>
				</select></td></tr>
				<tr><td>Bus No:</td><td><select name="busno" id="busno" disabled="disabled"><option value="0">Select Bus</option>
				<%  							try{	 
					 con=Db.connect();
  								            pst=con.prepareStatement("select distinct bus_num from bus_details_tab");
  								             rs=pst.executeQuery();
  								            while(rs.next()){
  								            %>
  								            <option value="<%=rs.getString("bus_num")%>"><%=rs.getString("bus_num")%></option>
  								            <%} }
				catch(Exception e){} %>
				</select></td></tr>
				<tr><td>Cancel Date:</td><td><input type="text" size="30" name="bcdate" id="bcdate" disabled="disabled" onblur="dtval('b')"></td></tr>
				</table></fieldset></td>
				<td colspan="2"><fieldset><legend>Accomodation Facility</legend><table>
				<tr><td><input type="radio" name="avail1" id="ayes" value="0"  onclick="checkavail()">Available</td><td><input type="radio" name="avail1" id="ano" value="1" checked="checked" onclick="checkavail()">Not Available</td></tr>
				<tr><td>Reg Date:</td><td><input type="text" size="30" name="accregdate" id="accregdate" disabled="disabled"></td></tr>
				<tr><td>Hostel Code:</td><td><select name="acchostelcode" id="acchostelcode" disabled="disabled"><option value="0">Select the hostel code</option>
				<%  	try{					
					                          System.out.println("qwertasdf");
					                           con=Db.connect();
  								            pst=con.prepareStatement("select distinct hostel_code from hostel_room");
  								            System.out.println(pst);
  								            rs=pst.executeQuery();
  								            System.out.println(rs);
  								            while(rs.next()){System.out.println("inside while");
  								            %>
  								             <option value="<%=rs.getString("hostel_code")%>"><%=rs.getString("hostel_code")%></option>
  								            <%} }
				catch(Exception e){} %>
				</select></td></tr>
				<tr><td>Floor/Room No:</td><td><select name="accroomno" id="accroomno" disabled="disabled"><option value="0">floor no</option>
								<%  	try{					
					                          System.out.println("qwertasdf");
					                           con=Db.connect();
  								            pst=con.prepareStatement("select distinct room_num from hostel_room");
  								            System.out.println(pst);
  								            rs=pst.executeQuery();
  								            System.out.println(rs);
  								            while(rs.next()){System.out.println("inside while");
  								            %>
  								             <option value="<%=rs.getString("room_num")%>"><%=rs.getString("room_num")%></option>
  								            <%} }
				catch(Exception e){} %>
				</select></td><td>Guardian:</td>
				<td><input type="text" name="guardian" id="guardian" disabled="disabled"/></td></tr>
				<tr><td>Phone:</td><td><input type="text" id="accphno" name="accphno" disabled="disabled"/></td>
				<td>Cancel Date:</td><td><input type="text" id="acccdate" name="acccdate" disabled="disabled" onblur="dtval('acc')"></td></tr>
				</table>
				
				</fieldset>
				
				</td>
				</tr>
				</table>
				<br><br>
				<center>
			  <input  type="submit" value="Next"/>
			  <input   type="button" value="Quit" onclick="window.close()"/>
			</center>
				

</form>
</body>
</html>