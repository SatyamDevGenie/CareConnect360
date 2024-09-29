<%@page import="com.doctor.DatabaseOperation"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="appointmentform.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<br>
	<br>
	<br>
	<br>


	<section class="appointment">

		<h1 class="heading">
			Appointment <span>Form</span>
		</h1>

		<div class="box-container">
			<div class="box main">
				<form action="AppointmentServlet" method="post">
				    <h1>Patient Details:-</h1><br>
				    <div>
				    	<input type="text" placeholder="First Name" name="firstname" required>	
						<input type="text" placeholder="Last Name" name="lastname" required>
						<input type="email" placeholder="Email" name="email" required style="text-transform: none;">
						<input type="number" placeholder="Age" name="age" required min="1" max="100">
						<input placeholder="Date of Birth" name="dateofbirth" type="text" onfocus="(this.type='date')" id="date" required>
						<select required id="gender" name="gender">
							<option value="Select">Select Gender</option>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
							<option value="Other">Other</option>
						</select>
						<input type="tel" id="mobnumber" placeholder="Enter your Number" name="mobnumber" maxlength="10" required pattern="[6-9]{1}[0-9]{9}" onblur="myFunction()" onkeypress="return onlyNumberKey(event)"><br>
						<span id="errMsg"></span>
					</div>
                    <br><br><br><br>					
					<h1>Appointment Regards:-</h1><br>
					<label>Have you previously attended our facility? </label><br><br>
					<select required class="select" id="select" name="select" onchange="activeTextArea(this)">
						<option value="Select">Select </option>
						<option value="Yes">Yes</option>
						<option value="No">No</option>
					</select><br><br>
					<label>If yes, state on which condition and when?</label><br><br>
					<textArea id="textarea" disabled="disabled" name="textarea" style="text-transform: none;"></textArea><br><br>
					<label>Appointment Date</label><br><br>
					<input type="date" name="appodate" required class="select" ><br><br>
					<label>Select Your Doctor</label><br><br>					
					
					<select required class="select" name="docname" id="docnames">
						<option value="Our Doctors">Our Doctors</option>
						<%
							ResultSet rs;
							DatabaseOperation.loadJDBCDriverAndCreateConnection();
							rs= DatabaseOperation.getDoctorNames();		
							while(rs.next()){
								String docnames= rs.getString("Name");
						%>
						<option value="<%= docnames %>"><%= docnames %></option>
						<%} %>
						
					</select>
					<br><br>
					<input type="submit" id="submit" value="Submit" class="btn-2">
					<input type="button" value="Cancel" class="btn-2">
				</form>
			</div>
		</div>
	</section>
	
	<%@ include file="footer.jsp" %>

	<script>
	
	$(document).ready(function(){
		$("#submit").on('click', function(){
			if($("#select").val() == "Select")
				{
					alert("Select have you previously attended our faculty or not?");
					$("#submit").attr('disable', 'true');
				}
			else{
				$("#submit").attr('disable', 'false');
			}
		})
	});
	
	$(document).ready(function(){
		$("#submit").on('click', function(){
			if($("#docnames").val() == "Our Doctors")
				{
					alert("Select Our Doctor Name");
					$("#submit").attr('disable', 'true');
				}
			else{
				$("#submit").attr('disable', 'false');
			}
		})
	});
	
	$(document).ready(function(){
		$("#submit").on('click', function(){
			if($("#select").val() == "Select")
				{
					alert("Select Gender");
					$("#submit").attr('disable', 'true');
				}
			else{
				$("#submit").attr('disable', 'false');
			}
		})
	});
	
	
	
	document.ready(function(){
		
	$("input[type=tel]").keypress(function(event) {
		  return /\d/.test(String.fromCharCode(event.keyCode));
		});
	});
	
		function myFunction() {
		  	const inpObj = document.getElementById("mobnumber");
		  	if (!inpObj.checkValidity()) {
		   	 	document.getElementById("errMsg").innerHTML = inpObj.validationMessage + " Starts with 6, 7, 8 and 9. <br> ";
		   	 	document.getElementById("errMsg").style.color='red';
		   	 	document.getElementById("submit").style.cursor='not-allowed';
		   	 	document.getElementById("submit").disabled=true;
		  	} 
		  	else {
		  		document.getElementById("errMsg").innerHTML = inpObj.validationMessage;
		  		document.getElementById("submit").disabled=false;
		  		document.getElementById("submit").style.cursor='pointer';
		  	}
			}
		
		
		
		function activeTextArea(select){
		        var selectedValue = select.options[select.selectedIndex].value;
		        var textarea = document.getElementById("textarea");
		        textarea.disabled = selectedValue == "Yes" ? false : true;
		        if (!textarea.disabled) {
		            textarea.focus();
		        }
		        else{
		        	textarea.innerHTML=" ";
		        }
		    }
		
		
	</script>
	</body>
	</html>
