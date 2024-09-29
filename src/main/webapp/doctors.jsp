<%@page import="java.sql.*"%>
<%@page import="com.doctor.DatabaseOperation"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="doctors.css">
<br>
<br>
<br>
<br>
<section class="doctors" id="doctors">

	<h1 class="heading">
		our <span>doctors</span>
	</h1>

	<div class="box-container">
		<%
		// Blob image = null;
		// byte[] imgData = null;
		DatabaseOperation.loadJDBCDriverAndCreateConnection();
		ResultSet rs = DatabaseOperation.getDoctorsData();
		// 		response.setContentType("image/jpg");
		// OutputStream o = null;
		while (rs.next()) {
			String fname = rs.getString("First_Name");
			String lname = rs.getString("Last_Name");
			String username = rs.getString("Username");
			String degree = rs.getString("Degree");
			String city = rs.getString("City");
			String pricing = rs.getString("Pricing");
			String price = rs.getString("Price");
			// 			image = rs.getBlob("Photo");
			//     imgData = image.getBytes(1, (int) image.length()); 

			//     System.out.println(image.length());
		%>
		<div class="box">
		
			<img src="Images/doc-2.jpg" alt="">
			<h3>Dr. <%=fname%>
				<%=lname%></h3>
			<p><%=degree%></p>
			<div class="stars">
				<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
					class="fas fa-star"></i> <i class="fas fa-star"></i> <i
					class="fas fa-star-half-alt"></i>
			</div>
			<p>
				<i class="fas fa-map-marker-alt"></i> &nbsp;&nbsp;<%=city%>
			</p>
			<p>
				<i class="fas fa-clock"></i> Available on Fir
			</p>
			<p>
				<%
				if (pricing.equalsIgnoreCase("free")) {
				%>
				Free
				<%
				} else {
				%>
				<i class="fas fa-dollar"></i>&nbsp; <%=price%>
				<%
				}
				%>
			</p>
			<div class="linkbtn">
				<form action="docprofile.jsp" method="post">
					<input type="hidden" value="<%=username%>" name="username">
					<input type="submit" value="View Profile">
					<button>
						<a href="appointmentform.jsp">Book Appointment</a>
					</button>
				</form>
			</div>
		</div>
		<%
		}
		%>
	</div>

</section>

<%@ include file="footer.jsp"%>