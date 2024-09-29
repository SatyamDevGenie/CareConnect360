<%@ include file="header.jsp"%>
<link rel="stylesheet" href="changepassword.css">
<link rel="stylesheet" href="login.css">
<br>
<br>
<br>
<br>
<section class="services">

	<h1 class="heading">
		Change <span>Password</span>
	</h1>

	<div class="box-container">

		<div class="box">
			<form action="ChangePatPasswordServlet" method="post">
				<input type="text" name="username" id="username" placeholder="Username" onblur="checkUsername()" required><br>
				<span id="errMsg"></span><br> 
				<input type="password" name="newpassword" id="newpassword" placeholder="New Password" required><br><br> 
				<input type="password" name="confirmpassword" id="confirmpassword" placeholder="Confirm Password" required onblur="checkPass()"><br><br> 
				<input class="btn-2" id="submit" type="submit" value="Change Password"> 
				<input class="btn-2" type="button" value="Cancel" onclick="history.back()">
				<br>
				<br>
			</form>
		</div>
	</div>
</section>

<%@ include file="footer.jsp"%>

<script type="text/javascript">
function checkUsername(){
    var request=new XMLHttpRequest();  
    var Username=document.getElementById("username").value;  
    var url="CheckPatientUsername.jsp?val="+Username;  
  
try{  
    request.onreadystatechange=function(){  
    if(request.readyState==4 && request.status==200){  
    var val=request.responseText;
if(val==1)
{
    document.getElementById("username").style.border='2px solid green';
    document.getElementById('errMsg').innerHTML="";
    document.getElementById('errMsg').style.color='red';
    document.getElementById("submit").disabled=false;
    document.getElementById("submit").style.cursor='pointer';
}
else
{
    document.getElementById("username").style.border='2px solid red';
    document.getElementById('errMsg').innerHTML="Username not available.<br>";
    document.getElementById('errMsg').style.color='red';
    document.getElementById("submit").disabled=true;
    document.getElementById("submit").style.cursor='not-allowed';
}
}  
}//end of function  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}
	

	
</script>
</body>
</html>




