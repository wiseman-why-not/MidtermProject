<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Hulu&Hang</title>
		<jsp:include page="topStyle.jsp"></jsp:include>
		<link rel="stylesheet" href="./css/homeStyle.css">
	</head>
	<body id="indexPage">	
		<jsp:include page="header.jsp"></jsp:include>
		<main class="container">
			<section class="login">
				<form action="login.do" method="post">
					<h2>Log in</h2>
					<div class="form-group">
	    				<label for="userName">UserName</label>
	    				<input type="text" name="userName" id="userName" class="form-control">
  					</div>
  					<div class="form-group">
    					<label for="password">Password</label>
    					<input type="password" name="password" id="password" class="form-control">
  					</div>
  					<input type="submit" value="Log In"/>
				</form>
				<a href="create.do">Create User</a>
			</section>
			<canvas></canvas>
			<section>
				<h2>description</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec posuere tellus. Fusce varius urna ante, quis venenatis sapien fringilla non. Nam tempor, eros fermentum finibus sagittis, nibh urna commodo metus, id fermentum purus libero bibendum mi. Nullam nec purus fermentum, molestie lorem id, ornare lorem. Donec aliquet nisl sed sagittis dictum. Donec imperdiet tempor dui. Phasellus non justo a leo commodo vestibulum quis et purus.</p>
			</section>
		</main>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="bottomScript.jsp"></jsp:include>
	</body>
</html>