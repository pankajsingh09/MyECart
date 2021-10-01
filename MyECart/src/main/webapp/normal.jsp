
<%@page import="com.learn.myEcart.helper.FactoryProvider"%>

<%@page import="com.learn.myEcart.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "you are not logged in !! Login First.");
	response.sendRedirect("login.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Normal Panel</title>
<%@include file="Components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="Components/navbar.jsp"%>
	<div class="container mt-3">
		<div class="card">
			<div class="card-body text-center">

				<h1>My Details</h1>
				<table class="table table-hover table-dark">

					<div class="container">
					<% if(user1.getUserGender().equals("Male")) { %>
					
						<img style="max-width: 200px" class="img-fluid rounded-circle"
							alt="user_icon" src="img/male.jpg">
							<%} 
							else {%>
							
					
					
						<img style="max-width: 200px" class="img-fluid rounded-circle"
							alt="user_icon" src="img/female.png">		
							<%} %>
					</div>


					<tbody style="font-size: 30px;">
						<tr>
							<th scope="row">1</th>
							<td>Name</td>
							<td><%=user1.getUserName()%></td>


						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Email</td>
							<td><%=user1.getUserEmail()%></td>

						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Mobile No</td>
							<td><%=user1.getUserPhone()%></td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>Address</td>
							<td><%=user1.getUserAddress()%></td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>Gender</td>
							<td><%=user1.getUserGender()%></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<%@ include file="Components/common_modals.jsp"%>
</body>
</html>
>
