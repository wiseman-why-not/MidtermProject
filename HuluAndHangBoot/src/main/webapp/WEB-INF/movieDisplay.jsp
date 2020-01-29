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
		<main>
			<section class="trailer">
			<iframe width="420" height="345" src="https://www.youtube.com/embed/${content.trailerUrl}">
			</iframe>
			</section>
			
			<section class="movie-image">
			
			<img  width="420" height="345" src="${content.imageUrl}">
			
			</section>
			
			<section class = "movie-desc">
			<div class = "movie-text"> ${content.description}</div>
			</section>
			
			<section class = "user-list">
			<div class = "user-text"> 
			<c:set var="favorite" value= "false" />
			<c:forEach var="u"   items="${content.getUsers()}">
			<c:if test="${user.id == u.id}">
			<c:set var="favorite" value= "true" />
			<h3 class = "hangWith">Hulu & Hang with:</h3>
			<c:forEach var="u"   items="${content.getUsers()}">
			
			<div class="grid-container">
  <div class="item1"><h5><a class = "atag" href="userHang.do?id=${u.id}">${u.username}</a></h5></div>
  <div class="item2"><img class = "userImage" src="https://media-exp1.licdn.com/dms/image/C4E03AQG97yrPw3MYzw/profile-displayphoto-shrink_800_800/0?e=1585180800&v=beta&t=_hCmt8WlG6r37DZSNR96m9BBpAiXfM3cMwOWRt3uEw0" alt="User Profile pic" /></div>
</div>
<br>
					
			</c:forEach>
			<nav class = like-dislike>
			<h5><a href="movieDislike.do?userId=${user.id}&mid=${content.id}">Dislike: ${content.title}</a></h5> 
			</nav>
			</c:if>
			</c:forEach>
			<c:if test="${favorite == false}">
			<nav class = like-dislike>
			<h5><a href="movieLike.do?userId=${user.id}&mid=${content.id}">Dislike: ${content.title}</a></h5> 
			</nav> 
			</c:if>
			</div>
			</section>
		</main>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="bottomScript.jsp"></jsp:include>
	</body>
</html>