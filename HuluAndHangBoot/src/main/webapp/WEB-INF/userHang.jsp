<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User Hang</title>
		<jsp:include page="topStyle.jsp"/>
		<link rel="stylesheet" href="./css/hangStyle.css">
		<script src="./js/copyEmail.js"></script>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<main class="container">
			<section class="user-image">
				<h3>${user.username}</h3>
				<img src="${user.imageURL}" alt="User Profile pic"/>
			</section>
			<section class="user-meta">
				<article>
					<p class = "userHangName">${user.firstName} ${user.lastName}</p>
					<div class = "emailButton">
						<p>${user.email}</p>
						<input class="emailInput" type="text" value="${user.email}" id="email">
						<button class="btn btn-primary" onclick="userEmail()">Copy Email</button>
					</div>
					<c:if test="${empty user.genres}">
						<p>genres is empty</p>					
					</c:if>
					<c:forEach var="genre" items="${user.genres}">
						<p>${genre.name}</p>
					</c:forEach>
				</article>
			</section>
			
			<!-- user description -->
			<section class="user-description">
				<div class="description-section">
					<c:if test="${empty user.description}">
						<p class="description">The user description is empty</p>					
					</c:if>
					<c:if test="${!empty user.description}">
						<p class="description">${user.description}</p>
					</c:if>
				</div>
			</section>
			<!-- list of the movies  -->
			<section class="user-movies">
				<c:forEach var="content" items="${user.contents}">
					<a href="movieDisplay.do?title=${content.title}">
						<div class="content-card">
							<img class="content-image" src="${content.imageUrl}" alt="${content.title}" />
							<article class="content-details">
								<h3>${content.title}</h3>
								<p>${content.description}</p>
							</article>
						</div>
					</a>
				</c:forEach>
			</section>
			
		</main>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="bottomScript.jsp"></jsp:include>
	</body>
</html>