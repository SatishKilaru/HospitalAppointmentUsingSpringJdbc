<%@ page language="java"
	import="com.models.Doctor,java.util.ArrayList"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aadhya Hospital</title>
<!-- Add Bootstrap CSS link -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
	max-width: 1000px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.product {
	width: 30%;
	margin-bottom: 20px;
	padding: 20px;
	border: 1px solid #ccc;
	text-align: center;
	background-color: #fff;
	transition: transform 0.2s, box-shadow 0.2s;
}

.product:hover {
	transform: translateY(-5px);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.doctor-image {
	max-width: 150px; /* Set the maximum width */
	height: auto; /* Maintain aspect ratio */
}

.product h3 {
	margin-top: 10px;
	font-size: 18px;
	color: #333;
}

.product p {
	color: #777;
}
</style>
</head>
<body>

	<div class="header bg-dark text-white py-3">
    <h1 class="text-center">MSB Hospital</h1>
</div>
	<br>
	<center>
		<label><b>Specialization:</b> <select id="specializationFilter"
			onchange="filterDoctorsBySpecialization()">
				<option value="All">All</option>
				<option value="Cardiology">Cardiology</option>
				<option value="Dermatology">Dermatology</option>
				<option value="Orthopedics">Orthopedics</option>
				<option value="Gynecology">Gynecology</option>
				<option value="Neurosurgery">Neurosurgery</option>
				<option value="Pediatrics">Pediatrics</option>
				<option value="Gastroenterology">Gastroenterology</option>
				<option value="Ophthalmology">Ophthalmology</option>
				<option value="Urology">Urology</option>
				<option value="Psychiatry">Psychiatry</option>
				<option value="ENT">ENT (Ear, Nose, and Throat)</option>
				<option value="Endocrinology">Endocrinology</option>
				<option value="PlasticSurgery">Plastic Surgery</option>
				<option value="Dentistry">Dentistry</option>
				<option value="Pulmonology">Pulmonology</option>
				<option value="Oncology">Oncology</option>
				<option value="CardiothoracicSurgery">Cardiothoracic
					Surgery</option>
				<option value="Rheumatology">Rheumatology</option>
				<option value="Nephrology">Nephrology</option>
				<option value="Obstetrics">Obstetrics</option>
		</select>
		</label> <br>
	</center>

	<div class="product-container">
		<%
		ArrayList<Doctor> docd = (ArrayList<Doctor>) request.getAttribute("doctorsList");
		for (Doctor d : docd) {
			String doc_id = d.getDoc_id() + "";
			String doc_name = d.getDoc_name();
			String doc_img = d.getDoc_img();
			String doc_qual = d.getDoc_qual();
			String doc_spec = d.getDoc_spec();
			String doc_exp = d.getDoc_exp() + "";
			String href = "?id=" + doc_id + "&name=" + doc_name + "&img=" + doc_img + "&spec=" + doc_spec + "&exp=" + doc_exp
			+ "&qual=" + doc_qual;
		%>

		<div class="product">
			<a href="doctor.jsp<%=href%>"><img src="images/<%=doc_img%>"
				alt=<%=d.getDoc_name()%> class="doctor-image"></a>
			<h3><b><%=d.getDoc_name()%></b></h3>
			<p class="product-spec"><%=d.getDoc_spec()%></p>
		</div>

		<%
		}
		%>
	</div>

	<script>
    function filterDoctorsBySpecialization() {
        const selectedSpecialization = document.getElementById('specializationFilter').value;
        const products = document.querySelectorAll('.product');

        products.forEach(product => {
            const productSpecialization = product.querySelector('.product-spec').textContent;
            if (selectedSpecialization === 'All' || productSpecialization === selectedSpecialization) {
                product.style.display = 'block';
            } else {
                product.style.display = 'none';
            }
        });
    }
    </script>
    <!-- Add Bootstrap JS and jQuery (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
