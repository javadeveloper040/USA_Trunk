<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nominal Roll</title>
<script type="text/javascript" src="script2.js"></script>
</head>
<body bgcolor="skyblue">
	<form name="nr">
			<table>
			<tr>
				<td><fieldset>
				<legend>Select Branch & Sem</legend>
			
				<table>
					<tr>
						<td>Branch:</td>
						<td>Semester:</td>
					</tr>
					<tr>
						<td width="200"><select name="branch" id="branch1" onchange="getBranDetails()" style="width:100%" >
							<option value="select">select</option>
							<option value="cse">cse</option>
							<option value="ece">ece</option>
							<option value="eee">eee</option>
							<option value="it">it</option>
							</select>
						</td>
						<td width="200"><select name="semester"  id="sem"  onchange="getSemDetails()" style="width:100%" disabled="disabled">
							<option value="select">select</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							</select>
						</td>
					</tr>
				</table>
				
				</fieldset>
				</td>
				<td>
					<fieldset>
						<legend>Strength of Branch</legend>
						<table>
							<tr>
								<td>figures</td>
								<td>Total</td>
							</tr>
							<tr>
								<td>Boys:<input type="text" name="boys" size="7">
								Girls:<input type="text" name="girls" size="7"></td>
								<td>Total:<input type="text" name="total"  id="total" size="7"></td>
							</tr>
						</table>
					</fieldset>
				
				</td>
				</tr>
				</table>
				<center><input name="view" value="View" type="button"  onclick="pview()">
				<input name="quit" value="Quit" type="button"  onclick="window.close()"/></center>
				<div style="overflow:auto;height=""20px">
				<span id="newtable"></span>  
				</div>
	</form>
</body>
</html>
