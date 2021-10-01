<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login:myCart</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>

	<%@include file="Components/navbar.jsp"%>


	<div class="container">


		<div class="row ">
			<div class="col-md-6 offset-md-3">

				<div class="card mt-3">

					<div class="card-header blue text-center">
						<h3>Login Here</h3>
					</div>

					<div class="card-body">
					<%@include file="Components/message.jsp" %>
						<form action="Login_Servlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> 
									<input name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input name="password" type="password" class="form-control"
									id="exampleInputPassword1">
							</div>
							<a href="register.jsp" class="text-center d-block mb-3">If
								not Register click here</a>
							<div class="container text-center border-0">
								<button type="submit" class="btn btn-primary">Submit</button>
								<button type="reset" class="btn btn-primary">Reset</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>


</body>
</html>