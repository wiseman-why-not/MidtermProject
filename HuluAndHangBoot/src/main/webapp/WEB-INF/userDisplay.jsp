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
				<c:forEach var="genre" items="${genres}">
					<c:if test="${user.genres.contains(genre)}">
						<div>
							<form class="genre-form">
								<input type="hidden" value="${genre.id}" name="genre" />
							</form>
							<h3>${genre.name}</h3>
						</div>
					</c:if>
					<c:if test="${!user.genres.contains(genre)}">
						<div>
							<form class="genre-form">
								<input type="hidden" value="${genre.id}" name="genre" />
							</form>
							<h3>${genre.name} hello</h3>
						</div>
					</c:if>
				</c:forEach>
			</section>
			<section class="user-description">
				<div class="description-section">
					<c:if test="${empty user.description}">
						<div class="no-description">
							<button class="edit-description add-description-button" type="button">add something about yourself</button>
							<p class="description"></p>
						</div>
					</c:if>
					<c:if test="${!empty user.description}">
						<svg class="edit-description" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 469.336 469.336" style="enable-background:new 0 0 469.336 469.336;" xml:space="preserve">
							<g>
								<path d="M347.878,151.357c-4-4.003-11.083-4.003-15.083,0L129.909,354.414c-2.427,2.429-3.531,5.87-2.99,9.258     c0.552,3.388,2.698,6.307,5.76,7.84l16.656,8.34v28.049l-51.031,14.602l-51.51-51.554l14.59-51.075h28.025l8.333,16.67     c1.531,3.065,4.448,5.213,7.833,5.765c0.573,0.094,1.146,0.135,1.708,0.135c2.802,0,5.531-1.105,7.542-3.128L317.711,136.26     c2-2.002,3.125-4.712,3.125-7.548c0-2.836-1.125-5.546-3.125-7.548l-39.229-39.263c-2-2.002-4.708-3.128-7.542-3.128h-0.021     c-2.844,0.01-5.563,1.147-7.552,3.159L45.763,301.682c-0.105,0.107-0.1,0.27-0.201,0.379c-1.095,1.183-2.009,2.549-2.487,4.208     l-18.521,64.857L0.409,455.73c-1.063,3.722-0.021,7.736,2.719,10.478c2.031,2.033,4.75,3.128,7.542,3.128     c0.979,0,1.958-0.136,2.927-0.407l84.531-24.166l64.802-18.537c0.195-0.056,0.329-0.203,0.52-0.27     c0.673-0.232,1.262-0.61,1.881-0.976c0.608-0.361,1.216-0.682,1.73-1.146c0.138-0.122,0.319-0.167,0.452-0.298l219.563-217.789     c2.01-1.991,3.146-4.712,3.156-7.558c0.01-2.836-1.115-5.557-3.125-7.569L347.878,151.357z"/>
								<path d="M456.836,76.168l-64-64.054c-16.125-16.139-44.177-16.17-60.365,0.031l-39.073,39.461     c-4.135,4.181-4.125,10.905,0.031,15.065l108.896,108.988c2.083,2.085,4.813,3.128,7.542,3.128c2.719,0,5.427-1.032,7.51-3.096     l39.458-39.137c8.063-8.069,12.5-18.787,12.5-30.192S464.899,84.237,456.836,76.168z"/>
							</g>
						</svg>
						<p class="description">${user.description}</p>
					</c:if>
				</div>
				<div class="edit-description-section">
				<form class="description-from" action="updateDescription.do" method="POST">
					<textarea name="description" rows="3" maxlength="93">
					</textarea>
					<svg class="submit-description" xmlns="http://www.w3.org/2000/svg" height="417pt" viewBox="0 -46 417.81333 417" width="417pt">
						<path d="m159.988281 318.582031c-3.988281 4.011719-9.429687 6.25-15.082031 6.25s-11.09375-2.238281-15.082031-6.25l-120.449219-120.46875c-12.5-12.5-12.5-32.769531 0-45.246093l15.082031-15.085938c12.503907-12.5 32.75-12.5 45.25 0l75.199219 75.203125 203.199219-203.203125c12.503906-12.5 32.769531-12.5 45.25 0l15.082031 15.085938c12.5 12.5 12.5 32.765624 0 45.246093zm0 0"/>
					</svg>
				</form>
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