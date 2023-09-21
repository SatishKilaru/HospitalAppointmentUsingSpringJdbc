<%@ page language="java"
	import="java.util.*,com.models.Patient,com.models.DoctorSlots"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.header {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 10px;
}
.product {
	width: 50%;
	padding: 20px;
	border: 1px solid #ccc;
	text-align: center;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<div class="header">
		<h1>MSB Hospital</h1>
	</div>
	<%
	Patient pt = (Patient) request.getAttribute("patient");
	%>
	<%
	DoctorSlots ds = (DoctorSlots) request.getAttribute("dslots");
	%>
	<%
	int s_id = ds.getS_id();
	int doc_id = ds.getS_docid();
	String s_date = ds.getS_date() + "";
	String s_ftime = ds.getS_ftime();
	String s_ttime = ds.getS_ttime();
	String fname = pt.getFname();
	String lname = pt.getLname();
	String gender = pt.getGender();
	String phone = pt.getPhone();
	%>


	<center>
	    <br><br><br>
		<div class="product">
			<h1>Slot Booked Successfully</h1>
			<h3>
				Slot Id:<%=s_id%></h3>
			<h3>
				Doctor Id:<%=doc_id%></h3>
			<h3>
				Slot Date:2023-09-04</h3>
			<h3>
				Slot Timing:<%="10:30 AM"%>-<%="11:30 AM"%></h3>
			<h3>
				<h3>
					Patient Name:<%=fname + " " + lname%></h3>
		</div>
		
	</center>
</body>
</html>