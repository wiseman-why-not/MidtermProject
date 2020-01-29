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
			<form action="addUser.do" method="POST">
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
	    			<input type="password" name="userPassword" id="password" class="form-control">
  				</div>
				<div class="form-group">
	    			<label for="email">Email</label>
	    			<input type="text" name="email" id="email" class="form-control">
  				</div>
				<div class="form-group">
	    			<label for="phone-number">Phone Number</label>
	    			<input type="number" name="phoneNumber" id="phone-number" class="form-control">
	    			<label for="age">Age</label>
	    			<input type="number" name="age" id="age" class="form-control">
  				</div>
  				<input type="submit" value="Create" />
			</form>
			<a href="/home.do">log in</a>
		</main>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="bottomScript.jsp"></jsp:include>
	</body>
</html>