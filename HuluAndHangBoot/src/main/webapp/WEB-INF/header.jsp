<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="fullView">
	<h1>H<span>ulu</span>&H<span>ang</span></h1>
	<c:if test="${!empty user}">
		<nav>
			<a href="user.do">Home</a>
			<a href="movie.do">Movie</a>
			<a href="logout.do">log out</a>
		</nav>
	</c:if>
</header>