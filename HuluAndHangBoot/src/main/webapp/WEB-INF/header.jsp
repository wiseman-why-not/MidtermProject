<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
	<h1>Hulu&Hang</h1>
	<c:if test="${!empty user}">
		<nav>
			<a href="user.do">Home</a>
			<a href="movie.do">Movie</a>
			<a href="genre.do">Genre</a>
			<a href="logout.do">log out</a>
		</nav>
	</c:if>
</header>