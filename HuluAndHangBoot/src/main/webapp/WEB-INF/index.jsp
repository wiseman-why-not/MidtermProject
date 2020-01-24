<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Hulu&Hang</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="stylesheet" href="./css/main.css">
		<link rel="stylesheet" href="./css/homeStyle.css">
	</head>
	<body id="indexPage">	
		<header>
			<h1>Hulu&Hang</h1>
				<nav>
					<a href="home.do">Home</a>
					<a href="movie.do">Movie</a>
					<a href="genre.do">Genre</a>
				</nav>
		</header>
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
			</section>
			<canvas></canvas>
			<section>
				<h2>description</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec posuere tellus. Fusce varius urna ante, quis venenatis sapien fringilla non. Nam tempor, eros fermentum finibus sagittis, nibh urna commodo metus, id fermentum purus libero bibendum mi. Nullam nec purus fermentum, molestie lorem id, ornare lorem. Donec aliquet nisl sed sagittis dictum. Donec imperdiet tempor dui. Phasellus non justo a leo commodo vestibulum quis et purus.</p>
			</section>
		</main>
		<footer>
		
		</footer>
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>