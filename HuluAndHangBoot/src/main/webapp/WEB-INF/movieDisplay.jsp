<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Display</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<jsp:include page="topStyle.jsp"></jsp:include>
<link rel="stylesheet" href="./css/movieDisplay.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section class="trailer">
<iframe width="420" height="345" src="https://www.youtube.com/embed/${content.trailerUrl}">
</iframe>
</section>

<section class="movie-image">

<img  width="420" height="345" src="https://image.tmdb.org/t/p/original${content.imageUrl}">

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
<p>Hulu and Hang with:</p>
<c:forEach var="u"   items="${content.getUsers()}">
<h5><a href="userHang.do?id=${u.id}">${u.firstName} ${u.lastName} ${u.email}</a></h5>
</c:forEach>
<form action="movieDislike.do" method="POST">
<input type="hidden" value="${content.id}" name="mid" />
<input type="hidden" value="${user.id}" name="userId" />
<input type="submit" value="Dislike: ${content.title}" />
</form> 
</c:if>
</c:forEach>
<c:if test="${favorite == false}">
<form action="movieLike.do" method="POST">
<input type="hidden" value="${content.id}" name="mid" />
<input type="hidden" value="${user.id}" name="userId" />
<input type="submit" value="Like: ${content.title}" />
</form> 
</c:if>
</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
	<jsp:include page="bottomScript.jsp"></jsp:include>
</body>
</html>