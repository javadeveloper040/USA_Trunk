<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="mis.Dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fee Card</title>
<script src="script2.js" type="text/javascript">
</script>
</head>
<body bgcolor="skyblue">
<form action="#" name="form1">
<table cellpadding="10" cellspacing="10" align="center" summary=""> 
  <tr>
    <td>
    <fieldset>
      <legend><b>Student Details</b></legend>
      <table cellpadding="7" summary="">
        <tr>
          <th>RollNo:</th>
          <td><input name="roll_num" id="roll_num" type="text" size="10" title="enter roll number" maxlength="10" onblur="getDetails()" /></td>
          <th>Branch:</th>
          <td><input name="branch" type="text"  size="5" maxlength="5" /></td>
          <th>Sem:</th>
          <td><input name="sem" type="text"  size="7" maxlength="5" /></td>
        </tr>
        <tr>
          <th>Student:</th>
          <td colspan="5"><input name="student_name" type="text"  size="50" maxlength="50" style="width:100%" /></td>
        </tr>
        <tr>
          <th>Parent:</th>
          <td colspan="5"><input name="parent_name" type="text"  size="50" maxlength="50" style="width:100%"/></td>
        </tr>
      </table>
      </fieldset>
    </td>
  <td>
    <fieldset>
    <legend>select academic years</legend>
    
    <select id="name" size="6"  onchange="getFee()" style="width:100%">
   </select>
  </fieldset>
    </td>
    <td></td>
    <td></td>
    <td><img  src="" name="sImage" width="100" height="130" alt="loading"/></td>
    
  </tr>

  </table><center>

   
   <input name="&nbsp;&nbsp;quit&nbsp;&nbsp;" type="button" value="  &nbsp;Quit&nbsp;  " onclick="javascript:window.close()"/>
 <span id="fillTable"></span>
  </center>
  </form>
</body>
</html>