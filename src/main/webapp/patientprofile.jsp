<%@page import="java.sql.ResultSet"%>
<%@page import="com.doctor.DatabaseOperation"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="doctorprofile.css">
<br>
<br>
<br>
<br>
<%
DatabaseOperation.loadJDBCDriverAndCreateConnection();
String Username = String.valueOf(session.getAttribute("PatientUsername"));

System.out.println(Username);

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

	<h1 class="docname">
		<%
		if (session.equals(null) || (session.getAttribute("PatientName") == null)) {
		%>
		<%
		} else if (session.getAttribute("PatientName") != null) {
		%>
		<%
		String DoctorUsername = String.valueOf(session.getAttribute("PatientName"));
		%>
		<%=DoctorUsername%>
		<%
		}
		%>
	</h1>



	<div class="box-container">

		<div class="box">
			<img src="Images/doc-1.jpg" alt=""><a href="editprofile.jsp"><i
				class="fas fa-edit"></i></a>
			<h3><%=firstname%>
				<%=lastname%>
			</h3>
			<p><%=degree%></p>
			<p>
				<i class="fas fa-map-marker-alt"></i> &nbsp;&nbsp;
				<%=city%>
			</p>
			<p>
				<i class="fas fa-clock"></i> Available on Fir
			</p>
			<p>
				<i class="fas fa-dollar"></i>&nbsp;
				<%=price%>
			</p>
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

</div>

</section>




<%@ include file="footer.jsp"%>