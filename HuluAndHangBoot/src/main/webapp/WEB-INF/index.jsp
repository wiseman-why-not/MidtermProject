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
			<section style="color:#7ff3bc;">
				<h2 >Welcome to Hulu&Hang!</h2>
				<p style="text-align: center; font-size: 50">
				 <br>
				We are a social networking platform doing things a little differently! <br><br>
				You tell us about your streaming preferences, and we’ll tell you who we think would be a good match for you!<br><br>
				Whether you’re looking to watch and chat, or “Netflix™ and chill”, it’s all much easier with <br><br>
				Hulu&Hang
				</p>
			</section>
		</main>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="bottomScript.jsp"></jsp:include>
	</body>
</html>