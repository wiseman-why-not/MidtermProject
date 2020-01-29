<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Hulu&Hang</title>
		<jsp:include page="topStyle.jsp"></jsp:include>
		<link rel="stylesheet" href="./css/adminStyle.css">
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<main class="container">
			
			<section class="user-image">
				<article>
					<h3>${user.username}</h3>
					<img src="https://media-exp1.licdn.com/dms/image/C4E03AQG97yrPw3MYzw/profile-displayphoto-shrink_800_800/0?e=1585180800&v=beta&t=_hCmt8WlG6r37DZSNR96m9BBpAiXfM3cMwOWRt3uEw0" alt="User Profile pic"/>
				</article>
			</section>
			
		<!-- 	A list of all users -->
		
			<section class="user-movies">
						<c:forEach var="user" items="${users}">
							<div class="content-card">
								<img class="content-image" src="https://media-exp1.licdn.com/dms/image/C4E03AQG97yrPw3MYzw/profile-displayphoto-shrink_800_800/0?e=1585180800&v=beta&t=_hCmt8WlG6r37DZSNR96m9BBpAiXfM3cMwOWRt3uEw0" alt="${user.firstName}" />
								<article class="content-details">
									<h3>${user.firstName} </h3>
									<p>Account: ${user.isActive}</p>
									
									<c:if test="${user.isActive }">
									<form action="deactivate.do" method="post">
										<input type="hidden" value="${user.id }" name="userId">
										<button type="submit" >DeActivate</button>
									</form>
									</c:if>
									<c:if test="${!user.isActive }">
									<form action="reactivate.do" method="post">
									<input type="hidden" value="${user.id }" name="userId">
									<button type="submit" >ReActivate</button>
									</form>
									</c:if>
									
								</article>
							</div>
						</c:forEach>
					</section>
			
		<!-- 	A list of all movies -->
		<%-- 	<section class="user-movies">
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
					</section> --%>
					
			<!-- end of move list	 -->	
		</main>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="bottomScript.jsp"></jsp:include>
	</body>
</html>