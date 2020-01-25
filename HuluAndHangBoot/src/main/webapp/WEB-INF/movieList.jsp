<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie List</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>

<c:forEach var="m" items="${contents}">
<h4>Title: ${m.title}</h4><br>
<p>${m.description}</p><br>
<h4>Release Date: ${m.releaseDate}</h4><br>
<img src= "https://image.tmdb.org/t/p/original${m.imageUrl}" height = 10% width= 10%>
<br>
</c:forEach>


</body>
</html>