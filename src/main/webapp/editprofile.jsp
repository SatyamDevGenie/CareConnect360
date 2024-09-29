<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.doctor.DatabaseOperation"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="editprofile.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<br>
<br>
<br>
<br>
<%
ResultSet rs;
DatabaseOperation.loadJDBCDriverAndCreateConnection();
String usrname = String.valueOf(session.getAttribute("Username"));

rs=DatabaseOperation.getDoctorData(usrname);
while(rs.next()){
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

<section class="editform">

	<h1 class="heading">
		Edit <span>Profile</span>
	</h1>
	<div class="box-form">
		<form action="EditProfileServlet" method="post" enctype="multipart/form-data">
			<div class="basicinfo">
				<h2>Basic Information :-</h2>
				<br>
				<div style="text-align: center;">
					<img id="imgPreview" src="Images/user-solid.svg" alt="pic"/><br><br>
					<input type="file" name="photo" id="photo" hidden="true" required/>				
					<label for="photo" class="uploadbtn"><i class="fas fa-upload"></i> Choose Photo</label>
				</div>
				<br><br>
				<input type="text" placeholder="First Name" name="firstname" value="<%= firstname %>" required>	
				<input type="text" placeholder="Last Name" name="lastname"  value="<%= lastname %>" required>
				<input type="email" placeholder="Email" name="email" value="<%= email %>" required>
				<input type="number" placeholder="Age" name="age"  value="<%= age %>" required min="1" max="100" maxlength="2">
				<input placeholder="Date of Birth" name="dateofbirth" value="<%= dob %>" type="text" onfocus="(this.type='date')" id="date" required>
				<select required id="gender" name="gender">
					<option value="Select">Select Gender</option>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
					<option value="Other">Other</option>
				</select>
				<input type="tel" id="mobnumber" placeholder="Enter your Number" value="<%= mobnumber %>" name="mobnumber" maxlength="10" required pattern="[6-9]{1}[0-9]{9}" onblur="myFunction()" >
				<span id="errMsg"></span>
			</div>
			<br><br>
			<div class="aboutme">
				<h2>About Me :-</h2>
				<br>
				<textarea placeholder="Biography" name="biography"><%= biography %></textarea>
			</div>
			<br>
			<div class="contactinfo">
				<h2>Contact Info :-</h2>
				<br>
				<input type="text" placeholder="Address Line 1" value="<%= addline1 %>" name="line1" required>	
				<input type="text" placeholder="Address Line 2"  value="<%= addline2 %>" name="line2">
				<input type="text" placeholder="Country" value="<%= country %>" name="country" required>
				<input type="text" placeholder="State" value="<%= state %>" name="state" required>
				<input type="text" placeholder="City" value="<%= city %>" name="city" required>
				<input type="tel" placeholder="Postal Code" value="<%= postalcode %>" name="postalcode" maxlength="6" required pattern="[0-9]{6}">				
			</div>
			<br><br>
			<div class="pricing">
				<h2>Pricing :-</h2>
				<br>
				<input type="radio" id="free" name="pricing" value="free" required> <label for="free">Free</label><br>
				<input type="radio" id="paid" name="pricing" value="paid" required> <label for="paid">Custom Pricing (Per Hour)</label><br>
				<input type="number" id="price" name="price" value="<%= price %>" min="0" maxlength="4" style="display: none;">
			</div>
			<br><br>
			<div class="services">
				<h2>Services And Specialization</h2>
				<br>
				<input type="text" placeholder="Services" value="<%= services %>" name="services">
				<input type="text" placeholder="Specialization" value="<%= specialization %>" name="specialization">
			</div>
			<br><br>
			<div class="education">
				<h2>Education</h2>
				<br>
				<input type="text" placeholder="Degree" name="degree" value="<%= degree %>" required>
				<input type="text" placeholder="College/Institute" name="college" value="<%= college %>" required>
				<input type="tel" id="compYear" placeholder="Year of Completion" name="year" maxlength="4" value="<%= yearofcomp %>" required pattern="[0-9]{4}">
			</div>
			<br><br>
			<div class="experience">
				<h2>Experience</h2>
				<br>
				<input type="text" placeholder="Hospital" name="hospital" value="<%= hospital %>">
				<input type="tel" id="fromYear" placeholder="From" name="from" maxlength="4"  pattern="[0-9]{4}" value="<%= expfrom %>">
				<input type="tel" id="toYear" placeholder="To" name="to" maxlength="4" pattern="[0-9]{4}" onblur="onCheck()" value="<%= expto %>">
				<input type="text" placeholder="Designation" name="designation" value="<%= designation %>">
			</div>
			<br><br>
			<div class="awards">
				<h2>Awards</h2>
				<br>
				<input type="text" placeholder="Award" name="award" value="<%= award %>">
				<input type="tel" placeholder="Year" name="awardyear" maxlength="4" pattern="[0-9]{4}" value="<%= awardyear %>">
			</div>
			
			<input type="submit" value="Save Changes" class="btns" id="submit">
			<input type="button" value="Cancel" class="btns" onclick="window.history.back()">
		</form>
	</div>
	<%} %>

</section>

<script>
	$(document).ready(() => {
		$("#photo").change(function () {
			const file = this.files[0];
			if (file) {
				let reader = new FileReader();
				reader.onload = function (event) {
					$("#imgPreview").attr("src", event.target.result);
					};
				reader.readAsDataURL(file);
			}
 			});
 	});
	
	$("input[type=tel]").keypress(function(event) {
		  return /\d/.test(String.fromCharCode(event.keyCode));
		});
	$("input[type=number]").keypress(function(event) {
		  return /\d/.test(String.fromCharCode(event.keyCode));
		});
	$(document).ready(function() {
        $("input[type='radio']").change(function() {
            if ($(this).val() == "paid") {
                $("#price").show();
                $("#price").attr('required', 'true');
            } else {
                $("#price").hide();
            }
        });
    });
	
	$(document).ready(function(){
		$("#submit").on('click', function(){
			if($("#gender").val() == "Select")
				{
					alert("Select Gender");
					$("#submit").attr('disable', 'true');
				}
			else{
				$("#submit").attr('disable', 'false');
			}
		})
	});
	
	$(document).ready(function(){
		$("#toYear").blur(function(){
			if($("#compYear").val() < $("#fromYear").val() && $("#fromYear").val() < $("#toYear").val())
				{
					alert("Experience From Year Should be greater than Year of complitation. Experience From Year Should be less than to Year.");
					$("#submit").css('cursor', 'not-allowed');
				}
			else{}
		})
	});
	
	function myFunction() {
	  	const inpObj = document.getElementById("mobnumber");
	  	if (!inpObj.checkValidity()) {
	   	 	document.getElementById("errMsg").innerHTML = inpObj.validationMessage + " Starts with 6, 7, 8 and 9 ";
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
	
	
	
	
	


</script>




<%@ include file="footer.jsp"%>