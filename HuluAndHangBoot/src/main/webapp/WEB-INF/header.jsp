<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
	<h1>Hulu&Hang</h1>
	<c:if test="${!empty user}">
		<nav>
			<a href="home.do">Home</a>
			<a href="movie.do">Movie</a>
			<a href="genre.do">Genre</a>
		</nav>
	</c:if>
</header>