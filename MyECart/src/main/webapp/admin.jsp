<%@page import="java.util.Map"%>
<%@page import="com.learn.myEcart.helper.Helper"%>
<%@page import="com.learn.myEcart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myEcart.helper.FactoryProvider"%>
<%@page import="com.learn.myEcart.Dao.CategoryDao"%>
<%@page import="com.learn.myEcart.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "you are not logged in !! Login First.");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "you are not Admin !! Do not access this page.");
		response.sendRedirect("login.jsp");
		return;
	}

}
%>

<% 
			CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
			List<Category> list =cdao.getCategories();
			
		Map<String,Long> m=Helper.getCount(FactoryProvider.getFactory());
			
			
			%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Admin Panel</title>
<meta charset="ISO-8859-1">
<%@include file="Components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="Components/navbar.jsp"%>


	<div class="container admin">


		<div class="container-fluid mt-3">
			<%@include file="Components/message.jsp"%>
		</div>


		<div class="row mt-3">

			<!-- First col -->
			<div class="col-md-4">

				<div class="card">

					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/team.png">
						</div>
						<h1><%=m.get("userCount") %></h1>
						<h1 class="text-uppercase text-muted">User</h1>
					</div>

				</div>

			</div>

			<!-- Second col -->
			<div class="col-md-4">
				<div class="card">

					<div class="card-body  text-center">
						<div class="container">
							<img style="max-width: 100px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/options.png">
						</div>
						<h1><%= list.size() %></h1>
						<h1 class="text-uppercase text-muted">Category</h1>
					</div>

				</div>

			</div>

			<!-- Third Col -->
			<div class="col-md-4">
				<div class="card">

					<div class="card-body  text-center">
						<div class="container">
							<img style="max-width: 100px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/delivery.png">
						</div>
						<h1><%=m.get("productCount") %></h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>

				</div>

			</div>
		</div>


		<!-- Second row -->
		<div class="row mt-3">

			<!-- Row2 col1 -->

			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">

					<div class="card-body  text-center">
						<div class="container">
							<img style="max-width: 100px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/add-file.png">
						</div>
						<p>Click here to add categories</p>
						<h1 class="text-uppercase text-muted">Add Categories</h1>
					</div>

				</div>

			</div>

			<!-- Row2 col2 -->

			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-product-modal">

					<div class="card-body  text-center">
						<div class="container">
							<img style="max-width: 100px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/buy.png">
						</div>
						<p>Click here to add products</p>
						<h1 class="text-uppercase text-muted">Add Products</h1>
					</div>

				</div>

			</div>


		</div>

	</div>


	<!-- Add Category Model Start-->

	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header blue text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Category
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperation_Servlet" method="post">
						<input type="hidden" name="operation" value="AddCategory">
						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter Category title" required />
						</div>
						<div class="form-group">
							<textarea style="height: 150px;" class="form-control"
								name="catDescription" placeholder="Enter Category Description"
								required></textarea>
						</div>
						
						<!-- Product file -->
			
			<div class="form-group">
			<label>Select Picture</label>
			<br>
			<input type="file" id="pPic" name="pPic" required />
			
			</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- Add Category Model Ends-->
	
	<!-- ----------------------------------------------------------------------------- -->

	<!--  Add Product Model Starts-->

	

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
		<!-- form -->
				
				<form action="ProductOperation_Servlet" method="post" enctype="multipart/form-data">
				
				<input type="hidden" name="operation" value="AddProduct"/>
				
		<!-- Product Title -->
				
				<div class="form-group">
				
				<input type="text" class="form-control" placeholder="Enter Product Title" name="pTitle" required />
				
				</div>
		<!-- Product description -->
				
				<div class="form-group">
				
				<textarea style="height:150px " class="form-control" placeholder="Enter Product Description " name="pDesc"></textarea>
				
				</div>
				
		<!-- Product Price -->
			
				
				<div class="form-group">
				
				<input type="number" class="form-control" placeholder="Enter Product Price" name="pPrice" required />
				
				</div>
		<!-- Product Discount -->
			
				
				<div class="form-group">
				
				<input type="number" class="form-control" placeholder="Enter Product Discount" name="pDiscount" required />
				
				</div>
		
		<!-- Product Quantity -->
			
				
				<div class="form-group">
				
				<input type="number" class="form-control" placeholder="Enter Product Quantity" name="pQuantity" required />
				
				</div>
				
		<!-- Product Category -->
			
			
			
				
				<div class="form-group">
				<select name="catId" class="form-control" id="">
				<%
				for(Category c:list){
				%>
				
				<option value="<%=c.getCategoryId() %>"><%= c.getCategoryTitle() %> </option>
				
				<% } %>
				</select>				
				
				</div>		
				
			<!-- Product file -->
			
			<div class="form-group">
			<label>Select Picture of Product</label>
			<br>
			<input type="file" id="pPic" name="pPic" required />
			
			</div>
			
			<!-- Submit Button -->
				<div class="container text-center">
					
					<button class="btn btn-outline-success">Add Product</button>
				
				</div>
				
				</form>
						
				
				<!-- End form -->
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
			
				</div>
			</div>
		</div>
	</div>

	<!--  Add Product Model Ends-->

<%@ include file="Components/common_modals.jsp" %>


</body>
</html>