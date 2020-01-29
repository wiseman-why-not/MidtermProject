<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Movie Display</title>
		<jsp:include page="topStyle.jsp"></jsp:include>
		<link rel="stylesheet" href="./css/movieDisplay.css">
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<main class="container-fluid">
			<section class="movie-detail">
				<iframe class="trailer" src="https://www.youtube.com/embed/${content.trailerUrl}"></iframe>
				<img class="movie-image" src="${content.imageUrl}" />
				<article class="movie-text">
					<h2>${content.title}</h2>
					<p> ${content.description}</p>
				</article>
				<div class="toggle-favorite-button">
					<c:if test="${user.contents.contains(content)}">
						<a class="dislike" href="movieDislike.do?userId=${user.id}&mid=${content.id}">Dislike</a>
					</c:if>
					<c:if test="${!user.contents.contains(content)}">
						<a class="like" href="movieLike.do?userId=${user.id}&mid=${content.id}">like</a>
					</c:if>
				</div>
			</section>
			<c:if test="${user.contents.contains(content)}">
				<section class="container match">
					<h3>Matches</h3>
					<c:forEach var="user" items="${content.users}">
						<a class="user-card" href="userHang.do?id=${user.id}">
								 <h5>${user.username}</h5>
								 <img class = "user-image" src="https://media-exp1.licdn.com/dms/image/C4E03AQG97yrPw3MYzw/profile-displayphoto-shrink_800_800/0?e=1585785600&v=beta&t=1Y3F6xHiDvnfEhiGeCC1ByY6Aj-srmKhDe4DqB4fMJQ" alt="User Profile pic" />
						</a>
					</c:forEach>
				</section>
			</c:if>
		</main>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="bottomScript.jsp"></jsp:include>
	</body>
</html>