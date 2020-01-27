<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie List</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<jsp:include page="topStyle.jsp"></jsp:include>
<link rel="stylesheet" href="./css/movieList.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<main>
		<section>
			<div>
				<form  id="filterMoviesForm">
				<button type="submit" form="filterMoviesForm" 
						formaction="movie.do" formmethod="get">All Movies</button>
				<input list="genres">
				<datalist id="genres">
					<option value="Action">
					<option value="Adventure">
					<option value="Animation">
					<option value="Comedy">
					<option value="Crime">
					<option value="Documentary">
					<option value="Drama">
					<option value="Family">
					<option value="Fantasy">
					<option value="History">
					<option value="Horror">
					<option value="Music">
					<option value="Mystery">
					<option value="Romance">
					<option value="Science Fiction">
					<option value="TV Movie">
					<option value="Thriller">
					<option value="War">
					<option value="Western">
				</datalist>
				<button type="submit" form="filterMoviesForm" 
					formaction="filterByGenre.do" formmethod="get">Filter by Genre</button>
				</form>
			</div>
		</section>
		<br>
	<!-- display the list of movies -->
		<section class="user-movies">
			<c:forEach var="content" items="${contents}">
				<div class="content-card">
					<img class="content-image"
						src="https://image.tmdb.org/t/p/original${content.imageUrl}"
						alt="${content.title}" />
					 
					<article class="content-details">
						<h3><a href="movieDisplay.do?title=${content.title }">${content.title}</a></h3>
						<p>${content.description}</p>
					</article>
				</div>
			</c:forEach>
			</section>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<jsp:include page="bottomScript.jsp"></jsp:include>

</body>
</html>