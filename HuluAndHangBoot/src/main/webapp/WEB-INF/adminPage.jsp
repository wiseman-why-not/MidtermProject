<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hulu&Hang</title>
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<jsp:include page="topStyle.jsp"></jsp:include>
<link rel="stylesheet" href="./css/userStyle.css">
<link rel="stylesheet" href="./css/adminPage.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<main class="container">
	<c:if test="${user.adminPrivleges }">
	
	<section class="user-image">
	<h3>${user.username}</h3>
	<img src="https://media-exp1.licdn.com/dms/image/C4E03AQG97yrPw3MYzw/profile-displayphoto-shrink_800_800/0?e=1585180800&v=beta&t=_hCmt8WlG6r37DZSNR96m9BBpAiXfM3cMwOWRt3uEw0" alt="User Profile pic"/>
	</section>
	
<!-- 	A list of all genres -->

<section class="user-meta">
				<c:forEach var="genre" items="${genres}">
					<c:if test="${user.genres.contains(genre)}">
						<div>
							<form class="genre-form" action="removeGenre.do" method="POST">
								<input type="hidden" value="${genre.id}" name="genreId" />
								<button>
									<svg xmlns="http://www.w3.org/2000/svg" height="417pt" viewBox="0 -46 417.81333 417" width="417pt">
										<path d="m159.988281 318.582031c-3.988281 4.011719-9.429687 6.25-15.082031 6.25s-11.09375-2.238281-15.082031-6.25l-120.449219-120.46875c-12.5-12.5-12.5-32.769531 0-45.246093l15.082031-15.085938c12.503907-12.5 32.75-12.5 45.25 0l75.199219 75.203125 203.199219-203.203125c12.503906-12.5 32.769531-12.5 45.25 0l15.082031 15.085938c12.5 12.5 12.5 32.765624 0 45.246093zm0 0"/>
									</svg>
								</button>
								<input type="hidden" value="${genre.id}" name="genreId" />
							</form>
							<p>${genre.name}</p>
						</div>
					</c:if>
					<c:if test="${!user.genres.contains(genre)}">
						<div>
							<form class="genre-form" action="addGenre.do" method="POST">
								<input type="hidden" value="${genre.id}" name="genreId" />
								<button></button>
							</form>
							<p>${genre.name}</p>
						</div>
					</c:if>
				</c:forEach>
			</section>
	
<!-- 	A list of all users -->

	<section class="user-movies">
				<c:forEach var="user" items="${users}">
					<div class="content-card">
						<img class="content-image" src=""https://media-exp1.licdn.com/dms/image/C4E03AQG97yrPw3MYzw/profile-displayphoto-shrink_800_800/0?e=1585180800&v=beta&t=_hCmt8WlG6r37DZSNR96m9BBpAiXfM3cMwOWRt3uEw0" alt="${content.title}" />
						<article class="content-details">
							<h3>${user.firstName + " " + user.lastName} </h3>
							<p>Account: ${user.isActive}</p>
						</article>
					</div>
				</c:forEach>
			</section>
	
<!-- 	A list of all movies -->
	<section class="user-movies">
				<c:forEach var="content" items="${contents}">
					<div class="content-card">
						<img class="content-image" src="https://image.tmdb.org/t/p/original${content.imageUrl}" alt="${content.title}" />
						<article class="content-details">
							<h3>${content.title}</h3>
							<p>${content.description}</p>
						</article>
						<form class="remove-film-form" action="deleteFilmFromHome.do" method="POST">
							<input type="hidden" name="filmId" value="${content.id}"/>
							<svg class="delete" xmlns="http://www.w3.org/2000/svg" height="365pt" viewBox="0 0 365.71733 365" width="365pt">
								<g>
									<path d="m356.339844 296.347656-286.613282-286.613281c-12.5-12.5-32.765624-12.5-45.246093 0l-15.105469 15.082031c-12.5 12.503906-12.5 32.769532 0 45.25l286.613281 286.613282c12.503907 12.5 32.769531 12.5 45.25 0l15.082031-15.082032c12.523438-12.480468 12.523438-32.75.019532-45.25zm0 0"/><path d="m295.988281 9.734375-286.613281 286.613281c-12.5 12.5-12.5 32.769532 0 45.25l15.082031 15.082032c12.503907 12.5 32.769531 12.5 45.25 0l286.632813-286.59375c12.503906-12.5 12.503906-32.765626 0-45.246094l-15.082032-15.082032c-12.5-12.523437-32.765624-12.523437-45.269531-.023437zm0 0"/>
								</g>
							</svg>
						</form>
					</div>
				</c:forEach>
			</section>
	</c:if>
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