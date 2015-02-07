<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="mis.Dbcon"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Transport Master</title>
<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<%@page import="java.sql.*"%>
</head>
<body bgcolor="skyblue">
<br>
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">Area Master</li>
    <li class="TabbedPanelsTab" tabindex="0">Bus Master</li>
    <li class="TabbedPanelsTab" tabindex="0">Routes And Stages Master</li>
    <li class="TabbedPanelsTab" tabindex="0">Layout Master</li>
  </ul>
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent"><form action="#" method="post" name="area_master" >

<table width="456" height="122" border="0" cellpadding="0" cellspacing="0" align="center">
   <tr>
    <th width="154" scope="row" align="left">Area Code</th>
    <td width="144"><input type="text" name="area_code" id="area_code" readonly="readonly"/></td>
    <td></td>
    <td width="186" rowspan="5">&nbsp;</td>
   <td rowspan="3"><select name="area_list" size="7" id="area_list" onclick="getAreaDetails()">
   
	  <% 
   try {
		
	    ResultSet res=null;
	    mis.Dbcon d= new mis.Dbcon();
		Connection con=d.getConnection();
	        Statement st = con.createStatement();
	        
	         res = st.executeQuery("SELECT  area_name FROM  area_tab");
	        
	        while (res.next()) {%>
					<option value="<%=res.getString("area_name") %>"><%=res.getString("area_name") %></option>
	        <% }
	        con.close();
		}
	      catch (Exception s){
	        System.out.println("SQL code does not execute"+s);
	      }%>
	
   
   </select></td>
  </tr>
  <tr>
    <th scope="row" align="left" align="left">Area Name</th><td><input type="text" name="area_name" id="area_name" title="enter area name" onblur="Validation1()" /></td>
    <td width="400" ><p id="xyz"></p></td>
    
    </tr>
  <tr>
    <th scope="row" align="left">Area Fee </th>
    <td>
      <label>
        <input type="text" name="area_fee" id="area_fee" title="enter area fee" onkeypress="return isNumberKey(event)" onblur="fun()"/>
      </label>
   </td>
   <td><p id="xyz1"></p></td>
	</tr>
</table>
<center>
  <input name="area_new" id="area_new" style="visibility: visible;" type="button" value="&nbsp;&nbsp;New&nbsp;&nbsp;" onclick="val()"/>
  <input name="area_modify" id="area_modify" style="visibility: hidden;" type="button" value="&nbsp;&nbsp;Modify&nbsp;&nbsp;" onclick="modify()"/>
  <input name="area_save" id="area_save" style="visibility: hidden;" type="button" value="&nbsp;&nbsp;Save&nbsp;&nbsp;" onclick="save()"/>
  <input name="area_delete" id="area_delete" style="visibility: hidden" value="&nbsp;&nbsp;Delete&nbsp;&nbsp;" type="button" onclick="getDelete()"/>
 <input type="reset" id="area_ cancel" value="&nbsp;&nbsp;Cancel&nbsp;&nbsp;" onclick="getalll()" />
 <input name="quit" value="    Quit    " type="button"  onclick="window.close()"/>
</center>
</form></div>
    <div class="TabbedPanelsContent"><form action="#" method="post" name="bus_master">
  <table width="601" border="0" cellspacing="2" cellpadding="2" align="center">
    <tr>
      <th width="198" scope="row">Bus Number:</th>
      <td width="4"><div id="bus_num_t" style="visibility: hidden;"><input type="text" name="bus_numt" id="bus_numt" title="enter bus number" size="10" /></div></td>
      
      
      <td ><select name="bus_num" id="bus_num" onchange="getDetailsBus()">
      <option value="select">select</option>
       
	  <% 
   try {
		 
	    ResultSet res=null;
	    Dbcon d= new Dbcon();
		Connection con=d.getConnection();
	        Statement st = con.createStatement();
	        
	         res = st.executeQuery("SELECT  bus_num FROM  bus_details_tab");
	         
	        while (res.next()) {%>
					<option value="<%=res.getString("bus_num") %>"><%=res.getString("bus_num") %></option>
	        <% }
	        con.close();
		}
	      catch (Exception s){
	        System.out.println("SQL code does not execute"+s);
	      }%>
      </select></td></tr>
      <tr>
      <th>Seats:</th>
      <td>
        <input type="text" name="num_of_seats" id="num_of_seats" title="enter number of seats" />
      </td>
    </tr>
    <tr>
      <th scope="row">Layout:</th>
      <td colspan="3"><select name="layout_name" id="layout_name"  style="width:100%">
        <option >select layout                                   </option>
          <% 
   try {
		 
	    ResultSet res=null;
	    Dbcon d= new Dbcon();
		Connection con=d.getConnection();
	        Statement st = con.createStatement();
	        
	         res = st.executeQuery("SELECT  layout_name FROM  layout_tab");
	         
	        while (res.next()) {%>
					<option value="<%=res.getString("layout_name") %>"><%=res.getString("layout_name") %></option>
	        <% }
	        con.close();
		}
	      catch (Exception s){
	        System.out.println("SQL code does not execute"+s);
	      }%>
      </select></td>
    </tr>
    <tr>
      <th scope="row" >Driver:</th>
      <td><label>
        <input type="text" name="driver_name" id="driver_name"  title="enter driver name"/>
      </label></td>
      <td><strong>Mobile:</strong></td>
      <td>
        <input type="text" name="driver_mob" id="driver_mob" title="enter mobile number" onkeypress="return isNumberKey(event)"/>
      </td><td><p id="xyz3"></p></td>
    </tr>
    <tr>
      <th scope="row">Faculty:</th>
      <td><label>
        <input type="text" name="faculty_name" id="faculty_name" title="enter faculty name" />
      </label></td>
      <td><strong>Mobile:</strong></td>
      <td><label>
        <input type="text" name="faculty_mob" id="faculty_mob" title="enter faculty mobile number" onkeypress="return isNumberKey(event)"/>
      </label></td><td></td><td><p id="xyz4"></p></td>
    </tr>
    <tr>
      <th scope="row">Coordinator:</th>
      <td><label>
        <input type="text" name="coordinator_name" title="enter coordinator name" id="coordinator_name" />
      </label></td>
      <td><strong>Mobile:</strong></td>
      <td><label>
        <input type="text" name="coordinator_mob" id="coordinator_mob" title="enter coordinator mobile number" onkeypress="return isNumberKey(event)"/>
      </label></td><td></td><td><p id="xyz5"></p></td>
    </tr>
    <tr>
      <th scope="row">Incharge:</th>
      <td><label>
        <input type="text" name="incharge_name" title="enter incharge name" id="incharge_name" />
      </label></td>
      <td><strong>Mobile:</strong></td>
      <td><label>
        <input type="text" name="incharge_mob" id="incharge_mob" title="enter incharge mobile number and press save" onkeypress="return isNumberKey(event)" />
      </label></td><td></td><td><p id="xyz6"></p></td>
    </tr>
  </table>
  <br/>
  <center>
  <input name=" New "  type="button" value="&nbsp;&nbsp;New&nbsp;&nbsp;" onclick="showbusnumtextbox()"/>
  <input name=" Save " type="button" value="&nbsp;&nbsp;Save&nbsp;&nbsp;" onclick="hideBusText()" />
  <input name="Delete" value="&nbsp;&nbsp;Delete&nbsp;&nbsp;" type="button" onclick="getDeleteBus()" />
  <input name="quit" value="    Quit    " type="button"  onclick="window.close()"/>
