function addroom() {
	window.navigate("./addhostelroom.jsp?hostel_code="+document.form1.hostel_code.value+"&room_num="+document.form1.room_num.value+"&room_capacity="+document.form1.room_capacity.value);
}
function backhostel() {
	window.navigate("./hostel_newmodify.jsp");
}
function delroom() {
	window.navigate("./delroom.jsp?hostel_code="+document.form1.hostel_code.value+"&room_num="+document.form1.room_num.value+"&room_capacity="+document.form1.room_capacity.value);
}