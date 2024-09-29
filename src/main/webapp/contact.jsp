<%@ include file="header.jsp" %>
<link rel="stylesheet" href="contact.css">
	<br>
	<br>
	<br>
	<br>
	<section class="contactus">

		<h1 class="heading">
			contact <span>us</span>
		</h1>

		<div class="box-container">

			<div class="box">
				<h3>Address Line 1#</h3>
				<ul class="quicklinks">
					<li><a
						href="https://www.google.com/maps/place/Stay+Healthy/@28.5838786,77.3582657,17z/data=!3m1!4b1!4m5!3m4!1s0x390ce5995d545f63:0x12f415a95b644ae4!8m2!3d28.5838616!4d77.3604707"><i
							class="fas fa-map-marker-alt"></i> B-14, Block B, Sector 34,
							Noida, Uttar Pradesh 201307</a></li>
					<li><a href="tel: 9326903988"><i class="fas fa-mobile-alt"></i>
							9326903988</a></li>
					<li><a href="tel: 8958537639"><i class="fas fa-mobile-alt"></i>
							8958537639</a></li>
					<li><a href="tel: 8108005226"><i class="fas fa-mobile-alt"></i>
							8108005226</a></li>
					<li><a
						href="https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox?compose=DmwnWrRnXVKPHdVqnbWgvTqGVNwjNBxSnzPnQcFhHMcTbtkJntcxbNxnxSzmpxwdxfXhPjrpZrFq"
						style="text-transform: lowercase;"><i class="fas fa-envelope"></i>
							stayhealthy@gmail.com</a></li>
				</ul>
				<br> <a href="https://www.facebook.com/login/"><i
					class="fab fa-facebook-f"></i></a> <a href="https://www.instagram.com/"><i
					class="fab fa-instagram"></i></a> <a
					href="https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoiZW4ifQ%3D%3D%22%7D"><i
					class="fab fa-twitter"></i></a> <a href="https://www.youtube.com/"><i
					class="fab fa-youtube"></i></a>

			</div>


			<div class="box">

				<h3>Contact with StayHealthy</h3>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad,
					omnis.</p>
				<form class="contactusform" action="ContactUsFormServlet" method="post">
					<input type="text" placeholder="Enter Your Full Name" required name="name">
					<input type="email" placeholder="Enter Your Email " required name="email" style="text-transform: none;">
					<textarea placeholder="Enter Your Message" required maxlength="250" name="message"></textarea>
					<input type="submit" class="btn" value="Send Message">
				</form>


			</div>
		</div>
	</section>




	<%@ include file="footer.jsp" %>