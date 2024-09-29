<!DOCTYPE html>
<html lang="en">
<head>
<title>Doctor Appointment</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="Images/user-md-solid.svg" type="image/x-icon">
<link rel="stylesheet" href="style.css">

<!-- ******google fonts********* -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
	<!-- header section starts  -->

	<header class="header">
		<button class="openNav" onclick="openNav()">
			<i class="fas fa-bars"></i>
		</button>

		<a href="index.jsp" class="logo"><i class="fa fa-user-md"
			aria-hidden="true"></i>Stay<span>Healthy.</span></a>

		<nav class="nav">
			<ul id="navlinks">
				<li><a href="#" class="closebtn" onclick="closeNav()">X</a></li>
				<li class="one"><a href="index.jsp">Home</a></li>
				<li><a href="aboutus.jsp">About</a></li>
				<li><a href="services.jsp">Services</a></li>
				<li><a href="doctors.jsp">Doctors</a></li>
				<li><a href="contact.jsp">Contact Us</a></li>
			</ul>
		</nav>

		<%
		if (session.equals(null)
				|| (session.getAttribute("Doctorname") == null && session.getAttribute("PatientName") == null)) {
		%>
		<a href="login.jsp" class="link-btn">Sign in</a>
		<%
		} else if (session.getAttribute("Doctorname") != null) {
		%>
		<%
		String DoctorUsername = String.valueOf(session.getAttribute("Doctorname"));
		%>
		<div class="dropdown">
			<a href="#" class="dropbtn"><%=DoctorUsername%></a>
			<div class="dropdown-content">
				<a href="doctorprofile.jsp"><i class="fas fa-angle-double-right"></i>
					My Profile</a> <a href="changedoctorpassword.jsp"><i
					class="fas fa-angle-double-right"></i> Change Password</a> <a
					href="LogoutServlet"><i class="fas fa-angle-double-right"></i>
					Log Out</a>
			</div>
		</div>
		<%
		} else if (session.getAttribute("PatientName") != null) {
		%>
		<%
		String PatientUsername = String.valueOf(session.getAttribute("PatientName"));
		%>
		<div class="dropdown">
			<a href="#" class="dropbtn"><%=PatientUsername%></a>
			<div class="dropdown-content">
				<a href="changepatientpassword.jsp"><i
					class="fas fa-angle-double-right"></i> Change Password</a> <a
					href="LogoutServlet"><i class="fas fa-angle-double-right"></i>
					Log Out</a>
			</div>
		</div>
		<%
		}
		%>
	</header>

	<!-- header section end -->