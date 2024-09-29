<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.doctor.DatabaseOperation"%>
<%@ include file="adminheader.jsp"%>
<link rel="stylesheet" href="doctors.css">

<br>
<br>
<br>
<br>
<br>


<h1 class="heading" style="margin-bottom: -50px;">
	<span>overview</span>
</h1>
<section class="icons-container">
	<div class="icons">
		<i class="fas fa-user-md"></i>
		<p>doctors at work</p>
		<h3>1001+</h3>
	</div>

	<div class="icons">
		<i class="fas fa-users"></i>
		<p>patients</p>
		<h3>1040+</h3>
	</div>

	<div class="icons">
		<i class="fas fa-procedures"></i>
		<p>Appointments</p>
		<h3>500+</h3>
	</div>

	<!-- 		<div class="icons"> -->
	<!-- 			<i class="fas fa-sack-dollar"></i> -->
	<!-- 			<h3>80+</h3> -->
	<!-- 			<p>Revenue</p> -->
	<!-- 		</div> -->

</section>
<section class="doctors" id="doctors">

	<h1 class="heading">
		our <span>doctors</span>
	</h1>

	<div class="box-container">
		<%
		DatabaseOperation.loadJDBCDriverAndCreateConnection();
		ResultSet rs = DatabaseOperation.getDoctorsData();
		while (rs.next()) {
			String fname = rs.getString("First_Name");
			String lname = rs.getString("Last_Name");
			String username = rs.getString("Username");
			String degree = rs.getString("Degree");
			String city = rs.getString("City");
			String pricing = rs.getString("Pricing");
			String price = rs.getString("Price");
		%>
		<div class="box" style="height: 450px;">

			<img src="Images/doc-2.jpg" alt="">
			<h3><%=fname%>
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
				<i class="fas fa-dollar"></i>&nbsp;
				<%=price%>
				<%
				}
				%>
			</p>
			<!-- 			<div class="linkbtn"> -->
			<!-- 				<form action="docprofile.jsp" method="post"> -->
			<%-- 					<input type="hidden" value="<%=username%>" name="username"> --%>
			<!-- 					<input type="submit" value="View Profile"> -->
			<!-- 					<button> -->
			<!-- 						<a href="appointmentform.jsp">Book Appointment</a> -->
			<!-- 					</button> -->
			<!-- 				</form> -->
			<!-- 			</div> -->
		</div>
		<%
		}
		%>
	</div>

</section>

<section class="patients">
	<h1 class="heading">
		our <span>patients</span>
	</h1>
	<table class="patienttable">
	<tr>
	<th>Sr.No.</th>
	<th>Name</th>
	<th>Email-Id</th>
	<th>Mobile Number</th>
	</tr>
	<%
	ResultSet rs2 = DatabaseOperation.getPatientData();
	int count= 0;
	while(rs2.next()){
		String name = rs2.getString("Name");
		String email = rs2.getString("Email");
		String mobnumber = rs2.getString("Mobile_Number");		
		count++;
	%>
	<tr>
		<td><%=count %></td>
		<td><%=name %></td>
		<td style="text-transform: none;"><%=email %></td>
		<td><%=mobnumber %></td>
	</tr>
	<%} %>

	</table>

</section>

<section class="patients">
	<h1 class="heading">
		our <span>Appointments</span>
	</h1>
	<table class="patienttable">
	<tr>
	<th>Sr.No.</th>
	<th>Name</th>
	<th>Email-Id</th>
	<th>Mobile Number</th>
	<th>Appointment Date</th>
	<th>Doctor's Name</th>
	</tr>
	<%
	ResultSet rs3 = DatabaseOperation.getAppointmentData();
	int appcount= 0;
	while(rs3.next()){
		String fname = rs3.getString("Firstname");
		String lname = rs3.getString("Lastname");
		String email = rs3.getString("Email");
		String mobnumber = rs3.getString("MobileNumber");
		String date = rs3.getString("AppoiDate");
		String docname = rs3.getString("DoctorName");
		appcount++;
	%>
	<tr>
		<td><%=appcount %></td>
		<td><%=fname %> <%=lname %></td>
		<td style="text-transform: none;"><%=email %></td>
		<td><%=mobnumber %></td>
		<td><%=date %></td>
		<td><%=docname %></td>
	</tr>
	<%} %>

	</table>

</section>









<%@ include file="adminfooter.jsp"%>








