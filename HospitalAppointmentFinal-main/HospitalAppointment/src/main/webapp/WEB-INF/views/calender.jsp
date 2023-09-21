<%@ page language="java" import="java.util.ArrayList,com.models.DoctorSlots,java.time.LocalDate" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Calendar</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
/* CSS styles for the calendar */
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

h1 {
	text-align: center;
	margin-top: 20px;
}

#calendar-container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #ddd;
	text-align: center;
	padding: 10px;
}

th {
	background-color: #f2f2f2;
}

.date-button {
	width: 100%;
	padding: 5px;
	border: none;
	background-color: #3498db;
	color: #fff;
	cursor: pointer;
	transition: background-color 0.2s;
}

.date-button:hover {
	background-color: #2980b9;
}

.date-button.weekend {
	background-color: #ccc;
	cursor: not-allowed;
}

button[disabled] {
	background-color: #ccc;
	cursor: not-allowed;
}
button[noslots] {
	background-color:red ;
	cursor: not-allowed;
}
button[slots] {
	background-color:green;
	color:white;
}
.product button {
	width: 100%; /* Full-width button */
	padding: 10px;
	background-color: #333;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}


</style>
</head>
<body>
	<%
	int doc_id = Integer.parseInt(request.getParameter("doc_id"));
	int check=0;
	%>
	<div class="header">
		<h1>MSB Hospital</h1>
	</div>
	<br>
	<br>
	<div id="calendar-title"></div>
	<div id="calendar-container">
		<h1>September 2023</h1>
		<table>
			<thead>
				<tr>
					<th>Sun</th>
					<th>Mon</th>
					<th>Tue</th>
					<th>Wed</th>
					<th>Thu</th>
					<th>Fri</th>
					<th>Sat</th>
				</tr>
			</thead>
			<tbody id="calendar-body">
				<!-- JavaScript will populate the calendar here -->
			</tbody>
		</table><br><center>
		<button id="previous-month-button" style="background-color:Blue;color:white">Previous</button>
		<button id="next-month-button" style="background-color:Blue;color:white" >Next</button></center>
	</div>

	<script>
		let currentYear =
	<%=java.util.Calendar.getInstance().get(java.util.Calendar.YEAR)%>;
		
		let currentMonth =
	<%=java.util.Calendar.getInstance().get(java.util.Calendar.MONTH)%>;
		let displayStartMonth, displayEndMonth;

		<%
		
		ArrayList<DoctorSlots> docd = (ArrayList<DoctorSlots>) request.getAttribute("doctorsList");
		ArrayList<LocalDate> dates=new ArrayList<>();
		for(DoctorSlots d:docd){
			dates.add(d.getS_date());
		}
		
		%>
	    function generateCalendar(year, month) {
	    	
	        const calendarTitle = document.getElementById('calendar-title');
	        const calendarBody = document.getElementById('calendar-body');
	        const firstDay = new Date(year, month, 1);
	        const lastDay = new Date(year, month + 1, 0);
	        const daysInMonth = lastDay.getDate();
	        const startingDay = firstDay.getDay();

	        let date = 1;

	        let html = '';

	        for (let i = 0; i < 6; i++) { // 6 rows for maximum calendar height
	            html += '<tr>';
	            
	            for (let j = 0; j < 7; j++) {
	            	let check=0;
	                if ((i === 0 && j < startingDay) || date > daysInMonth) {
	                    html += '<td></td>';
	                } else {
	                    const dayOfWeek = (j + 1) % 7; // Adjust day numbering starting from Sunday (0)
	 
	            
	                    const isWeekend = dayOfWeek === 1 || dayOfWeek === 0; // 0 is Sunday, 6 is Saturday
	   
;// 0 is Sunday, 6 is Saturday
	                    const buttonClass = isWeekend ? 'date-button weekend'
	                            : 'date-button';
	                    html += '<td><form action="slots?"> <input type="hidden" name="doc_id" value="<%=doc_id%>"><input type="hidden" name="yesr" value="'+year+'"><input type="hidden" name="month" value="'+(month+1)+'"><input type="hidden" name="day" value="'+date+'"><button type="submit" class="'
	                            + buttonClass
	                            + '" '
	                            + (isWeekend ? 'disabled' : '')
	                  

	                            + ' onclick="'
	                            + (isWeekend ? '' : 'selecuutedDate(' + date
	                                    + ',' + (month + 1) + ',' + year + ')')
	                            + '">' + date + '</button></form></td>';

	                    date++;
	                }
	            }
	            html += '</tr>';
	        }

	        const monthNames = [ "January", "February", "March", "April",
	                "May", "June", "July", "August", "September", "October",
	                "November", "December" ];
	        calendarTitle.textContent = `${monthNames[month]} ${year}`; // Display month name and year
	        calendarBody.innerHTML = html;
	    }
		function showNextMonths() {
			if (displayEndMonth < 11) { // Limit to 3 months ahead
				displayStartMonth++;
				displayEndMonth++;
				showCalendar(displayStartMonth);
			}
		}

		function showPreviousMonths() {
			if (displayStartMonth > currentMonth) {
				displayStartMonth--;
				displayEndMonth--;
				showCalendar(displayStartMonth);
			}
		}

		function showCalendar(month) {
			const today = new Date();
			currentYear = today.getFullYear();
			currentMonth = today.getMonth();
			generateCalendar(currentYear, month);
			updateButtons();
		}

		function updateButtons() {
			const previousMonthButton = document
					.getElementById('previous-month-button');
			const nextMonthButton = document
					.getElementById('next-month-button');

			if (displayStartMonth === currentMonth) {
				previousMonthButton.disabled = true;
			} else {
				previousMonthButton.disabled = false;
			}

			if (displayEndMonth >= currentMonth + 2) {
				nextMonthButton.disabled = false;
			} else {
				nextMonthButton.disabled = true;
			}
		}

		const nextMonthButton = document.getElementById('next-month-button');
		nextMonthButton.addEventListener('click', showNextMonths);

		const previousMonthButton = document
				.getElementById('previous-month-button');
		previousMonthButton.addEventListener('click', showPreviousMonths);

		const today = new Date();
		currentYear = today.getFullYear();
		currentMonth = today.getMonth();
		displayStartMonth = currentMonth;
		displayEndMonth = currentMonth + 2; // Display 3 months initially

		showCalendar(currentMonth);
	</script>
</body>
</html>
