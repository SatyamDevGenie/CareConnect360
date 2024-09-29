<%@ include file="header.jsp" %>
<link rel="stylesheet" href="login.css">
	<br>
	<br>
	<br>
	<br>


	<section class="services">

		<h1 class="heading">
			Log<span>in</span>
		</h1>

		<div class="box-container">

			<div class="box">
				<form action="LoginServlet" method="post">
					<p><input id="doc" type="radio" name="logintype" value="Doctor" required><label for="doc">Doctor</label>
					<input id="pat" type="radio" value="Patient" name="logintype" required><label for="pat">Patient</label></p><br><br>	
					<input type="text" name="username" id="username" placeholder="Username" required><br><br>
					<input type="password" name="password" id="password" placeholder="Password" required><br><br>
					<input type="checkbox" id="rememberme" value="RememberMe" style="width: 30px;"><label for="rememberme">Remember Me?</label>
					<a class="link" onclick="forgetPassword()">Forget Password</a>
					<input class="btn-2" type="submit" value="Login" onclick="RememberMe()">
					<input class="btn-2" type="button" value="Cancel" onclick="history.back()"><br><br>
					<a class="link" onclick="run()">Don't have an account? SignUp</a>
				</form>
			</div>
		</div>
	</section>
	
	
	<%@ include file="footer.jsp" %>

	<script type="text/javascript">
		function run(){
		    if(document.getElementById("doc").checked){
		        window.location="doctorregister.jsp";
		    }
		    else if(document.getElementById("pat").checked){
		        window.location="patientregister.jsp";
		    }
		    else{
		          alert("Select User type");
		    }
		}
		
		function forgetPassword(){
		    if(document.getElementById("doc").checked){
		        window.location="changedoctorpassword.jsp";
		    }
		    else if(document.getElementById("pat").checked){
		        window.location="changepatientpassword.jsp";
		    }
		    else{
		          alert("Select User type");
		    }
		}
		
		
		
		const rmCheck = document.getElementById("rememberme"),
	    UserName = document.getElementById("username");
		Password = document.getElementById("password")

	if (localStorage.checkbox && localStorage.checkbox !== "") {
	  rmCheck.setAttribute("checked", "checked");
	  UserName.value = localStorage.username;
	  Password.value = localStorage.password;
	} else {
	  rmCheck.removeAttribute("checked");
	  UserName.value = "";
	  Password.value = "";
	}

	function RememberMe() {
	  if (rmCheck.checked && UserName.value !== "") {
	    localStorage.username = UserName.value;
	    localStorage.password = Password.value;
	    localStorage.checkbox = rmCheck.value;
	  } else {
	    localStorage.username = "";
	    localStorage.password = "";
	    localStorage.checkbox = "";
	  }
	}
	    
	</script>
</body>
</html>