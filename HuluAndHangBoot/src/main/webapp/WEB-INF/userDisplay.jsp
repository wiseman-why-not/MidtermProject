<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			</section>
			<section class="user-meta">
				genre
			</section>
			<section class="user-description">
				description
			</section>
			<section class="user-movies">
				movies list
			</section>
		</main>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="bottomScript.jsp"></jsp:include>
	</body>
</html>