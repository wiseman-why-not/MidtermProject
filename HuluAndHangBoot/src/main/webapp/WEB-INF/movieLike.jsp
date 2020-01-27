<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Like</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<h4>Title: ${content.title}</h4><br>
<h4>Welcome ${userName}</h4><br>

<form action="returnUserDisplay.do" method="GET">
<input type="submit" value="Home Page" />
</form>

<form action="returnMovieList.do" method="GET">
<input type="submit" value="Movie List Page" />
</form>

<iframe width="420" height="345" src="https://www.youtube.com/embed/${content.trailerUrl}">
</iframe>
<c:if test="${not empty users}">
<h5> These members have marked ${content.title} as a favorite</h5>
<c:forEach var="u" items="${users}">
<p>${u.firstName} ${u.lastName} ${u.email}</p>
 </c:forEach>
 </c:if>  
</body>
</html>