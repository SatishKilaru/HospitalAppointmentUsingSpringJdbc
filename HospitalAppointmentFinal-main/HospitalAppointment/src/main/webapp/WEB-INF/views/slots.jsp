<%@ page language="java"
	import="com.models.DoctorSlots,java.util.ArrayList"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aadhya Hospital</title>
<!-- Add Bootstrap CSS link -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-pzjw8f+ua7Kw1TIq0v8FqFjcJ6pajs/rfdfs3SO+k5l5c5C5xBp4fJY5W5+5Y5t5b5"
	crossorigin="anonymous">

<!-- Add custom CSS styles -->
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
}

.product-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	max-width: 900px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.product {
	width: 30%;
	margin-bottom: 20px;
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
	background-color: #fff;
	transition: transform 0.2s, box-shadow 0.2s;
}

.product:hover {
	transform: translateY(-5px);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.product img {
	max-width: 60%;
	height: auto;
}

.product h3 {
	margin-top: 10px;
	font-size: 18px;
	color: #333;
}

.product p {
	color: #777;
}

/* Custom styles for the button */
.product button {
	background-color: green;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	transition: background-color 0.2s;
}

.product button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="header bg-dark text-white py-3">
		<h1 class="text-center">MSB Hospital</h1>
	</div>
	<center>

	
		<%
		ArrayList<DoctorSlots> docd = (ArrayList<DoctorSlots>) request.getAttribute("doctorSlotList");
		if (docd.size() > 0) {%><div class="product-container"><% 
			for (DoctorSlots d : docd) {
				String s_id = d.getS_id() + "";
				String s_docid = d.getS_docid() + "";
				String s_date = d.getS_date() + "";
				String s_ftime = d.getS_ftime();
				String s_ttime = d.getS_ttime();
				String href = "?s_id=" + s_id + "&s_docid=" + s_docid + "&s_date=" + s_date + "&s_ftime=" + s_ftime
				+ "&s_ttime=" + s_ttime;
		%>

		<div class="product">
			<a href="Patient.jsp<%=href%>"><button><%=s_ftime%>
					-
					<%=s_ttime%></button></a>
		</div>
		

		<%
		}
		} else {
		%>
		</div>
		
            <br><br><br>
			<h3><b>Slots not available</b></h3>
			

		<%
		}
		%>
		</center>
	
</body>
</html>
