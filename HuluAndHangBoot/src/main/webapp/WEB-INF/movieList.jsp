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

				<a href="movie.do" class="allContent">All Movies</a>

				<form action="filterByGenre.do" method="get" name="filterMoviesForm">

				<input list="genres" name="genreName" placeholder="Genre">
				<datalist id="genres">
					<c:forEach var="genre" items="${genres}">
						<option value="${genre.name}">
					</c:forEach>
				</datalist>
				<button type="submit">Filter by Genre</button>

					<select name="genreName">
						<c:forEach var="genre" items="${genres }">
							<option value="${genre.name }">${genre.name }</option>
						</c:forEach>
					</select>
					<button type="submit">Filter by Genre</button>

				</form>

				<form action="byKeyword.do" method="post">
					<input type="text" name="keyword" placeholder="Title">
					<button type="submit">Search</button>
				</form>
			</div>
		</section>
		<br>
		<!-- display the list of movies -->
		<c:if test="${! empty contents }">
			<section class="user-movies">
				<c:forEach var="content" items="${contents}">
					<div class="content-card">
						<img class="content-image"
							src="https://image.tmdb.org/t/p/original${content.imageUrl}"
							alt="${content.title}" />

						<article class="content-details">
							<h2 class="contentTitle">
								<a href="movieDisplay.do?title=${content.title }">${content.title}</a>
							</h2>
							<p>${content.description}</p>
						</article>
					</div>
				</c:forEach>
			</section>
		</c:if>
		<c:if test="${empty contents }">
			<div>
				<h2 class="nothingFound">Nothing Found</h2>
			</div>
		</c:if>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<jsp:include page="bottomScript.jsp"></jsp:include>

</body>
</html>