</center>
</form></div>
  <div class="TabbedPanelsContent"><form action="#" method="get" name="route_stages_master">
    <form action="#" method="get" name="route_stages_master">
    <table width="340" border="0" cellspacing="2" cellpadding="2" align="center">
  
    <th scope="row"><strong>Bus:</strong></th>
   
    <td ><select name="bus_menu" id="bus_menu"  style="width:80%" onchange="selectBus()">
      <option value="select">select</option>
         <% 
   try {
		 
	    ResultSet res=null;
	    Dbcon d= new Dbcon();
		Connection con=d.getConnection();
	        Statement st = con.createStatement();
	        
	         res = st.executeQuery("SELECT  bus_num FROM  bus_details_tab");
	         
	        while (res.next()) {%>
					<option value="<%=res.getString("bus_num") %>"><%=res.getString("bus_num") %></option>
	        <% }
	        con.close();
		}
	      catch (Exception s){
	        System.out.println("SQL code does not execute"+s);
	      }%>
    </select></td>
 
    <tr>
    <th width="126" scope="row">Route</th>
    <td width="194" ><select name="route_menu" id="route_menu"   style="width:80%" onchange="selectRoute()">
    <option value="select">select</option>
           <% 
   try {
		 
	    ResultSet res=null;
	    Dbcon d= new Dbcon();
		Connection con=d.getConnection();
	    
		
	        Statement st = con.createStatement();
	        
	         res = st.executeQuery("SELECT  layout_name FROM layout_tab");
	         
	        while (res.next()) {%>
					<option value="<%=res.getString("layout_name") %>"><%=res.getString("layout_name") %></option>
	        <% }
	        con.close();
		}
	      catch (Exception s){
	        System.out.println("SQL code does not execute"+s);
	      }%>
    </select></td>
  </tr>
  <tr>

  <tr>
    <th scope="row"><strong>Stage:</strong></th>
    <td><label>
      <input type="text" name="stage_name" id="stage_name" title="enter stage name" style="width:80%"/>
    </label></td>
  </tr>
 </table>
 <center>
 <input  type="button" value="  Add  " onclick="saveStage()" />
 <input  type="button" value="  Show  " onclick="showStage()" />
 <input name="quit" value="    Quit    " type="button"  onclick="window.close()"/>

<span id="fillMe"></span>  </center>

<div style="position:absolute;top:auto;left:auto;height:150;width:200">

</div>

    </form>
    </div>
<div class="TabbedPanelsContent"><form action="#" method="get" name="layout_master">

  <form action="#" method="get" name="layoutmaster">
  <table align="center">
  <tr><td>Layout Name:</td>
  <td><input id="layouttext" type="text" name="layout" title="enter layout and press save" style="visibility: hidden" > </td>
    <td><select name="layoutList" id="layoutList" onchange="changestatus()">
     <option>Select</option> 
    <% Dbcon d= new Dbcon();
	Connection con=d.getConnection();
    PreparedStatement pst=con.prepareStatement("select * from layout_tab");
    ResultSet rs=pst.executeQuery();
    while(rs.next()){
    %>  
      <option value="<%=rs.getString(1) %>"> <%=rs.getString(1) %> </option>
     <%} %>
    
    </select></td></tr>
    </table>
    <br/>
    <br/>
    <center>
  <input name=" New " type="button" value="&nbsp;&nbsp;New&nbsp;&nbsp;" onclick="showLayoutText()"/>
  <input name=" Save " type="button" value="&nbsp;&nbsp;Save&nbsp;&nbsp;" onclick="hideLayoutText()" /><span id="status"></span>
  <input name="Delete" value="&nbsp;&nbsp;Delete&nbsp;&nbsp;" type="button" onclick="deleteLayout()"/>
  <input name="quit" value="    Quit    " type="button"  onclick="window.close()"/>
</center>
  </form>
</div>

<script type="text/javascript">
<!--
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
//-->
</script>

</body>
</html>
