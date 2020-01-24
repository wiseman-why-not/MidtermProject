<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<jsp:include page="topStyle.jsp"></jsp:include>
		<link rel="stylesheet" href="./css/createStyle.css">
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<main class="container">
			<form>
				<h2>Create User</h2>
				<div class="form-group">
	    			<label for="first-name">First Name</label>
	    			<input type="text" name="firstName" id="first-name" class="form-control">
  				</div>
				<div class="form-group">
	    			<label for="last-name">Last Name</label>
	    			<input type="text" name="lastName" id="last-name" class="form-control">
  				</div>
				<div class="form-group">
	    			<label for="username">userName</label>
	    			<input type="text" name="username" id="username" class="form-control">
  				</div>
				<div class="form-group">
	    			<label for="password">Password</label>
	    			<input type="text" name="password" id="password" class="form-control">
  				</div>
				<div class="form-group">
	    			<label for="email">Email</label>
	    			<input type="text" name="email" id="email" class="form-control">
  				</div>
				<div class="form-group">
	    			<label for="phone-number">Phone Number</label>
	    			<input type="text" name="phoneNumber" id="phone-number" class="form-control">
  				</div>
			</form>
		</main>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="bottomScript.jsp"></jsp:include>
	</body>
</html>