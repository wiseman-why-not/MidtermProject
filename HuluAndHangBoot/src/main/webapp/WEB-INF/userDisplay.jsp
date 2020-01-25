<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<jsp:include page="topStyle.jsp"></jsp:include>
		<link rel="stylesheet" href="./css/userStyle.css">
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<main class="container">
			<section class="user-image">
				<h3>${user.username}</h3>
				<img src="https://media-exp1.licdn.com/dms/image/C4E03AQG97yrPw3MYzw/profile-displayphoto-shrink_800_800/0?e=1585180800&v=beta&t=_hCmt8WlG6r37DZSNR96m9BBpAiXfM3cMwOWRt3uEw0" alt="User Profile pic"/>
			</section>
			<section class="user-meta">
				genre
				<c:forEach var="genre" items="${user.genres}">
					<h3>${genre.name}</h3>
				</c:forEach>
			</section>
			<section class="user-description">
				<c:if test="${empty user.description}">
					<p>add something about yourself</p>
				</c:if>
				<p>${user.description}</p>
			</section>
			<section class="user-movies">
				<c:forEach var="content" items="${user.contents}">
					<div class="content-card">
						<h3>${content.title}</h3>
					</div>
				</c:forEach>
			</section>
		</main>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="bottomScript.jsp"></jsp:include>
	</body>
</html>