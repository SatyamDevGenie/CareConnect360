<%@page import="java.sql.ResultSet"%>
<%@page import="com.doctor.DatabaseOperation"%>
<%@ include file="adminheader.jsp"%>
<link rel="stylesheet" href="adminservicescss.css">
<br>
<br>
<br>
<br>

<!-- services section starts  -->

<section class="services" id="services">

	<h1 class="heading">
		our <span>services</span>
	</h1>

	<div class="box-container-1">

		<div class="innerbox">
			<i class="fas fa-notes-medical"></i>
			<h3>free checkups</h3>
			<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.</p>

		</div>

		<div class="innerbox">
			<i class="fas fa-ambulance"></i>
			<h3>24/7 ambulance</h3>
			<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.</p>

		</div>

		<div class="innerbox">
			<i class="fas fa-user-md"></i>
			<h3>expert doctors</h3>
			<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.</p>

		</div>

		<div class="innerbox">
			<i class="fas fa-pills"></i>
			<h3>medicines</h3>
			<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.</p>

		</div>

		<div class="innerbox">
			<i class="fas fa-procedures"></i>
			<h3>bed facility</h3>
			<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.</p>

		</div>

		<div class="innerbox">
			<i class="fas fa-heartbeat"></i>
			<h3>total care</h3>
			<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
				omnis.</p>
		</div>
		
		<%
			DatabaseOperation.loadJDBCDriverAndCreateConnection();
			ResultSet rs = DatabaseOperation.getServicesData();
			
			while(rs.next())
			{
				String Name = rs.getString("Name");
				String Discription = rs.getString("Discription");
			%>
			
			<div class="innerbox">
				<i class="fas fa-heartbeat"></i>
				<h3><%=Name %></h3>
				<p><%=Discription %></p>
			</div>
			
			<%} %>

		<div class="innerbox" style="text-align: center;">
			<button class="btn" style="width: 50%;"
				onclick="document.getElementById('id01').style.display='block';">Add
				More Services</button>
		</div>

		<div id="id01" class="modal">
			<form class="modal-content animate" action="AddServiceServlet" method="post">
				<h1 class="heading">
					Add <span> new service</span>
				</h1>
				<label for="servicename">Service Name</label><br> 
				<input type="text" id="servicename" name="servicename" required><br>
				<br> 
				<label for="servicediscription">Discription</label><br>
				<textarea id="servicediscription" name="servicediscription" required maxlength="350"></textarea><br>
				<input type="submit" class="btn">
				<input type="button" value="Cancel" onclick="document.getElementById('id01').style.display='none'" class="btn">
			</form>
		</div>


	</div>
	<br> <br> <br> <br>

</section>






<%@ include file="adminfooter.jsp"%>