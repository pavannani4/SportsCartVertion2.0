<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html >
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>Shopping Cart</title>
		
		<!-- Bootstrap and Font Awesome css -->
		<link href="../resources/css/font-awesome.css" rel="stylesheet">
		<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- Theme stylesheet -->
		<link href="../resources/css/style.default.css" rel="stylesheet"
			id="theme-stylesheet">
		
		<!-- favicon -->
		<link rel="shortcut icon" href="resources/favicon.png">
		
		<!-- owl carousel css -->
		<link href="../resources/css/owl.carousel.css" rel="stylesheet">
		<link href="../resources/css/owl.theme.css" rel="stylesheet">
		
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="table-responsive">
						<h2>Manage Product</h2>
						
						<c:url var="addProduct" value="/product/saveorupdate"></c:url>
						
						<form:form action="${addProduct}" commandName="product" enctype="multipart/form-data">

							<table class="table table-condensed">
								<tr>
									<td colspan="2">Add Directory</td>
								</tr>
								<tr>
									<td><form:label path="id">
										<spring:message text="ProductId" />
										</form:label>
									</td>
									<c:choose>
										<c:when test="${!empty product.id}">
											<td>
												<form:input path="id" readonly="true" />
											</td>
										</c:when>
										<c:otherwise>
											<td>
												<form:input path="id" pattern=".{6,10}" required="true" title="id should contains 6-10 characters." />
											</td>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr>
									<td>
										<form:label path="name">
											<spring:message text="ProductName" />
										</form:label>
									</td>
									<td>
										<form:input path="name" required="true" pattern=".{5,}" title="description is too small." />
									</td>
								</tr>
								<tr>
									<td>
										<form:label path="description">
											<spring:message text="ProductDescription" />
										</form:label>
									</td>
									<td>
										<form:input path="description" required="true" pattern=".{10,}" title="description is too small."/>
									</td>
								</tr>
								<tr>
									<td>
										<form:label path="price">
											<spring:message text="ProductPrice" />
										</form:label>
									</td>
									<td>
										<form:input path="price" required="true" />
									</td>
								</tr>
								<tr>
									<td>
										<form:label path="supplier">
											<spring:message text="Supplier" />
										</form:label>
									</td>
									<td>
										<form:select path="supplier.id" items="${supplierList}" itemValue="id" itemLabel="id" />
									</td>
								</tr>
								<tr>
									<td>
										<form:label path="category">
											<spring:message text="Category" />
										</form:label>
									</td>
									<td>
										<form:select path="category.id" items="${categoryList}" itemValue="id" itemLabel="name" />
									</td>
								</tr>
								<tr>
									<td><form:hidden path="productImage"/></td>
								</tr>
								<tr>
									<td>Choose Image</td>
									<td><input type="file" name="file"/></td>
								</tr>
								
								<tr>
									<td colspan="2">
										<c:if test="${!empty product.name}">
											<input type="submit" class="btn btn-info" value="Edit Product" />
										</c:if> 
										<c:if test="${empty product.name}">
											<input type="submit" class="btn btn-info" value="Add Product" />
										</c:if>
									</td>
								</tr>
							</table>
						</form:form>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-responsive">
						<h2 style="text-align: center;background-color: gold;">Product List</h2>
						<c:if test="${!empty productList}">
							<table class="table table-condensed">
								<tr style="background-color: #e6e6ff;">
									<th width="80">Product ID</th>
									<th width="120">Product Name</th>
									<th width="120">Product Description</th>
									<th width="80">Product Price</th>
									<th width="80">Product Category</th>
									<th width="80">Product Supplier</th>
									<th width="60">Image</th>
									<th width="60">Edit</th>
									<th width="60">Delete</th>
								</tr>
								<c:forEach items="${productList}" var="product">
									<tr>
										<td>${product.id}</td>
										<td>${product.name}</td>
										<td>${product.description}</td>
										<td>${product.price}</td>
										<td>${product.category.name}</td>
										<td>${product.supplier.name}</td>
										<td><img src="${pageContext.request.contextPath}/${product.productImage}" style="width : 60px"/></td>
										<td>
											<a href="<c:url value='product/edit/${product.id}'/>" class="btn btn-info" role="button">Edit</a>
										</td>
										<td>
											<a href="<c:url value='product/delete/${product.id}'/>" class="btn btn-danger" role="button"><span
											class="fa fa-remove"></span>  Delete</a>
										</td>
									</tr>
								</c:forEach>
							</table>
						</c:if>
					</div>
				</div>
			</div>
		</div>
				
		
			
		<!--  JAVASCRIPT FILES  -->
		<script src="../resources/js/jquery-1.11.0.min.js"></script>
		<script src="../resources/js/bootstrap.min.js"></script>
		<script src="../resources/js/jquery.cookie.js"></script>
		<script src="../resources/js/front.js"></script>
	</body>
</html>