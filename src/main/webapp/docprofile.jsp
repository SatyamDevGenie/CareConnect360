<%@page import="java.sql.ResultSet"%>
<%@page import="com.doctor.DatabaseOperation"%>
<%-- <%String title = "Accessing Request Param"; %> --%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="docprofilecss.css">
<br>
<br>
<br>
<br>
<%
DatabaseOperation.loadJDBCDriverAndCreateConnection();
String Username = request.getParameter("username");

ResultSet rs = DatabaseOperation.getDoctorData(Username);
while (rs.next()) {
	String firstname = rs.getString("First_Name");
	String lastname = rs.getString("Last_Name");
	String email = rs.getString("Email");
	String age = rs.getString("Age");
	String dob = rs.getString("Date_of_Birth");
	String gender = rs.getString("Gender");
	String mobnumber = rs.getString("Mobile_Number");
	String biography = rs.getString("Biography");
	String addline1 = rs.getString("Address_Line1");
	String addline2 = rs.getString("Address_Line2");
	String country = rs.getString("Country");
	String state = rs.getString("State");
	String city = rs.getString("City");
	String postalcode = rs.getString("Postal_Code");
	String price = rs.getString("Price");
	String services = rs.getString("Services");
	String specialization = rs.getString("Specialization");
	String degree = rs.getString("Degree");
	String college = rs.getString("College");
	String yearofcomp = rs.getString("Year_Of_Completion");
	String hospital = rs.getString("Hospital");
	String expfrom = rs.getString("Experience_From");
	String expto = rs.getString("Experience_To");
	String designation = rs.getString("Designation");
	String award = rs.getString("Award");
	String awardyear = rs.getString("Award_Year");
%>

<section class="doctors" id="doctors">

	<h1 class="heading">
			<%=firstname %> <span><%=lastname %></span>
		</h1>
	<div class="box-container">

		<div class="box">
			<div class="profilephoto">
				<img src="Images/doc-1.jpg" alt="">
				<h3><%=firstname%>
					<%=lastname%>
				</h3>
			</div>
			<br>
			<h2>About Me</h2>
			<p><%=biography%></p>
			<br> <br>

			<h2>Education</h2>
			<ul class="education">
				<li><%=degree%></li>
				<li><%=college%></li>
				<li><%=yearofcomp%></li>
			</ul>
			<br> <br>

			<h2>Work Experience</h2>
			<ul class="education">
				<li><%=hospital%></li>
				<li><%=expfrom%> - <%=expto%></li>
			</ul>
			<br> <br>

			<h2>Awards</h2>
			<ul class="education">
				<li><%=award%></li>
				<li><%=awardyear%></li>
			</ul>
			<br> <br>

			<h2>Services</h2>
			<ul class="education">
				<%
				String[] service = services.split(",");
				int length = service.length;
				for (int i = 0; i < length; i++) {
				%>
				<li>
					<%
					System.out.println(service[i]);
					%>
				</li>
				<%
				}
				%>
			</ul>
			<br> <br>

			<h2>Specializations</h2>
			<ul class="education">
				<%
				String[] specializations = specialization.split(",");
				int spelength = service.length;
				for (int i = 0; i < spelength; i++) {
				%>
				<li>
					<%
					System.out.println(specializations[i]);
					%>
				</li>
				<%
				}
				%>
			</ul>
			<br> <br>

			<h2>Clinic Info</h2>
			<ul class="education">
				<li><%=addline1%></li>
				<li><%=addline2%></li>
				<li><%=city%>, <%=state%></li>
				<li><%=postalcode%></li>
			</ul>
			<br> <br>



			<div class="linkbtn">
				<button>
					<a href="#">Book Appointment</a>
				</button>
			</div>
		</div>

	</div>

</section>

<%
}
%>



<%@ include file="footer.jsp"%>