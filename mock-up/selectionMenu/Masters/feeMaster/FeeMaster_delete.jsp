<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.sql.*" %>
<%! String fee=""; %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Fee master Delete</title>
<script language="javascript" src="getFee.js">
</script>
</head>
<body bgcolor="skyblue">
<form name="form1" method="post" action="./delFee.jsp">
<fieldset> 
<legend><b>Fee Master</b></legend>
<table border="0" cellspacing="5" cellpadding="5" align="center">
  <tr>
    <td width="70%">
    <table>
    <tr><td><table><tr><td>Fee Code:</td><td><input name="fee_code" type="text" id="fee_code" /></td></tr>
    <tr><td>Fee Name:</td><td><input type="text" name="fee_name" id="fee_name" /></td></tr>
    <tr><td>Account:</td><td><input type="text" name="account_name" id="account_name"/>
    </td></tr></table></td>
    <td><fieldset ><legend><b>Fee Schedule</b></legend>
    <input id="fee_schedule1" name="fee_sched" type="radio" value="Mon"/>Monthly<br/>
    <input id="fee_schedule2" name="fee_sched" type="radio" value="Year"/>Yearly</fieldset>
    </td><td><fieldset><input name="fine" type="checkbox" value="Apply Fine" />Apply Fine<br />
    <input name="refundable" type="checkbox" value="refundables"/>Refundables<br/>
    <input name="exclude" id="exclude" type="checkbox" value="exclude"/>Exclude Fee Category</fieldset>
    </td></tr></table>
    </td>   
     <td rowspan="7" width="30%"> <fieldset><legend><b>Existing Fees</b></legend>
      <select name="existing_fee" id="existing_fee" size="24" style="width:100%" onclick="viewFee(this.value)">
      <%	try {		 
	        Statement st = vdb.Db.connect().createStatement();	        
	        ResultSet res = st.executeQuery("SELECT * FROM  feemaster_tab");
	        while (res.next()) {%>
					<option value="<%=res.getString(2)%>"><%=res.getString(2) %></option>
	        <% }
		}
	      catch (Exception s){
	       s.printStackTrace();
	      }
	  %>
      </select>
     </fieldset></td>
  </tr>
  <tr>
    <td>
    <table>
    <tr><td><fieldset ><legend><b>Fee For Admission Type</b></legend>
    <input name="fee_admin" id="fee_for_admn_type1" type="radio" value="All"/>All
    <input name="fee_admin" id="fee_for_admn_type2" type="radio" value="New"/>New Admission
    <input name="fee_admin" id="fee_for_admn_type3" type="radio" value="Old"/>Old  Admission</fieldset></td>
    </tr>
      </table>
    </td>
  </tr>
   <tr> 
      <td>    
    <fieldset ><legend><b>Fee For Category</b></legend>
    Fee Category:<input type="text" name="fee_cat" id="fee_cat"/>
    </fieldset>
    </td>
   </tr>
        
  <tr>
    <td><fieldset ><legend><b>Fee Type</b></legend>
    <input name="fees_type" id="fee_type1" type="radio" value="Bus"/>Bus Fee
    <input name="fees_type" id="fee_type2" type="radio" value="Acc"/>Accomodation Fee
    <input name="fees_type" id="fee_type3" type="radio" value="Others"/>Others
    </fieldset></td>
  </tr>
  <tr>
    <td>
   under group:<input type="text" name="under_group" id="under_group"/>
    </td>
    </tr>
  <tr>
    <td>
	    <fieldset >
	    <legend><b>The Counter In Which The Fee Is Collected</b></legend>
		    <table>
			    <tr>
				    <td>counter:</td>
				    <td>
					    <input type="text" name="counter_type" id="counter_type"/>					    
				    </td>
			    </tr>
		    </table>
		    </fieldset>
		    </td>
		    </tr>
</table>
<br/>
<table width="800" align="center" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td>
    <fieldset >
    <legend><b>Counter Details</b></legend>
    <table border="0" >
    <tr>
    <td>Counter Code:</td>
    <td><input name="counter_num" id="counter_num" type="text"/></td>
  </tr>
  <tr>
  <tr>
    <td>Counter Name:</td>
    <td><input name="counter_name" id="counter_name" type="text"/></td>
  </tr>
  <tr>
    <td>Location:</td>
    <td><input name="location" id="location" type="text" /></td>
  </tr>
  <tr>
    <td>Incharge:</td>
    <td><input name="incharge" id="incharge" type="text" /></td>
  </tr>
  <tr>
    <td>Password:</td>
    <td><input name="password" id="password" type="password" /></td>
  </tr>
	</table>

	<br/>
	<table width="100%">
    <tr>
    	<th><input type="submit" value="  Delete  "/></th>
    	<th><input type="reset" value="Refresh" /></th>
    	<th><input type="button" value="   Quit   " onclick="window.close()" /></th>
    </tr>
    </table>
    </fieldset>
    </td></tr></table></fieldset>
 </form>

</body>
</html>
