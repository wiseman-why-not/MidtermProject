<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User Hang</title>
		<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
		<jsp:include page="topStyle.jsp"></jsp:include>
		
		<link rel="stylesheet" href="./css/userStyle.css">
		<script src="./js/copyEmail.js"></script>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<main class="container">
		
			<section class="user-image">
				<h3>${user.username}</h3>
				<img src="https://media-exp1.licdn.com/dms/image/C4E03AQG97yrPw3MYzw/profile-displayphoto-shrink_800_800/0?e=1585180800&v=beta&t=_hCmt8WlG6r37DZSNR96m9BBpAiXfM3cMwOWRt3uEw0" alt="User Profile pic"/>
			</section>
			<section class="user-meta">
			<div class = "userHangName">${user.firstName} ${user.lastName}</div>
			<div class = "emailButton">
			<input class = "emailInput" type="text" value="${user.email}" id="email">

			<button class="btn btn-primary" onclick="userEmail()">Copy Email</button>
			</div>
			
			<c:if test="${empty user.genres}">
						<p>genres is empty</p>					
					</c:if>
				<c:forEach var="genre" items="${user.genres}">
							<p>${genre.name}</p>
				</c:forEach>
			</section>
			
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
			
			<section class="user-movies">
				<c:forEach var="content" items="${user.contents}">
					<div class="content-card">
						<img class="content-image" src="https://image.tmdb.org/t/p/original${content.imageUrl}" alt="${content.title}" />
						<article class="content-details">
							<h3>${content.title}</h3>
							<p>${content.description}</p>
						</article>
					</div>
				</c:forEach>
			</section>
			
		</main>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="bottomScript.jsp"></jsp:include>
		<script>
			let descSec = document.querySelector(".description-section");
			let edit = document.querySelector(".edit-description-section");
			let desc = document.querySelector(".description");
			let textArea = document.querySelector("textarea");
			document.querySelector(".edit-description").addEventListener("click", () => {
				descSec.style.display = "none";
				edit.style.display = "block";
				textArea.focus();
				textArea.value = desc.innerText;
			});
			
			textArea.addEventListener("keyup", (e) => {
				console.log(e);
				e.target.value = e.target.value.replace(/[\r\n\v]+/g, '');
			});
			document.querySelector(".submit-description").addEventListener("click", () => {
				document.querySelector(".description-from").submit();
			});
			document.querySelector(".delete").addEventListener("click", () => {
				document.querySelector(".remove-film-form").submit();
			});
		</script>
	</body>
</html>