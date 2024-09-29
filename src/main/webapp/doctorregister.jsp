<%@ include file="header.jsp" %>
<link rel="stylesheet" href="register.css">
	<br>
	<br>
	<br>
	<br>


	<section class="signup">

		<h1 class="heading">
			Doctor <span>Signup</span>
		</h1>

		<div class="box-container">

			<div class="box">
				<form action="DoctorRegisterServlet" method="post">
					<input type="text" placeholder="Full Name" name="name" required>
					<br><br>
					<input type="text" placeholder="Username" id="usrname" name="username" onblur="checkUsername()" required>
					<br>
					<span id="errMsg"></span>
					<br>
					<input type="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" id="psw" name="password" required>
					<br><br>
					<input type="checkbox" style="width: 30px;" id="Show_Password" onclick="myFunction()"><label for="Show_Password">Show Password</label>
					<br>
					<div id="message">
					  	<h5>Password must contain the following:</h5>
  						<p id="letter" class="invalid">A <b>lowercase</b> letter</p>
  						<p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
  						<p id="number" class="invalid">A <b>number</b></p>
  						<p id="length" class="invalid">Minimum <b>8 characters</b></p>
					</div>
					<br>
					
					<input type="password" placeholder="Confirm Password" name="confirmpassword" id="cpsw" onblur="checkPass()" required>
					<br><br>
					<input type="email" placeholder="Email" name="email" required style="text-transform: none;">
					<br><br>
					<input type="tel" id="mobnumber" placeholder="Enter your Number" name="mobilenumber" maxlength="10" required pattern="[6-9]{1}[0-9]{9}" onblur="myFunction2()" >
					<span id="errMsg2"></span>
					<input class="btn-2" type="submit" id="submit" value="Sign Up">
					<input class="btn-2" type="button" value="Cancel" onclick="history.back()">
					<br><br> 
					<a class="link" href="login.jsp">Already have an account? SignIn</a>
				</form>
			</div>
		</div>
	</section>




<%@ include file="footer.jsp" %>



	<script type="text/javascript">		
		var myInput = document.getElementById("psw");
		var letter = document.getElementById("letter");
		var capital = document.getElementById("capital");
		var number = document.getElementById("number");
		var length = document.getElementById("length");


		myInput.onfocus = function() {
		  document.getElementById("message").style.display = "block";
		}

		myInput.onblur = function() {
		  document.getElementById("message").style.display = "none";
		}


		myInput.onkeyup = function() {
		 
		  var lowerCaseLetters = /[a-z]/g;
		  if(myInput.value.match(lowerCaseLetters)) {  
		    letter.classList.remove("invalid");
		    letter.classList.add("valid");
		  } else {
		    letter.classList.remove("valid");
		    letter.classList.add("invalid");
		  }
		  
		  
		  var upperCaseLetters = /[A-Z]/g;
		  if(myInput.value.match(upperCaseLetters)) {  
		    capital.classList.remove("invalid");
		    capital.classList.add("valid");
		  } else {
		    capital.classList.remove("valid");
		    capital.classList.add("invalid");
		  }

		  
		  var numbers = /[0-9]/g;
		  if(myInput.value.match(numbers)) {  
		    number.classList.remove("invalid");
		    number.classList.add("valid");
		  } else {
		    number.classList.remove("valid");
		    number.classList.add("invalid");
		  }
		  
		  
		  if(myInput.value.length >= 8) {
		    length.classList.remove("invalid");
		    length.classList.add("valid");
		  } else {
		    length.classList.remove("valid");
		    length.classList.add("invalid");
		  }
		}

		function checkPass() {
		    var pass=document.getElementById("psw").value;
		    var cpass=document.getElementById("cpsw").value;
		    if(pass!=cpass)
		    {
		        document.getElementById("cpsw").style.border='2px solid red';
		        document.getElementById("submit").disabled=true;
		        document.getElementById("submit").style.cursor='not-allowed';
		    }
		    else
		    {
		        document.getElementById("cpsw").style.border='2px solid green';
		        document.getElementById("submit").disabled=false;
		        document.getElementById("submit").style.cursor='pointer';
		    }
		    
		}

		function myFunction() {
		  var x = document.getElementById("psw");
		  if (x.type === "password") {
		    x.type = "text";
		  } else {
		    x.type = "password";
		  }
		}
		function checkUsername(){     
		    var request=new XMLHttpRequest();  
		    var Username=document.getElementById("usrname").value;  
		    var url="CheckDoctorUsername.jsp?val="+Username;  
		  
		try{  
		    request.onreadystatechange=function(){  
		    if(request.readyState==4 && request.status==200){  
		    var val=request.responseText;
		if(val==1)
		{
		    document.getElementById("usrname").style.border='2px solid red';
		    document.getElementById('errMsg').innerHTML="Username already exists.<br>";
		    document.getElementById('errMsg').style.color='red';
		    document.getElementById("submit").disabled=true;
		    document.getElementById("submit").style.cursor='not-allowed';
		}
		else
		{
		    document.getElementById("usrname").style.border='2px solid green';
		    document.getElementById('errMsg').innerHTML="Username available.<br>";
		    document.getElementById('errMsg').style.color='green';
		    document.getElementById("submit").disabled=false;
		    document.getElementById("submit").style.cursor='pointer';
		}
		}  
		}//end of function  
		request.open("GET",url,true);  
		request.send();  
		}catch(e){alert("Unable to connect to server");}  
		}
		function myFunction2() {
		  	const inpObj = document.getElementById("mobnumber");
		  	if (!inpObj.checkValidity()) {
		   	 	document.getElementById("errMsg2").innerHTML = inpObj.validationMessage + " Starts with 6, 7, 8 and 9. <br> ";
		   	 	document.getElementById("errMsg2").style.color='red';
		   	 	document.getElementById("mobnumber").style.border='2px solid red';
		   	 	document.getElementById("submit").style.cursor='not-allowed';
		   	 	document.getElementById("submit").disabled=true;
		  	} 
		  	else {
		  		document.getElementById("errMsg2").innerHTML = inpObj.validationMessage;
		  		document.getElementById("mobnumber").style.border='2px solid grey';
		  		document.getElementById("submit").disabled=false;
		  		document.getElementById("submit").style.cursor='pointer';
		  	}
			}
	</script>