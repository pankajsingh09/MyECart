<%@page import="com.learn.myEcart.entities.User"%>
<%
User user1 = (User) session.getAttribute("current-user");
%>

<nav class="navbar navbar-expand-lg navbar-dark blue ">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">MyECart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">

			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">



				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="about.jsp">About Us</a></li>

			</ul>

			<ul class="navbar-nav ml-auto mb-2 mb-lg-0">

				<li class="nav-item active"><a class="nav-link " href="#!"
					data-toggle="modal" data-target="#cart"> <i
						class="fa fa-cart-plus" style="font-size: 20px"></i> <span
						class="ml-0 cart-items">(0)</span>
				</a></li>

				<%
				if (user1 == null) {
				%>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="login.jsp">Login</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="register.jsp">Register</a></li>

				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page"
					href="<%=user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>"><%=user1.getUserName()%></a>
				</li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="Logout_Servlet">Logout</a></li>
				<%
				}
				%>

			</ul>
		</div>
	</div>
</nav>