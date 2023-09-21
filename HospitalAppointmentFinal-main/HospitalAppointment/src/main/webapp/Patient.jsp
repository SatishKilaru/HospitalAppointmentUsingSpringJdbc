<%@ page language="java" import="java.time.LocalDate,java.time.format.DateTimeFormatter" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
<style>
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
	position: relative;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
}

.product {
	width: 50%;
	padding: 20px;
	border: 1px solid #ccc;
	text-align: center;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.product h1 {
	font-size: 24px;
	margin-bottom: 20px;
}

.product label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold; /* Add bold font-weight to label text */
}

.product input[type="text"], .product input[type="password"] {
	width: 60%; /* Adjust the width as needed */
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.product button {
	width: 40%;
	padding: 10px;
	background-color: #333;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.product button:hover {
	background-color: #555;
}
</style>
</head>
<body>
		<div class="header">
			<h1>MSB Hospital</h1>
		</div>
		<%

		

		// Now 'localDate' contains the local date object.

			int s_id = Integer.parseInt(request.getParameter("s_id"));
			int s_docid = Integer.parseInt(request.getParameter("s_docid"));
			String s_date = request.getParameter("s_date");
			String s_ftime =request.getParameter("s_ftime");
			String s_ttime =request.getParameter("s_ttime");
			String dateStr = s_date;
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate localDate = LocalDate.parse(dateStr, formatter);
		
		%>
		<br>
		<center>
		<h1>Patient Details</h1>
		<br>
		<div class="container">
			<div class="product">
				<form action="booking" method="get">
					<label for="fname"><b>First Name:</b></label>
					<input type="text" name="fname"><br>
					<label for="lname"><b>Last Name:</b></label>
					<input type="text" name="lname"><br>
					<label for="age"><b>age:</b></label>
					<input type="text" name="age"><br>
					
					<label for="phone"><b>Phone Number:</b></label>
					<input type="text" name="phone"><br>
					<label for="gender"><b>Gender:</b>
					<select name="gender"><option>Male</option><option>Female</option><option>Other</option></select>
					</label>
					
					<input type="hidden" name="s_id" value="<%=s_id%>">
					<input type="hidden" name="s_docid" value="<%=s_docid%>">
					<button type="submit" class="btn">Book</button>
				</form>
			</div>
		</div>
		</center>
</body>
</html>
