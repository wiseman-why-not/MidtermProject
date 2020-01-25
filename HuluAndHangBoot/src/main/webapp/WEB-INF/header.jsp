<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="fullView">
	<h1>Hulu&Hang</h1>
	<c:if test="${!empty user}">
		<nav>
			<a href="user.do">Home</a>
			<form action="movie.do" method="POST">
			<input type="hidden" value="${user.id}" name="uid"/>
			<input type="hidden" value="${user.firstName}" name="uName"/>
			<input type="submit" value="Movie" />
			</form>
			<a href="genre.do">Genre</a>
			<a href="logout.do">log out</a>
		</nav>
	</c:if>
</header>